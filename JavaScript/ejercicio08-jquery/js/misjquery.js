$(document).ready(function () {
    /**
    * 1. Cambiar el texto de un elemento <p> al hacer clic en un botón
    */
    /*
    $("#btn").click(function () {
    $("#par").text("Texto cambiado");
    });*/



    /**
     * 2. Alternar la visibilidad de un elemento <div> al hacer clic
     */
    /*
    $("#btn").click(function () {
    $("#miDiv").toggle();
    });
    */

    /**
     * 3. Cambiar el color de fondo de todos los elementos <li>
     */
    /*
    $("#btn").click(function () {
    $("li").css("background-color", "yellow");
    });
    */

    /**
     * 4. Agregar un nuevo elemento <li> a una lista
     */
    /*
    $("#btn").click(function () {
    for(let i = 0; i <= 1000; i++)
    $("#ul").append("<li>Nuevo elemento</li>");
    });
    */

    /**
     * 5.   Eliminar un elemento del DOM al hacer clic en un botón
     */
    /*
    $("#btn").click(function () {
    $("#ul").remove();
    });
    */

    /**
     * 6. Ocultar un elemento lentamente
     */
    /*
    $("#btn").click(function () {
    $("#ul").fadeOut("slow");
    });
    /*
    
    /**
     * 7. Cambiar el texto de un input con jQuery
     */
    /*
    $("#btn").click(function(){
    $("#miInput").val("Texto puesto al pulsar el botón");
    });
    */

    /**
     * 8. Mostrar una alerta con el valor de un input
     */
    /*
    $("#btn").click(function () {
    alert($("#miInput").val());
    });
    */

    /**
     * 9. Alternar la clase de un elemento
    */
    /*
    $("#btn").click(function() {
    $("#parrafo").toggleClass("clase2");
    });
    */

    /**
     * 10. Cambiar dinámicamente la clase de un grupo de elementos
    */
    /*
    $("#btn").click(function () {
    $("li").each(function () {
    $(this).addClass("clase2");
    });
    });
    */

    /**
     * 11. Crear un efecto de "deslizar" al mostrar un elemento
    */
    /*
    $("#btn").click(function () {
        $("#lista").slideUp("fast");
    });
    */


    /**
     * 12. Iterar sobre un array y agregar los elementos a una lista
    */
    /*
    const frutas = ["Manzana", "Pera", "Naranja"];
    $.each(frutas, function (index, valor) {
        $("#lista").append(`<li>${valor}</li>`);
    });
    */

    /**
     * 13. Cambiar el atributo src de una imagen
    */
    /*
    $("#btn").click(function () {
        $("#imagen").attr("src", "img/fondo01.jpg");
        $("#imagen").attr("alt", "imagen cambiada con el botón");
        $("#imagen").attr("title", "imagen cambiada con el botón");
    });
    */

    /**
     * 14. Contar cuántos elementos <p> hay en el DOM
    */
    /*
    let cantidad = $("p").length;
    console.log(`Hay ${cantidad} párrafos.`);
    */

    /**
     * 15. Crear un evento hover para cambiar el color de un texto
     *
     */

    /*
    $("#miDiv").hover(
        function () {
            $(this).css("background-color", "blue");
        },
        function () {
            $(this).css("background-color", "black");
        }
    );
    */

    /**16. Crear un contador que aumente al hacer clic
     * 
     */
    /*
    let contador = 0;
    $("#btn").click(function () {
        contador++;
        $("#contador").text(contador);
    });
    */



    /**
     * 17. Animar el cambio de tamaño de un elemento
     */
    /*
    $("#btn").click(function () {
        $("#miDiv").animate({ width: "300px", height: "200px" });
    });
    */


    /**
     * 18. Agregar un texto dinámicamente al cargar la página
     */
    //$(document).ready(function() {
    // $("#miDiv").text("Hola, la página ha cargado correctamente");
    //});



    /**
     * 19. Crear un evento que cambie el color de un texto al presionar una tecla
     */
    /*
    $(document).on("keydown", function() {
        $("#miDiv").css("background-color", "red");
    });
    $(document).on("keyup", function() {
        $("#miDiv").css("background-color", "white");
    });
    */

    /**
     * 20. Filtrar elementos de una lista que contengan una palabra específica
     */
    /*
    $("#btnFruta").click(function () {
        let txt = $("#entrada").val();
        $("li").filter(function() {
            return $(this).text().includes(txt);
        }).css({"color":"green", "font-weight": "bold"});   // si son varias, entre llaves, : para asignar y , para separar
    });
    */

    /**
     * 21. Cambiar el tamaño de una imagen al pasar el mouse
     */
    /*
    $("#miImagen").hover(
        // function () {
        //     $(this).animate({ "width": "300px" }, 100);
        // },
        // function () {
        //     $(this).animate({ "width": "150" }, 100);
        // }
        function () {
            $(this).css("width", "300px");
        },
        function () {
            $(this).css("width", "150px");
        }
    );
    */

    /**
     * 22. Crear un evento que valide si un input está vacío
    */
    /*
    $("#btn").click(function () {
        if (!$("#txtValidar").val()) {
            //alert("El campo está vacío");
            console.log("El campo está vacío");
        }
    });
    */

    /**
     * Mostrar una alerta si el usuario selecciona texto en un campo
     */
    /*
    $("#txtValidar").on("select", function () {
        alert("¡Seleccionaste texto!");
    });
    */

    /**
     * 24. Cambiar el estilo de todos los elementos <a>
     */
    /*
    $("#btn").click(function (){
        $("a").css({ "text-decoration": "none", color: "blue" });
    });
    */

    /**
     * 25. Crear una animación que mueva un elemento hacia la derecha
     */
    /*
    $("#btn").click(function () {
        $("#mover").animate({ left: '+=25px' });
    });
    */

    /*
        *****************************************************************************************
        *****************************************************************************************
        *****************************************************************************************
        *****************************************************************************************
        *****************************************************************************************
    */


    /**
     * Ejercicio 1
     * Selecciona todos los elementos <p> en la página y cambia su texto a "Texto modificado con jQuery".
     */
    /*
    $("#btn").click(function () {
        $("p").each(function () {
            $(this).text("Texto modificado con jQuery...")
        });
    });
    */

    /**
     * Ejercicio 2
     * Crea un botón que muestre un mensaje en consola al hacer clic.
     */
    /*
    let contador = 0;
    $("#btn").click(function () {
        contador++;
        console.log("Has pulsado el botón ", contador, " veces.");
    });
    */

    /**
     * Ejercicio 3
     * Haz que un elemento <div> desaparezca lentamente al hacer clic en un botón.
     */
    /*
    $("#btn").click(function () {
        $("#miDiv").fadeOut("slow");
    });
    */

    /**
     * Ejercicio 4
     * Cambia el color de fondo de un elemento <div> al pasar el ratón sobre él.
     */
    /*
    $("#miDiv").hover(
        function () {
            $(this).css("background-color", "black");

        },
        function () {
            $(this).css("background-color", "aqua");

    });
    */
    // segunda opción sin usar hover
    /*
    $("#miDiv").on("mouseenter", function () {
        $(this).css("background-color", "black");
    });
    */

    /**
     * Ejercicio 5
     * Oculta todos los elementos <li> con un clic y vuelve a mostrarlos con otro clic.
     */
    /*
    $("#btn").click(function(){
        $("li").toggle("slow");
        $("#miDiv").toggle("slow");
    });
    */

    /**
     * Ejercicio 6
     * Agrega una nueva clase a todos los elementos de una lista <ul>.
     */
    /*
    $("#btn").click(function () {
        $("li").each(function () {
            $(this).addClass("clase2");
        });
    });
    */

    /**
     * Ejercicio 7
     * Crea una función que agregue un párrafo con texto dinámico a un contenedor <div>.
     */
    /*
    $("#btn").click(function () {
        // Variando el texto dentro del DIV
        //$("#miDiv").text("Mierda y peo");
        // añadiendo un <p> dentro del DIV
        $("#miDiv").html("<p>Hola mundo</p>");
    });
    */

    /**
     * Ejercicio 8
     * Cambia el atributo href de todos los enlaces en la página.
     */
    /*
    $("#btn").click(function () {
        $("a").each(function () {
            this.href = "https://www.google.es";
        });
    });
    */

    /**
     * Ejercicio 9.
     * Crea un evento que cuente cuántos elementos <li> hay en una lista y lo muestre en un <p>.
     */
    /*
    $("#btn").click(function () {
         $("#contador").text($("li").length);   
    });
    */

    /**
     * Ejercicio 10
     * Crea una lista vacía y llena dinámicamente con los números del 1 al 10.
     */
    /*
    $("#btn").click(function () {
        for (let i = 1; i <= 10; i++) {
            $("#rellenar").append(`<li>${i}</li>`);
        }
    });
    */

    /**
     * Ejercicio 11.
     * Crea un botón que alterne el color de texto entre rojo y negro de un elemento al hacer clic.
     */
    /*
    let color = true;
    $("#btn").click(function () {
        if (color) {
            $("#colorear").css({"color":"green"});
            color = false;
        }else{
            $("#colorear").css({"color":"black"});
            color = true;
        }
    });
    */

    /**
     * Ejercicio 12.
     * Crea un evento que muestre una alerta si el campo de un formulario está vacío.
     */
    /*
    $("#btn").click(function () {
        if($("#vacio").val() === ""){
            alert("Has dejado el campo vacío");
        }  
    });
    */

    /**
     * Ejercicio 13.
     * Usa jQuery para animar un cuadro y moverlo hacia abajo al hacer clic en un botón.
     */
    /*
    $("#btn").click(function () {
        $("#miDiv").animate({top: "+=50",})
    });
    */

    /**
     * Ejercicio 14.
     * Oculta un elemento <img> al hacer doble clic en él.
     */
    /*
    $("#miImagen").click(function(){
        $(this).css("visibility","hidden");
    });
    */

    /**
     * Ejercicio 15.
     * Usa jQuery para cambiar el texto de un botón al pasar el ratón por encima de él.
     */
    /*
    $("#btn").hover(
        function () {
            $(this).text("Mieda y peo");
        },
        function () {
            $(this).text("ocultar elmentos");
        }
    );
    */

    /**
     * Ejercicio 16.
     * Crea un contador que aumente o disminuya al hacer clic en los botones "+" y "-".
     */
    /*
    let contador = 0;
    $("#mas").click(function(){
        contador++;
        $("#valor").text(contador);
    })
    $("#menos").click(function(){
        contador--;
        $("#valor").text(contador);
    })
    */

    /**
     * Ejercicio 17.
     * Crea un botón que elimine todos los elementos de una lista <ul> al hacer clic.
     */
    /*
    $("#btn").click(function(){
        $("#ul").empty();
    });
    */

    /**
     * Ejercicio 18
     * Crea una animación que aumente el tamaño de un cuadro al hacer clic y luego lo reduzca.
     */
    /*
    $("#btn").click(function(){
        $("#miDiv").animate({
            width: "300px",
            height: "300px"
        });

        $("#miDiv").animate({
            width: "100px",
            height: "100px"
        });
    });
    */

    /**
     * Ejercicio 19.
     * Crea un evento que cambie el texto de un <p> dependiendo del valor de un campo <select>.
     */
    /*
    $("#origen").change(function(){
        $("#indicador").text($("#origen").val());
    });
    */

    /**
     * Ejercicio 20
     * Crea una lista desplegable (<select>) y muestra el valor seleccionado en un párrafo
     */
    /*
    $("#btn").click(function () {
        let texto = document.getSelection();
        $("#elementos").append(`<option value="${texto}" selected>${texto}</option>`);
    });
    */

    /**
     * Ejercicio 21
     * Muestra una alerta cada vez que el usuario haga clic en cualquier parte de la página.
     */
    /*
    $(window).click(function(){
        alert("Has pulsado el ratón...");
    })
    */

    /**
     * Ejercicio 22
     * Crea un botón que haga un fade in y fade out alternativo en un elemento <div>.
     */
    /*
    let x = false;
    $("#btn").click(function () {
        if (x == false) {
            $("#miDiv").fadeOut("slow");
            x = true;
        } else {
            $("#miDiv").fadeIn("slow");
            x = false;
        }
    });
    */

    /**
     * Ejercicio 23
     * Usa jQuery para deshabilitar un botón después de hacer clic en él.
     */
    /*
    $("#btn").click(function(){
        //$(this).prop("disabled",true);
        $(this).attr("disabled",true);
    })
    */

    /**
     * Ejercicio 24
     * Crea un efecto de hover que resalte todos los elementos <li> al pasar el ratón.
     */
    /*
    $("li").hover(
        function () {
            $(this).css("color", "yellow");
        },
        function () {
            $(this).css("color", "");
        }
    );
    */

    /**
     * Ejercicio 25
     * Crea un campo de texto que valide si el usuario escribió una dirección de correo electrónico válida.
     */
    /*
    $("#btn").click(function () {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        let email = $("#txtValidar").val();
        if (!emailRegex.test(email)) {
            alert("La dirección no es válida");
        }else{
            alert("La dirección es válida");
        }

    })
    */

    /**
     * Validacion Ejercicio 
     */















});