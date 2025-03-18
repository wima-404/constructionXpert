// src/main/webapp/jsp/admin/tasks/add_task.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Task</title>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<header>
    <h1>ConstructionXpert - Add New Task</h1>
</header>
<main>
    <div class="container">
        <h2>Add Task</h2>
        <form action="../../../tasks?action=create" method="post">
            <div class="form-group">
                <label for="projectId">Project ID:</label> <input type="number"
                                                                  id="projectId" name="projectId" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description"></textarea>
            </div>
            <div class="form-group">
                <label for="startDate">Start Date:</label> <input type="date"
                                                                  id="startDate" name="startDate" required>
            </div>
            <div class="form-group">
                <label for="endDate">End Date:</label> <input type="date"
                                                              id="endDate" name="endDate" required>
            </div>
            <button type="submit">Save</button>
        </form>
    </div>
</main>
</body>
</html>