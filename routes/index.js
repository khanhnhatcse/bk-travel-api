var express = require('express');
var router = express.Router();
var db = require('../config/db_help.js');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.json({code : 1, "msg " : "Thanh cong"})
  res.json({test : "Hello world"});
});

module.exports = router;
