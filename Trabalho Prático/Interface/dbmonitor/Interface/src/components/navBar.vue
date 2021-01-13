<template>
  <div>
    <nav>
      <v-app-bar flat app height="75" color="#C62828">
        <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
        <v-app-bar flat color="#C62828" class="text-uppercase black--text">
          <h3 class="font-weight-light">Menu</h3>
        </v-app-bar>
      </v-app-bar>
      <v-layout align-center justify-space-between column fill-height>
        <v-navigation-drawer app class="white" width="200" v-model="drawer"
      absolute
      temporary>
          <v-list>
            <v-list-item>
              <v-list-item-icon>
                <v-btn icon to="/">
                <v-icon>mdi-home</v-icon></v-btn>
              </v-list-item-icon>

              <v-list-item-title>DbMonitor</v-list-item-title>
            </v-list-item>
          </v-list>

          <v-list-group :value="true" color="#C62828">
            <template v-slot:activator>
              <v-list-item-title>Users</v-list-item-title>
            </template>

            <v-list-item link to="/monitor/users/" color="grey">
              <v-list-item-title>Timestamps</v-list-item-title>

              <v-list-item-icon>
                <v-icon small>schedule</v-icon>
              </v-list-item-icon>
            </v-list-item>
          </v-list-group>

          <v-list-group :value="true" color="#C62828">
            <template v-slot:activator>
              <v-list-item-title>Tablespaces</v-list-item-title>
            </template>

            <v-list-item link to="/tablespaces" color="grey">
              <v-list-item-title>Tablespaces</v-list-item-title>

              <v-list-item-icon>
                <v-icon small>poll</v-icon>
              </v-list-item-icon>
            </v-list-item>

            <v-list-item link to="/datafiles" color="grey">
              <v-list-item-title>Datafiles</v-list-item-title>

              <v-list-item-icon>
                <v-icon small>description</v-icon>
              </v-list-item-icon>
            </v-list-item>
          </v-list-group>
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
    };
  },
};
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
#letra {
  font-family: "Merienda", Helvetica, Arial;
}
</style>