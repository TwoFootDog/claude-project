import axios from 'axios'

const apiClient = axios.create({
  baseURL: 'http://localhost:8080/api',
  headers: {
    'Content-Type': 'application/json'
  }
})

export interface User {
  id?: number
  name: string
  email: string
  createdAt?: string
}

export interface HelloResponse {
  message: string
  timestamp: string
}

export const api = {
  getHello(): Promise<HelloResponse> {
    return apiClient.get('/hello').then(res => res.data)
  },

  getUsers(): Promise<User[]> {
    return apiClient.get('/users').then(res => res.data)
  },

  createUser(user: User): Promise<User> {
    return apiClient.post('/users', user).then(res => res.data)
  }
}