// src/main/webapp/jsp/admin/projects/list_projects.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Projects</title>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<header>
    <h1>ConstructionXpert - List Projects</h1>
</header>
<main>
    <div class="container">
        <h2>Projects</h2>
        <a href="add_project.jsp" class="button">Add New Project</a>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Budget</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="project" items="${listProject}">
                <tr>
                    <td>${project.id}</td>
                    <td>${project.name}</td>
                    <td>${project.description}</td>
                    <td><fmt:formatDate value="${project.startDate}"
                                        pattern="yyyy-MM-dd" /></td>
                    <td><fmt:formatDate value="${project.endDate}"
                                        pattern="yyyy-MM-dd" /></td>
                    <td>${project.budget}</td>
                    <td><a href="edit_project.jsp?action=edit&id=${project.id}"
                           class="button">Edit</a> <a
                            href="../../../projects?action=delete&id=${project.id}"
                            class="button">Delete</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>