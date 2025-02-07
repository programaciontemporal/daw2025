import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import AuthForm from '@/components/AuthForm.vue'
import ClientForm from '@/components/ClientForm.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/client-form',
      name: 'client-form',
      component: ClientForm,
    },
  ],
})

export default router
