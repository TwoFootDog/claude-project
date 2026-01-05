<script setup lang="ts">
import { ref } from 'vue'
import { api, type HelloResponse, type User } from '@/services/api'

const message = ref<string>('')
const users = ref<User[]>([])
const loading = ref(false)
const error = ref<string>('')

async function testApi() {
  loading.value = true
  error.value = ''
  message.value = ''
  try {
    const response: HelloResponse = await api.getHello()
    message.value = response.message
  } catch (err: any) {
    error.value = err.message || 'Failed to connect to API'
  } finally {
    loading.value = false
  }
}

async function fetchUsers() {
  loading.value = true
  error.value = ''
  users.value = []
  try {
    users.value = await api.getUsers()
  } catch (err: any) {
    error.value = err.message || 'Failed to fetch users'
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <div class="about">
    <h1>API Integration Test</h1>

    <div class="button-group">
      <button @click="testApi" :disabled="loading">Test Spring API</button>
      <button @click="fetchUsers" :disabled="loading">Get Users</button>
    </div>

    <div v-if="loading" class="loading">Loading...</div>
    <div v-if="error" class="error">{{ error }}</div>

    <div v-if="message" class="message">{{ message }}</div>

    <div v-if="users.length > 0" class="users">
      <h2>Users from Database:</h2>
      <ul>
        <li v-for="user in users" :key="user.id">
          {{ user.name }} - {{ user.email }}
        </li>
      </ul>
    </div>
  </div>
</template>

<style scoped lang="scss">
.about {
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem;

  @media (min-width: 1024px) {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
}

h1 {
  margin-bottom: 2rem;
  color: var(--color-heading);
}

.button-group {
  display: flex;
  gap: 1rem;
  margin: 2rem 0;
}

button {
  padding: 0.75rem 1.5rem;
  background: #42b883;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
  transition: background 0.3s ease;

  &:hover:not(:disabled) {
    background: #35a372;
  }

  &:disabled {
    opacity: 0.5;
    cursor: not-allowed;
  }
}

.loading {
  color: #42b883;
  font-style: italic;
  margin: 1rem 0;
}

.error {
  color: #f56c6c;
  padding: 1rem;
  background: #fef0f0;
  border-radius: 4px;
  margin: 1rem 0;
  border-left: 4px solid #f56c6c;
}

.message {
  color: #67c23a;
  padding: 1rem;
  background: #f0f9ff;
  border-radius: 4px;
  margin: 1rem 0;
  border-left: 4px solid #67c23a;
  font-weight: 500;
}

.users {
  margin-top: 2rem;

  h2 {
    font-size: 1.5rem;
    margin-bottom: 1rem;
    color: var(--color-heading);
  }

  ul {
    list-style: none;
    padding: 0;
  }

  li {
    padding: 0.75rem;
    border-bottom: 1px solid var(--color-border);
    transition: background 0.2s ease;

    &:hover {
      background: var(--color-background-soft);
    }

    &:last-child {
      border-bottom: none;
    }
  }
}
</style>
