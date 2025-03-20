package model;

import java.sql.Date;

public class Tache {

    private Integer tache_id ;
    private String description_tache ;
    private Date date_debut;
    private Date date_fin;
    private String statut ;

    private Integer projet_id;



    //Constructeur
    public Tache(Integer tache_id, String description_tache, Date date_debutT, Date date_finT, String statut,Integer projet_id) {
        this.tache_id = tache_id;
        this.description_tache = description_tache;
        this.date_debut = date_debutT;
        this.date_fin = date_finT;
        this.statut = statut;
        this.projet_id = projet_id;
    }
    public Tache( String description_tache, Date date_debutT, Date date_finT, String statut,Integer projet_id) {

        this.description_tache = description_tache;
        this.date_debut = date_debutT;
        this.date_fin = date_finT;
        this.statut = statut;
        this.projet_id = projet_id;
    }



    //Getters et Setters
    public Integer getTache_id() {
        return tache_id;
    }

    public void setTache_id(Integer tache_id) {
        this.tache_id = tache_id;
    }

    public String getDescription_tache() {
        return description_tache;
    }

    public void setDescription_tache(String description_tache) {
        this.description_tache = description_tache;
    }

    public Date getDate_debut() {
        return date_debut;
    }

    public void setDate_debut(Date date_debut) {
        this.date_debut = date_debut;
    }

    public Date getDate_fin() {
        return date_fin;
    }

    public void setDate_fin(Date date_fin) {
        this.date_fin = date_fin;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }
    public Integer getProjet_id() {
        return projet_id;
    }

    public void setProjet_id(Integer projet_id) {
        this.projet_id = projet_id;
    }



}

