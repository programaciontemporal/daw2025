<template>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Lista de Recetas</h1>
        <div v-for="(receta, index) in recetas" :key="index" class="card mb-3">
            <div class="card-header">
                <h2>{{ receta.nombre }}</h2>
                <button class="btn btn-primary" @click="toggleDetalles(index)">
                    {{ receta.mostrarDetalles ? 'Ocultar Detalles' : 'Mostrar Detalles' }}
                </button>
            </div>
            <div v-if="receta.mostrarDetalles" class="card-body">
                <h3>Ingredientes</h3>
                <ul>
                    <li v-for="(ingrediente, i) in receta.ingredientes" :key="i">{{ ingrediente }}</li>
                </ul>
                <h3>Pasos</h3>
                <ol>
                    <li v-for="(paso, i) in receta.pasos" :key="i">{{ paso }}</li>
                </ol>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            recetas: [
                {
                    nombre: 'Tortilla de Patatas',
                    ingredientes: ['Patatas', 'Huevos', 'Cebolla', 'Aceite de oliva', 'Sal'],
                    pasos: [
                        'Pelar y cortar las patatas y la cebolla.',
                        'Freír las patatas y la cebolla en aceite de oliva.',
                        'Batir los huevos y mezclar con las patatas y la cebolla.',
                        'Cocinar la mezcla en una sartén hasta que esté dorada por ambos lados.'
                    ],
                    mostrarDetalles: false
                },
                {
                    nombre: 'Paella',
                    ingredientes: ['Arroz', 'Pollo', 'Conejo', 'Judías verdes', 'Tomate', 'Aceite de oliva', 'Azafrán', 'Sal'],
                    pasos: [
                        'Calentar el aceite en una paellera y dorar el pollo y el conejo.',
                        'Añadir las judías verdes y el tomate rallado.',
                        'Agregar el arroz y el azafrán, y mezclar bien.',
                        'Añadir agua y cocinar a fuego medio hasta que el arroz esté en su punto.'
                    ],
                    mostrarDetalles: false
                },
                {
                    nombre: 'Gazpacho',
                    ingredientes: ['Tomates', 'Pepino', 'Pimiento verde', 'Ajo', 'Aceite de oliva', 'Vinagre', 'Sal'],
                    pasos: [
                        'Lavar y cortar los tomates, el pepino y el pimiento.',
                        'Triturar todos los ingredientes en una batidora.',
                        'Añadir aceite de oliva, vinagre y sal al gusto.',
                        'Enfriar en la nevera antes de servir.'
                    ],
                    mostrarDetalles: false
                }
            ]
        };
    },
    methods: {
        toggleDetalles(index) {
            this.recetas[index].mostrarDetalles = !this.recetas[index].mostrarDetalles;
        }
    }
};
</script>

<style scoped>
.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
</style>