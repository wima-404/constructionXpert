//validation.js
// Example validation functions (add more as needed)
function validateName(nameInput, nameError) {
    if (nameInput.value.trim() === "") {
        nameError.textContent = "Le nom est obligatoire.";
        return false;
    } else {
        nameError.textContent = "";
        return true;
    }
}

function validateDescription(descriptionInput, descriptionError) {
    if (descriptionInput.value.trim() === "") {
        descriptionError.textContent = "La description est obligatoire.";
        return false;
    } else {
        descriptionError.textContent = "";
        return true;
    }
}

function validateDate(dateInput, dateError) {
    if (dateInput.value.trim() === "") {
        dateError.textContent = "La date est obligatoire.";
        return false;
    } else {
        dateError.textContent = "";
        return true;
    }
}

function validateBudget(budgetInput, budgetError) {
    if (budgetInput.value.trim() === "") {
        budgetError.textContent = "Le budget est obligatoire.";
        return false;
    } else if (isNaN(budgetInput.value)) {
        budgetError.textContent = "Le budget doit être un nombre.";
        return false;
    } else if (parseFloat(budgetInput.value) <= 0) {
        budgetError.textContent = "Le budget doit être supérieur à zéro.";
        return false;
    } else {
        budgetError.textContent = "";
        return true;
    }
}

// Add more validation functions for other fields (email, etc.)
// Add JavaScript to project_form.jsp to call these functions and enable/disable the submit button