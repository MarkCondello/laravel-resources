import axios from 'axios'


//json-server --watch db.json
export let getMessage = () => {
  return axios.get('http://127.0.0.1:3000/message')
    .then(response => {
      return response.data
  })
}

 //export let mockData = () => Promise.resolve({ data: 'value' })
export let mockData = () => {
  return axios.get('http://127.0.0.1:3000/data')
    .then(response => {
      return response.data
  })
}


// I assume a service for all api calls needs to be made so that testing can be done against the methods defined here.

// When mounting the component, there is an object option which takes methods which can be stubbed out too. Worth investigating
// { methods: { getData: () => {}} }