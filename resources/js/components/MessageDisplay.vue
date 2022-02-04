<template>
<div>
  <p v-if="error" data-testid="message-error">{{ error }}</p>
  <p v-else data-testid="message">{{ message.text }}</p>
</div>
</template>

<script>
// import { getMessage } from '../services/axios.js'
import axios from 'axios'

export default {
  data() {
    return {
      message: {},
      error: null
    }
  },
  async created() {
    try {
      // let res = await getMessage();
      let res = await axios.get('http://127.0.0.1:5000/message')
        .then(response => {
          return response.data
        })
      this.message = res;
    } catch (err) {
      this.error = 'Oops! Something went wrong.'
    }
  },


}
</script>