// src/main/webapp/jsp/admin/resources/edit_resource.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Resource</title>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<header>
    <h1>ConstructionXpert - Edit Resource</h1>
</header>
<main>
    <div class="container">
        <h2>Edit Resource</h2>
        <form action="../../../resources?action=update" method="post">
            <input type="hidden" name="id" value="${resource.id}">
            <div class="form-group">
                <label for="name">Name:</label> <input type="text" id="name"
                                                       name="name" value="${resource.name}" required>
            </div>
            <div class="form-group">
                <label for="type">Type:</label> <input type="text" id="type"
                                                       name="type" value="${resource.type}">
            </div>
            <div class="form-group">
                <label for="quantity">Quantity:</label> <input type="number"
                                                               id="quantity" name="quantity" value="${resource.quantity}" required>
            </div>
            <div class="form-group">
                <label for="supplierInfo">Supplier Info:</label>
                <textarea id="supplierInfo" name="supplierInfo">${resource.supplierInfo}</textarea>
            </div>
            <button type="submit">Update</button>
            <a href="../../../resources?action=delete&id=${resource.id}" class="button">Delete
                Resource</a>
        </form>
    </div>
</main>
</body>
</html>