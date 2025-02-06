<template>
    <div class="saludo">
        <h2>{{ saludo }}</h2>
    </div>
</template>

<script>
export default {
    name: 'Saludo',
    data() {
        return {
            saludo: 'Hola desde el componente Saludo'
        };
    }
}
</script>

<style scoped>
.saludo {
    border: 1px solid #ccc;
    padding: 1rem;
    margin: 1rem;
}
</style>