// src/main/java/com/example/construction/dao/ProjectDAO.java
package com.example.construction.dao;

import com.example.construction.model.Project;
import com.example.construction.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO {

    public List<Project> getAllProjects() {
        List<Project> projects = new ArrayList<>();
        String sql = "SELECT id, name, description, start_date, end_date, budget FROM projects";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Project project = new Project();
                project.setId(resultSet.getInt("id"));
                project.setName(resultSet.getString("name"));
                project.setDescription(resultSet.getString("description"));
                project.setStartDate(resultSet.getDate("start_date"));
                project.setEndDate(resultSet.getDate("end_date"));
                project.setBudget(resultSet.getDouble("budget"));
                projects.add(project);
            }

        } catch (SQLException e) {
            System.err.println("Error getting all projects: " + e.getMessage());
        }

        return projects;
    }

    public void addProject(Project project) {
        String sql = "INSERT INTO projects (name, description, start_date, end_date, budget) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, project.getName());
            statement.setString(2, project.getDescription());
            statement.setDate(3, new java.sql.Date(project.getStartDate().getTime()));
            statement.setDate(4, new java.sql.Date(project.getEndDate().getTime()));
            statement.setDouble(5, project.getBudget());

            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error adding project: " + e.getMessage());
        }
    }

    public Project getProjectById(int projectId) {
        Project project = null;
        String sql = "SELECT id, name, description, start_date, end_date, budget FROM projects WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, projectId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                project = new Project();
                project.setId(resultSet.getInt("id"));
                project.setName(resultSet.getString("name"));
                project.setDescription(resultSet.getString("description"));
                project.setStartDate(resultSet.getDate("start_date"));
                project.setEndDate(resultSet.getDate("end_date"));
                project.setBudget(resultSet.getDouble("budget"));
            }

        } catch (SQLException e) {
            System.err.println("Error getting project by ID: " + e.getMessage());
        }

        return project;
    }

    public void updateProject(Project project) {
        String sql = "UPDATE projects SET name = ?, description = ?, start_date = ?, end_date = ?, budget = ? WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, project.getName());
            statement.setString(2, project.getDescription());
            statement.setDate(3, new java.sql.Date(project.getStartDate().getTime()));
            statement.setDate(4, new java.sql.Date(project.getEndDate().getTime()));
            statement.setDouble(5, project.getBudget());
            statement.setInt(6, project.getId());

            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error updating project: " + e.getMessage());
        }
    }

    public void deleteProject(int projectId) {
        String sql = "DELETE FROM projects WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, projectId);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error deleting project: " + e.getMessage());
        }
    }
}