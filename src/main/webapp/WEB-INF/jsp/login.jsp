// src/main/webapp/jsp/login.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h2>Login</h2>
    <c:if test="${not empty loginError}">
        <p class="error">${loginError}</p>
    </c:if>
    <form action="login" method="post">
        <div class="form-group">
            <label for="username">Username:</label> <input type="text"
                                                           id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label> <input type="password"
                                                           id="password" name="password" required>
        </div>
        <button type="submit">Login</button>
    </form>
</div>
</body>
</html>