import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: () => import(/* webpackChunkName: "about" */ '../views/Home.vue')
  },

  {
    path:  "/monitor/users/",
    name: 'Users',
    component: () => import(/* webpackChunkName: "about" */ '../views/Users.vue')
  },
  {
    path:  "/tablespaces",
    name: 'Tablespaces',
    component: () => import(/* webpackChunkName: "about" */ '../views/Tablespaces.vue')
  },
  {
    path:  "/tablespace/:id/:id2",
    name: 'Tablespace',
    component: () => import(/* webpackChunkName: "about" */ '../views/Tablespace.vue')
  },
  {
    path:  "/datafiles",
    name: 'Datafiles',
    component: () => import(/* webpackChunkName: "about" */ '../views/Datafiles.vue')
  },
  {
    path:  "/datafile/:id/:id2",
    name: 'Datafile',
    component: () => import(/* webpackChunkName: "about" */ '../views/Datafile.vue')
  },
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes, 

  })

  export default router


  "/monitor/users/"