package servlet;

import ConstructionXpert.DAO.TacheDAOImpl;

import ConstructionXpert.model.Tache;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "UpdateTache", value = "/UpdateTache")
public class UpdateTache extends HttpServlet {
    @Override
    protected <TacheDAOImpl> void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id=Integer.valueOf(request.getParameter("id"));
        TacheDAOImpl th=new TacheDAOImpl();
        try {
            request.setAttribute("Tache",th.equals(id));

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/UpdateTache.jsp").forward(request, response);

    }

    @Override
    protected <TacheDAOImpl> void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer idTache=Integer.valueOf(request.getParameter("idTache"));
        String StatutTache=request.getParameter("StatutTache");
        Date DateDebutTache= Date.valueOf(request.getParameter("DateDebutTache"));
        Date DateFinTache=Date.valueOf(request.getParameter("DateFinTache"));
        String descriptionTache=request.getParameter("descriptionTache");
        Integer idProjet=Integer.valueOf(request.getParameter("idProjet"));
        Tache th=new Tache(idTache,descriptionTache,DateDebutTache,DateFinTache,StatutTache,idProjet);
        TacheDAOImpl td=new TacheDAOImpl();
        try {
            td.UpdateTache(idTache,th);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        TacheDAOImpl ta=new TacheDAOImpl();
        try {
            request.setAttribute("Tache",ta.wait(idProjet));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/ShowTaches.jsp").forward(request, response);

    }
}