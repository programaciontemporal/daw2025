<template>
    <div class="contenedor-tabla">
        <h2 class="title">Lista de Clientes</h2>
        <table v-if="clientes.length > 0">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th>Empresa</th>
                    <th>Cargo</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(cliente, index) in clientes" :key="index">
                    <td>{{ cliente.nombre }}</td>
                    <td>{{ cliente.email }}</td>
                    <td>{{ cliente.telefono }}</td>
                    <td>{{ cliente.empresa }}</td>
                    <td>{{ cliente.cargo }}</td>
                </tr>
            </tbody>
        </table>
        <p v-else>No hay clientes registrados.</p>
    </div>
</template>

<script>
export default {
    props: {
        clientes: {
            type: Array,
            required: true
        }
    }
};
</script>

<style scoped>
.contenedor-tabla {
    background: white;
    padding: 2rem;
    border-radius: 8px;
    box-shadow: 0px 4px 10px #0000001a;
    width: 300px;
    text-align: center;
    border: 1px solid lightgray;
    width: 100vh;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

th,
td {
    border: 1px solid #ccc;
    padding: 8px;
    text-align: left;
}

th {
    background: #1e3c72;
    color: white;
}
</style>