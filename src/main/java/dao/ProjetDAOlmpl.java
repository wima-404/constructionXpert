package dao;

import model.Projet;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProjetDAOImpl implements ProjetDAO{
    @Override
    public ArrayList<Projet> ShowProjet(Integer projectId) throws SQLException, ClassNotFoundException {
        ArrayList<Projet> projets=new ArrayList<>();
        String sql="SELECT * FROM Projet where  projet_id=?";
        PreparedStatement statement = ConnectionDAO.getConnection().prepareStatement(sql);
        statement.setInt(1,projectId);
        ResultSet resultat = statement.executeQuery();
        System.out.println(resultat);
        while (resultat.next()) {
            Integer projet_id = resultat.getInt("projet_id");
            String nom_projet=resultat.getString("nom_projet");
            System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjj");
            String description_projet=resultat.getString("description_projet");
            Date date_debut = resultat.getDate("date_debut");
            Date date_fin = resultat.getDate("date_fin");
            Integer budget = resultat.getInt("budget");
            String picture_Url=resultat.getString("picture_Url");
            Projet prt=new Projet(projet_id,nom_projet,description_projet,date_debut,date_fin,budget,picture_Url);
            System.out.println(prt.getNom());
            projets.add(prt);
        }
        projets.forEach(projet -> System.out.println(projet.getNom()));
        return projets;
    }

    @Override
    public ArrayList<Projet> ShowProjet() throws SQLException, ClassNotFoundException {
        ArrayList<Projet> projets=new ArrayList<>();
        String sql="SELECT * FROM Projet";
        PreparedStatement statement = ConnectionDAO.getConnection().prepareStatement(sql);

        ResultSet resultat = statement.executeQuery();
        System.out.println(resultat);
        while (resultat.next()) {
            Integer projet_id = resultat.getInt("projet_id");
            String nom_projet=resultat.getString("nom_projet");
            System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjj");
            String description_projet=resultat.getString("description_projet");
            Date date_debut = resultat.getDate("date_debut");
            Date date_fin = resultat.getDate("date_fin");
            Integer budget = resultat.getInt("budget");
            String picture_Url=resultat.getString("picture_Url");
            Projet prt=new Projet(projet_id,nom_projet,description_projet,date_debut,date_fin,budget,picture_Url);
            System.out.println(prt.getNom());
            projets.add(prt);
        }
        projets.forEach(projet -> System.out.println(projet.getNom()));
        return projets;
    }

    @Override
    public void AddProjet(Projet Projet) throws SQLException, ClassNotFoundException {

        String sql = "INSERT INTO projet (nom_projet,description_projet, date_debut,date_fin,budget,Picture_Url) VALUES (?,?,?,?,?,?)";
        PreparedStatement Add = ConnectionDAO.getConnection().prepareStatement(sql);
        Add.setString(1,Projet.getNom() );
        Add.setString(2,Projet.getDescription_projet() );
        Add.setDate(3,Projet.getDateDebut());
        Add.setDate(4,Projet.getDateFin() );
        Add.setInt(5,Projet.getBudget() );
        Add.setString(6,Projet.getPicture_Url() );
        Add.executeUpdate();

    }


    @Override
    public <Projet> void AddProjet(model.Projet Projet) throws SQLException, ClassNotFoundException {

    }

    @Override

    public void SupprimerProjet(Integer projet_id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM Projet WHERE projet_id= ?";
        PreparedStatement statement = ConnectionDAO.getConnection().prepareStatement(sql);
        statement.setInt(1, projet_id);
        statement.executeUpdate();

    }




    @Override
    public void UpdateProjet(Integer projet_id, Projet Projet) throws SQLException, ClassNotFoundException {
        String sqls = "UPDATE projet SET nom_projet=?,description_projet=?, date_debut=? , date_fin=? , budget=? WHERE projet_id=?";
        PreparedStatement s = ConnectionDAO.getConnection().prepareStatement(sqls);
        s.setString(1,Projet.getNom());
        s.setString(2,Projet.getDescription_projet());
        s.setDate(3,Projet.getDateDebut());
        s.setDate(4,Projet.getDateFin());
        s.setInt(5,Projet.getBudget());
        s.setInt(6,projet_id);
        s.executeUpdate();

    }
    @Override
    public <Projet> Projet RecupererProjet(Integer projet_id) throws SQLException, ClassNotFoundException {

        String requet = "SELECT * FROM  Projet WHERE projet_id=?";
        PreparedStatement statement = ConnectionDAO.getConnection().prepareStatement(requet);
        statement.setInt(1, projet_id);
        ResultSet resultat = statement.executeQuery();
        Projet RecupProjet = null;
        while (resultat.next()) {
            String nom_projet = resultat.getString("nom_projet");
            String description_projet = resultat.getString("description_projet");
            Date dateDebut= resultat.getDate("date_debut");
            Date dateFin = resultat.getDate("date_fin");
            Integer budget = resultat.getInt("budget");
            String picture_Url = resultat.getString("picture_Url");
            RecupProjet = new Projet(projet_id, nom_projet,description_projet,dateDebut, dateFin,budget,picture_Url);

        }
        return RecupProjet;
    }

    @Override
    public <Projet> void UpdateProjet(Integer idProjet, model.Projet projet) throws SQLException, ClassNotFoundException {

    }
}