<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Accueil</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style><%@ include file="Style.css"%></style>
</head>
<body>
<header class="header">

    <nav class="navbar navbar-expand-lg navbar-light" id="nav">
        <div class="container">
            <div class="logo">
                <img src="https://cdn.discordapp.com/attachments/1317121719705800825/1352611913380397066/images__1_-removebg-preview.png?ex=67e1f142&is=67e09fc2&hm=c663248077f7df5a2fde9e404eeaf1ff3433ac07c354d66c0e41174b73b0dcfc&" alt="image de logo" style="width: 50px; height: 50px;">
                <a class="navbar-brand" href="#">ConstructionXpert</a>
            </div>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link nav-link-shadow" href="WEB-INF/Acceuil.jsp">Accueil</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link nav-link-shadow" href="${pageContext.request.contextPath}/ConstructionXpert_Services_Solution_war_exploded/AfficherProjet">Projets</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link nav-link-shadow" href="<c:url value="/ShowTaches.jsp">Tache</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link nav-link-shadow" href="WEB-INF/ShowRessource.jsp">Ressource</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="title">
        <h1> Gestion de Projets de Construction Efficace </h1>
        <p class="description">Planifiez, organisez et gérez vos projets de construction avec précision et efficacité grâce à une interface intuitive qui permet de visualiser, mettre à jour et supprimer des projets, des tâches et des ressources, tout en assurant la sécurité et l'intégrité de vos données.</p>


        <a href="/ConstructionXpert_Services_Solution_war_exploded/AfficherProjet" class="btn">Let's Go</a>
    </div>


</header>


<div class="container text-center my-5">
    <h2>Ce que nous offrons à nos clients</h2>
    <p class="text-muted">Construisez l'avenir avec notre application de gestion de projets de construction, efficace et durable.</p>
    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card1">
                <div class="card-body">
                    <h5 class="card-title">Gestion de Projet</h5>
                    <p class="card-text">
                        La gestion des projets consiste à planifier, organiser et suivre toutes les activités nécessaires pour atteindre les objectifs d'un projet.
                    </p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card1">
                <div class="card-body">
                    <h5 class="card-title">Gestion des Taches</h5>
                    <p class="card-text">
                        La gestion des tâches consiste à planifier, organiser et suivre toutes les activités nécessaires pour atteindre les objectifs d'un projet.
                    </p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card1">
                <div class="card-body">
                    <h5 class="card-title">Gestion des Ressources</h5>
                    <p class="card-text">
                        La gestion des ressources implique la planification, l'allocation et le suivi des ressources nécessaires à un projet, comme le personnel, les matériaux et le temps.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script>

</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>