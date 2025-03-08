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

<div> <!--parte que eu fiz separado para para usar como menu-->
    <div class="hidden w-full md:block md:w-auto" id="navbar-default">
        <ul class="font-medium flex flex-col p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 rtl:space-x-reverse md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
            <li>
                <a href="busca.jsp" class="block py-2 px-3 text-white bg-gray-700 rounded-sm md:bg-transparent md:text-gray-700 md:p-0 dark:text-white md:dark:text-gray-500" aria-current="page">Buscar Músicas</a>
            </li>

            <li>
                <a href="logoff-servlet" class="block py-2 px-3 text-white bg-red-500 rounded-sm md:bg-transparent md:text-gray-700 md:p-0 dark:text-white md:dark:text-gray-500">
                    Sair da Sessão
                </a>
            </li>
        </ul>
    </div>
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
