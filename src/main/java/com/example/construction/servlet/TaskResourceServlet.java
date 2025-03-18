package com.example.construction.servlet;

import com.example.construction.dao.TaskResourceDAO;
import com.example.construction.model.TaskResource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/taskresources")
public class TaskResourceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final TaskResourceDAO taskResourceDAO = new TaskResourceDAO();

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
                    createTaskResource(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateTaskResource(request, response);
                    break;
                case "delete":
                    deleteTaskResource(request, response);
                    break;
                case "list":
                default:
                    listTaskResources(request, response);
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

    private void listTaskResources(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TaskResource> listTaskResource = taskResourceDAO.getAllTaskResources();
        request.setAttribute("listTaskResource", listTaskResource);
        request.getRequestDispatcher("jsp/admin/taskresources/list_taskresources.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("jsp/admin/taskresources/add_taskresource.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int taskId = Integer.parseInt(request.getParameter("taskId"));
            int resourceId = Integer.parseInt(request.getParameter("resourceId"));
            TaskResource taskResource = taskResourceDAO.getTaskResourceByIds(taskId, resourceId);

            if (taskResource == null) {
                System.err.println("TaskResource with task ID " + taskId + " and resource ID "+ resourceId+" not found.");
                request.setAttribute("errorMessage", "TaskResource not found.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            request.setAttribute("taskResource", taskResource);
            request.getRequestDispatcher("jsp/admin/taskresources/edit_taskresource.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.err.println("Invalid TaskResource ID format: " + request.getParameter("id"));
            request.setAttribute("errorMessage", "Invalid TaskResource ID.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }

    private void updateTaskResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int taskId = Integer.parseInt(request.getParameter("taskId"));
            int resourceId = Integer.parseInt(request.getParameter("resourceId"));
            int quantityNeeded = Integer.parseInt(request.getParameter("quantityNeeded"));

            TaskResource taskResource = new TaskResource();
            taskResource.setTaskId(taskId);
            taskResource.setResourceId(resourceId);
            taskResource.setQuantityNeeded(quantityNeeded);

            taskResourceDAO.updateTaskResource(taskResource);
            response.sendRedirect("taskresources?action=list");

        } catch (NumberFormatException e) {
            System.err.println("Invalid input format.");
            request.setAttribute("errorMessage", "Invalid input format.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }

    private void deleteTaskResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int taskId = Integer.parseInt(request.getParameter("taskId"));
            int resourceId = Integer.parseInt(request.getParameter("resourceId"));
            taskResourceDAO.deleteTaskResource(taskId, resourceId);
            response.sendRedirect("taskresources?action=list");
        } catch (NumberFormatException e) {
            System.err.println("Invalid TaskResource ID format: " + request.getParameter("id"));
            request.setAttribute("errorMessage", "Invalid TaskResource ID.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }

    private void createTaskResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int taskId = Integer.parseInt(request.getParameter("taskId"));
            int resourceId = Integer.parseInt(request.getParameter("resourceId"));
            int quantityNeeded = Integer.parseInt(request.getParameter("quantityNeeded"));

            TaskResource newTaskResource = new TaskResource();
            newTaskResource.setTaskId(taskId);
            newTaskResource.setResourceId(resourceId);
            newTaskResource.setQuantityNeeded(quantityNeeded);

            taskResourceDAO.addTaskResource(newTaskResource);
            response.sendRedirect("taskresources?action=list");
        }  catch (NumberFormatException e) {
            System.err.println("Invalid input format.");
            request.setAttribute("errorMessage", "Invalid input format.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }
}