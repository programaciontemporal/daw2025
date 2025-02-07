<template>
  <div class="auth-container">
    <form @submit.prevent="login" class="auth-form">
      <h2 class="title">Iniciar Sesión</h2>
      <div class="input-group">
        <label for="username">Usuario</label>
        <input type="text" id="username" v-model="username" required />
      </div>
      <div class="input-group">
        <label for="password">Contraseña</label>
        <input type="password" id="password" v-model="password" required />
      </div>
      <button type="submit" class="btn">Ingresar</button>
      <p v-if="error" class="error">{{ error }}</p>
    </form>
  </div>
</template>

<script>
export default {
  data()
  {
    return {
      username: "",
      password: "",
      error: ""
    };
  },
  methods: {
    login()
    {
      if (this.username === "admin" && this.password === "1234") {
        this.$router.push("/client-form");
      } else {
        this.error = "Usuario o contraseña incorrectos";
      }
    }
  }
};
</script>

<style scoped>
.auth-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
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
  margin-top: 10px;
}
</style>
