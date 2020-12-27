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


  module.exports=router;    
  
