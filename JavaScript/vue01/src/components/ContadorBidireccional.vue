<template>
    <div class="contadorBidireccional">
        <h2>Contador: {{ contador }}</h2>
        <button @click="incrementar">Incrementar</button>
        <button @click="decrementar">Decremetnar</button>
    </div>
</template>

<script>
export default {
    name: 'ContadorBidireccional',
    data() {
        return {
            contador: 0
        }
    },
    methods: {
        incrementar() {
            this.contador += 1;
        },
        decrementar() {
            this.contador -= 1;
        }
    }
}
</script>

<style scoped>
.contadorBidireccional {
    width: 100%;
    text-align: center;
    margin: 20px;
}

button {
    padding: 10px 20px;
    margin: 10px;
    background-color: #42b983;
    color: white;
    border: none;
    cursor: pointer;
}
</style>