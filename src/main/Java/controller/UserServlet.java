package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserServlet", urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login= request.getParameter("username");
        String passwd=request.getParameter("passwd");
        if(login.trim().equals("admin") && passwd.trim().equals("admin")){
            getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp")
            .forward(request,response);
        }
        else {
            request.setAttribute("errorLogin", "Login ou mot de passe incorrect!");
            getServletContext().getRequestDispatcher("/WEB-INF/index.jsp")
                    .forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //response.getWriter().println("okey");
        request.setAttribute("info", "Bienvenue!");
        getServletContext().getRequestDispatcher("/WEB-INF/index.jsp")
                .forward(request,response);
    }
}
