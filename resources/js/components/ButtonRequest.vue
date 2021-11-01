<template>
  <button @click="fetchResults">{{ value }}</button>
</template>

<script>
  // import axios from 'axios';
  import { mockData } from '../services/axios.js';

  export default {
    data() {
      return {
        value: null
      }
    },

    methods: {
      async fetchResults() {
        const response = await mockData();
        //axios.get('mock/service') // in the docs but wtf?
        console.log({response})
        this.value = response.text
      }
    }
  }
</script>