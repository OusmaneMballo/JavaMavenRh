package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import model.Medecin;
import model.Service;
import model.Specialite;
import services.IMedecin;
import services.IService;
import services.ISpecialite;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.parser.Parser;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "MedecinServlet", urlPatterns = "/medecin")
public class MedecinServlet extends HttpServlet {

    @EJB
    private IMedecin medecinEJB;
    @EJB
    private ISpecialite specialiteEJB;
    @EJB
    private IService serviceEJB;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if(action!=null) {
            Medecin medecin=new Medecin();
            medecin.setAdresse(request.getParameter("adresse"));
            medecin.setDatenaissance(request.getParameter("dateNaiss"));
            medecin.setEmail(request.getParameter("email"));
            medecin.setPrenom_nom(request.getParameter("prenom_nom"));
            medecin.setPasswd(request.getParameter("passwd"));
            medecin.setTelephone(request.getParameter("telephone"));
            int idservice=Integer.parseInt(request.getParameter("service"));
            medecin.setService(serviceEJB.findById(idservice));
            String[] specialiteView=request.getParameterValues("specialite");
            List<Specialite> listspecialite=new ArrayList<>();
            for (String sp:specialiteView){
                listspecialite.add(specialiteEJB.findById(Integer.parseInt(sp)));
            }
            medecin.setSpecialites(listspecialite);
            switch (action) {
                case "add":
                    try {
                            medecinEJB.addMedecin(medecin);
                            response.sendRedirect("medecin?action=add");
                    }
                    catch (Exception exception){
                        exception.printStackTrace();
                    }
                    break;
                default:
                    throw new IllegalStateException("Unexpected value: " + action);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if(action!=null){
            switch(action){
                case "add" :
                    request.setAttribute("medecins", medecinEJB.findAll());
                    request.setAttribute("services", serviceEJB.findAll());
                    //request.setAttribute("specialites", specialiteEJB.findByServiceId(2));
                    getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp")
                            .forward(request, response);
                    break;
                case "findByIdService" :
                    int idService=Integer.parseInt(request.getParameter("idSpecialite"));
                    List<Specialite> specialites=specialiteEJB.findByServiceId(idService);
                    ObjectMapper mapper=new ObjectMapper();
                    //on fait un consol.log
                    String jsonData=mapper.writeValueAsString(specialites);
                    response.getWriter().println(jsonData);
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
