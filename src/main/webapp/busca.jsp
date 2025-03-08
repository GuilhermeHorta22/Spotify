<%@ page import="org.example.webimc.util.BuscarMusicaServlet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Buscar Música</title>
</head>
<body>
<div>
    <div class="text-white flex flex-col items-center min-h-screen p-6">
        <h2 class="text-3xl font-bold mb-6">Buscar Música</h2>
        <form action="busca" method="get" class="bg-gray-800 p-4 rounded-lg shadow-lg flex flex-col items-center w-full max-w-md">
            <label class="mb-2 text-lg">Palavra presente no arquivo:</label>
            <input type="text" name="nome" required class="w-full p-2 rounded-lg text-black mb-4">
            <button type="submit" class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded-lg w-full">Buscar</button>
        </form>
        <div id="resultado" class="mt-6 w-full max-w-lg">
            <%
                String[] musicas = (String[]) request.getAttribute("musicasEncontradas");
                if(musicas != null)
                {
                    for(String musica : musicas)
                    {
            %>
            <div class="bg-gray-800 p-4 rounded-lg shadow-lg mt-4">
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
</div>
</body>
</html>
