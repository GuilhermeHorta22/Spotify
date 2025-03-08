<%@ page import="org.example.webimc.util.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Web Upload</title>
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

<div>
    <form method="POST" action="upload-servlet" enctype="multipart/form-data" onsubmit="return validarArquivo()">
        <label for="nome">Nome da Música:</label>
        <input type="text" name="nome" id="nome" required /><br/>

        <label for="estilo">Estilo:</label>
        <select name="estilo" id="estilo" required>
            <option value="sertanejo">Sertanejo</option>
            <option value="rock">Rock</option>
            <option value="hip_hop">Hip Hop</option>
            <option value="eletronica">Eletrônica</option>
            <option value="samba">Samba</option>
            <option value="forro">Forró</option>
            <option value="mpb">MPB</option>
            <option value="reggae">Reggae</option>
            <option value="pop_internacional">Pop Internacional</option>
        </select><br/>

        <label for="artista">Artista:</label>
        <input type="text" name="artista" id="artista" required /><br/>

        Arquivo:
        <input type="file" name="file" id="file" required /><br/>

        <input type="hidden" id="nomeArquivo" name="nomeArquivo"/>

        <input type="submit" value="Upload" name="upload" id="upload" />
    </form>
</div>

</body>
</html>
