// src/main/java/com/example/construction/dao/TaskResourceDAO.java
package com.example.construction.dao;

import com.example.construction.model.TaskResource;
import com.example.construction.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskResourceDAO {

    public List<TaskResource> getAllTaskResources() {
        List<TaskResource> taskResources = new ArrayList<>();
        String sql = "SELECT task_id, resource_id, quantity_needed FROM task_resources";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                TaskResource taskResource = new TaskResource();
                taskResource.setTaskId(resultSet.getInt("task_id"));
                taskResource.setResourceId(resultSet.getInt("resource_id"));
                taskResource.setQuantityNeeded(resultSet.getInt("quantity_needed"));
                taskResources.add(taskResource);
            }

        } catch (SQLException e) {
            System.err.println("Error getting all taskResources: " + e.getMessage());
        }

        return taskResources;
    }

    public void addTaskResource(TaskResource taskResource) {
        String sql = "INSERT INTO task_resources (task_id, resource_id, quantity_needed) VALUES (?, ?, ?)";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, taskResource.getTaskId());
            statement.setInt(2, taskResource.getResourceId());
            statement.setInt(3, taskResource.getQuantityNeeded());

            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error adding taskResource: " + e.getMessage());
        }
    }

    public TaskResource getTaskResourceByIds(int taskId, int resourceId) {
        TaskResource taskResource = null;
        String sql = "SELECT task_id, resource_id, quantity_needed FROM task_resources WHERE task_id = ? AND resource_id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, taskId);
            statement.setInt(2, resourceId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                taskResource = new TaskResource();
                taskResource.setTaskId(resultSet.getInt("task_id"));
                taskResource.setResourceId(resultSet.getInt("resource_id"));
                taskResource.setQuantityNeeded(resultSet.getInt("quantity_needed"));
            }

        } catch (SQLException e) {
            System.err.println("Error getting taskResource by IDs: " + e.getMessage());
        }

        return taskResource;
    }

    public void updateTaskResource(TaskResource taskResource) {
        String sql = "UPDATE task_resources SET quantity_needed = ? WHERE task_id = ? AND resource_id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, taskResource.getQuantityNeeded());
            statement.setInt(2, taskResource.getTaskId());
            statement.setInt(3, taskResource.getResourceId());

            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error updating taskResource: " + e.getMessage());
        }
    }

    public void deleteTaskResource(int taskId, int resourceId) {
        String sql = "DELETE FROM task_resources WHERE task_id = ? AND resource_id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, taskId);
            statement.setInt(2, resourceId);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error deleting taskResource: " + e.getMessage());
        }
    }
}