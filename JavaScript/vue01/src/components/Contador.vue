<template>
    <div class="contador">
        <h2>Contador: {{ contador }}</h2>
        <button @click="incrementar">Incrementar</button>
    </div>
</template>

<script>
export default {
    name: 'Contador',
    data() {
        return {
            contador: 0
        }
    },
    methods: {
        incrementar() {
            this.contador += 1;
        }
    }
}
</script>

<style scoped>
.contador {
    text-align: center;
    margin: 20px;
}

button {
    padding: 10px 20px;
    background-color: #42b983;
    color: white;
    border: none;
    cursor: pointer;
}
</style>