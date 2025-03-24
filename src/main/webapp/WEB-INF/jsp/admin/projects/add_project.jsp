<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ConstructionXpert - Projets</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            background-color: #f0f0f0;
        }

        .container {
            width: 100%; /* Full width */
            max-width: 800px; /* Maximum width */
            margin: 0 auto; /* Center the container */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 2px solid #007bff; /* Blue border */
            box-sizing: border-box; /* Include border in width calculation */
        }

        header {
            background-color: #fff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            height: 40px; /* Adjust as needed */
            margin-right: 10px;
        }

        .logo span {
            font-weight: bold;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        nav li {
            margin-left: 20px;
        }

        nav a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        .image-container {
            position: relative;
        }

        .image-container img {
            width: 100%;
            display: block; /* Remove extra space below image */
        }

        .overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 3em; /* Larger text */
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Text shadow for readability */
        }

        footer {
            padding: 20px;
            text-align: right;
        }
        footer img {
            height: 40px;
        }
    </style>
</head>
<body>

<div class="container">
    <header>
        <div class="logo">
            <img src="<%=request.getContextPath()%>/images/logo.png" alt="ConstructionXpert Logo">
            <span>ConstructionXpert</span>
        </div>
        <nav>
            <ul>
                <li><a href="<%=request.getContextPath()%>/index.jsp">Accueil</a></li>
                <li><a href="<%=request.getContextPath()%>/projets.jsp">Projets</a></li>
                <li><a href="<%=request.getContextPath()%>/contact.jsp">Contact</a></li>
            </ul>
        </nav>
    </header>

    <div class="image-container">
        <img src="<%=request.getContextPath()%>/images/projects-image.jpg" alt="Luxury Villa">
        <div class="overlay">PROJETS</div>
    </div>
    <footer>
        <img src="<%=request.getContextPath()%>/images/footer-logo.png" alt="footer logo"/>
    </footer>

</div>

</body>
</html>