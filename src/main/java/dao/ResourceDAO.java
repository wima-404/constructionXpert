package dao;




import construction.model.Ressource;

import java.sql.SQLException;
import java.util.ArrayList;

public interface RessourceDAO {
    <Ressource> ArrayList<Ressource> ShowRessources(Integer idTache) throws SQLException, ClassNotFoundException;
    // ArrayList<Ressource> ShowRessources() throws SQLException, ClassNotFoundException;
    <Ressource> void AddRessources(Ressource Ressource) throws SQLException, ClassNotFoundException;
    void DeleteRessource(Integer idRessource) throws SQLException, ClassNotFoundException;
    <Ressource> Ressource RecupererRessource(Integer idRessource) throws SQLException, ClassNotFoundException;
    void UpdateRessource(Integer idRessource, Ressource Ressource) throws SQLException, ClassNotFoundException;
    // void AssocierRessource(Integer idRessource , Integer idTache)throws SQLException, ClassNotFoundException;
}
