// src/main/webapp/index.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ConstructionXpert</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
    <h1>ConstructionXpert</h1>
    <nav>
        <ul>
            <li><a href="projects?action=list">Projects</a></li>
            <li><a href="tasks?action=list">Tasks</a></li>
            <li><a href="resources?action=list">Resources</a></li>
            <li><a href="taskresources?action=list">TaskResources</a></li>
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <li>Welcome, ${sessionScope.user.username}!</li>
                    <li><a href="logout">Logout</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="jsp/login.jsp">Login</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</header>
<main>
    <h2>Welcome to ConstructionXpert</h2>
    <p>Your construction project management solution.</p>
</main>
</body>
</html>