
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter une Ressource</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            background-image: url("https://cdn.discordapp.com/attachments/1317121719705800825/1352611874822295562/668832bd40ac2950a.jpg?ex=67e1f139&is=67e09fb9&hm=80c4d56cc3b996a4454be54d43f886041783f31a10fd7446647e3b169f846fd0&");
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        #container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        #container h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="number"],
        select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 15px;
        }

        button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            align-self: flex-end;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div id="container">
    <h1>Ajouter une Ressource</h1>
    <form action="AddRessource" method="post">
        <label for="ressource_nom">Nom de la Ressource:</label>
        <input type="text" id="ressource_nom" name="ressource_nom" required><br>

        <label for="type_ressource">Type de Ressource:</label>
        <input type="text" id="type_ressource" name="type_ressource" required><br>

        <label for="quantite">Quantité:</label>
        <input type="number" id="quantite" name="quantite" required><br>

        <label for="fournisseur">Fournisseur:</label>
        <input type="text" id="fournisseur" name="fournisseur" required><br>

        <input type="hidden" id="tache_id" name="tache_id" value="${idtache}" required>

        <button type="submit">Ajouter</button>
    </form>
</div>
</body>
</html>
