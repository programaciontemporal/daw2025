<template>
  <div>
    <!-- Usamos la directiva personalizada v-resaltar en el párrafo -->
    <p v-resaltar>
      Haz doble clic en este párrafo para alternar el estilo.
    </p>
  </div>
</template>

<script>
export default {
  directives: {
    // Definimos la directiva personalizada 'resaltar'
    resaltar: {
      // Al montar el elemento, añadimos el evento de doble clic
      mounted(el) {
        el.addEventListener('dblclick', () => {
          // Comprobamos el estado actual del estilo y alternamos
          if (el.style.fontWeight === 'bold' && el.style.backgroundColor === 'yellow') {
            // Si ya está en negrita y con fondo amarillo, lo revertimos
            el.style.fontWeight = 'normal';
            el.style.backgroundColor = 'transparent';
          } else {
            // Si no está resaltado, lo aplicamos
            el.style.fontWeight = 'bold';
            el.style.backgroundColor = 'yellow';
          }
        });
      },
      // Limpiamos el evento cuando el componente se destruye
      unmounted(el) {
        el.removeEventListener('dblclick');
      }
    }
  }
};
</script>

<style scoped>
div {
  width: 100%;
}
</style>