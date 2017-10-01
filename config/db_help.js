// const DB_HOST = "localhost";
// const DB_USER = "bktravel";
// const DB_PASS = "123456";
// const DB_NAME = "test";

const DB_HOST = "mysql.bk-travel.svc";
const DB_USER = "bktravel";
const DB_PASS = "123456";
//
const DB_NAME = "test";


var HOST = 'http://192.168.1.8:3000';

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : DB_HOST,
  user     : DB_USER,
  password : DB_PASS,
  database : DB_NAME
});

connection.connect(function(err){
  if(!err) {
      console.log("Database is connected ... nn");
  } else {
      console.log("Error connecting database ... nn" + err);
  }
});


module.exports = connection
