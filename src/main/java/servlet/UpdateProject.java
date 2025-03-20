package ConstructionXpert.servlets;

import ConstructionXpert.DAO.ProjetDAOImpl;
import ConstructionXpert.model.Projet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "UpdateProjet", value = "/UpdateProjet")
public class UpdateProjet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProjetDAOImpl rr=new ProjetDAOImpl();
        Integer id=Integer.valueOf(request.getParameter("id"));
        try {
            request.setAttribute("Projet",rr.RecupererProjet(id));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/UpdateProjet.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProjetDAOImpl pr = new ProjetDAOImpl();
        Integer projet_id = Integer.valueOf(request.getParameter("id"));
        String nom_projet = request.getParameter("Name");
        Integer budget = Integer.valueOf(request.getParameter("Budget"));
        Date dateDebut = Date.valueOf(request.getParameter("DateDebut"));
        Date dateFin = Date.valueOf(request.getParameter("DateFin"));
        String description_projet = request.getParameter("Description");
        String picture_Url = request.getParameter("Picture_Url");
        Projet projet = new Projet(nom_projet, description_projet, dateDebut, dateFin, budget, picture_Url);


        try {
            pr.UpdateProjet(projet_id, projet);
            request.setAttribute("Projets",pr.ShowProjet());
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/AfficherProjet.jsp").forward(request, response);

    }
}