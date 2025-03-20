package ConstructionXpert.servlets;

import ConstructionXpert.DAO.TacheDAOImpl;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ShowTaches", value = "/ShowTaches")
public class ShowTaches extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer id=Integer.valueOf(request.getParameter("id"));
        request.setAttribute("idProjet",id);
        TacheDAOImpl ta=new TacheDAOImpl();
        try {
            request.setAttribute("Tache",ta.ShowTaches(id));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/ShowTaches.jsp").forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}