<template>
    <div class="container mt-4">
        <h1 class="mb-4">Lista de Compra</h1>
        <input
            type="text"
            class="form-control mb-4"
            v-model="searchQuery"
            placeholder="Buscar producto..."
        />
        <ul class="list-group">
            <li
                v-for="producto in filteredProductos"
                :key="producto.id"
                class="list-group-item"
            >
                {{ producto.nombre }}
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    data() {
        return {
            searchQuery: '',
            productos: [
                { id: 1, nombre: 'Manzanas' },
                { id: 2, nombre: 'Naranjas' },
                { id: 3, nombre: 'Plátanos' },
                { id: 4, nombre: 'Leche' },
                { id: 5, nombre: 'Pan' },
            ],
        };
    },
    computed: {
        filteredProductos() {
            return this.productos.filter((producto) =>
                producto.nombre.toLowerCase().includes(this.searchQuery.toLowerCase())
            );
        },
    },
};
</script>

<style scoped>
.container {
    max-width: 600px;
}
</style>