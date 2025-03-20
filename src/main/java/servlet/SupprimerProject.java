package ConstructionXpert.servlets;

import ConstructionXpert.DAO.ProjetDAOImpl;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SupprimerProjet", value = "/Cancel")
public class SupprimerProjet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.getServletContext().getRequestDispatcher("/WEB-INF/AfficherProjet.jsp").forward(request, response);
    }








    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer projet_id = Integer.valueOf(request.getParameter("projectId"));
        ProjetDAOImpl pr=new ProjetDAOImpl();
        ProjetDAOImpl rr = new ProjetDAOImpl();
        try {
            rr.SupprimerProjet(projet_id);
            request.setAttribute("Projets", pr.ShowProjet());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/AfficherProjet.jsp").forward(request, response);
        //response.sendRedirect("/WEB-INF/AfficherProjet.jsp");
    }
}