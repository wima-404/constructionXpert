// src/main/webapp/jsp/admin/resources/list_resources.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Resources</title>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<header>
    <h1>ConstructionXpert - List Resources</h1>
</header>
<main>
    <div class="container">
        <h2>Resources</h2>
        <a href="add_resource.jsp" class="button">Add New Resource</a>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>Quantity</th>
                <th>Supplier Info</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="resource" items="${listResource}">
                <tr>
                    <td>${resource.id}</td>
                    <td>${resource.name}</td>
                    <td>${resource.type}</td>
                    <td>${resource.quantity}</td>
                    <td>${resource.supplierInfo}</td>
                    <td><a href="edit_resource.jsp?action=edit&id=${resource.id}"
                           class="button">Edit</a> <a
                            href="../../../resources?action=delete&id=${resource.id}"
                            class="button">Delete</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>