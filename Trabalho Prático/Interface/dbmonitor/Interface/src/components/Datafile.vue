<template>
<div id="maintenance">
    <Navbar/>
    <v-row align="center" justify="center">
      <v-card height = "50" width="700" class="mt-8 text-center pt-3">
       <span class="title mt-8" >
          {{item.FILENAME}}
       </span>
      </v-card>
    </v-row>
    <v-row justify="center" align="start" no-gutters class="mb-6">
      <v-card height="100" width="225" class="mt-7 mr-7 rounded-0">
        <v-row>
          <v-col cols="9">
             <v-row align="center">
              <span class="mt-4 ml-7 caption">Tablespace</span>
            </v-row>
            <v-row align="center">
              <span class="mt-4 ml-7 title font-weight-bold">
                {{ item.TABLESPACE_NAME }}
              </span>
            </v-row>
            <v-row align="center">
              <v-chip
              v-if="item.ONLINE_STATUS=='ONLINE'"
                class="ml-7 mt-4 white--text rounded-sm"
                color="green"
                label
                small
              >
                status
              </v-chip>
              <v-chip
              v-else
              class="ml-7 mt-4 white--text rounded-sm"
                color="orange"
                label
                small
              >
                status
              </v-chip>
              <span class="body-2 mt-4 ml-2">{{item.ONLINE_STATUS}}</span>
            </v-row>
          </v-col>
          <v-col cols="3">
            <v-icon class="mt-10 mr-7" color="green">
              published_with_changes
            </v-icon>
          </v-col>
        </v-row>
      </v-card>

      <v-card height="100" width="225" class="mt-7 mr-7 rounded-0">
        <v-row>
          <v-col cols="8">
            <v-row align="center">
              <span class="mt-8 ml-7 title font-weight-bold">
                {{ item.STATUS }}
              </span>
            </v-row>
            <v-row align="center">
              <span class="ml-7 mt-4 body-2 font-weight-light">Status</span>
            </v-row>
          </v-col>
          <v-col cols="4">
            <v-icon class="mt-10 mr-7" color="#D32F2F"> source </v-icon>
          </v-col>
        </v-row>
      </v-card>

      <v-card height="100" width="225" class="mt-7 mr-7 rounded-0">
        <v-row>
          <v-col cols="9">
            <v-row align="center">
              <span class="mt-9 ml-15 title font-weight-bold">
                {{ item.FILE_ID }}
              </span>
            </v-row>
            <v-row align="center">
              <span class="body-2 mt-4 ml-14">FileID</span>
            </v-row>
          </v-col>
          <v-col cols="3">
            <v-icon class="mt-10 mr-7" color="#8BC34A">
              fingerprint
            </v-icon>
          </v-col>
        </v-row>
      </v-card>

      <v-card height="100" width="225" class="mt-7 mr-7 rounded-0">
        <v-row>
          <v-col cols="9">
            <v-row align="center">
              <span class="mt-9 ml-15 title font-weight-bold">
                {{ item.AUTOEXTENSIBLE }}
              </span>
            </v-row>
            <v-row align="center">
              <span class="body-2 mt-4 ml-8">Autoextensible</span>
            </v-row>
          </v-col>
          <v-col cols="3">
            <v-icon class="mt-10 mr-7" color="#F9A825"> extension </v-icon>
          </v-col>
        </v-row>
      </v-card>

      <v-card height="100" width="225" class="mt-7 mr-7 rounded-0">
        <v-row>
          <v-col cols="8">
            <v-row align="center">
              <h3 class="mt-7 ml-7">
                {{
                  timestamp(item.TIMESTAMP)
                }}
              </h3>
            </v-row>
            <v-row align="center">
              <span class="ml-7 mt-2 body-2 font-weight-light">Timestamp</span>
            </v-row>
          </v-col>
          <v-col cols="4">
            <v-icon class="mt-10 mr-7" color="#80DEEA"> query_builder </v-icon>
          </v-col>
        </v-row>
      </v-card>
    </v-row>



<!-- THIS -->
   <v-row>
      <v-col class="ml-13">
        <v-card class="mt-2 ml-16 rounded-0" height="332" width="610">
          <DatafilesBytes
            class="ml-n2"
            :width="550"
            :height="300"
            :id="$route.params.id"
          ></DatafilesBytes>
        </v-card>
      </v-col>
      <v-col class="ml-n16  ">
        <v-card class="mt-2 ml-n3 rounded-0" height="332" width="610">
          <DatafilesBlocks
             class="ml-n2"
            :width="550"
            :height="300"
            :id="$route.params.id"
          ></DatafilesBlocks>
        </v-card>
      </v-col>
   </v-row>


</div>
</template>
<script>
import Navbar from "@/components/navBar.vue";
import axios from "axios";
import moment from "moment/moment";
// THIS
import DatafilesBytes from "@/components/DatafilesBytes";
import DatafilesBlocks from "@/components/DatafilesBlocks";

export default {
    props: ["id", "id2"],
    data() {
    return {
      item: [],
    }},
    components:{Navbar,

    // THIS
    DatafilesBytes,
    DatafilesBlocks,
    },

     created: async function () {
         console.log(this.id);
         console.log(this.id2);
        // var nid = this.id.replace(/!/g,"/");
         var format = "DD-MM-YYYY HH:mm:ss";
         var nid2 = moment(this.id2).format(format);
    let response = await axios.get("http://localhost:5001/getDataFileTimeStamp/"+ this.id + "/" + nid2);
    console.log(response);
    // format = "DD-MM-YYYY HH:mm:ss";
    this.item=response.data.rows[0];
  },
  methods: {
    timestamp: function (time) {
      return moment(time).format("MMM DD, YYYY HH:mm:ss");
    },
  }
}
</script>


<style>
#maintenance {
  background-color: #efdcc3;
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