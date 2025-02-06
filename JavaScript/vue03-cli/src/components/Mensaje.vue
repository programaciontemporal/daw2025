<template>
    <div>
        <p>Mensaje recibido: {{ mensaje }}</p>
    </div>
</template>

<script>
export default {
    name: 'Mensaje',
    props: {
        mensaje: {
            type: String,
            default: 'No hay mensaje',
            required: true
    }
}
}
</script>