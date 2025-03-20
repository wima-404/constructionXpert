package ConstructionXpert.servlets;

import ConstructionXpert.DAO.ProjetDAOImpl;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Showdetails", value = "/Showdetails")
public class Showdetails extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer projet_id = Integer.valueOf(request.getParameter("projectId"));
        ProjetDAOImpl pr=new ProjetDAOImpl();
        try {
            request.setAttribute("Projets",pr.ShowProjet(projet_id));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/Showdetails.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}