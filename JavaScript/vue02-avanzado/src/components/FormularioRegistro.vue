<template>
    <div class="div-centrado">
        <h1>Formulario de registro</h1>
        <form @submit.prevent="submitForm">
            <div>
                <label for="name">Nombre:</label>
                <input type="text" v-model="name" id="name" />
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="email" v-model="email" id="email" />
                <span v-if="emailError">{{ emailError }}</span>
            </div>
            <div>
                <label for="password">Contraseña:</label>
                <input type="password" v-model="password" id="password" />
                <span v-if="passwordError">{{ passwordError }}</span>
            </div>
            <button type="submit" :disabled="!isFormValid">Registrar</button>
        </form>
    </div>
</template>

<script>
export default {
    data() {
        return {
            name: '',
            email: '',
            password: ''
        };
    },
    computed: {
        emailError() {
            if (!this.email.includes('@') || !this.email.includes('.')) {
                return 'El email debe contener "@" y un punto.';
            }
            return '';
        },
        passwordError() {
            if (this.password.length < 6) {
                return 'La contraseña debe tener al menos 6 caracteres.';
            }
            return '';
        },
        isFormValid() {
            return this.name && !this.emailError && !this.passwordError;
        }
    },
    methods: {
        submitForm() {
            if (this.isFormValid) {
                alert('Formulario enviado');
                // Aquí puedes agregar la lógica para enviar el formulario
            }
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

form {
    display: flex;
    flex-direction: column;
    width: 100%;
    max-width: 500px;
    margin: auto;
    padding: 20px;
    border: 1px solid #ced4da;
    border-radius: 5px;
    background-color: #f8f9fa;
}

div {
    margin-bottom: 15px;
}

label {
    margin-bottom: 5px;
    font-weight: bold;
}

input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ced4da;
    border-radius: 5px;
}

button {
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: white;
    font-size: 16px;
    cursor: pointer;
}

button:disabled {
    background-color: #6c757d;
}

span {
    color: red;
    font-size: 12px;
}
form {
    display: flex;
    flex-direction: column;
    width: 300px;
    margin: auto;
}

div {
    margin-bottom: 10px;
}

span {
    color: red;
    font-size: 12px;
}
</style>