// src/main/java/com/example/construction/servlet/ProjectServlet.java
package com.example.construction.servlet;

import com.example.construction.dao.ProjectDAO;
import com.example.construction.model.Project;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/projects")
public class ProjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ProjectDAO projectDAO = new ProjectDAO();
    private final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "create":
                    createProject(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateProject(request, response);
                    break;
                case "delete":
                    deleteProject(request, response);
                    break;
                case "list":
                default:
                    listProjects(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
            System.err.println("Error processing request: " + e.getMessage());
            request.setAttribute("errorMessage", "An error occurred while processing your request.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response); // Centralized error handling
        }
    }

    private void listProjects(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Project> listProject = projectDAO.getAllProjects();
        request.setAttribute("listProject", listProject);
        request.getRequestDispatcher("jsp/admin/projects/list_projects.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("jsp/admin/projects/add_project.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Project project = projectDAO.getProjectById(id);

            if (project == null) {
                System.err.println("Project with ID " + id + " not found.");
                request.setAttribute("errorMessage", "Project not found.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            request.setAttribute("project", project);
            request.getRequestDispatcher("jsp/admin/projects/edit_project.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.err.println("Invalid project ID format: " + request.getParameter("id"));
            request.setAttribute("errorMessage", "Invalid project ID.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }

    private void updateProject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            Date startDate = dateFormat.parse(request.getParameter("startDate"));
            Date endDate = dateFormat.parse(request.getParameter("endDate"));
            double budget = Double.parseDouble(request.getParameter("budget"));

            Project project = new Project();
            project.setId(id);
            project.setName(name);
            project.setDescription(description);
            project.setStartDate(startDate);
            project.setEndDate(endDate);
            project.setBudget(budget);

            projectDAO.updateProject(project);
            response.sendRedirect("projects?action=list");

        } catch (ParseException e) {
            System.err.println("Error parsing date: " + request.getParameter("startDate") + " or " + request.getParameter("endDate"));
            request.setAttribute("errorMessage", "Invalid date format. Please use yyyy-MM-dd.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.err.println("Invalid budget format: " + request.getParameter("budget"));
            request.setAttribute("errorMessage", "Invalid budget format.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }

    private void deleteProject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            projectDAO.deleteProject(id);
            response.sendRedirect("projects?action=list");
        } catch (NumberFormatException e) {
            System.err.println("Invalid project ID format: " + request.getParameter("id"));
            request.setAttribute("errorMessage", "Invalid project ID.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }

    private void createProject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            Date startDate = dateFormat.parse(request.getParameter("startDate"));
            Date endDate = dateFormat.parse(request.getParameter("endDate"));
            double budget = Double.parseDouble(request.getParameter("budget"));

            Project newProject = new Project();
            newProject.setName(name);
            newProject.setDescription(description);
            newProject.setStartDate(startDate);
            newProject.setEndDate(endDate);
            newProject.setBudget(budget);

            projectDAO.addProject(newProject);
            response.sendRedirect("projects?action=list");

        } catch (ParseException e) {
            System.err.println("Error parsing date: " + request.getParameter("startDate") + " or " + request.getParameter("endDate"));
            request.setAttribute("errorMessage", "Invalid date format. Please use yyyy-MM-dd.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.err.println("Invalid budget format: " + request.getParameter("budget"));
            request.setAttribute("errorMessage", "Invalid budget format.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }
}