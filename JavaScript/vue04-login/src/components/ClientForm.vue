<template>
    <div class="auth-container">
        <form @submit.prevent="submitForm" class="auth-form">
            <h2 class="title">Registro de Cliente</h2>

            <div class="input-group">
                <label for="name">Nombre</label>
                <input type="text" id="name" v-model="cliente.nombre" required />
                <p v-if="errores.nombre" class="error">{{ errores.nombre }}</p>
            </div>

            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" v-model="cliente.email" required />
                <p v-if="errores.email" class="error">{{ errores.email }}</p>
            </div>

            <div class="input-group">
                <label for="telefono">Teléfono</label>
                <input type="text" id="telefono" v-model="cliente.telefono" required />
                <p v-if="errores.telefono" class="error">{{ errores.telefono }}</p>
            </div>

            <div class="input-group">
                <label for="empresa">Empresa</label>
                <input type="text" id="empresa" v-model="cliente.empresa" required />
                <p v-if="errores.empresa" class="error">{{ errores.empresa }}</p>
            </div>

            <div class="input-group">
                <label for="cargo">Cargo</label>
                <input type="text" id="cargo" v-model="cliente.cargo" required />
                <p v-if="errores.cargo" class="error">{{ errores.cargo }}</p>
            </div>

            <button type="submit" class="btn">Registrar Cliente</button>
        </form>
    </div>

    <div>
        <!-- Tabla de clientes debajo del formulario -->
        <ClientTable :clientes="clientes" v-if="clientes.length > 0" />
    </div>
</template>

<script>
import ClientTable from "@/components/ClientTable.vue";

export default {
    components: { ClientTable },
    data()
    {
        return {
            cliente: {
                nombre: "",
                email: "",
                telefono: "",
                empresa: "",
                cargo: ""
            },
            clientes: [], // Inicializa el array de clientes
            errores: {}
        };
    },
    methods: {
        validarFormulario()
        {
            this.errores = {};

            if (this.cliente.nombre.length < 3) {
                this.errores.nombre = "El nombre debe tener al menos 3 caracteres.";
            }

            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(this.cliente.email)) {
                this.errores.email = "Debe ser un email válido.";
            }

            const telefonoRegex = /^[0-9]{7,15}$/;
            if (!telefonoRegex.test(this.cliente.telefono)) {
                this.errores.telefono = "El teléfono debe contener entre 7 y 15 dígitos.";
            }

            if (!this.cliente.empresa.trim()) {
                this.errores.empresa = "El campo empresa es obligatorio.";
            }

            if (!this.cliente.cargo.trim()) {
                this.errores.cargo = "El campo cargo es obligatorio.";
            }

            return Object.keys(this.errores).length === 0;
        },
        submitForm()
        {
            if (this.validarFormulario()) {
                this.clientes.push({ ...this.cliente }); // Agregar el cliente al array
                console.log("Clientes:", this.clientes); // Comprobar si los datos se están agregando
                this.cliente = { nombre: "", email: "", telefono: "", empresa: "", cargo: "" }; // Limpiar el formulario
            }
        }
    }
};
</script>


<style scoped>
.table-container{
    width: 100%;
}
.auth-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    /* background: linear-gradient(to right, #1e3c72, #2a5298); */
}

.auth-form {
    background: white;
    padding: 2rem;
    border-radius: 8px;
    box-shadow: 0px 4px 10px #0000001a;
    width: 300px;
    text-align: center;
    border: 1px solid lightgray;
}

.title {
    margin-bottom: 1rem;
    color: #1e3c72;
}

.input-group {
    margin-bottom: 1rem;
    text-align: left;
}

.input-group label {
    display: block;
    font-weight: bold;
    color: #333;
}

.input-group input {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.btn {
    background: #1e3c72;
    color: white;
    border: none;
    padding: 10px;
    width: 100%;
    border-radius: 4px;
    cursor: pointer;
    transition: background 0.3s;
}

.btn:hover {
    background: #2a5298;
}

.error {
    color: red;
    margin-top: 5px;
}

.clientes-list {
    margin-top: 20px;
    text-align: center;
}

.clientes-list h3 {
    color: #1e3c72;
}

.clientes-list ul {
    list-style: none;
    padding: 0;
}

.clientes-list li {
    background: #f5f5f5;
    margin: 5px 0;
    padding: 8px;
    border-radius: 4px;
}
</style>