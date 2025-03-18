// src/main/webapp/jsp/admin/tasks/list_tasks.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Tasks</title>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<header>
    <h1>ConstructionXpert - List Tasks</h1>
</header>
<main>
    <div class="container">
        <h2>Tasks</h2>
        <a href="add_task.jsp" class="button">Add New Task</a>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Project ID</th>
                <th>Description</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="task" items="${listTask}">
                <tr>
                    <td>${task.id}</td>
                    <td>${task.projectId}</td>
                    <td>${task.description}</td>
                    <td><fmt:formatDate value="${task.startDate}"
                                        pattern="yyyy-MM-dd" /></td>
                    <td><fmt:formatDate value="${task.endDate}"
                                        pattern="yyyy-MM-dd" /></td>
                    <td><a href="edit_task.jsp?action=edit&id=${task.id}"
                           class="button">Edit</a> <a
                            href="../../../tasks?action=delete&id=${task.id}" class="button">Delete</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>