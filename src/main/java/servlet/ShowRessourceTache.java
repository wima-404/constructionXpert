package ConstructionXpert.servlets;

import ConstructionXpert.DAO.RessourceDAOImpl;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ShowRessourceTache", value = "/ShowRessourceTache")
public class ShowRessourceTache extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id=Integer.valueOf(request.getParameter("id"));
        System.out.println("Valeur de id : " + request.getParameter("id"));
        request.setAttribute("idtache",id);
        RessourceDAOImpl Rc=new RessourceDAOImpl();
        try {
            request.setAttribute("Ressources",Rc.ShowRessources(id));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/ShowRessource.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}