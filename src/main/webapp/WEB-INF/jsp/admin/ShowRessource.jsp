<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="ConstructionXpert.model.Ressource" %>
<html>
<head>
    <title>Gestion des Ressources</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

    <style>
        /* Style de header */
        .navbar-brand {
            font-weight: bold;
        }
        .navbar-light .navbar-brand {
            margin-top: 5px;
        }
        .nav-link-shadow {
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        .logo {
            display: flex;
            gap: 10px;
        }

        .header2 {
            height: 65%;
            background: url("https://cdn.discordapp.com/attachments/1317121719705800825/1353686061276074098/img.jpg?ex=67e28de3&is=67e13c63&hm=6383c95097cedd4ee550a82f7c6f3fb7660875250abc141def1d809974ae3278& ") no-repeat bottom right / cover;
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
            color: white;
            text-align: center;
        }
        .titleProjet > h1 {
            font-size: 48px;
            font-weight: 600;
            color: black;
            text-transform: uppercase;
            text-shadow: 0 0 20px white;
        }


        body {
            background-color: #1f1e1e;
            font-family: Arial, sans-serif;
        }
        .card-header h2 {
            font-size: 1.5em;
            margin: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        }

        .card-body h3, .card-body h4 {
            font-size: 1.1em;
            margin: 0.5em 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        }

        .btn-primary {
            background-color: #d73ddc;
            border-color: #ffffff;
        }
        .btn-primary:hover {
            background-color: #d73ddc;
            border-color: #ffffff;
        }
        .btn {
            font-size: 1em;
            padding: 0.375rem 0.75rem;

        }
        .card-footer {
            display: flex;

            align-items: center;
            height: 20%;
            justify-content: right;
            gap: 20px;
        }
        .resource-container {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
        }

        .card {
            display: flex;
            flex-direction: row;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            color: #040304;
            transition: transform 0.2s;

            flex: 1 1 calc(50% - 1rem);
            max-width: calc(50% - 1rem);
            flex-wrap: wrap;
            justify-content: left;


            background-color: #ffffff;
            border: 1px solid #d73ddc;
            border-radius: 8px;

            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);


        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(239, 235, 235, 0.01);

        }

        .btn {
            font-size: 14px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            background-color: #d73ddc;
            color: white;
        }

        .btn:hover {
            background-color: #d73ddc;
            box-shadow: 0 4px 8px rgb(255, 255, 255);
        }

        .d-inline{
            margin-top: 16px;
            transition: background-color 0.3s ease;
            background-color: #ffffff;
            color: rgba(11, 10, 10, 0.01);
        }
        .d-inline:hover {
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgb(215, 61, 220);
        }

        .card-img-container {
            flex: 0 0 150px;
            margin-right: 1rem;
            justify-content: center;
            align-items: center;
            display: flex;
        }
        .card-img-container img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }
        .card-content {
            flex: 1;
        }
        .imgRessource {
            display: flex;
        }
        .container {
            margin-right: 0px;
            margin-left: 35px;
        }


        .titre{
            font-family: "Poppins", sans-serif;
            color: rgba(255, 255, 255, 0.95);
            line-height: 1.2em;
            margin-bottom: 55px;
            margin-top: 55px;
            font-weight: 600;
            font-size: 36px;
        }
        .para{
            display: flex;
            justify-content: center;
            align-content: center;
            margin: 20px auto;
        }
        /* style du button */
        .add-project-btn {
            background-color: #d73ddc;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 35px -8px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease, color 0.3s ease, text-shadow 0.3s ease;
        }

        /* Ombre pour le texte */
        .add-project-btn {
            font-weight: bold;
        }

        /* Effet hover */
        .add-project-btn:hover {
            background-color: #d73ddc;
            color: white;
            text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.7);
        }
        .btnAjou{
            margin-top: 18px;
            margin-left: 10px;
        }


        /* Responsive styles */
        @media (max-width: 1200px) {
            .card {
                flex: 1 1 calc(50% - 1rem);
                max-width: calc(50% - 1rem);
            }
            .card-header h2 {
                font-size: 1.4em;
            }
            .card-body h3, .card-body h4 {
                font-size: 1em;
            }
        }

        @media (max-width: 834px) {
            .card {
                flex: 1 1 calc(100% - 1rem);
                max-width: calc(100% - 1rem);
            }
            .card-header h2 {
                font-size: 1.3em;
            }
            .card-body h3, .card-body h4 {
                font-size: 0.9em;
            }
        }

        @media (max-width: 600px) {
            .card {
                flex: 1 1 calc(100% - 1rem);
                max-width: calc(100% - 1rem);
            }
            .card-header h2 {
                font-size: 1.2em;
            }
            .card-body h3, .card-body h4 {
                font-size: 0.8em;
            }
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
                        <a class="nav-link nav-link-shadow" href="#">Projets</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link nav-link-shadow" href="#">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="titleProjet">
        <h1>Ressources</h1>
    </div>
</header>
<div class="para">
    <h1 class="titre"> Voyez Vos Ressources</h1>
</div>


<div class="container mt-4">
    <a href="/ConstructionXpert_Services_Solution_war_exploded/AddRessource?id=<%= request.getAttribute("idtache") %>" >
        <div class="btnAjou">
            <button class="add-project-btn"> Ajouter une ressource</button>
        </div>
    </a>

    <div class="resource-container">
        <%
            List<Ressource> ressources = (List<Ressource>) request.getAttribute("Ressources");
            if (ressources != null) {
                for (Ressource ressource : ressources) {
        %>
        <div class="card mb-4">
            <div class="card-content">
                <div class="card-header">
                    <h2 class="card-title">Ressource N°: <%= ressource.getRessource_id() %></h2>
                </div>
                <div class="imgRessource">
                    <div class="card-body">
                        <h3>Nom: <%= ressource.getRessource_nom() %></h3>
                        <h4>Type: <%= ressource.getType_ressource() %></h4>
                        <h4>Quantité: <%= ressource.getQuantite() %></h4>
                        <h4>Fournisseur: <%= ressource.getFournisseur() %></h4>
                        <h4>Tâche N°: <%= ressource.getTache_id() %></h4>
                    </div>
                    <div class="card-img-container">
                        <img src="https://cdn.discordapp.com/attachments/1317121719705800825/1352611874822295562/668832bd40ac2950a.jpg?ex=67e1f139&is=67e09fb9&hm=80c4d56cc3b996a4454be54d43f886041783f31a10fd7446647e3b169f846fd0&" alt="Image de la ressource">
                    </div>
                </div>
                <div class="card-footer">
                    <a href="UpdateRessourceTache?id=<%= ressource.getRessource_id() %>" class="btn">
                        <i class="bi bi-pencil me-2"></i> Modifier
                    </a>
                    <form action="DeleteRessource" method="post" class="d-inline">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="RessourceId" value="<%= ressource.getRessource_id() %>">
                        <input type="hidden" name="TacheId" value="<%= ressource.getTache_id() %>">
                        <button type="submit" class="btn btn-danger" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette ressource ?')">
                            <i class="bi bi-trash me-2"></i> Supprimer
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>

</body>
</html>
