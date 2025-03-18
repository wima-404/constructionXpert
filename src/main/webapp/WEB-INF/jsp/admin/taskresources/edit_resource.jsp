// src/main/webapp/jsp/admin/taskresources/edit_taskresource.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit TaskResource</title>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<header>
    <h1>ConstructionXpert - Edit TaskResource</h1>
</header>
<main>
    <div class="container">
        <h2>Edit TaskResource</h2>
        <form action="../../../taskresources?action=update" method="post">
            <input type="hidden" name="taskId" value="${taskResource.taskId}">
            <input type="hidden" name="resourceId" value="${taskResource.resourceId}">
            <div class="form-group">
                <label for="quantityNeeded">Quantity Needed:</label> <input
                    type="number" id="quantityNeeded" name="quantityNeeded"
                    value="${taskResource.quantityNeeded}" required>
            </div>
            <button type="submit">Update</button>
            <a href="../../../taskresources?action=delete&taskId=${taskResource.taskId}&resourceId=${taskResource.resourceId}" class="button">Delete TaskResource</a>
        </form>
    </div>
</main>
</body>
</html>