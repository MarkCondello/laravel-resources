import axios from 'axios'

export function getMessage() {
  return axios.get('http://127.0.0.1:3000/message')
    .then(response => {
      return response.data
  })
}