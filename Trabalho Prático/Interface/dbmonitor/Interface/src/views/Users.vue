<template>
  <div>
    <Navbar/>
<v-row align=center justify=center class="mt-16">
<v-card width="1500">
  <v-select :items="itemsTimestamp" label="Choose a TimeStamp" class="pa-4"></v-select> 
    <v-data-table
      :headers="getHeaders"
      :items="items"
      item-key="name"
      class="elevation-1"
    ></v-data-table>
</v-card>
</v-row>
  </div>
</template>

<script>
import axios from "axios"
import Navbar from '../components/navBar.vue'
export default {
  data() {
    return {
      headers: [],
      items: [],
      itemsTimestamp: [],
    };
  },
  components: {
    Navbar,
  },
created: async function() {
      let response= await axios.get("http://localhost:5001/users");
      for(var i=0;i<response.data.metaData.length;i++){
      this.headers.push(response.data.metaData[i].name);
      }
      this.items=response.data.rows;

      let response2 = await axios.get("http://localhost:5001/users/timestamp");
      for(i=0; i<response2.data.rows.length;i++)
      this.itemsTimestamp.push(response2.data.rows[i].TIMESTAMP);

  },
  computed: {
    getHeaders() {
      let s = new Set();

      this.headers.forEach(item => {
          s.add(item)
      });

      return Array.from(s).map(a => {
        return {
          text: a.toUpperCase(),
          value: a
        }
      });

    }
  }}
    </script>


