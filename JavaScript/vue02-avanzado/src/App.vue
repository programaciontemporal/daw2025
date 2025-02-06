<script setup>
import CestaCompra from './components/CestaCompra.vue';
import ColorRaton from './components/ColorRaton.vue';
import ConversorTemperatura from './components/ConversorTemperatura.vue';
import FiltroListaCompra from './components/FiltroListaCompra.vue';
import FormularioRegistro from './components/FormularioRegistro.vue';
import ListaCompra from './components/ListaCompra.vue';
import ListaTareasPendientes from './components/ListaTareasPendientes.vue';
import RecetasDetalles from './components/RecetasDetalles.vue';
import ResaltarTexto from './components/ResaltarTexto.vue';
</script>

<template>
  <header>

  </header>
  <div class="d-flex justify-content-center">
    <main>
      <!-- Ejercicios 14 - Lista de la compra -->
      <ListaCompra />
      <hr>

      <!-- Ejercicios 14 - Formulario de registro con validación en tiempo real -->
      <FormularioRegistro />
      <hr>

      <!-- Ejercicios 14 - Conversor de temperatura -->
      <ConversorTemperatura />
      <hr>

      <!-- Ejercicios 14 - Filtro lista de productos -->
      <FiltroListaCompra />
      <hr>

      <!-- Ejercicios 14 - Resaltar texto -->
      <ResaltarTexto />
      <hr>

      <!-- Ejercicios 14 - Lista de tareas pendientes -->
      <ListaTareasPendientes />
      <hr>

      <!-- Ejercicios 14 - Directiva para Cambiar Color al Pasar el Ratón -->
      <ColorRaton />
      <hr>

      <!-- Ejercicios 14 - Lista de Productos con Cálculo del Total -->
      <CestaCompra />
      <hr>

      <!-- Ejercicios 14 - Aplicación de Recetas con Detalles Desplegables -->
      <RecetasDetalles />
      <hr>
    </main>
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
