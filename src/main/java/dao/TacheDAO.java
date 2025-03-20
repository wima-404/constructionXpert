package dao;

import construction.model.Tache;

import java.sql.SQLException;
import java.util.ArrayList;

public interface TacheDAO {
    <Tache> ArrayList<Tache> ShowTaches(Integer id) throws SQLException, ClassNotFoundException;
    <Tache> void AddTaches(Tache tache) throws SQLException, ClassNotFoundException;
    void DeleteTaches(Integer idTache) throws SQLException, ClassNotFoundException;
    <Tache> Tache RecupererTache(Integer idTache) throws SQLException, ClassNotFoundException;
    <Tache> void UpdateTache(Integer idTache, Tache tache) throws SQLException, ClassNotFoundException;
}