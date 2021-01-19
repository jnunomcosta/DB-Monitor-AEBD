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
              <v-flex xs6 sm4 md2>
                <div class="caption grey--text">Username</div>
                <div class="body-2">{{ item.USERNAME }}</div>
              </v-flex>
              <v-flex xs6 sm4 md3>
                <div class="caption grey--text">Account Status</div>
                <v-chip
                  v-if="item.ACCOUNT_STATUS === 'OPEN'"
                  color="#C5E1A5"
                  class="body-2 px-4 mb-2"
                  small
                >
                  {{ item.ACCOUNT_STATUS }}
                </v-chip>
                <v-chip v-else color="#EF9A9A" class="body-2 mb-2" small>
                  {{ item.ACCOUNT_STATUS }}
                </v-chip>
              </v-flex>
              <v-flex xs6 sm4 md2 class="ml-n12">
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

              <v-flex xs6 sm4 md2>
                <div class="caption grey--text">Created</div>
                <div class="body-2">{{ date(item.CREATED) }}</div>
              </v-flex>
              <v-flex xs6 sm4 md2>
                <div class="caption grey--text">Timestamp</div>
                <div class="body-2">{{ timestamp(item.TIMESTAMP) }}</div>
              </v-flex>
              <v-flex xs6 sm4 md1>
                <v-btn
                  @click="opendialog(item)"
                  outlined
                  small
                  class="mt-3"
                  color="red"
                  >More Details</v-btn
                >
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

    <v-dialog
      v-model="dialog"
      fullscreen
      hide-overlay
      transition="dialog-bottom-transition"
    >
      <v-card>
        <v-toolbar dark color="#C62828">
          <v-btn icon dark @click="dialog = false">
            <v-icon>mdi-close</v-icon>
          </v-btn>
          <v-toolbar-title>User details</v-toolbar-title>
        </v-toolbar>
        <v-list three-line subheader>
          <v-subheader>User</v-subheader>

          <v-list-item>
            <v-card class="mx-auto" flat>
              <v-row>
            <v-card height="100" width="225" class="mt-7 mx-7 mb-4 rounded-0">
              <v-row>
                <v-col cols="9">
                  <v-row align="center">
                    <span class="mt-9 ml-8 title font-weight-bold">
                      {{ this.common }}
                    </span>
                  </v-row>
                  <v-row align="center">
                    <span class="body-2 mt-4 ml-8">Common</span>
                  </v-row>
                </v-col>
                <v-col cols="3">
                  <v-icon class="mt-10 mr-7" color="rgba(187,238,17,1)">
                    assistant_photo
                  </v-icon>
                </v-col>
              </v-row>
            </v-card>

            <v-card height="100" width="225" class="mt-7 mx-7 mb-4 rounded-0">
              <v-row>
                <v-col cols="9">
                  <v-row align="center">
                    <span class="mt-9 ml-8 title font-weight-bold">
                      {{ this.temporary }}
                    </span>
                  </v-row>
                  <v-row align="center">
                    <span class="body-2 mt-4 ml-8">Temporary Tablespace</span>
                  </v-row>
                </v-col>
                <v-col cols="3">
                  <v-icon class="mt-10 mr-7" color="rgba(60,213,255,1)">
                    hourglass_bottom
                  </v-icon>
                </v-col>
              </v-row>
            </v-card>

            <v-card height="100" width="225" class="mt-7 mx-7 mb-4 rounded-0">
              <v-row>
                <v-col cols="9">
                  <v-row align="center">
                    <span class="mt-9 ml-8 title font-weight-bold">
                      {{ this.default }}
                    </span>
                  </v-row>
                  <v-row align="center">
                    <span class="body-2 mt-4 ml-8">Default Tablespace</span>
                  </v-row>
                </v-col>
                <v-col cols="3">
                  <v-icon class="mt-10 mr-7" color="rgba(255,156,119,1)">
                    backup_table
                  </v-icon>
                </v-col>
              </v-row>
            </v-card>
            <v-card height="100" width="225" class="mt-7 mx-7 mb-4 rounded-0">
              <v-row>
                <v-col cols="9">
                  <v-row align="center">
                    <span class="mt-9 ml-8 title font-weight-bold">
                      {{ this.profile }}
                    </span>
                  </v-row>
                  <v-row align="center">
                    <span class="body-2 mt-4 ml-8">Profile</span>
                  </v-row>
                </v-col>
                <v-col cols="3">
                  <v-icon class="mt-10 mr-7" color="rgba(255,99,132,1)">
                    person_pin
                  </v-icon>
                </v-col>
              </v-row>
            </v-card>
            </v-row>
            </v-card>
          </v-list-item>
        </v-list>
        <v-divider></v-divider>
        <v-list three-line subheader>
          <v-subheader>Sessions</v-subheader>
          <v-card v-if="sessionsUser.length == 0" flat class="mx-auto" width = "800">
              <v-alert
                border="right"
                colored-border
                type="error"
                elevation="2"
              >
              No sessions recorded!
              </v-alert>
          </v-card>
          <v-card width = "1050" flat class="mx-auto" v-else>
              <v-list-item v-for="(session, index) in sessionsUser" :key="index">
                <v-list-item-content>
                  <v-list-item-title class="body-2"
                    >{{ session }}
                  </v-list-item-title>
                </v-list-item-content>
                <v-list-item-action>
                  <v-btn depressed small @click="toSession(session)" class="mt-2">
                    View Session
                    <v-icon color="orange darken-4" right>
                      mdi-open-in-new
                    </v-icon>
                  </v-btn>
                </v-list-item-action>
              </v-list-item>
            </v-card>
        </v-list>
      </v-card>
    </v-dialog>
    <v-card color="transparent" flat height="100"></v-card>
    <Footer />
  </div>
