package ConstructionXpert.servlets;

import ConstructionXpert.DAO.RessourceDAOImpl;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeleteRessource", value = "/DeleteRessource")

public class DeleteRessource extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id=Integer.valueOf(request.getParameter("RessourceId"));
        Integer Id=Integer.valueOf(request.getParameter("TacheId"));
        System.out.println(Id);
        request.setAttribute("idtache",Id);

        RessourceDAOImpl rd=new RessourceDAOImpl();
        try {
            rd.DeleteRessource(id);
            request.setAttribute("Ressources", rd.ShowRessources(Id));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/ShowRessource.jsp").forward(request, response);

    }
}