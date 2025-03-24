<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier Tâche</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {

            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            background-image: url("https://cdn.discordapp.com/attachments/1317121719705800825/1352611874822295562/668832bd40ac2950a.jpg?ex=67e1f139&is=67e09fb9&hm=80c4d56cc3b996a4454be54d43f886041783f31a10fd7446647e3b169f846fd0&");
            align-items: center;
            height: 100vh;
            margin: 1px 23px;
        }
        label {
            font-weight: bold;
        }
        .form1 {
            display: flex;
            gap: 23px;
        }
        .form-group {
            width: 100%;
        }
        .TitreModifier {
            display: flex;
            justify-content: center;
            align-content: center;
            font-weight: bold;
            font-size: 33px;
        }
        .btn-btn-primary {
            background-color: #d73ddc;
            border-color: #ffffff;
        }
        .btn-btn-primary:hover {
            background-color: #d73ddc;
            border-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h5 class="TitreModifier">Modifier Tâche</h5>
    <form action="UpdateTache" method="post" class="card p-4">
        <input type="hidden" name="idTache" value="${Tache.getTache_id()}">
        <div class="form-group">
            <label>Description</label>
            <input type="text" name="descriptionTache" class="form-control" value="${Tache.getDescription_tache()}" placeholder="Entrer Description">
        </div>
        <div class="form-group">
            <label>Date Début</label>
            <input type="date" name="DateDebutTache" class="form-control" value="${Tache.getDate_debut()}" placeholder="Entrer Date Début">
        </div>
        <div class="form-group">
            <label>Date Fin</label>
            <input type="date" name="DateFinTache" class="form-control" value="${Tache.getDate_fin()}" placeholder="Entrer Date Fin">
        </div>
        <div class="form-group">
            <label>Statut Tâche</label>
            <input type="text" name="StatutTache" class="form-control" value="${Tache.getStatut()}" placeholder="Entrer Statut Tâche">
        </div>
        <input type="hidden" name="idProjet" value="${Tache.getProjet_id()}">
        <button type="submit" class="btn-btn-primary">Modifier</button>
    </form>
</div>
</body>
</html>
