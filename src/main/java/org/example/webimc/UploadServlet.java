package org.example.webimc;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "UploadServlet", value = "/upload-servlet")
@MultipartConfig(
        location="/",
        fileSizeThreshold=1024*1024,    // 1MB *
        maxFileSize=1024*1024*100,      // 100MB **
        maxRequestSize=1024*1024*10*10  // 100MB ***
)
public class UploadServlet extends HttpServlet
{
    private static final String UPLOAD_DIRECTORY = "uploads"; //diretorio fixo para salvar os arquivos

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String nomeArquivo = request.getParameter("nomeArquivo");
        Part filePart = request.getPart("file");

        if(filePart == null || filePart.getSize() == 0)
        {
            request.setAttribute("erro", "Erro: Nenhum arquivo foi enviado.");
            request.getRequestDispatcher("play-song.jsp").forward(request, response);
            return;
        }

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if(!uploadDir.exists())
        {
            uploadDir.mkdir();
        }

        File file = new File(uploadDir, nomeArquivo);
        try(InputStream input = filePart.getInputStream(); FileOutputStream output = new FileOutputStream(file))
        {
            byte[] bytes = new byte[1024];
            int bytesRead;
            while((bytesRead = input.read(bytes)) != -1)
            {
                output.write(bytes, 0, bytesRead);
            }
            request.setAttribute("mensagem", "Upload realizado com sucesso! Arquivo salvo como: " + nomeArquivo);
        }
        catch(Exception e)
        {
            request.setAttribute("erro", "Erro!!! Não foi possível salvar o arquivo: " + nomeArquivo);
        }
        request.getRequestDispatcher("play-song.jsp").forward(request, response);
    }
}