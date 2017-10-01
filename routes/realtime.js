var socket_io = require('socket.io');
var path = require('path');
var db = require('../config/db_help.js');
let helper = require('../config/helper.js');
var schedule = require('node-schedule');
var constant = require('../config/constant');
var error_code = require('../config/error_code');
var io = socket_io();
var fs = require("fs");
var io = socket_io();
var socketApi = {};
socketApi.io = io;
var size_image = "";
// const HOST = "http://192.168.100.52:3000";
const HOST = "http://192.168.43.236:3000";

var path = path.join(__dirname, '..');
path = path + '/public/images/uploads/';

var arrayImage = new Array();
var arraySound = new Array();

fs.readdir( path, function(err, files) {
    if (err) {
        return;
    }
    files.forEach(function(f) {
       arrayImage.push(path + f);
    });
});

fs.readdir("sounds/", function(err, files) {
    if (err) {
        return;
    }
    files.forEach(function(f) {
       arraySound.push("sounds/"+f);
    });
});
//

/*
Plan 9/10 10/10 -> Tour 9/10
*/


schedule.scheduleJob({ hour: 1, minute: 0 }, function(){
  var date = new Date();
  console.log("Vao dinh thoi");
  var query = " SELECT `ID` id, `NAME` name, `NOTE` note,  `START_DATE` startDate, `START_TIME` startTime, `ALARM` alarm FROM `plan` ";
  db.query(query, function(err, result, field) {
    if(!err) {
      console.log("vao day");
      result.forEach(function(item, index) {
        console.log(item);
        var pattern = /(\d{2})\/(\d{2})\/(\d{4})/;
        var dt = new Date(item.startDate.replace(pattern,'$3-$2-$1'));
        var date1 = new Date(dt);
        console.log(date1);
        if(date1.getDate() === date.getDate() && date1.getMonth() === date.getMonth() && date1.getFullYear() === date.getFullYear() ) {
          query = " INSERT INTO `tour`( `NAME`, `NOTE`, `START_DATE`, `STATUS`, `PLAN_ID`) VALUES (?,?,?,?,?)";
          db.query(query, [item.name, item.note, date1, constant.SLIVER, item.id], function(err, result) {
            if(err) console.log("Loi" + err);
            else {
              console.log("Ghi Thanh cong");

            }
          });
        }
      });
    }else{
      console.log(err);
    }
  });
});

