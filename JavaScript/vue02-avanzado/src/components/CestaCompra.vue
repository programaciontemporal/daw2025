<template>
    <div class="container mt-5">
        <h1 class="mb-4">Cesta de la Compra</h1>
        <div class="list-group">
            <div v-for="product in products" :key="product.id" class="list-group-item">
                <div class="form-check">
                    <!-- Se asegura de que cada producto esté vinculado al modelo -->
                    <input class="form-check-input" type="checkbox" :id="product.id" v-model="selectedProducts"
                        :value="product">
                    <label class="form-check-label" :for="product.id">
                        {{ product.name }} - {{ product.precio.toFixed(2) }}€
                    </label>
                </div>
            </div>
        </div>
        <div class="mt-4">
            <h3>Total a pagar: {{ totalPrice.toFixed(2) }}€</h3>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            // Productos de ejemplo con id, nombre y precio
            products: [
                { id: 1, name: 'Pera', precio: 10.00 },
                { id: 2, name: 'Manzana', precio: 15.50 },
                { id: 3, name: 'Plátano', precio: 7.25 },
                { id: 4, name: 'Brócoli', precio: 12.30 }
            ],
            // Lista para los productos seleccionados
            selectedProducts: []
        };
    },
    computed: {
        // Cálculo del total sumando los precios de los productos seleccionados
        totalPrice() {
            return this.selectedProducts.reduce((total, product) => total + product.precio, 0);
        }
    }
};
</script>

<style scoped>
.container {
    max-width: 600px;
}
</style>
