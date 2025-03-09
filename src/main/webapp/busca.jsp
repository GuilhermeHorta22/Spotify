<%@ page import="org.example.webimc.BuscarMusicaServlet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Play My Song - Buscar Música</title>
    <link href="resources/uploadS.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">

    <div class="mb-4">
        <ul class="nav justify-content-start">
            <li class="nav-item">
                <a class="nav-link active" href="play-song.jsp">Subir musicas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-danger" href="logoff-servlet">Sair da Sessão</a>
            </li>
        </ul>
    </div>

    <div class="title1">
        <h2 class="mb-4">Subir musicas</h2>
    </div>

    <form action="busca" method="get" class="bg-white p-4 rounded-lg shadow-lg flex flex-col items-center w-full max-w-md">
        <label class="mb-2 text-lg">Palavra presente no arquivo:</label>
        <input type="text" name="nome" required class="w-full p-2 rounded-lg text-black mb-4">
        <button type="submit" class="bg-green-500 hover:bg-green-600 text-green font-bold py-2 px-4 rounded-lg w-full">Buscar</button>
    </form>

    <div id="resultado" class="mt-6 w-full max-w-lg">
        <%
            String erro = (String) request.getAttribute("erro");
            if(erro != null)
            {
        %>
        <div class="bg-red-200 text-red-800 p-3 rounded-lg shadow-md">
            <p class="font-semibold"><%= erro %></p>
        </div>
        <% } %>

        <%
            String[] musicas = (String[]) request.getAttribute("musicasEncontradas");
            if(musicas != null && musicas.length > 0)
            {
                for(String musica : musicas)
                {
        %>
        <div class="bg-white p-4 rounded-lg shadow-lg mt-4">
            <p class="text-lg font-semibold"><%= musica %></p>
            <audio controls class="w-full mt-2">
                <source src="uploads/<%= musica %>" type="audio/mpeg">
            </audio>
        </div>
        <%
                }
            }
        %>
    </div>
</div>
</body>
</html>
