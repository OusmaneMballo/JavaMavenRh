package controller;

import services.IMedecin;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MedecinServlet", urlPatterns = "/medecin")
public class MedecinServlet extends HttpServlet {

    @EJB
    private IMedecin medecinEJB;
    //IMedecin medecindao;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if(action!=null){
            switch(action){
                case "add" :
                    request.setAttribute("medecins", medecinEJB.findAll());
                    getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp")
                            .forward(request, response);
                    break;
                case "list" :
                    break;
                case "update" :
                    break;
                case "delete" :
                    break;
                default :
                    request.setAttribute("erreur", true);
                    request.setAttribute("medecins", medecinEJB.findAll());
                    getServletContext().getRequestDispatcher("WEB-INF/admin.jsp")
                            .forward(request, response);
                    break;
            }
        }
    }
}
