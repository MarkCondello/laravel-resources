import axios from 'axios'

export let getMessage = () => {
  return axios.get('http://127.0.0.1:3000/message')
    .then(response => {
      return response.data
  })
}


// I assume a service for all api calls needs to be made so that testing can be done against the methods defined here.