package ConstructionXpert.servlets;

import ConstructionXpert.DAO.TacheDAOImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeleteTache", value = "/DeleteTache")
public class DeleteTache extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("tacheId"));
        Integer projet_id = Integer.valueOf(request.getParameter("projet_id"));
        TacheDAOImpl pr=new TacheDAOImpl();
        TacheDAOImpl rr = new TacheDAOImpl();
        try {
            rr.DeleteTaches(id);
            request.setAttribute("Tache", pr.ShowTaches(projet_id));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/ShowTaches.jsp").forward(request, response);
        //response.sendRedirect("/WEB-INF/AfficherProjet.jsp");
    }
}