</template>

<script>
import axios from "axios";
import Navbar from "@/components/navBar.vue";
import moment from "moment/moment";
import Footer from "@/components/Footer.vue"
export default {
  data() {
    return {
      fab: false,
      search: "",
      selected: [],
      headers: [],
      items: [],
      itemsTimestamp: [],
      dialog: false,
      profile: "",
      temporary: "",
      common: "",
      default: "",
      user: "",
      sessions: [],
      sessionsUser: [],
    };
  },
  components: {
    Navbar,
    Footer
  },
  methods: {
    date: function (data) {
      return moment(data).format("ll");
    },
    timestamp: function (time) {
      const format = "MMM DD, YYYY HH:mm:ss";
      return moment(time).format(format);
    },
    passed: function (time) {
      var now = moment(new Date());
      return moment.duration(now.diff(time), "ms").asMilliseconds();
    },
    onScroll(e) {
      if (typeof window === "undefined") return;
      const top = window.pageYOffset || e.target.scrollTop || 0;
      this.fab = top > 20;
    },
    toTop() {
      this.$vuetify.goTo(0);
    },
    toSession: function (session) {
      this.$router.push(
        "/session/" + this.user + "/" + session
      );
    },
    opendialog(item) {
      this.sessionsUser = [];
      this.user = item.USERNAME;
      this.common = item.COMMON;
      this.temporary = item.TEMPORARY_TABLESPACE;
      this.profile = item.PROFILE;
      this.default = item.DEFAULT_TABLESPACE;
      const format = "MMM DD, YYYY HH:mm:ss";
      for (var i = 0; i < this.sessions.length; i++){
        if (this.sessions[i].USERNAME == item.USERNAME){
          this.sessionsUser.push(moment(this.sessions[i].TIMESTAMP).format(format));
        }
      }
      this.dialog = true;
    },
  },
  created: async function () {
    let response = await axios.get("http://localhost:5001/users");
    for (var i = 0; i < response.data.metaData.length; i++) {
      this.headers.push(response.data.metaData[i].name);
    }
    this.items = response.data.rows;

    let response2 = await axios.post("http://localhost:5001/timestamp", {
      table: "USERS",
    });

    this.itemsTimestamp.push("- Select -");
    const format = "MMM DD, YYYY HH:mm:ss";
    for (i = 0; i < response2.data.rows.length; i++)
      this.itemsTimestamp.push(
        moment(response2.data.rows[i].TIMESTAMP).format(format)
      );

      let response3 = await axios.get("http://localhost:5001/getTimeStampsUser/");
      this.sessions = response3.data.rows;
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
      const format = "MMM DD, YYYY HH:mm:ss";
      let filtered_data = this.items.filter(function (item) {
        if (self.search != "" && self.search != "- Select -") {
          return self.search == moment(item.TIMESTAMP).format(format);
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

