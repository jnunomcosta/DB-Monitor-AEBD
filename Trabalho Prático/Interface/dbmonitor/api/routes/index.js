var express = require('express');
var router = express.Router();
const axios = require('axios')
const path = require('path')
var connection = require('../controllers/checkConnection')

router.get('/users',(req,res,next) =>{
    connection.getUsers()
      .then(dados => res.jsonp(dados))
      .catch(erro => res.jsonp(erro))
  })

  router.get('/users/timestamp',(req,res) =>{
    connection.getUsersTimeStamps()
      .then(dados => res.jsonp(dados)) 
      .catch(erro => res.jsonp(erro))
  })

  router.get('/tablespaces',(req,res) =>{
    connection.getTablespaces()
      .then(dados => res.jsonp(dados)) 
      .catch(erro => res.jsonp(erro))
  })
  
  router.post('/timestamp',(req,res) =>{
    connection.getTimeStamps(req.body.table)
      .then(dados => res.jsonp(dados)) 
      .catch(erro => res.jsonp(erro))
  })

  router.get('/tablespacedata/:id/:id2',(req,res) =>{
    connection.getTablespaceData(req.params.id,req.params.id2)
      .then(dados => res.jsonp(dados)) 
      .catch(erro => res.jsonp(erro))
  })

  router.get('/lasttimestamps/:id', (req, res) => {
    connection.getLastTimestamps(req.params.id)
      .then(dados => res.jsonp(dados))
      .catch(erro => res.jsonp(erro))
  })

  router.get('/getDataFilesTablespace/:id/:id2', (req, res) => {
    connection.getDataFilesTablespace(req.params.id, req.params.id2)
      .then(dados => res.jsonp(dados))
      .catch(erro => res.jsonp(erro))
  })

  router.get('/getDataFiles',(req,res) =>{
    connection.getDataFiles()
      .then(dados => res.jsonp(dados)) 
      .catch(erro => res.jsonp(erro))
  })

  module.exports=router;    
  
