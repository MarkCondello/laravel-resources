<template>
<div>
  <p v-if="error" data-testid="message-error">{{ error }}</p>
  <p v-else data-testid="message">{{ message.text }}</p>
</div>
</template>

<script>
 import { getMessage } from '../services/axios.js'

export default {
  data() {
    return {
      message: {},
      error: null
    }
  },
  async created() {
    try {
      let res = await getMessage();
      console.log("From created lc", {res});
      this.message = res;
    } catch (err) {
      this.error = 'Oops! Something went wrong.'
    }
  },


}
</script>