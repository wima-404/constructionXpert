// src/main/webapp/jsp/admin/dashboard.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../../css/style.css">
</head>
<body>
<header>
    <h1>ConstructionXpert - Admin Dashboard</h1>
    <nav>
        <ul>
            <li><a href="../projects?action=list">Projects</a></li>
            <li><a href="../tasks?action=list">Tasks</a></li>
            <li><a href="../resources?action=list">Resources</a></li>
            <li><a href="../taskresources?action=list">TaskResources</a></li>
            <li><a href="../../logout">Logout</a></li>
        </ul>
    </nav>
</header>
<main>
    <h2>Welcome, Administrator!</h2>
    <p>Manage your projects, tasks and resources here.</p>
</main>
</body>
</html>