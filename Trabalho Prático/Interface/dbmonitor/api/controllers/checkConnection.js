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
    console.log(sql);
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
                console.log(results)
                resolve(results);
                console.log(results)
                process.nextTick(function() {
                    oracleDbRelease(connection);
                });
            })
            .catch(function(err) {
                console.log(err)
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

checkConnection.getTablespaces = () => {
    
    return queryObject("SELECT TABLESPACE_NAME,TABLESPACE_SIZE,STATUS,TIMESTAMP FROM TABLESPACES", {}, {outFormat: ""});
}

checkConnection.getTimeStamps = (table) => {
    
    return queryObject("SELECT DISTINCT TIMESTAMP FROM "+table, {}, {outFormat: ""});
}

checkConnection.getTablespaceData = (tName,tTS) => {

    return queryObject("SELECT * FROM TABLESPACES T WHERE T.TABLESPACE_NAME='"+tName+"' AND T.TIMESTAMP=to_date('"+tTS+"','DD-MM-YYYY HH24:MI:SS')", {}, {outFormat: ""});
}

checkConnection.getLastTimestamps = (tName) => {

    return queryObject("SELECT TIMESTAMP, FREE, USED FROM TABLESPACES T WHERE T.TABLESPACE_NAME='"+tName+"' ORDER BY TIMESTAMP DESC FETCH NEXT 5 ROWS ONLY", {}, {outFormat: ""});
}

checkConnection.getDataFilesTablespace = (tName, tTS) => {

    return queryObject("SELECT * FROM DATAFILES D WHERE D.TABLESPACE_NAME= '"+tName+"' AND D.TIMESTAMP=to_date('"+tTS+"','DD-MM-YYYY HH24:MI:SS')", {}, {outFormat: ""});
}

checkConnection.getDataFiles = () => {
    
    return queryObject("SELECT * FROM DATAFILES", {}, {outFormat: ""});
}



module.exports.queryObject = queryObject;