io.on('connection', function (socket) {

  console.log("NOTICE: NEW USER CONNECTED!" + socket.id);
  socket.on("CLIENT_SEND_SIZE_IMAGE", function(size){
    console.log("SIZE IMAGE" + size);
      if(0 === parseInt(size)){
          io.sockets.emit("SERVER_SEND_POST", {msg : "POST DI"});
          console.log("POST BAI" );

      }
  });

  schedule.scheduleJob({ minute: 17 }, function(){
    var date = new Date();
    var query = " SELECT `ID` id, `NAME` name, `NOTE` name,  `START_DATE` startDate, `START_TIME` startTime, `ALARM` alarm FROM `plan` ";
    db.query(query, function(err, result, field) {
      if(!err) {
        result.forEach(function(item, index) {
          var date1 = new Date(item.startDate);
          if(date1.getDate() === date.getDate() && date1.getMonth() === date.getMonth() && date1.getFullYear() === date.getFullYear() ) {
            query = " INSERT INTO `tour`( `NAME`, `NOTE`, `START_DATE`, `STATUS`) VALUES (?,?,?,?)";
            db.query(query, [item.name, item.note, item.startDate, 0], function(err, result) {
              if(err) console.log("Loi");
              else console.log("Ghi Thanh cong");
            });
          }
        });
      }
    });
  });

  socket.on("CLIENT_SEND_FOLLOW", function(result) {
    var userId = result.userid;
    var followId = result.followId;
    var status = result.status;
    console.log(result);
    var query = "";
    if(status == true)
        query = " INSERT INTO `user_follow`(`USER_ID`, `USER_FOLLOW`) VALUES (?,?) ";
    else 
        query = " DELETE FROM `user_follow` WHERE `USER_ID` = ? AND `USER_FOLLOW` = ? ";
    db.query(query, [userId, followId], function(err,result) {
      if(err) socket.emit("SERVER_SEND_FOLLOW", {result : error_code.ERROR , following : 0, followed : 0});
      else {
        io.sockets.emit("SERVER_SEND_FOLLOW", {result : error_code.SUCCESS, following : 1, followed : 2});
      }
    });

  });

  socket.on("CLIENT_SEND_LIKE", function(result) {
    var userId = result.userid;
    var status_id = result.newfeed_id;
    var status = result.status;
    console.log(result);

    if(status == true) {

      var query = "INSERT INTO `like`(`USER_ID`, `STATUS_ID`, `STATUS`) VALUES (?, ?, ?)";
        db.query(query, [userId, status_id, 1], function(err, result) {
        if(err)console.log("That bai");
        else{
          console.log("1 like :)))))");
          query = "SELECT count(*) count FROM `like` WHERE  `STATUS_ID` = ? ";
          db.query(query, [status_id], function(err, result) {
            if(err)console.log("That bai");
            else {
              io.sockets.emit('SERVER_SEND_LIKE', {newfeed_id : status_id, status : result[0].count} );
            }
          });
          
        }
      });
    }else {
      var query = "DELETE FROM `like` WHERE `USER_ID`= ? AND  `STATUS_ID` = ?";
        db.query(query, [userId, status_id], function(err, result) {
        if(err)console.log("That bai");
        else{
          console.log("1 like :)))))");
          query = "SELECT count(*) count FROM `like` WHERE  `STATUS_ID` = ? ";
          db.query(query, [status_id], function(err, result) {
            if(err)console.log("That bai");
            else {
              io.sockets.emit('SERVER_SEND_LIKE', {newfeed_id : status_id, status : result[0].count} );
            }
          });
          
        }
      });
    }

     
  });


  // Binh luan nguoi dung
  socket.on('CLIENT_SEND_COMMENT', function(data) {
    console.log(data);
    var query = "INSERT INTO `comment`( `USER_ID`, `STATUS_ID`, `CONTENT`) VALUES (?,?,?)";
    db.query(query, [data.user_id, data.status_id, data.comment], function(err, result, field) {
      if(err) console.log("That bai");
      else if(result){
        console.log("Thanh cong");
        query = " SELECT u.ID userId, u.USERNAME username, c.CONTENT content, DATE_FORMAT(c.CREATE_AT, '%m/%d/%Y %H:%i:%s') createAt FROM comment c INNER JOIN user u on c.USER_ID = u.ID WHERE c.STATUS_ID = ? ORDER BY c.CREATE_AT";
        db.query(query, [data.status_id], function(err, result, field ) {
          if(!err) {
            console.log(result);
            io.sockets.emit('SERVER_SEND_COMMENT', {data : result});
          }
        });

      }else{
        console.log("That bai 1");
      }
    });
  });

  //


  socket.on('CLIENT_SEND_IMAGE', function (data) {
        console.log("SERVER SAVED A NEW IMAGE");
        var filename = getFilenameImage(socket.id);
        arrayImage.push(filename);
        var query = "INSERT INTO photo(NAME, LINK) VALUES(?,?)";
        db.query(query, [filename,  HOST + "/images/uploads/" + filename], function(err, result, field) {
            if(err) console.log("That bai");
            if(result){
              console.log("Thanh cong");
              io.sockets.emit('SERVER_SEND_IMAGE', {id : result.insertId});
            }else{
              console.log("That bai");
            }

        });
        fs.writeFile( path + filename, data);
  });
  socket.on('CLIENT_SEND_SOUND', function (data) {
              console.log("SERVER SAVED NEW SOUND");
              var filename = getFilenameSound(socket.id);
              arraySound.push(filename);
              fs.writeFile(filename, data);
    });

  socket.on('CLIENT_SEND_REQUEST', function(data){
        var filename = getRandomFile(arrayImage);
        fs.readFile(filename, function(err, data){
            if(!err){
                io.sockets.emit('SERVER_SEND_IMAGE', data);
                console.log("SEND TO CLIENT A FILE: "+filename);
            }else{
                console.log('THAT BAI: ' + filename);
            }
        });
  });

  socket.on('CLIENT_SEND_REQUEST_SOUND', function(data){
          var filename = getRandomFile(arraySound);
          fs.readFile(filename, function(err, data){
                      if(!err){
                          io.sockets.emit('SERVER_SEND_SOUND', data);
                          console.log("SEND TO CLIENT A FILE: "+filename);
                      }else{
                          console.log('THAT BAI: ' + filename);
                      }
                  });
    });



});
function getFilenameImage(id){
    return id.substring(2) + getMilis() + ".png";
}

function getFilenameSound(id){
    return __dirname + "/uploads/" + id.substring(2) + getMilis() + ".3gpp";
}

function getMilis(){
    var date = new Date();
    var milis = date.getTime();
    return milis;
}

function getRandomFile(array){
    return array[Math.floor(Math.random()*array.length)];
}

module.exports = socketApi;
