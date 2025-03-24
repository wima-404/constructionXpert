<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
        }</style>
</head>
<body>
<div class="container mt-4">
    <form action="UpdateRessourceTache" method="post" class="card p-4">
        <input type="hidden" name="idRessource" value="${Ressource.getRessource_id()}">
        <div class="form-group">
            <label>Nom Ressource</label>
            <input type="text" name="nomRessource" class="form-control" value="${Ressource.getRessource_nom()}" placeholder="Entrer Nom Ressource">
        </div>
        <div class="form-group">
            <label>Type Ressource</label>
            <input type="text" name="typeRessource" class="form-control" value="${Ressource.getType_ressource()}" placeholder="Entrer Type Ressource">
        </div>
        <div class="form-group">
            <label>Quantite Ressource</label>
            <input type="number" name="quantiteRessource" class="form-control" value="${Ressource.getQuantite()}" placeholder="Entrer Quantite Ressource">
        </div>
        <div class="form-group">
            <label>Info Fournisseur</label>
            <input type="text" name="infoFournisseur" class="form-control" value="${Ressource.getFournisseur()}" placeholder="Entrer infoFournisseur">
        </div>
        <input type="hidden" name="idTache" value="${Ressource.getTache_id()}">
        <button type="submit" class="btn btn-primary">Modifier</button>
    </form>
</div>
</body>

</html>
