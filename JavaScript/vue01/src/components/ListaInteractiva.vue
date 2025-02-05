<template>
    <div class="lista-interactiva">
        <h2>Lista de tareas interactiva</h2>
        <ul>
            <li v-for="(tarea, index) in tareas" :key="index">
                {{ tarea }}
            </li>
        </ul>
        <input type="text" v-model="nuevaTarea" placeholder="Escribe una nueva tarea">
        <button @click="agregarTarea">Agregar Tarea</button>
    </div>
</template>

<script>
export default {
    name: 'ListaInteractiva',
    data() {
        return {
            tareas: [
                'Item 1',
                'Item 2'
            ],
            nuevaTarea: ''
        }
    },
    methods: {
        agregarTarea() {
            if (this.nuevaTarea.trim() !== '') {
                this.tareas.push(this.nuevaTarea);
                this.nuevaTarea = '';
            }
        }
    }
}
</script>

<style scoped>
.lista-interactiva {
    margin: 20px;
    text-align: center;
}

input {
    padding: 8px;
    margin-right: 10px;
    width: 250px;
}

button {
    padding: 8px 16px;
    background-color: #42b983;
    border: none;
    color: white;
    cursor: pointer;
}

ul {
    list-style-type: none;
    padding: 0;
}

li {
    padding: 4px 0;
}
</style>