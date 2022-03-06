import axios from 'axios'

//json-server --watch db.json --port 5000
export let getMessage = () => {
  return axios.get('http://127.0.0.1:5000/message')
    .then(response => {
      return response.data
  })
}

export let mockData = () => {
  return axios.get('http://127.0.0.1:5000/data')
    .then(response => {
      return response.data
  })
}

// I assume a service for all api calls needs to be made so that jest testing can be done against the methods defined.
export let getValue = () => Promise.resolve({ data: 'get value yo.'})