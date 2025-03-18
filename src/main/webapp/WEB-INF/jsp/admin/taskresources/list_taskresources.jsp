// src/main/webapp/jsp/admin/taskresources/list_taskresources.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List TaskResources</title>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<header>
    <h1>ConstructionXpert - List TaskResources</h1>
</header>
<main>
    <div class="container">
        <h2>TaskResources</h2>
        <a href="add_taskresource.jsp" class="button">Add New TaskResource</a>
        <table>
            <thead>
            <tr>
                <th>Task ID</th>
                <th>Resource ID</th>
                <th>Quantity Needed</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="taskResource" items="${listTaskResource}">
                <tr>
                    <td>${taskResource.taskId}</td>
                    <td>${taskResource.resourceId}</td>
                    <td>${taskResource.quantityNeeded}</td>
                    <td><a href="edit_taskresource.jsp?action=edit&taskId=${taskResource.taskId}&resourceId=${taskResource.resourceId}" class="button">Edit</a>
                        <a href="../../../taskresources?action=delete&taskId=${taskResource.taskId}&resourceId=${taskResource.resourceId}" class="button">Delete</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>