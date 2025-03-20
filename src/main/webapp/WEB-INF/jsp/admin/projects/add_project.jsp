<!-- jsp/project/project_form.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulaire de Projet</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Formulaire de Projet</h1>

<c:if test="${not empty errorMessage}">
    <p style="color:red;">${errorMessage}</p>
</c:if>

<form action="projects?action=${empty project ? 'create' : 'update'}" method="post" id="projectForm">
    <c:if test="${not empty project}">
        <input type="hidden" name="id" value="${project.id}">
    </c:if>

    <label for="name">Nom:</label>
    <input type="text" id="name" name="name" value="${project.name}" required><span id="nameError" class="error"></span><br><br>

    <label for="description">Description:</label>
    <textarea id="description" name="description" required>${project.description}</textarea><span id="descriptionError" class="error"></span><br><br>

    <label for="startDate">Date de début:</label>
    <input type="date" id="startDate" name="startDate" value="${project.startDate}" required><span id="startDateError" class="error"></span><br><br>

    <label for="endDate">Date de fin:</label>
    <input type="date" id="endDate" name="endDate" value="${project.endDate}" required><span id="endDateError" class="error"></span><br><br>

    <label for="budget">Budget:</label>
    <input type="number" id="budget" name="budget" value="${project.budget}" required><span id="budgetError" class="error"></span><br><br>

    <input type="submit" value="${empty project ? 'Créer' : 'Mettre à jour'}" id="submitButton">
    <button type="button" id="cancelButton" onclick="window.location.href='projects?action=list'">Annuler</button>
</form>

<script src="${pageContext.request.contextPath}/js/validation.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const form = document.getElementById("projectForm");
        const nameInput = document.getElementById("name");
        const descriptionInput = document.getElementById("description");
        const startDateInput = document.getElementById("startDate");
        const endDateInput = document.getElementById("endDate");
        const budgetInput = document.getElementById("budget");
        const submitButton = document.getElementById("submitButton");

        // Attach event listeners and implement validation logic as described in the previous answer.
        // Example:  nameInput.addEventListener("input", validateName);  (implement validateName function)
        // Remember to disable/enable the submit button based on validation results.

        //Also enable the function to validate the dates, to be sure that they are in the correct order
        startDateInput.addEventListener('change', validateDates);
        endDateInput.addEventListener('change', validateDates);

        function validateDates() {
            const startDate = new Date(startDateInput.value);
            const endDate = new Date(endDateInput.value);
            if (startDate > endDate) {
                startDateError.textContent = "La date de début doit être antérieure à la date de fin.";
                endDateError.textContent = "La date de fin doit être postérieure à la date de début.";
                return false;
            } else {
                startDateError.textContent = "";
                endDateError.textContent = "";
                return true;
            }
        }

    });
</script>
</body>
</html>