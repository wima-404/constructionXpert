// src/main/webapp/jsp/admin/taskresources/add_taskresource.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New TaskResource</title>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<header>
    <h1>ConstructionXpert - Add New TaskResource</h1>
</header>
<main>
    <div class="container">
        <h2>Add TaskResource</h2>
        <form action="../../../taskresources?action=create" method="post">
            <div class="form-group">
                <label for="taskId">Task ID:</label> <input type="number"
                                                            id="taskId" name="taskId" required>
            </div>
            <div class="form-group">
                <label for="resourceId">Resource ID:</label> <input type="number"
                                                                    id="resourceId" name="resourceId" required>
            </div>
            <div class="form-group">
                <label for="quantityNeeded">Quantity Needed:</label> <input
                    type="number" id="quantityNeeded" name="quantityNeeded" required>
            </div>
            <button type="submit">Save</button>
        </form>
    </div>
</main>
</body>
</html>