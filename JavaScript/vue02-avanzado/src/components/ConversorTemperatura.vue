<template>
    <div class="div-centrado">
        <h1>Conversor de Temperatura</h1>
        <label for="celsius">Grados Celsius:</label>
        <input type="number" v-model="celsius" id="celsius" />
        <p>Grados Fahrenheit: {{ fahrenheit }}</p>
    </div>
</template>

<script>
export default {
    data() {
        return {
            celsius: 0
        };
    },
    computed: {
        fahrenheit() {
            return (this.celsius * 9/5) + 32;
        }
    }
};
</script>

<style scoped>
.div-centrado{
    width: 100%;
    margin: 0 auto;
    clear: both;
    text-align: center;
}

h1 {
    font-family: Arial, sans-serif;
}
label {
    margin-right: 10px;
}
input {
    margin-bottom: 10px;
}
</style>
