package org.example.webimc;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.webimc.util.Usuario;

import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet
{

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");

        //validando email e senha
        if(senha != null && validarEmailESenha(usuario, senha))
        {
            //criando a sessão como o professor pediu para registrar os dados do usuario
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("usuario", new Usuario(usuario, "normal", "ativo"));

            response.sendRedirect("play-song.jsp"); //levando para outra pagina apos o login
            return;
        }

        response.sendRedirect("index.html?erro=1"); //se caso a autenticação falhar
    }

    private boolean validarEmailESenha(String email, String senha)
    {
        String regexEmail = "^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,6}$";
        if(!email.matches(regexEmail))
        {
            return false;
        }
        String parteUsuario = email.split("@")[0];
        return parteUsuario.equals(senha);
    }
}



