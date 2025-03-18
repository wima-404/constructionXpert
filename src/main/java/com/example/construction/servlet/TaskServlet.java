package com.example.construction.servlet;

import com.example.construction.dao.TaskDAO;
import com.example.construction.model.Task;
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

@WebServlet("/tasks")
public class TaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final TaskDAO taskDAO = new TaskDAO();
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
                    createTask(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateTask(request, response);
                    break;
                case "delete":
                    deleteTask(request, response);
                    break;
                case "list":
                default:
                    listTasks(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
            System.err.println("Error processing request: " + e.getMessage());
            request.setAttribute("errorMessage", "An error occurred while processing your request.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void listTasks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Task> listTask = taskDAO.getAllTasks();
        request.setAttribute("listTask", listTask);
        request.getRequestDispatcher("jsp/admin/tasks/list_tasks.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("jsp/admin/tasks/add_task.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            if (id <= 0) {
                System.err.println("Invalid task ID: " + id);
                request.setAttribute("errorMessage", "Invalid task ID. Must be a positive number.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            Task task = taskDAO.getTaskById(id);

            if (task == null) {
                System.err.println("Task with ID " + id + " not found.");
                request.setAttribute("errorMessage", "Task not found.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            request.setAttribute("task", task);
            request.getRequestDispatcher("jsp/admin/tasks/edit_task.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.err.println("Invalid task ID format: " + request.getParameter("id"));
            request.setAttribute("errorMessage", "Invalid task ID.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }

    private void updateTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            if (id <= 0) {
                System.err.println("Invalid task ID: " + id);
                request.setAttribute("errorMessage", "Invalid task ID. Must be a positive number.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            int projectId = 0;
            try {
                projectId = Integer.parseInt(request.getParameter("projectId"));
                if (projectId < 0) {
                    System.err.println("Invalid project ID: " + projectId);
                    request.setAttribute("errorMessage", "Project ID cannot be negative.");
                    request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                System.err.println("Invalid project ID format: " + request.getParameter("projectId"));
                request.setAttribute("errorMessage", "Invalid project ID format. Please enter a number.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            String description = request.getParameter("description");
            if (description == null || description.trim().isEmpty()) {
                System.err.println("Invalid task description: " + description);
                request.setAttribute("errorMessage", "Task description cannot be empty.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            Date startDate = null;
            try {
                startDate = dateFormat.parse(request.getParameter("startDate"));
            } catch (ParseException e) {
                System.err.println("Invalid date format: " + request.getParameter("startDate"));
                request.setAttribute("errorMessage", "Invalid start date format. Please use yyyy-MM-dd.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            Date endDate = null;
            try {
                endDate = dateFormat.parse(request.getParameter("endDate"));
            } catch (ParseException e) {
                System.err.println("Invalid date format: " + request.getParameter("endDate"));
                request.setAttribute("errorMessage", "Invalid end date format. Please use yyyy-MM-dd.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            Task task = new Task();
            task.setId(id);
            task.setProjectId(projectId);
            task.setDescription(description);
            task.setStartDate(startDate);
            task.setEndDate(endDate);

            taskDAO.updateTask(task);
            response.sendRedirect("tasks?action=list");

        } catch (ServletException | IOException e) {
            System.err.println("An error occurred during task update: " + e.getMessage());
            request.setAttribute("errorMessage", "An error occurred while updating the task. Please check the input.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }

    private void deleteTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            if (id <= 0) {
                System.err.println("Invalid task ID: " + id);
                request.setAttribute("errorMessage", "Invalid task ID. Must be a positive number.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            taskDAO.deleteTask(id);
            response.sendRedirect("tasks?action=list");

        } catch (NumberFormatException e) {
            System.err.println("Invalid task ID format: " + request.getParameter("id"));
            request.setAttribute("errorMessage", "Invalid task ID.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }

    private void createTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int projectId = 0;
            try {
                projectId = Integer.parseInt(request.getParameter("projectId"));
                if (projectId < 0) {
                    System.err.println("Invalid project ID: " + projectId);
                    request.setAttribute("errorMessage", "Project ID cannot be negative.");
                    request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                System.err.println("Invalid project ID format: " + request.getParameter("projectId"));
                request.setAttribute("errorMessage", "Invalid project ID format. Please enter a number.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            String description = request.getParameter("description");
            if (description == null || description.trim().isEmpty()) {
                System.err.println("Invalid task description: " + description);
                request.setAttribute("errorMessage", "Task description cannot be empty.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            Date startDate = null;
            try {
                startDate = dateFormat.parse(request.getParameter("startDate"));
            } catch (ParseException e) {
                System.err.println("Invalid date format: " + request.getParameter("startDate"));
                request.setAttribute("errorMessage", "Invalid start date format. Please use yyyy-MM-dd.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            Date endDate = null;
            try {
                endDate = dateFormat.parse(request.getParameter("endDate"));
            } catch (ParseException e) {
                System.err.println("Invalid date format: " + request.getParameter("endDate"));
                request.setAttribute("errorMessage", "Invalid end date format. Please use yyyy-MM-dd.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            Task newTask = new Task();
            newTask.setProjectId(projectId);
            newTask.setDescription(description);
            newTask.setStartDate(startDate);
            newTask.setEndDate(endDate);

            taskDAO.addTask(newTask);
            response.sendRedirect("tasks?action=list");

        } catch (ServletException | IOException e) {
            System.err.println("An error occurred during task creation: " + e.getMessage());
            request.setAttribute("errorMessage", "An error occurred while creating the task. Please check the input.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }
}