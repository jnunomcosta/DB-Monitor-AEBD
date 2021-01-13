<template>
  <div id="maintenance">
    <Navbar />
    <v-row justify="center" align="start" no-gutters class="mb-6">
      <v-card height="100" width="220" class="mt-7 mr-3 rounded-0">
        <v-row>
          <v-col cols="9">
            <v-row align="center">
              <span class="mt-7 ml-7 title font-weight-bold">
                {{ item.TABLESPACE_NAME }}
              </span>
            </v-row>
            <v-row align="center">
              <v-chip
                class="ml-7 mt-4 white--text rounded-sm"
                color="green"
                label
                small
              >
                status
              </v-chip>
              <span class="body-2 mt-4 ml-2">online</span>
            </v-row>
          </v-col>
          <v-col cols="3">
            <v-icon class="mt-10 mr-7" color="green">
              published_with_changes
            </v-icon>
          </v-col>
        </v-row>
      </v-card>

      <v-card height="100" width="220" class="mt-7 mr-3 rounded-0">
        <v-row>
          <v-col cols="8">
            <v-row align="center">
              <span class="mt-8 ml-7 title font-weight-bold">
                {{ item.CONTENTS }}
              </span>
            </v-row>
            <v-row align="center">
              <span class="ml-7 mt-4 body-2 font-weight-light">Contents</span>
            </v-row>
          </v-col>
          <v-col cols="4">
            <v-icon class="mt-10 mr-7" color="#D32F2F"> source </v-icon>
          </v-col>
        </v-row>
      </v-card>

      <v-card height="100" width="220" class="mt-7 mr-3 rounded-0">
        <v-row>
          <v-col cols="9">
            <v-row align="center">
              <span class="mt-8 ml-7 title font-weight-bold">
                {{ Math.round((item.FREE + Number.EPSILON) * 100) / 100 }}
              </span>
            </v-row>
            <v-row align="center">
              <v-chip
                class="ml-7 mt-4 white--text rounded-sm"
                color="#8BC34A"
                label
                small
              >
                {{ Math.round((item.PERC_FREE + Number.EPSILON) * 100) / 100 }}
                %
              </v-chip>
              <span class="body-2 mt-4 ml-2">Free space</span>
            </v-row>
          </v-col>
          <v-col cols="3">
            <v-icon class="mt-10 mr-7" color="#8BC34A">
              hourglass_empty
            </v-icon>
          </v-col>
        </v-row>
      </v-card>

      <v-card height="100" width="220" class="mt-7 mr-3 rounded-0">
        <v-row>
          <v-col cols="9">
            <v-row align="center">
              <span class="mt-8 ml-7 title font-weight-bold">
                {{ Math.round((item.USED + Number.EPSILON) * 100) / 100 }}
              </span>
            </v-row>
            <v-row align="center">
              <v-chip
                class="ml-7 mt-4 white--text rounded-sm"
                color="#F9A825"
                label
                small
              >
                {{ Math.round((item.PERC_USED + Number.EPSILON) * 100) / 100 }}
                %
              </v-chip>
              <span class="body-2 mt-4 ml-2">Used space</span>
            </v-row>
          </v-col>
          <v-col cols="3">
            <v-icon class="mt-10 mr-7" color="#F9A825"> hourglass_full </v-icon>
          </v-col>
        </v-row>
      </v-card>

      <v-card height="100" width="220" class="mt-7 mr-3 rounded-0">
        <v-row>
          <v-col cols="8">
            <v-row align="center">
              <h1 class="mt-7 ml-7">
                {{
                  Math.round((item.TABLESPACE_SIZE + Number.EPSILON) * 100) /
                  100
                }}
              </h1>
            </v-row>
            <v-row align="center">
              <span class="ml-7 mt-2 body-2 font-weight-light">Megabytes</span>
            </v-row>
          </v-col>
          <v-col cols="4">
            <v-icon class="mt-10 mr-7" color="#80DEEA"> aspect_ratio </v-icon>
          </v-col>
        </v-row>
      </v-card>

      <v-card height="100" width="220" class="mt-7 mr-3 rounded-0">
        <v-row>
          <v-col cols="8">
            <v-row align="center">
              <span class="mt-8 ml-7 title font-weight-bold">
                {{ item.ALLOCATION_TYPE }}
              </span>
            </v-row>
            <v-row align="center">
              <span class="body-2 mt-4 ml-7">Allocation Type</span>
            </v-row>
          </v-col>
          <v-col cols="4">
            <v-icon class="mt-10 mr-7" color="#9575CD">
              system_update_alt
            </v-icon>
          </v-col>
        </v-row>
      </v-card>
    </v-row>

    <v-row>
      <v-col>
        <v-card class="mt-4 ml-16 rounded-0" height="332" width="685">
          <stackedTimestamps
            :width="500"
            :height="300"
            :id="$route.params.id"
          ></stackedTimestamps>
        </v-card>
      </v-col>
      <v-col>
        <v-virtual-scroll :items="datafiles" max-height="348" :item-height="50">
          <template v-slot:default="{ item }">
            <v-card class="mt-4" max-width="660" tile>
              <v-list-item>
                <v-list-item-content>
                  <v-list-item-title class="body-2">{{ item.FILENAME }} </v-list-item-title>
                </v-list-item-content>
                <v-list-item-action>
                  <v-btn depressed small @click="toDataFile(item)">
                    View DataFile
                    <v-icon color="orange darken-4" right>
                      mdi-open-in-new
                    </v-icon>
                  </v-btn>
                </v-list-item-action>
              </v-list-item>
            </v-card>
          </template>
        </v-virtual-scroll>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import axios from "axios";
import Navbar from "@/components/navBar.vue";
import stackedTimestamps from "@/components/stackedTimestamps";

export default {
  name: "Tablespace",
  props: ["id", "id2"],

  data() {
    return {
      item: [],
      datafiles: []
    };
  },
  created: async function () {
    let response = await axios.get(
      "http://localhost:5001/tablespacedata/" + this.id + "/" + this.id2
    );
    console.log(response.data)
    this.item = response.data.rows[0];

    let response2 = await axios.get(
      "http://localhost:5001/getDataFilesTablespace/" + this.id + "/" + this.id2
    );
    this.datafiles = response2.data.rows;
  },
  methods: {
    toDataFile: function (item) {
      this.$router.push(
        "/datafile/" + item.FILENAME + "/" + item.TIMESTAMP
      );
    },
  },
  components: {
    Navbar,
    stackedTimestamps,
  },
};
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