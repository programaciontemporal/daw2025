<script setup>
import { RouterLink, RouterView } from 'vue-router'
import BotonEmisor from './components/BotonEmisor.vue'
</script>

<template>
  <div id="app">
    <nav>
      <router-link to="/">Inicio</router-link> |
      <router-link to="/about">Acerca de</router-link>
    </nav>
    <router-view></router-view>





    <h1>Ejercicio 12: Componente Emisor</h1>
    <BotonEmisor @evento-personalizado="manejarEvento" />
    <p>{{ mensajeRecibido }}</p>

  </div>
</template>

<script>
export default {
  name: 'App',
  components: { BotonEmisor },
  data() {
    return { mensajeRecibido: '' };
  },
  methods: {
    manejarEvento(mensaje) {
      this.mensajeRecibido = mensaje;
    }
  }
}

</script>

<style>
nav {
  margin-bottom: 1rem;
}
</style>
