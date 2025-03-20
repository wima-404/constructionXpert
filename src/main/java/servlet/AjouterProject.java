package ConstructionXpert.servlets;

import ConstructionXpert.DAO.ProjetDAOImpl;
import ConstructionXpert.model.Projet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "AjouterProjet", value = "/AjouterProjet")
public class AjouterProjet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        ProjetDAOImpl pr=new ProjetDAOImpl();
//        try {
//            request.setAttribute("Projets",pr.ShowProjet());
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        } catch (ClassNotFoundException e) {
//            throw new RuntimeException(e);
//        }




        this.getServletContext().getRequestDispatcher("/WEB-INF/AjouterProjet.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProjetDAOImpl pr=new ProjetDAOImpl();
        ProjetDAOImpl pr1=new ProjetDAOImpl();
        String nom_projet = request.getParameter("nom_projet");
        String description_projet = request.getParameter("description_projet");
        Date date_debut = Date.valueOf(request.getParameter("dateDebut"));
        Date date_fin = Date.valueOf(request.getParameter("dateFin"));
        Integer budget = Integer.valueOf(request.getParameter("budget"));
        String picture_Url = request.getParameter("Picture_Url");

        Projet projet = new Projet(nom_projet, description_projet, date_debut, date_fin, budget,picture_Url);
        try {
            pr.AddProjet(projet);
            request.setAttribute("Projets",pr.ShowProjet());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/AfficherProjet.jsp").forward(request, response);

    }
}