<template>
    <div class="container mt-5">
      <!-- Usamos la directiva personalizada v-cambiar-fondo -->
      <button v-cambiar-fondo class="btn btn-primary">Pasa el cursor sobre este botón</button>
      
      <p v-cambiar-fondo class="mt-3">Pasa el cursor sobre este párrafo para cambiar su color de fondo.</p>
  
      <div v-cambiar-fondo class="mt-3 p-3 border">Pasa el cursor sobre este cuadro para cambiar su fondo.</div>

      <span v-cambiar-fondo class="mt-3">Pasa el cursor sobre este span para cambiar su fondo.</span>
    </div>
  </template>
  
  <script>
  export default {
    directives: {
      // Directiva personalizada 'cambiar-fondo'
      cambiarFondo: {
        // Al montar el elemento, añadimos los eventos de mouseenter y mouseleave
        mounted(el) {
          el.addEventListener('mouseenter', () => {
            // Cambiar el fondo a un color específico cuando el cursor está sobre el elemento
            el.style.backgroundColor = 'lightblue';
          });
          
          el.addEventListener('mouseleave', () => {
            // Restaurar el color de fondo cuando el cursor salga del elemento
            el.style.backgroundColor = '';
          });
        },
        // Limpiamos los eventos cuando el componente se destruye
        unmounted(el) {
          el.removeEventListener('mouseenter');
          el.removeEventListener('mouseleave');
        }
      }
    }
  };
  </script>
  
  <style scoped>
  /* Opcionales: Agregar un poco de estilo extra para los elementos */
  p, div {
    transition: background-color 0.3s ease; /* Suaviza la transición del color */
  }
  </style>
  