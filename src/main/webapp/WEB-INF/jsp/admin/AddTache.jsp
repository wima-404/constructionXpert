
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter une Tâche</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            background-image: url("https://cdn.discordapp.com/attachments/1317121719705800825/1352611874822295562/668832bd40ac2950a.jpg?ex=67e1f139&is=67e09fb9&hm=80c4d56cc3b996a4454be54d43f886041783f31a10fd7446647e3b169f846fd0&");
            align-items: center;
            height: 100vh;
            margin: 1px 23px 1px 23px;
        }

        #container {
            background-color: white;
            padding: 2px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            height: 400px;
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

        select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
            box-sizing: border-box;
        }

        input[type="date"], input[type="text"],
        textarea {
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
    </style>
</head>
<body>
<div id="container">
    <h1>Ajouter une tâche</h1>
    <form action="addTache" method="post">
        <label for="description_tache">Description de la tâche:</label>
        <textarea id="description_tache" name="description_tache" rows="4" required></textarea><br>

        <div class="Inputdate">
            <div class="date1">
                <label for="date_debutT">Date de Début:</label>
                <input type="date" id="date_debutT" name="date_debutT" required><br>
            </div>
            <div class="date1">
                <label for="DateFinTache">Date de Fin:</label>
                <input type="date" id="DateFinTache" name="DateFinTache" required><br>
            </div>
        </div>

        <label for="StatutTache">Statut:</label>
        <select id="StatutTache" name="StatutTache" required>
            <option value="En cours">En cours</option>
            <option value="Terminer">Terminer</option>
        </select><br>

        <input type="hidden" id="projet_id" name="projet_id" value="${idProjet}" required>

        <button type="submit">Ajouter</button>
    </form>
</div>
</body>
</html>
