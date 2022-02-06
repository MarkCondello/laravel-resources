<template>
<div>
  <button @click="fetchResults">Click this</button>
  <p>{{ value }}</p>
</div>
</template>

<script>
import { getValue } from '../services/axios'
export default {
  data() {
    return {
      value: null
    }
  },
  methods: {
    async fetchResults() {
      const resp = await getValue()
      this.value = resp.data
    }
  }
}
</script>

<style>

</style>