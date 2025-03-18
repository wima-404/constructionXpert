// src/main/webapp/jsp/admin/tasks/edit_task.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Task</title>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<header>
    <h1>ConstructionXpert - Edit Task</h1>
</header>
<main>
    <div class="container">
        <h2>Edit Task</h2>
        <form action="../../../tasks?action=update" method="post">
            <input type="hidden" name="id" value="${task.id}">
            <div class="form-group">
                <label for="projectId">Project ID:</label> <input type="number"
                                                                  id="projectId" name="projectId" value="${task.projectId}" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description">${task.description}</textarea>
            </div>
            <div class="form-group">
                <label for="startDate">Start Date:</label> <input type="date"
                                                                  id="startDate" name="startDate"
                                                                  value="<fmt:formatDate value="${task.startDate}" pattern="yyyy-MM-dd"/>"
                                                                  required>
            </div>
            <div class="form-group">
                <label for="endDate">End Date:</label> <input type="date"
                                                              id="endDate" name="endDate"
                                                              value="<fmt:formatDate value="${task.endDate}" pattern="yyyy-MM-dd"/>"
                                                              required>
            </div>
            <button type="submit">Update</button>
            <a href="../../../tasks?action=delete&id=${task.id}" class="button">Delete
                Task</a>
        </form>
    </div>
</main>
</body>
</html>