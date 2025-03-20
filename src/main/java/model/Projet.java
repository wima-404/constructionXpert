package model;


import java.util.Date;

public class Projet {



    private Integer projet_id;
    private String nom_projet ;
    private String description_projet;
    private Date dateDebut;
    private Date dateFin;
    private Integer budget;
    private String picture_Url;

    // Constructeurs

    public Projet(Integer projet_id, String nom_projet, String description_projet, Date dateDebut, Date dateFin, Integer budget, String picture_Url) {
        this.projet_id = projet_id;
        this.nom_projet = nom_projet;
        this.description_projet = description_projet;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.budget = budget;
        this.picture_Url = picture_Url;
    }


    public Projet(String nomProjet, String descriptionProjet, Date dateDebut, Date dateFin, Integer budget, String pictureUrl) {
        this.nom_projet = nomProjet;
        this.description_projet = descriptionProjet;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.budget = budget;
        this.picture_Url = pictureUrl;

    }




    // Getters et Setters


    public Integer getProjet_id() {
        return projet_id;
    }

    public void setProjet_id(Integer projet_id) {
        this.projet_id = projet_id;
    }
    public String getNom() {
        return nom_projet;
    }

    public void setNom(String nom) {
        this.nom_projet = nom;
    }
    public String getDescription_projet() {
        return description_projet;
    }

    public void setDescription_projet(String description_projet) {
        this.description_projet = description_projet;
    }
    public java.sql.Date getDateDebut() {
        return (java.sql.Date) dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public java.sql.Date getDateFin() {
        return (java.sql.Date) dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public Integer getBudget() {
        return budget;
    }

    public void setBudget(Integer budget) {
        this.budget = budget;
    }
    public String getPicture_Url() {
        return picture_Url;
    }

    public void setPicture_Url(String picture_Url) {
        this.picture_Url = picture_Url;
    }


}