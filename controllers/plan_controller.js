var db = require('../config/db_help.js');
var helper = require('../config/helper');
var error_code = require('../config/error_code.js');
var Log =require('../config/log');



exports.gets = function(req, res) {
  gets().then(list => {
    res.json({code : error_code.SUCCESS, data : list,  msg : "GET thanh cong"});
  }).catch(err => {
    res.json({code : error_code.ERROR, data : [],  msg : "GET that ba"});
  });
}


exports.create = function(req, res) {
  var test = insert(req.body, db);
  res.json({code : test? error_code.SUCCESS : error_code.ERROR,  msg : "INSERt du lieu"});
}


function insert(data, db) {
  var user = data.user;
  var alarm = data.alarm;
  var name = data.name;
  var note = data.note;
  var province = data.provinces;
  var schedule = data.schedule;
  var startDate = data.startDate;
  var startTime = data.startTime;
  var token = data.token;
  var id = data.id;
  console.log(province);
  db.beginTransaction(function(err){
    if(err)  {
      db.rollback(function() {
        console.log("err" + err);
        return false;
      });
    }
    else {
        var query = "INSERT INTO `plan`(`NAME`, `NOTE`, `START_DATE`, `START_TIME`, `ALARM`, `USER_ID`) VALUES (?,?,?,?,?,?)";
        db.query(query, [name, note, startDate, startTime, alarm, user.id], function(err, result) {
          if(err)  {
            db.rollback(function() {
              console.log("err" + err);
              return false;
            });
          }
          else{
            var plan_id = result.insertId;
            // var date = new Date();
            // var pattern = /(\d{2})\/(\d{2})\/(\d{4})/;
            // var dt = new Date(startDate.replace(pattern,'$3-$2-$1'));
            // var date1 = new Date(dt);
            // console.log(date1);
            // if(date1.getDate() === date.getDate() && date1.getMonth() === date.getMonth() && date1.getFullYear() === date.getFullYear() ) {
            //   query = " INSERT INTO `tour`( `NAME`, `NOTE`, `START_DATE`, `STATUS`, `PLAN_ID`) VALUES (?,?,?,?,?)";
            //   db.query(query, [item.name, item.note, date1, constant.SLIVER, item.id], function(err, result) {
            //     if(err)  {
            //       db.rollback(function() {
            //         console.log("err" + err);
            //         return false;
            //       });
            //     }
            //     else {
            //       console.log("Ghi Thanh cong");
            //     }
            //   });
            // }
            console.log(province);
            for(i = 0; i < province.length; i++) {

              let insert_province = async (index) => {
                query = "INSERT INTO `province`(`NAME`, `LONGTITUDE`, `LATITUDE`, `TOTAL_RATE`, `START_DATE`, `START_TIME`) VALUES (?,?,?,?,?,?)";
                let result = await helper.get(query, [province[i].name, 0.0, 0.0, 0,province[i].startDate,province[i].startTime]);
                return {result : result, index : index};
                // var province_id = result.insertId;
                // query = "INSERT INTO `PLAN_PROVINCE`( `PLAN_ID`, `PROVINCE_ID`) VALUES (?,?)";
                // await helper.get(query, [plan_id, province_id]);
                // console.log("province " + i);
                // console.log(province[i]);
                // for( j = 0; j < province[i].landmarks.length; j++) {
                //       var l = province[i].landmarks[j];
                //       query = "INSERT INTO `landmark`(`NAME`, `TOTAL_RATE`, `LONGTITUDE`, `LATITUDE`, `VISITED`, `PROVINCE_ID`) VALUES (?,?,?,?,?,?)";
                //       db.query(query, [l.name, l.totalRate, l.longtitude, l.latitude, l.visited, province_id], function(err, result, field) {
                //         if(err)  {
                //           db.rollback(function() {
                //             console.log("err" + err);
                //             return false;
                //           });
                //         }
                //       });
                //     }



              }

              let insert_plan_province = async (param) => {
                query = "INSERT INTO `PLAN_PROVINCE`( `PLAN_ID`, `PROVINCE_ID`) VALUES (?,?)";
                await helper.get(query, param);
              }

              let insert_landmark = async (index, province_id) => {
                for( j = 0; j < province[i].landmarks.length; j++) {
                      var l = province[index].landmarks[j];
                      query = "INSERT INTO `landmark`(`NAME`, `TOTAL_RATE`, `LONGTITUDE`, `LATITUDE`, `VISITED`, `PROVINCE_ID`) VALUES (?,?,?,?,?,?)";
                      await helper.get(query, [l.name, l.totalRate, l.longtitude, l.latitude, l.visited, province_id]);
                }
              }

              insert_province(i).then( (result) => {

                let res = result.result;
                let index = result.index;

                console.log("province " + index);
                console.log(res);
                insert_plan_province([plan_id, res.insertId]).catch((err) => {
                  db.rollback(function() {
                    console.log("err" + err);
                    return false;
                  });
                });

                insert_landmark(index, res.insertId).catch((err) => {
                  db.rollback(function() {
                    console.log("err" + err);
                    return false;
                  });
                });


              }).catch((err) => {
                db.rollback(function() {
                  console.log("err" + err);
                  return false;
                });
              });




              // console.log("i + " + i);

              // db.query(query, [province[i].name, 0.0, 0.0, 0,province[i].startDate,province[i].startTime] , function(err, result) {
              //   if(err)  {
              //     db.rollback(function() {
              //       console.log("err" + err);
              //       return false;
              //     });
              //   }else{
              //
              //
              //     console.log("province" + i);
              //     console.log(province[i]);
              //
              //     var province_id = result.insertId;
              //     query = "INSERT INTO `PLAN_PROVINCE`( `PLAN_ID`, `PROVINCE_ID`) VALUES (?,?)";
              //     db.query(query, [plan_id, province_id], function(err, r){
              //       if(err)  {
              //         db.rollback(function() {
              //           console.log("err" + err);
              //           return false;
              //         });
              //       }
              //     });
              //
              //     console.log("--------------");
              //
              //     for( j = 0; j < province[i].landmarks.length; j++) {
              //       var l = province[i].landmarks[j];
              //       query = "INSERT INTO `landmark`(`NAME`, `TOTAL_RATE`, `LONGTITUDE`, `LATITUDE`, `VISITED`, `PROVINCE_ID`) VALUES (?,?,?,?,?,?)";
              //       db.query(query, [l.name, l.totalRate, l.longtitude, l.latitude, l.visited, province_id], function(err, result, field) {
              //         if(err)  {
              //           db.rollback(function() {
              //             console.log("err" + err);
              //             return false;
              //           });
              //         }
              //       });
              //     }
              //   }
              // });
            }

            db.commit(function(err) {
              if(err){
                db.rollback(function() {
                  console.log("err" + err);
                  return false;
                });
              }
              console.log('Transaction Complete.');
              //db.end();

              return true;
            })
          }
        });
    }
  });
  return true;
}



