// src/main/java/com/example/construction/model/Task.java
package com.example.construction.model;

import java.io.Serializable;
import java.util.Date;

public class Task implements Serializable {

    private int id;
    private int projectId;
    private String description;
    private Date startDate;
    private Date endDate;

    // Constructors, Getters, Setters
    public Task() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
}