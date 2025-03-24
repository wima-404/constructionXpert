<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier Projet</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 1px 23px 1px 23px;
            background-image: url("https://cdn.discordapp.com/attachments/1317121719705800825/1352611874822295562/668832bd40ac2950a.jpg?ex=67e1f139&is=67e09fb9&hm=80c4d56cc3b996a4454be54d43f886041783f31a10fd7446647e3b169f846fd0&");
            background-repeat: no-repeat;
            background-position: bottom right;
            background-size: cover;
        }

        label {
            font-weight: bold;
            color: white;
        }
        .form1{
            display: flex;
            gap: 23px;
        }
        .form-group{
            width: 100%;
        }
        .TitreModifier{
            display: flex;
            justify-content: center;
            align-content: center;
            font-weight: bold;
            font-size: 33px;
        }
        button {
            background-color: #d73ddc;
            color: black;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            align-self: flex-end;
        }

        button:hover {
            background-color: #d73ddc;
        }

        #container {
            padding: 2px 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            height: 82%;
            background: transparent;
            border: 2px solid rgba(255, 255, 255, 0.5);
            border-radius: 20px;
            backdrop-filter: blur(15px);
        }

        @media (max-width: 1200px) {
            #container{
                padding: 2px 40px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 100%;
                height: 45%;
                background: transparent;
                border: 2px solid rgba(255, 255, 255, 0.5);
                border-radius: 20px;
                backdrop-filter: blur(15px);
            }
        }

        @media (max-width: 768px) {
            #container{
                padding: 2px 40px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 100%;
                height: 74%;
                background: transparent;
                border: 2px solid rgba(255, 255, 255, 0.5);
                border-radius: 20px;
                backdrop-filter: blur(15px);
            }
        }
    </style>
</head>
<body>
<div id="container" class="container mt-5">
    <h5 class="TitreModifier">Modifier Projet</h5>
    <form action="UpdateProjet" method="post" class="mb-4">
        <input type="hidden" name="id" value="${Projet.projet_id}">
        <div class="form1">
            <div class="form-group">
                <label for="Name">Nom du projet</label>
                <input type="text" class="form-control" id="Name" name="Name" value="${Projet.getNom()}" placeholder="Entrer nom">
            </div>
            <div class="form-group">
                <label for="Budget">Budget</label>
                <input type="number" class="form-control" id="Budget" name="Budget" value="${Projet.budget}" placeholder="Entrer budget">
            </div>
        </div>
        <div class="form1">
            <div class="form-group">
                <label for="DateDebut">Date de début</label>
                <input type="date" class="form-control" id="DateDebut" name="DateDebut" value="${Projet.dateDebut}">
            </div>
            <div class="form-group">
                <label for="DateFin">Date de fin</label>
                <input type="date" class="form-control" id="DateFin" name="DateFin" value="${Projet.dateFin}">
            </div>
        </div>
        <div class="form-group">
            <label for="Description">Description</label>
            <textarea class="form-control" id="Description" name="Description" placeholder="Entrer description">${Projet.description_projet}</textarea>
        </div>
        <div class="form-group">
            <label for="Picture_Url">Url d'image</label>
            <input type="text" class="form-control" id="Picture_Url" name="Picture_Url" value="${Projet.picture_Url}">
        </div>

        <button type="submit">Modifier</button>
    </form>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