let gets = async () => {
  var query = "SELECT * FROM `plan` ORDER BY START_DATE DESC, START_TIME DESC";
  var list = [];
  let data = await helper.get(query, []);
  for(i = 0; i < data.length; i++) {
    item = data[i];
    Log.d("PLAN " , item);
    query = " SELECT p.ID id, p.NAME name, p.LONGTITUDE longtitude, p.LATITUDE latitude, p.TOTAL_RATE totalRate, p.START_DATE startDate, p.START_TIME startTime  FROM `province` p INNER JOIN PLAN_PROVINCE pp on p.ID = pp.PROVINCE_ID WHERE pp.PLAN_ID = ? ";
    let province = await helper.get(query, [item.ID]);
    Log.d("PROVINCE " , province);
    for(j = 0; j < province.length; j ++) {
      var p = province[j];
      query = " SELECT `ID` id, `NAME` name, `TOTAL_RATE` totalRate, `LONGTITUDE` longtitude, `LATITUDE` latitude, `VISITED` visited FROM `landmark` Where `PROVINCE_ID` = ?";
      let landmark = await helper.get(query, [p.id]);
      province[j].landmarks =  landmark;
    }
    var ele = {
      id : item.ID,
      user : {
        username : "",
        userId : item.USER_ID
      },
      alarm : item.ALARM?(item.ALARM == 1 ? true : false) : false,
      name : item.NAME,
      note : item.NOTE,
      startDate : item.START_DATE,
      startTime : item.START_TIME,
      provinces : province

    }
    Log.d("ELE", ele);
    list.push(ele);
  }

  //Log.d("LIST", list);
  return list;
}
