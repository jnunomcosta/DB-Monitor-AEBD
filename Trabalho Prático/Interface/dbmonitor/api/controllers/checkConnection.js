const checkConnection = module.exports

'use strict';
const oracledb = require('oracledb');
 oracledb.initOracleClient({ libDir: 'C:\\Oracle\\instantclient_19_9' });

const oracleDbRelease = function(conn) {
  conn.release(function (err) {
    if (err)
      console.log(err.message);
  });
}

function queryObject(sql, bindParams, options) {
    options['outFormat'] = oracledb.OBJECT;

    return new Promise(function(resolve, reject) {       
      
        oracledb.getConnection(
                  {
                    user          : "monitor",
                    password      : "database",
                    connectString : "//localhost:1521/dbmonitor.localdomain"
                })
        .then(function(connection){
            connection.execute(sql, bindParams, options)
            .then(function(results) {
                resolve(results);
                process.nextTick(function() {
                    oracleDbRelease(connection);
                });
            })
            .catch(function(err) {
                reject(err);
 
                process.nextTick(function() {
                    oracleDbRelease(connection);
                });
            });
        })
        .catch(function(err) {
            reject(err);
        });
    });
}

checkConnection.getUsers = () => {
    return queryObject("SELECT * FROM Users", {}, {outFormat: ""});
}

checkConnection.getUsersTimeStamps = () => {
    
    return queryObject("SELECT DISTINCT TIMESTAMP FROM Users", {}, {outFormat: ""});
}




module.exports.queryObject = queryObject;



