<template>
    <div>
        <Navbar />
         <v-container fluid>
          <cpuChart
             class="ml-n2"
            :width="550"
            :height="500"
            id="SYS"
          ></cpuChart>
         </v-container>
    </div>
</template>

<script>
//import axios from "axios";
import Navbar from "@/components/navBar.vue";
//import moment from "moment/moment";
import cpuChart from "@/components/cpuChart"

export default {
    props:[
        'id',
    ],
    data() {
    return {
      item: [],
    };
  },

  
  components: {
      Navbar,
      cpuChart,
  }
}

</script>