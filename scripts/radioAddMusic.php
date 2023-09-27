<?php
// Verificar se um arquivo de música foi enviado

use function PHPSTORM_META\type;

var_dump($_FILES);
var_dump($_POST);

if (isset($_FILES['musicas']) && isset($_POST['radio_id'])) {
    // Conexão com o banco de dados
    require_once("../conn.php");

    // Obter o diretório da rádio a partir do banco de dados usando o ID da rádio
    $radio_id = $_POST['radio_id'];
    $sql = "SELECT diretorio FROM radio WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $radio_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($row = $result->fetch_assoc()) {
        $diretorio = $row['diretorio'];

        // Loop através dos arquivos enviados
        foreach ($_FILES['musicas']['error'] as $key => $error) {
            if ($error == UPLOAD_ERR_OK) {
                $tmp_name = $_FILES["musicas"]["tmp_name"][$key];
                $name = $_FILES["musicas"]["name"][$key];
                $type = "musica";

                // Utilizar o GetID3 para obter informações da música
                require_once('../dependencies/getID3/getid3/getid3.php');
                $getID3 = new getID3;
                $fileInfo = $getID3->analyze($tmp_name);

                $titulo = isset($fileInfo["tags"]["id3v2"]["title"][0]) ? $fileInfo["tags"]["id3v2"]["title"][0] : "comentario";
                $artista = isset($fileInfo["tags"]["id3v2"]["artist"][0]) ? $fileInfo["tags"]["id3v2"]["artist"][0] : "comentario";

                //caso não senha titulo, deve ser um comentario
                if ($titulo === "comentario"){
                    $type = "comentario";
                }
                // Mover o arquivo para o diretório da rádio
                $target_dir = "../" . $diretorio . "/";
                if (!is_dir($target_dir)) {
                    mkdir($target_dir, 0755, true);
                }

                //caminho da musica
                $music_dir = $diretorio . "/". $name;

                if (move_uploaded_file($tmp_name, $target_dir . $name)) {
                    // Inserir os detalhes da música no banco de dados
                    $sql = "INSERT INTO musicas (name, artist, directory, radio_id, type) VALUES (?, ?, ?, ?, ?)";
                    $stmt = $conn->prepare($sql);
                    $stmt->bind_param("sssis", $titulo, $artista, $music_dir, $radio_id, $type);

                    if ($stmt->execute()) {
                        echo "Música '$titulo' adicionada com sucesso.<br>";
                    } else {
                        echo "Erro ao adicionar música '$titulo'.<br>";
                    }
                    $stmt->close();
                } else {
                    echo "Erro ao fazer upload da música '$name'.<br>";
                }
            }
        }
    } else {
        echo "ID da rádio não encontrado no banco de dados.";
    }

    // Fechar a conexão com o banco de dados
    $conn->close();
} else {
    echo "Nenhum arquivo de música enviado ou ID da rádio ausente.";
}
?>
