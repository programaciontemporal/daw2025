$(document).ready(function ()
{
    /* ****************************************************************************************** */
    /* ****************************       EJERCICIOS RESUELTOS       **************************** */
    /* ****************************************************************************************** */

    // // 1. Cambiar el texto de un párrafo al hacer clic en un botón
    // $("#btn1").click(function () {
    //     $("#para1").text("Texto cambiado!");
    // });

    // // 2. Ocultar un elemento al hacer clic en un botón
    // $("#btn2").click(function () {
    //     $("#box1").hide();
    // });

    // // 3. Mostrar un elemento oculto al hacer clic en un botón
    // $("#btn3").click(function () {
    //     $("#box1").show();
    // });

    // // 4. Alternar visibilidad de un elemento
    // $("#btn4").click(function () {
    //     $("#box1").toggle();
    // });

    // // 5. Cambiar el color de fondo de un div
    // $("#btn5").click(function () {
    //     $("#box1").css({ "background-color": "#45a049", "color": "white" });
    // });

    // // 6. Animar el ancho de un div
    // $("#btn6").click(function () {
    //     $("#box4").animate({ width: "100%" });
    // });

    // // 7. Obtener el valor de un input
    // $("#btn7").click(function () {
    //     alert($("#input1").val());
    // });

    // // 8. Cambiar el valor de un input
    // $("#btn8").click(function () {
    //     $("#input1").val("Nuevo valor");
    // });

    // // 9. Agregar una clase a un elemento
    // $("#btn9").click(function () {
    //     $("#text1").addClass("highlight");
    // });

    // // 10. Quitar una clase de un elemento
    // $("#btn10").click(function () {
    //     $("#text1").removeClass("highlight");
    // });

    // // 11. Alternar una clase en un elemento
    // $("#btn11").click(function () {
    //     $("#text1").toggleClass("highlight");
    // });

    // // 12. Obtener el contenido HTML de un elemento
    // $("#btn12").click(function () {
    //     alert($("#content1").html());
    // });

    // // 13. Cambiar el contenido HTML de un elemento
    // $("#btn13").click(function () {
    //     $("#content1").html("<strong>Nuevo contenido</strong>");
    // });

    // // 14. Desvanecer un elemento
    // $("#btn14").click(function () {
    //     $("#fade1").fadeOut();
    // });

    // // 15. Aparecer un elemento con fadeIn
    // $("#btn15").click(function () {
    //     $("#fade1").fadeIn();
    // });

    // // 16. Alternar visibilidad con fadeToggle
    // $("#btn16").click(function () {
    //     $("#fade1").fadeToggle();
    // });

    // // 17. Deslizar un elemento hacia arriba
    // $("#btn17").click(function () {
    //     $("#slide1").slideUp();
    // });

    // // 18. Deslizar un elemento hacia abajo
    // $("#btn18").click(function () {
    //     $("#slide1").slideDown();
    // });

    // // 19. Alternar deslizamiento
    // $("#btn19").click(function () {
    //     $("#slide1").slideToggle();
    // });

    // // 20. Clonar un elemento
    // $("#btn20").click(function () {
    //     $("#clone1").clone().appendTo("#container");
    // });

    // // 21. Eliminar un elemento
    // $("#btn21").click(function () {
    //     $("#remove1").remove();
    // });

    // // 22. Cambiar el atributo de una imagen
    // $("#btn22").click(function () {
    //     $("#img1").attr("src", "img/img02.jpg");
    //     $("#img1").attr("alt", "imagen 2");
    //     $("#img1").attr("title", "imagen 2");
    // });

    // // 23. Detectar cuando un input cambia
    // $("#input2").change(function () {
    //     alert("El input ha cambiado a: " + $(this).val());
    // });

    // // 24. Detectar el evento de enfoque en un input
    // $("#input3").focus(function () {
    //     $(this).css("border", "2px solid red");
    // });

    // // 25. Detectar cuando un input pierde el foco
    // $("#input3").blur(function () {
    //     $(this).css("border", "1px solid yellow");
    // });

    // // 26. Agregar un elemento a una lista
    // $("#btn26").click(function () {
    //     $("#list1").append("<li>Nuevo elemento</li>");
    // });

    // // 27. Eliminar el último elemento de una lista
    // $("#btn27").click(function () {
    //     $("#list1 li:last").remove();
    // });

    // // 28. Crear un array y mostrar su contenido
    // var fruits = ["Manzana", "Banana", "Naranja"];
    // $("#btn28").click(function () {
    //     alert(fruits.join(", "));
    // });

    // // 29. Agregar un elemento al array y mostrarlo
    // $("#btn29").click(function () {
    //     fruits.push("Uva");
    //     alert(fruits.join(", "));
    // });

    // // 30. Eliminar el último elemento del array
    // $("#btn30").click(function () {
    //     fruits.pop();
    //     alert(fruits.join(", "));
    // });





    /* ****************************************************************************************** */
    /* ***************************       EJERCICIOS PROPUESTOS       **************************** */
    /* ****************************************************************************************** */

    // 1. Crear un botón que muestre una alerta con un mensaje personalizado.
    // $("#btn1").click(function () {
    //     if ($("#saludo").val() === "") {
    //         alert("Saludos, persona sin nombre");
    //     } else {
    //         alert(`Saludos, ${$("#saludo").val()}`);
    //     }
    // });

    // 2. Cambiar el color de un elemento al hacer hover sobre él.
    // $("#hover").hover(
    //     function(){
    //         $(this).css("background-color", "yellow");
    //     },
    //     function(){
    //         $(this).css("background-color","white");
    //     }
    // );

    // 3. Crear un contador que aumente al presionar un botón.
    // let contador = 0;
    // $("#btn3").click(function () {
    //     contador++;
    //     $("#span3").text(contador);
    // });

    // // 4. Crear una función que elimine el primer elemento de una lista.
    // $("#btn4").click(function() {
    //     $("#lst4 li:first").remove();
    // });

    // 5. Alternar el color de fondo de un div cada vez que se haga clic en él.
    // $("#div5").click(function () {
    //     $(this).toggleClass("highlight");
    // });

    // 6. Usar jQuery para validar que un campo de texto no esté vacío.
    // $("#input6").on("blur", function(){
    //     if($(this).val() === ""){
    //         alert("Campo vacío")
    //     } else {
    //         console.log(`Campo con texto: ${$(this).val()}`);

    //     }
    // });

    // 7. Crear una función que calcule la suma de valores ingresados en dos inputs.
    // $("#btn7").on("click", function () {
    //     function suma(n1, n2) {
    //         return (n1 + n2);
    //     }
    //     alert(suma(parseInt($("#input61").val()), parseInt($("#input62").val())));
    // })

    // 8. Agregar y eliminar clases dinámicamente con botones.
    // $("#btn81").on("click", function(){
    //     $("#div8").removeClass("clase1");
    //     $("#div8").removeClass("clase2");
    //     $("#div8").addClass("clase1");
    // });
    // $("#btn82").on("click", function(){
    //     $("#div8").removeClass("clase1");
    //     $("#div8").removeClass("clase2");
    //     $("#div8").addClass("clase2");
    // });
    // $("#btn83").on("click", function(){
    //     $("#div8").removeClass("clase1");
    //     $("#div8").removeClass("clase2");
    // });

    // 9. Hacer que un div siga el cursor del ratón por la pantalla.
    // $(document).mousemove(function (e) {
    //     $("#div9").css({
    //         left: e.pageX,
    //         top: e.pageY
    //     });
    // });

    // 10. Crear un acordeón simple con elementos que se expandan al hacer clic.
    // $(".accordion_tab").click(function () {
    //     $(".accordion_tab").each(function () {
    //         $(this).parent().removeClass("active");
    //         $(this).removeClass("active");
    //     });
    //     $(this).parent().addClass("active");
    //     $(this).addClass("active");
    // });

    // 11. Cambiar el contenido de una imagen al pasar el ratón sobre ella.
    // $("#img11").on("mouseover", function(){
    //     $(this).attr("src", "img/img02.jpg");
    //     $(this).attr("alt", "imagen 2");
    //     $(this).attr("title", "imagen 2");
    // });

    // 12. Hacer que un div se desplace automáticamente de izquierda a derecha.
    // $("#div12").on("mouseover", function () {
    //     function animateDiv() {
    //         $("#div12").animate({ left: $(window).width() - $("#div12").width() }, 2000, function () {
    //             $("#div12").animate({ left: 0 }, 2000, animateDiv);
    //         });
    //     }

    //     animateDiv();


    // });

    // 13. Crear un botón que reinicie el contenido de un formulario.
    // $("#btn12borrar").on("click", function(){
    //     $("#form12").trigger("reset");
    // })

    // 14. Validar que un email ingresado en un input sea correcto antes de enviarlo.
    // $("#btn14enviar").on("click", function (e) {
    //     e.preventDefault();
    //     let email = $("#email14").val();
    //     let emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    //     if (!emailPattern.test(email)) {
    //         $("#errorEmail").show();
    //         alert("Por favor, ingrese un correo electrónico válido.");
    //     } else {
    //         $("#errorEmail").hide();
    //         alert("Correo electrónico válido.");
    //     }
    // });

    // 15. Crear un input que solo acepte números y valide que el valor esté en un rango de 1 a 100.
    // $("#btn15").on("click", function () {
    //     $("#mensaje15").hide();
    //     $("#mensaje15").removeClass("error success");

    //     let value = parseInt($("#num15").val());
    //     if (!isNaN(value)) {
    //         $("#mensaje15").addClass("success");
    //         $("#mensaje15").show().text("¡Correcto!");
    //     } else {
    //         $("#mensaje15").addClass("error");
    //         $("#mensaje15").show().text("Incorrecto, por favor introduzca un número");
    //     }
    // });

    // 16. Implementar un formulario con validación para que todos los campos sean obligatorios.
    // $("#btn16enviar").on("click", function (e) {
    //     $(".error").hide();
    //     (e).preventDefault;
    //     let valido = true;

    //     if ($("#nombre16").val().trim() === "") {
    //         $("#errorNombre16").show();
    //         valido = false;
    //     } else {
    //         $("#errorNombre16").hide();
    //     }

    //     if ($("#email16").val().trim() === "") {
    //         $("#errorEmail16").show();
    //         valido = false;
    //     } else {
    //         $("#errorEmail16").hide();
    //     }

    //     if ($("#repetirEmail16").val().trim() === "") {
    //         $("#errorRepetirEmail16").show();
    //         valido = false;
    //     } else {
    //         $("#errorRepetirEmail16").hide();
    //     }

    //     if (valido) {
    //         alert("Formulario enviado correctamente");
    //     }
    // });

    // $("#btn16borrar").click(function ()
    // {
    //     $(".error").hide();
    // });

    // 17. Crear una función que recorra un array de nombres y los muestre en una lista.
    // let nombres = ["Antonio", "Beatriz", "Carlos", "Diana", "Eduardo", "Fernanda", "Gabriel", "Hilda", "Ignacio", "Julia", "Kevin", "Laura", "Manuel", "Natalia", "Oscar", "Patricia", "Quentin", "Rosa", "Sergio", "Teresa"];

    // function mostrarNombres() {
    //     nombres.forEach(function(nombre) {
    //         $("#lista17").append("<li>" + nombre + "</li>");
    //     });
    // }

    // mostrarNombres();

    // 18. Crear un slider de imágenes que cambie al hacer clic en un botón.

    // function animateImage(prevImg, currentImg)
    // {
    //     currentImg.css({ "left": "100%" });
    //     currentImg.animate({ "left": "0%" }, 1000);
    //     prevImg.animate({ "left": "-100%" }, 1000);
    // };

    // let i = 0;


    // $("#btn18").on("click", function ()
    // {
    //     i++;
    //     if (i == $('img').length) {
    //         i = 0;
    //     }
    //     let currentImg = $('img').eq(i);
    //     let prevImg = $('img').eq(i - 1);
    //     //call function to animate the rotation of the images to the right
    //     animateImage(prevImg, currentImg);
    // });

    // 19. Detectar si un checkbox está seleccionado y mostrar un mensaje en función de su estado.
    // $("#check18").on("change", function() {
    //     alert(`El check box está en ${$("#check18").prop("checked")}`);
    // });

    // 20. Validar que una contraseña ingresada tenga al menos 8 caracteres, una mayúscula y un número.
    $("#btn20enviar").on("click", function (e) {
        e.preventDefault();
        let password = $("#password20").val();
        let passwordPattern = /^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$/;

        if (!passwordPattern.test(password)) {
            $("#errorPassword20").show().text("La contraseña debe tener al menos 8 caracteres, una mayúscula y un número.");
            alert("La contraseña debe tener al menos 8 caracteres, una mayúscula y un número.");
        } else {
            $("#errorPassword20").hide();
            alert("Contraseña válida.");
        }
    });
});