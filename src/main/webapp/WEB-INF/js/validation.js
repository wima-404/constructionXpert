
function validateForm() {

    var nom = document.getElementById('ressource_nom').value;
    var type = document.getElementById('type_ressource').value;
    var quantite = document.getElementById('quantite').value;
    var fournisseur = document.getElementById('fournisseur').value;


    clearErrors();

    var isValid = true;

)
    if (nom.length === 0 || isOnlySpaces(nom) || nom.length < 2) {
        showError('ressource_nom', 'Le nom doit contenir au moins 2 caractères');
        isValid = false;
    }
)
    if (type.length === 0 || isOnlySpaces(type)) {
        showError('type_ressource', 'Le type est requis');
        isValid = false;
    }


    if (quantite.length === 0 || isNaN(quantite) || parseInt(quantite) <= 0) {
        showError('quantite', 'Entrez une quantité valide (> 0)');
        isValid = false;
    }


    if (fournisseur.length === 0 || isOnlySpaces(fournisseur)) {
        showError('fournisseur', 'Le fournisseur est requis');
        isValid = false;
    }

    return isValid;
}

function isOnlySpaces(str) {
    for (var i = 0; i < str.length; i++) {
        if (str[i] !== ' ') return false;
    }
    return true;
}

function showError(fieldId, message) {
    var field = document.getElementById(fieldId);
    field.style.borderColor = 'red';

    var errorDiv = document.createElement('div');
    errorDiv.className = 'error-message';
    errorDiv.style.color = 'red';
    errorDiv.style.fontSize = '12px';
    errorDiv.style.marginTop = '-10px';
    errorDiv.style.marginBottom = '10px';
    errorDiv.textContent = message;

    field.parentNode.insertBefore(errorDiv, field.nextSibling);
}

function clearErrors() {

    var errors = document.querySelectorAll('.error-message');
    for (var i = 0; i < errors.length; i++) {
        errors[i].parentNode.removeChild(errors[i]);
    }s
    var inputs = document.querySelectorAll('input, select');
    for (var i = 0; i < inputs.length; i++) {
        inputs[i].style.borderColor = '#ddd';
    }
}

document.querySelector('form').onsubmit = function() {
    return validateForm();
};