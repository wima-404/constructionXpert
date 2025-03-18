// src/main/java/com/example/construction/dao/ResourceDAO.java
package com.example.construction.dao;

import com.example.construction.model.Resource;
import com.example.construction.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResourceDAO {

    public List<Resource> getAllResources() {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT id, name, type, quantity, supplier_info FROM resources";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Resource resource = new Resource();
                resource.setId(resultSet.getInt("id"));
                resource.setName(resultSet.getString("name"));
                resource.setType(resultSet.getString("type"));
                resource.setQuantity(resultSet.getInt("quantity"));
                resource.setSupplierInfo(resultSet.getString("supplier_info"));
                resources.add(resource);
            }

        } catch (SQLException e) {
            System.err.println("Error getting all resources: " + e.getMessage());
        }

        return resources;
    }

    public void addResource(Resource resource) {
        String sql = "INSERT INTO resources (name, type, quantity, supplier_info) VALUES (?, ?, ?, ?)";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, resource.getName());
            statement.setString(2, resource.getType());
            statement.setInt(3, resource.getQuantity());
            statement.setString(4, resource.getSupplierInfo());

            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error adding resource: " + e.getMessage());
        }
    }

    public Resource getResourceById(int resourceId) {
        Resource resource = null;
        String sql = "SELECT id, name, type, quantity, supplier_info FROM resources WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, resourceId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                resource = new Resource();
                resource.setId(resultSet.getInt("id"));
                resource.setName(resultSet.getString("name"));
                resource.setType(resultSet.getString("type"));
                resource.setQuantity(resultSet.getInt("quantity"));
                resource.setSupplierInfo(resultSet.getString("supplier_info"));
            }

        } catch (SQLException e) {
            System.err.println("Error getting resource by ID: " + e.getMessage());
        }

        return resource;
    }

    public void updateResource(Resource resource) {
        String sql = "UPDATE resources SET name = ?, type = ?, quantity = ?, supplier_info = ? WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, resource.getName());
            statement.setString(2, resource.getType());
            statement.setInt(3, resource.getQuantity());
            statement.setString(4, resource.getSupplierInfo());
            statement.setInt(5, resource.getId());

            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error updating resource: " + e.getMessage());
        }
    }

    public void deleteResource(int resourceId) {
        String sql = "DELETE FROM resources WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, resourceId);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error deleting resource: " + e.getMessage());
        }
    }
}