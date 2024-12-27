<?php
// Database connection
if ($_SERVER['HTTP_HOST'] === 'localhost') {
    $db = mysqli_connect("localhost", "root", "", "siondb");
} else if ($_SERVER['HTTP_HOST'] === 'sion.cakra-portfolio.my.id') {
    $db = mysqli_connect("localhost", "u686303384_sion", "#sion12", "u686303384_siondb");
}

// Set timezone and locale
date_default_timezone_set("Asia/Jakarta");
setlocale(LC_TIME, 'id_ID.UTF-8');

// Define constants
define('PAGE_TITLE', 'Template');
define('BASE_URL_HTML', $_SERVER['HTTP_HOST'] === 'localhost' ? '/php-template' : '');
define('BASE_URL_PHP', dirname(__DIR__));

// Lambda function for concatenating constant
$constant = fn(string $name) => constant($name) ?? '';

// Query function
function query($query, $params = []) {
    global $db;
    $stmt = mysqli_prepare($db, $query);

    if (!empty($params)) {
        $types = str_repeat("s", count($params));
        mysqli_stmt_bind_param($stmt, $types, ...$params);
    }

    mysqli_stmt_execute($stmt);

    $queryType = strtoupper(explode(' ', trim($query))[0]);
    if ($queryType === 'SELECT') {
        $result = mysqli_stmt_get_result($stmt);
        $rows = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $rows[] = $row;
        }
        mysqli_stmt_close($stmt);
        return $rows;
    } else {
        $affectedRows = mysqli_stmt_affected_rows($stmt);
        mysqli_stmt_close($stmt);
        return $affectedRows;
    }
}

// Check user session
function checkUserSession($db) {
    if (!isset($_SESSION['userId']) || !isset($_SESSION['csrf_token'])) {
        session_destroy();
        header("Location: " . BASE_URL_HTML);
        exit();
    }

    $query = "SELECT * FROM user WHERE userId = ?";
    $stmt = $db->prepare($query);
    $stmt->execute([$_SESSION['userId']]);
    $user = $stmt->fetch();

    if (!$user) {
        session_destroy();
        header("Location: " . BASE_URL_HTML);
        exit();
    }
}

// URL encryption and decryption
function encryptUrl($url) {
    return base64_encode($url);
}

function decryptUrl($encryptedUrl) {
    return base64_decode($encryptedUrl);
}

// Get current directory
function getCurrentDirectory() {
    return pathinfo($_SERVER['SCRIPT_NAME'], PATHINFO_DIRNAME);
}
