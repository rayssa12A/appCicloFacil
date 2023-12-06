<?php

$banco = 'db_ciclofacil';
$host = 'localhost';
$usuario = 'root';
$senha = '';

try {
    $pdo = new PDO("mysql:dbname=$banco;host=$host;charset=utf8", "$usuario", "$senha");
    echo "---Conexão bem sucedida com o banco";
} catch (Exception $e) {
    echo "---Erro ao se conectar com o banco", $e;
}

?>