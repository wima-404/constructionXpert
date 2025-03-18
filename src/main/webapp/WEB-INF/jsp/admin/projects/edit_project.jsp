// src/main/webapp/jsp/admin/projects/edit_project.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Project</title>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<header>
    <h1>ConstructionXpert - Edit Project</h1>
</header>
<main>
    <div class="container">
        <h2>Edit Project</h2>
        <form action="../../../projects?action=update" method="post">
            <input type="hidden" name="id" value="${project.id}">
            <div class="form-group">
                <label for="name">Name:</label> <input type="text" id="name"
                                                       name="name" value="${project.name}" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description">${project.description}</textarea>
            </div>
            <div class="form-group">
                <label for="startDate">Start Date:</label> <input type="date"
                                                                  id="startDate" name="startDate"
                                                                  value="<fmt:formatDate value="${project.startDate}" pattern="yyyy-MM-dd"/>"
                                                                  required>
            </div>
            <div class="form-group">
                <label for="endDate">End Date:</label> <input type="date"
                                                              id="endDate" name="endDate"
                                                              value="<fmt:formatDate value="${project.endDate}" pattern="yyyy-MM-dd"/>"
                                                              required>
            </div>
            <div class="form-group">
                <label for="budget">Budget:</label> <input type="number" id="budget"
                                                           name="budget" step="0.01" value="${project.budget}" required>
            </div>
            <button type="submit">Update</button>
            <a href="../../../projects?action=delete&id=${project.id}" class="button">Delete
                Project</a>
        </form>
    </div>
</main>
</body>
</html>