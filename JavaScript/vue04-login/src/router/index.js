import { createRouter, createWebHistory } from 'vue-router';
import AuthForm from '@/components/AuthForm.vue';
import ClientForm from '@/components/ClientForm.vue';

const routes = [
  { path: '/', component: AuthForm },
  { path: '/client-form', component: ClientForm }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;