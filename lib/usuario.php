<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include_once("./conexao.php");

// Verificar se a requisição é do tipo POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    // Receber dados do corpo da requisição
    $dadosRecebidos = json_decode(file_get_contents("php://input"), true);

    // Verificar se os dados foram recebidos corretamente
    if ($dadosRecebidos !== null) {


        $nome = $dadosRecebidos['nome'];
        $dataNascimento = $dadosRecebidos['dataNascimento'];
        $email = $dadosRecebidos['email'];
        $senha = $dadosRecebidos['senha'];
        $confirmaSenha = $dadosRecebidos['confirmarSenha'];

        // Preparar e executar a inserção no banco de dados
        $stmt = $pdo->prepare("INSERT INTO pessoa (nome, dataNascimento, email, senha, confirmarSenha) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$nome, $dataNascimento, $email, $senha, $confirmaSenha]);
        // Verificar se a inserção foi bem-sucedida
        if ($stmt->rowCount() > 0) {
            echo json_encode(array("code" => 1, "message" => "Cadastro realizado com sucesso"));
        } else {
            echo json_encode(array("code" => 0, "message" => "Falha no cadastro"));
        }

    } else {
        echo json_encode(array("code" => 0, "message" => "Dados inválidos"));
    }

} else {
    echo json_encode(array("code" => 0, "message" => "Método de requisição inválido"));
}

?>
