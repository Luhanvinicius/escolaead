<?php
try {
    $dsn = "mysql:host=127.0.0.1;port=3306;dbname=escolaead";
    $user = "root";
    $password = "";
    $pdo = new PDO($dsn, $user, $password);
    echo "MySQL Connection successful!";
} catch (PDOException $e) {
    echo "MySQL Connection failed: " . $e->getMessage();
}
