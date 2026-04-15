<?php
try {
    $dsn = "pgsql:host=127.0.0.1;port=5432;dbname=escolaead";
    $user = "postgres";
    $password = "2026";
    $pdo = new PDO($dsn, $user, $password);
    echo "Connection successful!";
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
