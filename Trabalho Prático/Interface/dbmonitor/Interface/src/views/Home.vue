<template>
    <div id="maintenance">
        <Navbar/>
        <v-card
            flat
            class = "mx-auto text-center mb-16 pt-16"
            height="400"
            color = "transparent"
        >
            <v-row align="center" justify="center"  >
            <v-col cols=4>
              <v-row>
            <v-img
                class="mb-5 mt-16 pt-16" 
                src="@/assets/oracleLogo.png"
                max-width = "500"
                max-height = "300"
            /> 
              </v-row>
              <v-row>
            <h1 id="letra" class="   red--text text--darken-4 pl-16 ml-13" > Database Monitor </h1>
              </v-row>
            </v-col>
            </v-row>
        </v-card>
    </div>

</template>


<script>
import Navbar from '../components/navBar.vue'
export default {
  components: { Navbar },
    data() {
        return {
            drawer: true,
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