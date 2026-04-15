<?php
try {
    $dsn = "pgsql:host=127.0.0.1;port=5432;dbname=postgres";
    $user = "postgres";
    $password = "2026";
    $pdo = new PDO($dsn, $user, $password);
    $pdo->exec("CREATE DATABASE escolaead");
    echo "Database created successfully!";
} catch (PDOException $e) {
    echo "Creation failed: " . $e->getMessage();
}
