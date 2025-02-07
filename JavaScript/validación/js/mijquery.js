$(document).ready(function () {
    $("#form6").on("submit", function (e) {
        e.preventDefault();

        // Variables
        let valid = true;
        let email = $("#email").val();
        let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        let password = $("#password").val();
        let confirmPassword = $("#confirmPassword").val();

        $(".error").hide();

        // Validación del nombre (que no esté vacío)
        if ($("#nombre").val().trim() === "") {
            $("#errorNombre").show();
            valid = false;
        }

        // Validación formato del email
        $("#errorEmail").hide();

        if (!emailRegex.test(email)) {
            $("#errorEmail").show();
            valid = false;
        }

        // Validación de la longitud de la contraseña
        $("#errorPassword").hide();

        if (password.length < 8) {
            $("#errorPassword").show();
            valid = false;
        }

        // Confirmación de la contraseña
        $("#errorConfirm").hide();

        if (password !== confirmPassword) {
            $("#errorConfirm").show();
            valid = false;
        }

        // Validación fecha de nacimiento
        let birthDate = new Date($("#fechaNacimiento").val());
        let today = new Date();
        let age = today.getFullYear() - birthDate.getFullYear();
        let monthDifference = today.getMonth() - birthDate.getMonth();

        if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }

        if (age < 18) {
            $("#errorMenorEdad").show();
            valid = false;
        } else {
            $("#errorMenorEdad").hide();
        }

        // Si todo va bien...
        if (valid) {
            alert("Formulario enviado correctamente");
        }
    });
});