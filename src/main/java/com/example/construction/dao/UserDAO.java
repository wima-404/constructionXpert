// src/main/java/com/example/construction/dao/UserDAO.java
package com.example.construction.dao;

import com.example.construction.model.User;
import com.example.construction.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public User getUserByUsername(String username) {
        User user = null;
        String sql = "SELECT id, username, password, role FROM users WHERE username = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password")); // Hashed password
                user.setRole(resultSet.getString("role"));
            }

        } catch (SQLException e) {
            System.err.println("Error getting user by username: " + e.getMessage());
        }
        return user;
    }
}