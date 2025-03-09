package org.example.webimc;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/busca")
public class BuscarMusicaServlet extends HttpServlet
{
    private static final String UPLOAD_DIRECTORY = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String nome = request.getParameter("nome");
        if(nome == null || nome.isEmpty())
        {
            response.getWriter().println("Erro: Nenhuma palavra-chave foi fornecida.");
            return;
        }

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File pasta = new File(uploadPath);

        if(!pasta.exists() || !pasta.isDirectory())//valindo se o diretorio existe
        {
            response.getWriter().println("Erro: Diretório 'uploads' não encontrado!");
            return;
        }

        List<String> musicasEncontradas = new ArrayList<>();
        for(File f : pasta.listFiles())
        {
            if(f.isFile())
            {
                if(f.getName().contains(nome))//validando se o nome do arquivo contém a palavra-chave
                {
                    musicasEncontradas.add(f.getName());
                }
            }
        }

        //retornando a lista de musica encontrada
        request.setAttribute("musicasEncontradas", musicasEncontradas.toArray(new String[0]));
        request.getRequestDispatcher("busca.jsp").forward(request, response);
    }
}


