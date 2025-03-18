// src/main/webapp/jsp/admin/resources/add_resource.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Resource</title>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<header>
    <h1>ConstructionXpert - Add New Resource</h1>
</header>
<main>
    <div class="container">
        <h2>Add Resource</h2>
        <form action="../../../resources?action=create" method="post">
            <div class="form-group">
                <label for="name">Name:</label> <input type="text" id="name"
                                                       name="name" required>
            </div>
            <div class="form-group">
                <label for="type">Type:</label> <input type="text" id="type"
                                                       name="type">
            </div>
            <div class="form-group">
                <label for="quantity">Quantity:</label> <input type="number"
                                                               id="quantity" name="quantity" required>
            </div>
            <div class="form-group">
                <label for="supplierInfo">Supplier Info:</label>
                <textarea id="supplierInfo" name="supplierInfo"></textarea>
            </div>
            <button type="submit">Save</button>
        </form>
    </div>
</main>
</body>
</html>