
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* CSS pour le header */
        .navbar-brand {
            font-weight: bold;
        }

        .header2 {
            height: 70%;
            background: url("https://en.idei.club/uploads/posts/2023-06/1686013328_en-idei-club-p-building-construction-background-dizain-in-26.jpg") no-repeat bottom right/cover;
        }

        .nav-link {
            font-weight: bold;
            color: white;
            display: flex;
            gap: 5px;
        }

        .navbar-expand-lg {
            height: 80px;
        }

        .titleProjet {
            width: 700px;
            margin: 118px auto;
            color: #1f1e1e;
            text-align: center;
        }

        .titleProjet h1 {
            font-size: 40px;
            text-transform: uppercase;
            font-weight: 800;
            text-shadow: 0 0 20px #ffffff;
        }

        /* CSS pour la section des projets */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            display: flex;
            width: 95%;
            margin: 20px auto;
        }

        .image-container {
            flex: 1;
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .content-container {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .content-container h1 {
            margin-top: 0;
        }

        .content-container p {
            line-height: 1.6;
        }

        .details p {
            margin: 5px 0;
        }

        .budget {
            display: flex;
            align-items: center;
        }

        .dollar {
            margin-left: 5px;
            font-size: 18px;
        }
        body{
            background-color: black;
        }
        .Content{
            color: white;
        }
    </style>
</head>
<body>
<header class="header2">
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <div class="logo">
                <img src="https://cdn.discordapp.com/attachments/1317121719705800825/1352611913380397066/images__1_-removebg-preview.png?ex=67e1f142&is=67e09fc2&hm=c663248077f7df5a2fde9e404eeaf1ff3433ac07c354d66c0e41174b73b0dcfc&" alt="image de logo" style="width: 50px; height: 50px;">
                <a class="navbar-brand" href="#">ConstructionXpert</a>
            </div>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link nav-link-shadow" href="#">Accueil</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link nav-link-shadow" href="#">Services</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link nav-link-shadow" href="#">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="titleProjet">
        <h1> Projets</h1>
    </div>
</header>

<c:forEach var="projet" items="${Projets}">
    <div class="container">
        <div class="image-container">
            <img src="${projet.getPicture_Url()}" alt="Lavender ambient interior">
        </div>
        <div class="content-container">
            <h1 class="Content">${projet.getNom()}</h1>
            <p class="Content">${projet.getDescription_projet()}</p>
            <div class="details">
                <p class="Content"><strong>Date début</strong>: ${projet.getDateDebut()}</p>
                <p class="Content"><strong>Date fin</strong>: ${projet.getDateFin()}</p>
                <div class="budget">
                    <p class="Content"><strong>Budget</strong>: ${projet.getBudget()}</p>
                    <div class="dollar">
                        <svg height="25px" width="25px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve" fill="#000000">
                            <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                            <g id="SVGRepo_iconCarrier">
                                <circle style="fill:#ffffff;" cx="256" cy="256" r="256"></circle>
                                <path style="fill:#ffce52;" d="M243.808,345.432v-74.348c-23.188-6.624-40.192-16.648-51.016-30.084 c-10.824-13.424-16.236-29.724-16.236-48.888c0-19.4,6.12-35.696,18.364-48.892c12.244-13.188,28.54-20.788,48.888-22.796v-17.572 h25.732v17.572c18.808,2.248,33.772,8.664,44.892,19.252c11.12,10.584,18.22,24.752,21.296,42.496l-44.896,5.856 c-2.724-13.952-9.82-23.42-21.292-28.392v69.384c28.392,7.692,47.736,17.656,58.024,29.904C337.856,271.172,343,286.868,343,306.032 c0,21.416-6.476,39.452-19.428,54.12s-30.968,23.66-54.036,26.972v33.18h-25.732v-32.292c-20.468-2.484-37.084-10.112-49.864-22.892 c-12.776-12.776-20.936-30.816-24.488-54.12l46.312-4.968c1.892,9.464,5.44,17.628,10.648,24.488 C231.62,337.392,237.42,342.36,243.808,345.432z M243.808,159.116c-6.98,2.368-12.54,6.388-16.68,12.068 c-4.144,5.676-6.212,11.948-6.212,18.808c0,6.268,1.892,12.092,5.676,17.476c3.784,5.388,9.52,9.736,17.212,13.044L243.808,159.116 L243.808,159.116z M269.536,347.916c8.872-1.648,16.084-5.76,21.648-12.328c5.56-6.568,8.34-14.284,8.34-23.156 c0-7.92-2.336-14.752-7.008-20.496c-4.672-5.74-12.332-10.14-22.98-13.224V347.916L269.536,347.916z">
                                </path>
                            </g>
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</body>
</html>
