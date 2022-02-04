<template>
    <div>
        <h1>Click count: {{ counter }}</h1>
        <button @click="counter++" :disabled="counter > 2">+1</button>
    </div>
</template>
<script>
export default {
    data() {
        return {
            counter: 0,
        }
    }
}
</script>
