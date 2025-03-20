package model;

public class Ressource {
    private Integer ressource_id;
    private String ressource_nom;
    private String type_ressource;
    private Integer quantite;
    private String fournisseur;
    private  Integer tache_id;


    //Constructor :

    public Ressource(Integer ressource_id, String ressource_nom, String type_ressource, Integer quantite, String fournisseur, Integer tache_id) {
        this.ressource_id = ressource_id;
        this.ressource_nom = ressource_nom;
        this.type_ressource = type_ressource;
        this.quantite = quantite;
        this.fournisseur = fournisseur;
        this.tache_id = tache_id;
    }
    public Ressource( String ressource_nom, String type_ressource, Integer quantite, String fournisseur, Integer tache_id) {
        this.ressource_nom = ressource_nom;
        this.type_ressource = type_ressource;
        this.quantite = quantite;
        this.fournisseur = fournisseur;
        this.tache_id = tache_id;
    }





    //Getters et Setters
    public int getRessource_id() {
        return ressource_id;
    }

    public void setRessource_id(int ressource_id) {
        this.ressource_id = ressource_id;
    }

    public String getRessource_nom() {
        return ressource_nom;
    }

    public void setRessource_nom(String ressource_nom) {
        this.ressource_nom = ressource_nom;
    }

    public String getType_ressource() {
        return type_ressource;
    }

    public void setType_ressource(String type_ressource) {
        this.type_ressource = type_ressource;
    }

    public Integer getQuantite() {
        return quantite;
    }

    public void setQuantite(Integer quantite) {
        this.quantite = quantite;
    }

    public String getFournisseur() {
        return fournisseur;
    }

    public void setFournisseur(String fournissuer) {
        this.fournisseur = fournissuer;
    }

    public Integer getTache_id() {
        return tache_id;
    }

    public void setTache_id(Integer tache_id) {
        this.tache_id = tache_id;
    }



}