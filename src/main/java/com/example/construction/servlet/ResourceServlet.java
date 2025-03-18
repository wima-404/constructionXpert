package com.example.construction.servlet;

import com.example.construction.dao.ResourceDAO;
import com.example.construction.model.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/resources")
public class ResourceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ResourceDAO resourceDAO = new ResourceDAO();

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
                    createResource(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateResource(request, response);
                    break;
                case "delete":
                    deleteResource(request, response);
                    break;
                case "list":
                default:
                    listResources(request, response);
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

    private void listResources(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Resource> listResource = resourceDAO.getAllResources();
        request.setAttribute("listResource", listResource);
        request.getRequestDispatcher("jsp/admin/resources/list_resources.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("jsp/admin/resources/add_resource.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            if (id <= 0) {
                System.err.println("Invalid resource ID: " + id);
                request.setAttribute("errorMessage", "Invalid resource ID. Must be a positive number.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            Resource resource = resourceDAO.getResourceById(id);

            if (resource == null) {
                System.err.println("Resource with ID " + id + " not found.");
                request.setAttribute("errorMessage", "Resource not found.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            request.setAttribute("resource", resource);
            request.getRequestDispatcher("jsp/admin/resources/edit_resource.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.err.println("Invalid resource ID format: " + request.getParameter("id"));
            request.setAttribute("errorMessage", "Invalid resource ID.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }

    private void updateResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            if (id <= 0) {
                System.err.println("Invalid resource ID: " + id);
                request.setAttribute("errorMessage", "Invalid resource ID. Must be a positive number.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            String name = request.getParameter("name");
            if (name == null || name.trim().isEmpty()) {
                System.err.println("Invalid resource Name: " + name);
                request.setAttribute("errorMessage", "Resource Name cannot be empty.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            String type = request.getParameter("type");
            int quantity = 0;
            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
                if (quantity < 0) {
                    System.err.println("Invalid resource quantity: " + quantity);
                    request.setAttribute("errorMessage", "Resource quantity cannot be negative.");
                    request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                System.err.println("Invalid quantity format: " + request.getParameter("quantity"));
                request.setAttribute("errorMessage", "Invalid quantity format. Please enter a number.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            String supplierInfo = request.getParameter("supplierInfo");

            Resource resource = new Resource();
            resource.setId(id);
            resource.setName(name);
            resource.setType(type);
            resource.setQuantity(quantity);
            resource.setSupplierInfo(supplierInfo);

            resourceDAO.updateResource(resource);
            response.sendRedirect("resources?action=list");

        }  catch (ServletException | IOException e) {
            System.err.println("An error occurred during resource update: " + e.getMessage());
            request.setAttribute("errorMessage", "An error occurred while updating the resource. Please check the input.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }

    private void deleteResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            if (id <= 0) {
                System.err.println("Invalid resource ID: " + id);
                request.setAttribute("errorMessage", "Invalid resource ID. Must be a positive number.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            resourceDAO.deleteResource(id);
            response.sendRedirect("resources?action=list");

        } catch (NumberFormatException e) {
            System.err.println("Invalid resource ID format: " + request.getParameter("id"));
            request.setAttribute("errorMessage", "Invalid resource ID.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }

    private void createResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            if (name == null || name.trim().isEmpty()) {
                System.err.println("Invalid resource Name: " + name);
                request.setAttribute("errorMessage", "Resource Name cannot be empty.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            String type = request.getParameter("type");
            int quantity = 0;
            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
                if (quantity < 0) {
                    System.err.println("Invalid resource quantity: " + quantity);
                    request.setAttribute("errorMessage", "Resource quantity cannot be negative.");
                    request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                System.err.println("Invalid quantity format: " + request.getParameter("quantity"));
                request.setAttribute("errorMessage", "Invalid quantity format. Please enter a number.");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                return;
            }

            String supplierInfo = request.getParameter("supplierInfo");

            Resource newResource = new Resource();
            newResource.setName(name);
            newResource.setType(type);
            newResource.setQuantity(quantity);
            newResource.setSupplierInfo(supplierInfo);

            resourceDAO.addResource(newResource);
            response.sendRedirect("resources?action=list");

        } catch (ServletException | IOException e) {
            System.err.println("An error occurred during resource creation: " + e.getMessage());
            request.setAttribute("errorMessage", "An error occurred while creating the resource. Please check the input.");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
    }
}