<%@ page import="org.example.webimc.util.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Web Upload</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/uploadS.css" rel="stylesheet"> <!-- Referência ao seu arquivo CSS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function validarArquivo()
        {
            var nomeMusica = document.getElementById('nome').value;
            var estilo = document.getElementById('estilo').value;
            var artista = document.getElementById('artista').value;
            const regex = /^[a-zA-Z0-9 _]+$/; //regex para validação do nome
            if (!regex.test(nomeMusica) || !regex.test(estilo) || !regex.test(artista))
            {
                alert("Os campos nome da música, estilo e artista podem conter apenas letras, números, espaços e underline.");
                return false;
            }
            var nomeArquivo = nomeMusica.replace(/ /g, "") + "_" + estilo.replace(/ /g, "") + "_" + artista.replace(/ /g, "") + ".mp3"; //concatenação do arquivo
            document.getElementById('nomeArquivo').value = nomeArquivo;
            return true;
        }
    </script>
</head>
<body>

<div class="container mt-5">
    <div class="mb-4">
        <ul class="nav justify-content-start">
            <li class="nav-item">
                <a class="nav-link active" href="busca.jsp">Buscar Músicas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-danger" href="logoff-servlet">Sair da Sessão</a>
            </li>
        </ul>
    </div>

    <div class="title1">
        <h2 class="mb-4">Upload de Música</h2>
    </div>

    <form method="POST" action="upload-servlet" enctype="multipart/form-data" onsubmit="return validarArquivo()">
        <div class="mb-3">
            <label for="nome" class="form-label">Nome da Música:</label>
            <input type="text" name="nome" id="nome" class="form-control" required />
        </div>

        <div class="mb-3">
            <label for="estilo" class="form-label">Estilo:</label>
            <select name="estilo" id="estilo" class="form-select" required>
                <option value="sertanejo">Sertanejo</option>
                <option value="rock">Rock</option>
                <option value="hip_hop">Hip Hop</option>
                <option value="eletronica">Eletrônica</option>
                <option value="samba">Samba</option>
                <option value="forro">Forró</option>
                <option value="mpb">MPB</option>
                <option value="reggae">Reggae</option>
                <option value="pop_internacional">Pop Internacional</option>
                <option value="pagode">Pagode</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="artista" class="form-label">Artista:</label>
            <input type="text" name="artista" id="artista" class="form-control" required />
        </div>

        <div class="mb-3">
            <label for="file" class="form-label">Arquivo de Música:</label>
            <input type="file" name="file" id="file" class="form-control" required />
        </div>

        <input type="hidden" id="nomeArquivo" name="nomeArquivo"/>

        <button type="submit" class="btn btn-primary">Upload</button>
    </form>
</div>

</body>
</html>
