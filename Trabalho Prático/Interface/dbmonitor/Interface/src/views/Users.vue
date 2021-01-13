<template>
  <div id="maintenance">
    <Navbar />
    <v-row align="center" justify="center" class="mt-16">
      <v-card width="1350">
        <v-select
          color="#C62828"
          v-model="search"
          :items="itemsTimestamp"
          label="Choose a TimeStamp"
          class="pa-4"
        ></v-select>
        <v-container class="ml-5" fluid>
          <v-card
            flat
            v-for="(item, index) in table_data"
            :key="index"
            class="mb-3 mr-3"
          >
            <v-layout>
              <v-flex xs6 sm4 md1>
                <div class="caption grey--text">Username</div>
                <div class="body-2">{{ item.USERNAME }}</div>
              </v-flex>
              <v-flex xs6 sm4 md2>
                <div class="caption grey--text">Account Status</div>
                <v-chip
                  v-if="item.ACCOUNT_STATUS === 'OPEN'"
                  color="#8BC34A"
                  class="body-2 px-4 mb-2"
                  small
                >
                  {{ item.ACCOUNT_STATUS }}
                </v-chip>
                <v-chip v-else color="#B70000" class="body-2 mb-2" small>
                  {{ item.ACCOUNT_STATUS }}
                </v-chip>
              </v-flex>
              <v-flex xs6 sm4 md1 class="ml-n12">
                <div class="caption grey--text">Expiry Date</div>
                <div class="body-2">
                  {{ date(item.EXPIRY_DATE) }}
                  <v-icon
                    v-if="passed(date(item.EXPIRY_DATE)) < 0"
                    small
                    color="#8BC34A"
                    >schedule</v-icon
                  >
                  <v-icon v-else small color="#B70000">schedule</v-icon>
                </div>
              </v-flex>
              <v-flex xs6 sm4 md2 class="ml-6">
                <div class="caption grey--text">Default Tablespace</div>
                <div class="body-2">{{ item.DEFAULT_TABLESPACE }}</div>
              </v-flex>
              <v-flex xs6 sm4 md2 class="ml-n12">
                <div class="caption grey--text">Temporary Tablespace</div>
                <div class="body-2">{{ item.TEMPORARY_TABLESPACE }}</div>
              </v-flex>
              <v-flex xs6 sm4 md1 class="ml-n12">
                <div class="caption grey--text">Profile</div>
                <div class="body-2">{{ item.PROFILE }}</div>
              </v-flex>
              <v-flex xs6 sm4 md1>
                <div class="caption grey--text">Created</div>
                <div class="body-2">{{ date(item.CREATED) }}</div>
              </v-flex>
              <v-flex xs6 sm4 md1>
                <div class="caption grey--text">Common</div>
                <div class="body-2">{{ item.COMMON }}</div>
              </v-flex>
              <v-flex xs6 sm4 md2>
                <div class="caption grey--text">Timestamp</div>
                <div class="body-2">{{ timestamp(item.TIMESTAMP) }}</div>
              </v-flex>
            </v-layout>
            <v-divider></v-divider>
          </v-card>
        </v-container>
      </v-card>
    </v-row>

    <v-btn
      v-scroll="onScroll"
      v-show="fab"
      icon
      depressed
      fixed
      dark
      bottom
      right
      class="ma-2"
      color="#C62828"
      @click="toTop"
    >
      <v-icon>keyboard_arrow_up</v-icon>
    </v-btn>
  </div>
</template>

<script>
import axios from "axios";
import Navbar from "@/components/navBar.vue";
import moment from "moment/moment";
export default {
  data() {
    return {
      fab:false,
      search: "",
      selected: [],
      headers: [],
      items: [],
      itemsTimestamp: [],
    };
  },
  components: {
    Navbar,
  },
  methods: {
    date: function (data) {
      return moment(data).format("ll");
    },
    timestamp: function (time) {
      return moment(time).format("MMM DD, YYYY HH:mm:ss");
    },
    passed: function (time) {
      var now = moment(new Date());
      return moment.duration(now.diff(time), "ms").asMilliseconds();
    },
    onScroll (e) {
        if (typeof window === 'undefined') return
        const top = window.pageYOffset ||   e.target.scrollTop || 0
        this.fab = top > 20
    },
    toTop () {
        this.$vuetify.goTo(0)
    },
  },
  created: async function () {
    let response = await axios.get("http://localhost:5001/users");
    for (var i = 0; i < response.data.metaData.length; i++) {
      this.headers.push(response.data.metaData[i].name);
    }
    this.items = response.data.rows;

    let response2 = await axios.get("http://localhost:5001/users/timestamp");
    this.itemsTimestamp.push("- Select -");
    for (i = 0; i < response2.data.rows.length; i++)
      this.itemsTimestamp.push(
        moment(response2.data.rows[i].TIMESTAMP).format("MMM DD, YYYY HH:mm:ss")
      );
  },
  computed: {
    getHeaders() {
      let s = new Set();
      this.headers.forEach((item) => {
        s.add(item);
      });

      return Array.from(s).map((a) => {
        return {
          text: a.toUpperCase(),
          value: a,
        };
      });
    },
    table_data() {
      let self = this;
      let filtered_data = this.items.filter(function (item) {
        if (self.search != "" && self.search != "- Select -") {
          return (
            self.search ==
            moment(item.TIMESTAMP).format("MMM DD, YYYY HH:mm:ss")
          );
        } else {
          return item;
        }
      });
      return filtered_data;
    },
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

