// src/main/java/com/example/construction/dao/TaskDAO.java
package com.example.construction.dao;

import com.example.construction.model.Task;
import com.example.construction.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {

    public List<Task> getAllTasks() {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT id, project_id, description, start_date, end_date FROM tasks";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Task task = new Task();
                task.setId(resultSet.getInt("id"));
                task.setProjectId(resultSet.getInt("project_id"));
                task.setDescription(resultSet.getString("description"));
                task.setStartDate(resultSet.getDate("start_date"));
                task.setEndDate(resultSet.getDate("end_date"));
                tasks.add(task);
            }

        } catch (SQLException e) {
            System.err.println("Error getting all tasks: " + e.getMessage());
        }

        return tasks;
    }

    public void addTask(Task task) {
        String sql = "INSERT INTO tasks (project_id, description, start_date, end_date) VALUES (?, ?, ?, ?)";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, task.getProjectId());
            statement.setString(2, task.getDescription());
            statement.setDate(3, new java.sql.Date(task.getStartDate().getTime()));
            statement.setDate(4, new java.sql.Date(task.getEndDate().getTime()));

            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error adding task: " + e.getMessage());
        }
    }

    public Task getTaskById(int taskId) {
        Task task = null;
        String sql = "SELECT id, project_id, description, start_date, end_date FROM tasks WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, taskId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                task = new Task();
                task.setId(resultSet.getInt("id"));
                task.setProjectId(resultSet.getInt("project_id"));
                task.setDescription(resultSet.getString("description"));
                task.setStartDate(resultSet.getDate("start_date"));
                task.setEndDate(resultSet.getDate("end_date"));
            }

        } catch (SQLException e) {
            System.err.println("Error getting task by ID: " + e.getMessage());
        }

        return task;
    }

    public void updateTask(Task task) {
        String sql = "UPDATE tasks SET project_id = ?, description = ?, start_date = ?, end_date = ? WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, task.getProjectId());
            statement.setString(2, task.getDescription());
            statement.setDate(3, new java.sql.Date(task.getStartDate().getTime()));
            statement.setDate(4, new java.sql.Date(task.getEndDate().getTime()));
            statement.setInt(5, task.getId());

            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error updating task: " + e.getMessage());
        }
    }

    public void deleteTask(int taskId) {
        String sql = "DELETE FROM tasks WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, taskId);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error deleting task: " + e.getMessage());
        }
    }
}