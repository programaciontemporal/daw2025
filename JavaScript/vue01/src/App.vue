<script setup>
import Cabecera from './components/Cabecera.vue';
import Contador from './components/Contador.vue'
import ContadorBidireccional from './components/ContadorBidireccional.vue';
import ListaInteractiva from './components/ListaInteractiva.vue';
import ListaTareas from './components/ListaTareas.vue'
</script>


<template>
  <Cabecera />
  <div id="app">
    <!-- Ejercicio 01 - Contador -->
    <Contador />

    <!-- Ejercicio 02 - Lista de tareas -->
    <ListaTareas />

    <!-- Ejercicio 03 - Contador bidireccional -->
    <ContadorBidireccional />


    <!-- Ejercicio 04 - Lista de elementos interactiva -->
    <ListaInteractiva />
  </div>






</template>




<style scoped>
header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }
}
</style>
