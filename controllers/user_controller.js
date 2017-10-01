var db = require('../config/db_help.js');
var randtoken = require('rand-token');
var error_code = require('../config/error_code.js');
var nodemailer = require('nodemailer');
var config = require('../config/config');
exports.login = function(req, res) {
  var username = req.body.username;
  var password = req.body.password;
  db.query('select * from user where username = ? and password = ? ' , [username, password], function(err, result){

    console.log("leng " + result.length);
    if(err) res.json({code: error_code.SQL_INVALID, msg : "Cau SQL nay khong hop le"});

    else if(parseInt(result.length) === 0)
    {
      console.log("Vao day");
      res.json({code: error_code.FAIL, msg : "Khong ton tai nguoi dung nay"});
    }
    else {

      var token = randtoken.generate(16);
      var query = " update user set TOKEN = ? where ID = ?";
      var userId = result[0].ID;
      db.query(query, [token, userId], function(err, result) {
          if(err) res.json({code: error_code.SQL_INVALID, msg : "Cau SQL nay khong hop le"});
          else res.json({ code : error_code.SUCCESS, msg : "Them token thanh cong" , token : token, userId : userId});
      });
    }
  });
};

exports.resgister = function(req, res) {
  var username = req.body.username;
  var password = req.body.password;
  var email = req.body.email;
  var fullname = req.body.fullname;
  console.log(req.body);

  var query = " SELECT count(*) dem FROM user where  `EMAIL` = ? ";
  var query1 = " SELECT count(*) dem FROM user where `USERNAME` = ?";
  db.query(query, [email] , function(err, result){
    if(err) res.json({code: error_code.SQL_INVALID, msg : "Cau SQL nay khong hop le " + query});
    else{
      if(result[0].dem == 0){
        db.query(query1, [username], function(err, result){
          if(err) res.json({code: error_code.SQL_INVALID, msg : "Cau SQL nay khong hop le " + query1});
          else{
            if(result[0].dem == 0){
              var token = randtoken.generate(16);
              query = "INSERT INTO `user`(`USERNAME`, `FULL_NAME`, `PASSWORD` ,`EMAIL`, `TOKEN`) VALUES (?, ? ,?, ?, ?)";
              db.query(query, [username,fullname, password,email, token], function(err, result){

                if (err) {
                  res.json({code: error_code.SQL_INVALID, msg : "Cau SQL nay khong hop le" + err});
                }
                else if(result.affectedRows == 0){
                  res.json({code: error_code.FAIL, msg : "Nguoi dung nay da ton tai"});
                }
                else {

                  res.json({ code : error_code.SUCCESS, msg : "Dang ki thanh cong", token : token, userId : result.insertId});
                }
              });
            }
            else{
              res.json({code: error_code.DUPLICATE_USERNAME, msg : "Email Nguoi dung nay da ton tai"});
            }
          }
        });
      }else {
        res.json({code: error_code.DUPLICATE_EMAIL, msg : "Email Nguoi dung nay da ton tai"});
      }
    }
  });


};

exports.forget_password = function(req, res){
  var mail = req.body.email;
  // create reusable transporter object using the default SMTP transport
  var transporter = nodemailer.createTransport('smtps://knhat2014%40gmail.com:khanhnhat2015@smtp.gmail.com');
  var query = "SELECT TOKEN ID FROM user WHERE `EMAIL` = ?";

  db.query(query, [mail], function(err, result) {
    if(err) res.json({ code : error_code.SQL_INVALID, msg : "Send mail that bai"});
    else {
      if(result.length == 0){
        res.json({ code : error_code.ERROR_EMAIL, msg : "Dia chi Email khong dung"});

      }else{
        // setup e-mail data with unicode symbols
        var host= config.HOST + "/users/forget/" +result[0].ID;
        var mailOptions = {
            from: '"BK Travel ?" <bktravel@gmail.com>', // sender address
            to: mail , // list of receivers
            subject: 'Forget password ✔', // Subject line
            text: 'Forget password', // plaintext body
            html: '<b>Please click on the link below to recover your password</b> <br/> '
                  + '<a href="'+host+'" >GET PASSWORD NOW</a> '// html body
        };

        // send mail with defined transport object
        transporter.sendMail(mailOptions, function(error, info){
            if(error){
               res.json({ code : error_code.ERROR, msg : "Send mail that bai"});
            }else{
              res.json({ code : error_code.SUCCESS, msg : "Send mail thanh cong " + info.response});
            }
        });
      }
    }
  });

}

exports.forget_now = function(req, res){
  var pass = req.body.inputPassword;
  var userId = req.body.id;
  console.log(req.body);
  var query = "UPDATE user set `PASSWORD` = ? WHERE `TOKEN` = ?";
  db.query(query, [pass, userId], function(err, result) {
    if(err) res.render('error' , {message : "Update password fail"});
    else res.render('error', {message : "Update password SUCCESS"});
  });

}

exports.forget = function(req, res){
  var userId = req.params.id;
  console.log("id la " + req.params.id);
  res.render('forget', {userId:userId});
}

exports.logout = function(req, res){
  var userId = req.param.Id;
  var query = " update user set TOKEN = ? where ID = ?";
  db.query(query, [null, userId], function(err, result) {
      if(err) res.json({code: error_code.SQL_INVALID, msg : "Cau SQL nay khong hop le"});
      else res.json({ code : error_code.SUCCESS, msg : "Set token thanh cong"});
  });
}
