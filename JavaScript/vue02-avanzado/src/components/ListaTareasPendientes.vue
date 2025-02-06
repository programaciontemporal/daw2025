<template>
    <div class="div-centrado">
        <h1>Lista de Tareas Pendientes</h1>
        <div class="div-centrado">
            <input v-model="nuevaTarea" @keyup.enter="agregarTarea" placeholder="Agregar nueva tarea" />
            <button @click="agregarTarea">Agregar Tarea</button>
        </div>
        <ul>
            <li v-for="(tarea, index) in tareas" :key="index" :class="{ completada: tarea.completada }">
                <input type="checkbox" v-model="tarea.completada" />
                <span>{{ tarea.texto }}</span>
                <button @click="eliminarTarea(index)">Eliminar</button>
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    data() {
        return {
            nuevaTarea: '',
            tareas: []
        };
    },
    methods: {
        agregarTarea() {
            if (this.nuevaTarea.trim() !== '') {
                this.tareas.push({ texto: this.nuevaTarea, completada: false });
                this.nuevaTarea = '';
            }
        },
        eliminarTarea(index) {
            this.tareas.splice(index, 1);
        }
    }
};
</script>

<style scoped>
.div-centrado {
    width: 100%;
    margin: 0 auto;
    clear: both;
    text-align: center;
}

ul {
    list-style-type: none;
    padding: 0;
    width: 100%;
}

li {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
}

button {
    background-color: #007BFF;
    color: white;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    margin-left: 10px;
}

button:hover {
    background-color: #0056b3;
}

h1 {
    margin-bottom: 20px;
    width: 100%;
}

input {
    margin-right: 10px;
}

ul {
    list-style-type: none;
    padding: 0;
}

li {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

li span {
    flex-grow: 1;
    margin-left: 10px;
}

li button {
    margin-left: 10px;
}

.completada {
    text-decoration: line-through;
    color: gray;
}
</style>