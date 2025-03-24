
<html>
<head>
    <title>Title</title>

    <style>
        body {
            background-image: url("https://cdn.discordapp.com/attachments/1317121719705800825/1352611913380397066/images__1_-removebg-preview.png?ex=67e1f142&is=67e09fc2&hm=c663248077f7df5a2fde9e404eeaf1ff3433ac07c354d66c0e41174b73b0dcfc&");
            background-repeat: no-repeat;
            background-position: bottom right;
            background-size: cover;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 1px 23px 1px 23px;
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

        #container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: white;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
            color: white;
            padding: 5px;
            border-radius: 5px;
        }

        .date1 > label {
            margin-bottom: 5px;
            font-weight: bold;
            color: white;

            padding: 5px;
            border-radius: 5px;
        }

        input[type="date"], input[type="text"], input[type="number"], textarea {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
            box-sizing: border-box;
        }

        input[type="date"], textarea {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
            height: 75px;
        }

        button {
            background-color: #f7b317;
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
            background-color: #d4af37;
        }


        a {
            text-decoration: none;
        }

        .Inputdate {
            display: flex;
            gap: 32px;
            margin-bottom: 9px;
        }

        .date1 {
            width: 50%;
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
<div id="container">
    <h1>Add projet</h1>
    <form action="add" method="post">
        <div class="Inputdate">
            <div class="date1">
                <label class="label" for="nom_projet">Nom du Projet:</label>
                <input type="text" id="nom_projet" name="nom_projet" required><br>
            </div>
            <div class="date1">
                <label class="label" for="budget">Budget:</label>
                <input type="number" id="budget" name="budget" required><br>
            </div>
        </div>
        <div class="Inputdate">
            <div class="date1">
                <label class="label" for="dateDebut">Date de Début:</label>
                <input type="date" id="dateDebut" name="dateDebut" required><br>
            </div>
            <div class="date1">
                <label class="label" for="dateFin">Date de Fin:</label>
                <input type="date" id="dateFin" name="dateFin" required><br>
            </div>
        </div>

        <label for="description_projet">Description du Projet:</label>
        <textarea id="description_projet" name="description_projet" rows="4" required></textarea><br>

        <label for="Picture_Url">Url d'image</label>
        <input type="text" id="Picture_Url" name="Picture_Url" required><br>

        <a href="${pageContext.request.contextPath}/ConstructionXpert_Services_Solution_war_exploded/add">
            <button type="submit">Ajouter</button>
        </a>
    </form>
</div>
</body>
</html>
