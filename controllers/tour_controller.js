var db = require('../config/db_help.js');
var error_code = require('../config/error_code.js');
var constant = require('../config/constant');
var moment = require('moment');



exports.gets = function(req, res)  {
    var query = "SELECT `ID` id , `NAME` name, `NOTE` note, DATE_FORMAT(`START_DATE`, '%m/%d/%Y %H:%i:%s') startDate, `STATUS`status FROM `tour` WHERE 1";
    db.query(query, function(err, result, field) {
        if(err) res.json({code : error_code.SQL_INVALID, msg : "Loi cau SQL"});
        else {
            res.json({code : error_code.SUCCESS, msg : "Thanh cong", data : result});
        }
    });
}

exports.run = function(req, res) {
    var id = req.body.id;
    var query = "UPDATE `tour` SET `STATUS` = ? WHERE `ID` = ?";
    db.query(query, [constant.GREEN, id], function(err, result) {
        if(err) {
            console.log("vo day ne");
            res.json({code : error_code.SQL_INVALID, msg : "Sai cau sql"});
        }
        else {
            console.log("vo day ne 2");
            res.json({code : error_code.SUCCESS, msg: "Thanh cong"});
        }
    });
}

exports.tour_share = function(req, res ){
    var query = " SELECT `ID` id, `NAME` name , `NOTE` note , DATE_FORMAT(`START_DATE`, '%m/%d/%Y %H:%i:%s') startDate, `STATUS` status FROM `tour` ";
    db.query(query, function(err, result) {
        if(err) res.json({code : error_code.SQL_INVALID, msg: "Loi cau SQL"});
        else res.json({code:error_code.SUCCESS, data : result, msg:"Thanh cong"});
    });
}