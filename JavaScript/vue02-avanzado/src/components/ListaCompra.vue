<template>
    <div class="div-centrado">
        <h1>Lista de la compra</h1>
        <input class="agregar" v-model="nuevoProducto" @keyup.enter="agregarProducto" placeholder="Agregar producto" />
        &nbsp;
        <button @click="agregarProducto">Agregar</button>
        <ul>
            <li v-for="(producto, index) in productos" :key="index">
                {{ producto }}
                &nbsp;<button @click="eliminarProducto(index)">Eliminar</button>
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    data() {
        return {
            nuevoProducto: '',
            productos: []
        };
    },
    methods: {
        agregarProducto() {
            if (this.nuevoProducto.trim() !== '') {
                this.productos.push(this.nuevoProducto);
                this.nuevoProducto = '';
            }
        },
        eliminarProducto(index) {
            this.productos.splice(index, 1);
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
.agregar {
    margin-right: 10px;
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
}

button:hover {
    background-color: #0056b3;
}
</style>