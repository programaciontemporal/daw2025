$(document).ready(function () {
    /**
    * Ejercicio resuelto 1 Validación de Campos Obligatorios
    * Crea un formulario con tres campos obligatorios (nombre, correo y contraseña).
    * Muestra un mensaje de error si alguno está vacío.
    */
    // index01.html
    /*
    $("#form1").on("submit", function (e) {
        e.preventDefault();
        $(".error").hide();
        let valid = true;

        if ($("#nombre").val().trim() === "") {
            $("#errorNombre").show();
            valid = false;
        }
        if ($("#email").val().trim() === "") {
            $("#errorEmail").show();
            valid = false;
        }
        if ($("#password").val().trim() === "") {
            $("#errorPassword").show();
            valid = false;
        }
        if (valid) {
            alert("Formulario enviado correctamente");
        }
    });
    */

    /**
     * Ejercicio resuelto 2
     * Validación de Longitud de Contraseña
     * Crea un formulario que valide que la contraseña tenga al menos 8 caracteres.
     * Si es menor, muestra un mensaje de error.
     */
    // index02.html
    /*
    $("#form2").on("submit", function (e) {
        e.preventDefault();
        $("#errorPassword").hide();
        const password = $("#password").val();

        if (password.length < 8) {
            $("#errorPassword").show();
        } else {
            alert("Formulario enviado correctamente");
        }
    });
    */

    /**
     * Ejercicio resuelto 3 Validación de Formato de Email
     * Valida que el email tenga un formato válido (por ejemplo, usuario@dominio.com).
     */
    // index03.html
    /*
    $("#form3").on("submit", function (e) {
        e.preventDefault();
        $("#errorEmail").hide();
        const email = $("#email").val();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailRegex.test(email)) {
            $("#errorEmail").show();
        } else {
            alert("Formulario enviado correctamente");
        }
    });
    */

    /**
     * Ejercicio resuelto 4
     * Confirmación de Contraseña
     * Valida que la confirmación de contraseña sea idéntica a la contraseña principal.
     */
    // index04.html
    /*
    $("#form4").on("submit", function (e) {
        e.preventDefault();
        $("#errorConfirm").hide();
        const password = $("#password").val();
        const confirmPassword = $("#confirmPassword").val();

        if (password !== confirmPassword) {
            $("#errorConfirm").show();
        } else {
            alert("Formulario enviado correctamente");
        }
    });
    */




    /*  *******************************************************************************************
        *******************************************************************************************
        *******************************************************************************************
        *******************************************************************************************
        *******************************************************************************************
        ***************************************************************************************  */


    /**
     * Ejercicio propuesto 1
     * Validación Completa de Campos Obligatorios y Contraseña Segura:
     * Crea un formulario que contenga los campos: nombre, correo electrónico, contraseña y confirmación de contraseña.
     * Valida:
     * o	Todos los campos sean obligatorios.
     * o	La contraseña tenga al menos 8 caracteres y contenga al menos un número.
     * o	La confirmación de contraseña coincida con la contraseña principal.
     */
    // index05.html
    $("#form5").on("submit", function (e) {
        e.preventDefault();
        $(".error").hide();
        let valid = true;
        const email = $("#email").val();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const password = $("#password").val();
        const confirmPassword = $("#confirmPassword").val();

        // Validar nombre
        if ($("#nombre").val().trim() === "") {
            $("#errorNombre").show();
            valid = false;
        }

        // Validar email

        if (!emailRegex.test(email)) {
            $("#errorEmail").show();
            valid = false;
        }

        // Validar pasword
        if ($("#password").val().trim() === "") {
            $("#errorPassword").show();
            valid = false;
        }

        if (password !== confirmPassword) {
            $("#errorConfirm").show();
        }

        // Confirmación
        if (valid) {
            // Antes de enviar, por estética, limpiar errores
            $("#errorNombre").hide();
            $("#errorEmail").hide();
            $("#errorPassword").hide();
            $("#errorConfirm").hide();

            // Mostrar alert
            alert("Formulario enviado correctamente");
        }
    });








});