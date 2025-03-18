// src/main/webapp/jsp/error.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h2>Error</h2>
    <p class="error">${errorMessage}</p>
    <a href="javascript:history.back()">Go Back</a>
</div>
</body>
</html>