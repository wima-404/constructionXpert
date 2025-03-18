// src/main/java/com/example/construction/model/TaskResource.java
package com.example.construction.model;

import java.io.Serializable;

public class TaskResource implements Serializable {

    private int taskId;
    private int resourceId;
    private int quantityNeeded;

    // Constructors, Getters, Setters
    public TaskResource() {
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public int getResourceId() {
        return resourceId;
    }

    public void setResourceId(int resourceId) {
        this.resourceId = resourceId;
    }

    public int getQuantityNeeded() {
        return quantityNeeded;
    }

    public void setQuantityNeeded(int quantityNeeded) {
        this.quantityNeeded = quantityNeeded;
    }
}