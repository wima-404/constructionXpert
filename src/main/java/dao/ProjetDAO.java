package dao;

import construction.model.Projet;
import model.Projet;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ProjetDAO {
    <Projet> ArrayList<Projet> ShowProjet() throws SQLException, ClassNotFoundException;

    <Projet> ArrayList<Projet> ShowProjet(Integer projectId) throws SQLException, ClassNotFoundException;

    <Projet> void AddProjet(Projet Projet) throws SQLException, ClassNotFoundException;

    void AddProjet(model.Projet Projet) throws SQLException, ClassNotFoundException;

    void SupprimerProjet(Integer projet_id) throws SQLException, ClassNotFoundException;

    void UpdateProjet(Integer projet_id, model.Projet Projet) throws SQLException, ClassNotFoundException;

    <Projet> Projet RecupererProjet(Integer projet_id) throws SQLException, ClassNotFoundException;

    <Projet> void UpdateProjet(Integer idProjet, Projet projet) throws SQLException, ClassNotFoundException;

    <Projet> void UpdateProjet(Integer idProjet, model.Projet projet) throws SQLException, ClassNotFoundException;
}