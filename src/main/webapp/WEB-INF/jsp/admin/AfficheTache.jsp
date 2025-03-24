
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ConstructionXpert.model.Tache" %>
<%
    List<Tache> taskList = (List<Tache>) request.getAttribute("Tache");
%>
<html>
<head>
    <title>Title</title>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Tâches</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>

        /* Style de header */
        body{
            background-color: black;
        }

        .navbar-brand {
            font-weight: bold;
        }
        .navbar-light .navbar-brand{
            margin-top: 5px;
        }
        .nav-link-shadow {
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        .logo{
            display: flex;
            gap: 10px;
        }

        .header2{

            height: 65%;

            background :url("https://cdn.discordapp.com/attachments/1317121719705800825/1352611874822295562/668832bd40ac2950a.jpg?ex=67e1f139&is=67e09fb9&hm=80c4d56cc3b996a4454be54d43f886041783f31a10fd7446647e3b169f846fd0&")no-repeat bottom right/cover ;
        }
        .nav-link{
            font-weight: bold;
            color: white;
            display: flex;
            gap: 5px;
        }
        .navbar-expand-lg{
            height: 80px;
        }


        .titleProjet{

            width:700px;
            margin:118px auto;
            color:white;
            text-align: center;


        }
        .titleProjet >h1{
            font-size: 48px;
            font-weight: 600;
            color: black;

            text-transform:uppercase;

            text-shadow: 0 0 20px white;

        }



        .card-custom {
            margin-bottom: 20px;
        }
        .card-footer-custom {
            display: flex;
            justify-content: space-between;
        }
        .btn-custom {
            display: inline-flex;
            align-items: center;
        }
        .btn-custom i {
            margin-right: 5px;
        }


        .card {
            display: flex;

            align-items: center;
            flex: 1 1 calc(50% - 1rem);
            flex-direction: row;

            flex-wrap: wrap;
            justify-content: left;
            background-color: #ffffff;
            border: 1px solid #d73ddc;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
            margin-bottom: 20px;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgb(4, 3, 4);
        }

        .btn {
            font-size: 14px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            background-color: #040304;
            color: white;
            padding: 0.375rem 0.75rem;
            width: 131PX;
        }

        .btn:hover {
            background-color: #d73ddc;
            box-shadow: 0 4px 8px rgb(255, 255, 255);
        }

        .d-inline {

            transition: background-color 0.3s ease;
            background-color: #d73ddc;
            color: white;
        }

        .d-inline:hover {
            background-color: #d73ddc;
            box-shadow: 0 4px 8px rgb(4, 3, 4);
        }
        .mb-4 {
            margin-bottom: 1.5rem !important;
            color: white;
        }



        .card-img-container img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }
        .card-footer-custom {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            gap: 12px;
        }

        .card-buttons {
            margin-top: auto;
        }


        .add-project-btn {
            background-color: #d73ddc;
            color: black;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 36px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease, color 0.3s ease, text-shadow 0.3s ease;
        }


        .add-project-btn {
            font-weight: bold;
        }


        .add-project-btn:hover {
            background-color: #d73ddc;
            color: white;
            text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.7);
        }
        .btnAjou{
            margin-top: 18px;
            margin-left: 10px;
        }


    </style>
</head>





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
                        <a class="nav-link nav-link-shadow" href="/ConstructionXpert_Services_Solution_war_exploded/AfficherProjet">Projets</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link nav-link-shadow" href="#">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="titleProjet">
        <h1> Taches</h1>
    </div>
</header>



<body>
<a href="/ConstructionXpert_Services_Solution_war_exploded/addTache?id=${idProjet}">
    <button class="btn-btn-warning">Ajouter une tache</button>
</a>
<div class="container mt-5">
    <h2 class="mb-4" style="color: white;">Liste des Tâches</h2>
    <%
        if (taskList != null) {
            for (Tache tache : taskList) {
    %>
    <div class="card">
        <div class="card-body">
            <p><strong>Description :</strong> <%= tache.getDescription_tache() %></p>
            <p><strong>Date début :</strong> <%= tache.getDate_debut() %></p>
            <p><strong>Date fin :</strong> <%= tache.getDate_fin() %></p>
            <p><strong>Statut :</strong> <%= tache.getStatut() %></p>
        </div>
        <div class="card-footer">
            <a href="UpdateTache?id=<%= tache.getTache_id() %>" class="btn btn-warning">Edit</a>
            <a href="ShowRessourceTache?id=<%= tache.getTache_id() %>" class="btn btn-info">Show Resource</a>
            <form action="DeleteTache" method="post" style="display: inline;">
                <input type="hidden" name="tacheId" value="<%= tache.getProjet_id() %>">
                <input type="hidden" name="projet_id" value="<%= tache.getTache_id() %>">
                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this task?')">Delete</button>
            </form>
        </div>
    </div>
    <%
            }
        }
    %>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>




