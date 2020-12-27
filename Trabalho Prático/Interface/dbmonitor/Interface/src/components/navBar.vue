<template>
    <div>
        <nav>
            <v-app-bar flat app height = "100" color="#C62828">
                <v-app-bar-nav-icon class = "black--text" @click="drawer = !drawer"></v-app-bar-nav-icon>
                <v-app-bar flat color = "#C62828" class = "text-uppercase black--text">
                    <h3 class= "font-weight-bold">Menu</h3>
                </v-app-bar>
            </v-app-bar>
            <v-layout align-center justify-space-between column fill-height>
            <v-navigation-drawer app v-model="drawer" class = "white" width = "400">
            <v-list-item two-line>
                <v-list-item-content>
                <v-list-item-title class= "headline">{{this.utilizador.nome}}</v-list-item-title>
                </v-list-item-content>
            </v-list-item>

        <v-divider></v-divider>

        <v-list nav> 
            <v-list-item 
                v-for="item in items"
                :key="item.title"
                router :to="item.route"
                link
            >
                <v-list-item-icon>
                    <v-icon class = "ma-2">{{ item.icon }}</v-icon>
                </v-list-item-icon>

                <v-list-item-content>
                    <v-list-item-title class= "headline">{{ item.title }}</v-list-item-title>
                </v-list-item-content>
                <v-card height = "20" flat></v-card>
            </v-list-item>
        </v-list>
        <template v-slot:append>
        <div class="pa-2">
            <v-btn x-large text class= "headline" block @click="preferencias()">
                <v-icon left>settings</v-icon>Preferências
            </v-btn>
        </div>
      </template>

        </v-navigation-drawer>
        </v-layout>
    </nav>
    </div>
</template>

<script>
export default {
    data() {
        return {
            drawer: false,
            utilizador: {},
            items: [
            { title: 'Users', icon: 'people', route: "/monitor/users/"}, 
            { title: 'File', icon: 'people', route: "/file"}, 
            ],
        }
    },
  
}
</script>

<style>
    #maintenance {
    background-color: burlywood; 
    height: 100%;
    background-position: center;
    background-repeat: repeat;
    background-size: contain;
    position: relative;
  }
  #letra
  {
    font-family: "Merienda", Helvetica, Arial;
  }

</style>