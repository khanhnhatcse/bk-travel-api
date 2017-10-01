var db = require('../config/db_help.js');
var error_code = require('../config/error_code.js');
var constant = require('../config/constant.js');
var moment = require('moment');

exports.search = function(req, res) {
  var keyword = req.body.keyword;

  var query = 
   "SELECT * from "+
          "("+
          "    select 3 loai,ID id, name FROM `plan`"+
              
          "    UNION ALL "+
              
          "    select 2 loai,ID id, full_name from user"+
              
          "    UNION ALL"+
              
          "    SELECT 1 loai,ID id, name from province "+
              
          ") A where A.name like N";
  query += db.escape('%'+keyword+'%');
  console.log("query " + query);
  db.query(query, function(err, result) {
    if(err) res.json({code:error_code.SQL_INVALID, msg : "Loi SQL" + err, data : []});
    else res.json({code:error_code.SUCCESS, msg : "Tim thay", data : result});
  });
}


exports.get_comments = function(req, res) {
  var status_id = req.query.status_id;
  console.log("VOooo" + status_id);
  var query = " SELECT u.ID userId, u.USERNAME username, c.CONTENT content, DATE_FORMAT(c.CREATE_AT, '%m/%d/%Y %H:%i:%s') createAt  FROM comment c INNER JOIN user u on c.USER_ID = u.ID WHERE c.STATUS_ID = ? ORDER BY c.CREATE_AT";
  db.query(query, [status_id], function(err, result, field ) {
    if(!err) {
      console.log(result);
      res.json({code:error_code.SUCCESS, msg : "Nhan du lieu" ,data : result});
    }else{
      console.log(err);
      res.json({code:error_code.ERROR, msg : "Loi du lieu" ,data : []});
    }
  });
}

exports.get_all_newfeed = function(req, res) {
  var user_id = req.query.user_id;
  var next = req.query.next;
  var num = req.query.size;
  if(typeof next === 'undefined')
    next = 0;
  if(typeof num === 'undefined')
    num = 100;
  console.log(req.query);
  // var query = "select u.USERNAME user , s.ID id, s.CONTENT content, DATE_FORMAT(s.CREATE_AT, '%m/%d/%Y %H:%i:%s') createAt, DATE_FORMAT(s.UPDATE_AT, '%m/%d/%Y %H:%i:%s') updateAt, "+
  //             "GROUP_CONCAT( p.LINK  SEPARATOR ',') path, COUNT(p.LINK) count,l.DEM likes, co.DEM comments from status s inner join status_album s_a on s_a.STATUS_ID = s.ID "+
  //             "inner join album_photo a on a.ID = s_a.ALBUM_ID LEFT JOIN ( SELECT SUM(STATUS) DEM, STATUS_ID ID from test.like group by STATUS_ID ) l on l.ID = s.ID  LEFT JOIN (SELECT COUNT(*) DEM, STATUS_ID ID from comment GROUP BY STATUS_ID) co on co.ID = s.ID inner join photo p on p.ALBUM_ID = a.ID inner join user u on u.ID = s.USER_ID "+
  //             "group by u.USERNAME ,s.ID, s.CONTENT, s.CREATE_AT, s.UPDATE_AT LIMIT " + next + ", " + num;
  var query = " SELECT * FROM ( select 1 type, u.USERNAME user , s.ID id, s.CONTENT content, DATE_FORMAT(s.CREATE_AT, '%m/%d/%Y %H:%i:%s') createAt, DATE_FORMAT(s.UPDATE_AT, '%m/%d/%Y %H:%i:%s') updateAt, GROUP_CONCAT( p.LINK SEPARATOR ',') path, COUNT(p.LINK) count,l.DEM likes, co.DEM comments,l.userId userLike, co.userId userComment from status s inner join status_album s_a on s_a.STATUS_ID = s.ID inner join album_photo a on a.ID = s_a.ALBUM_ID LEFT JOIN ( SELECT SUM(STATUS) DEM,GROUP_CONCAT(USER_ID SEPARATOR ',') userId, STATUS_ID ID from test.like group by STATUS_ID ) l on l.ID = s.ID LEFT JOIN (SELECT COUNT(*) DEM,GROUP_CONCAT(USER_ID SEPARATOR ',') userId, STATUS_ID ID from comment GROUP BY STATUS_ID) co on co.ID = s.ID inner join photo p on p.ALBUM_ID = a.ID inner join user u on u.ID = s.USER_ID group by u.USERNAME ,s.ID, s.CONTENT, s.CREATE_AT, s.UPDATE_AT "+
  
              " UNION ALL "+ 
              " select 2 type, u.USERNAME user , s.ID id, s.CONTENT content, DATE_FORMAT(s.CREATE_AT, '%m/%d/%Y %H:%i:%s') createAt, DATE_FORMAT(s.UPDATE_AT, '%m/%d/%Y %H:%i:%s') updateAt, '' path, 1 count,l.DEM likes, co.DEM comments, l.userId userLike, co.userId userComment from status s inner join status_tour s_a on s_a.STATUS_ID = s.ID inner join tour "+
              " t on t.ID = s_a.TOUR_ID LEFT JOIN ( SELECT SUM(STATUS) DEM,GROUP_CONCAT(USER_ID SEPARATOR ',') userId, STATUS_ID ID from test.like group by STATUS_ID ) l on l.ID = s.ID LEFT JOIN (SELECT COUNT(*) DEM,GROUP_CONCAT(USER_ID SEPARATOR ',') userId, STATUS_ID ID from comment GROUP BY STATUS_ID) co on co.ID = s.ID inner join user u on u.ID = s.USER_ID ) A ORDER BY createAt DESC LIMIT " + next + ", " + num;
  console.log(query);
  db.query(query, function(err, result, field) {
    if(err) res.json({code : error_code.ERROR, msg : "Loi Cau query " + query});

    else {
      var list = [];
      for(i = 0; i < result.length; i++){
        // var query = "SELECT distinct u.USERNAME username, u.ID userId FROM test.like l INNER JOIN user u on l.USER_ID = u.ID where l.STATUS_ID = ?";
        // var list_user_like = [];
        // db.query(query, result[i].id, function(err, r, field) {
        //   if(err) {
        //     res.json({code : error_code.ERROR, msg : "Loi Cau query " + query});
        //   }
        //   else{
        //     console.log("nhat " + r);
        //     for(j = 0; j < r.length; j++){
        //       console.log(r[j]);

        //       list_user_like.push(r[j]);
        //     }
        //   }
        // });
        var likes = result[i].userLike?result[i].userLike.split(","):[];
        var comments = result[i].userComment?result[i].userComment.split(","):[];
        var path = result[i].path;
        path = path.split(",");
        var item = {
          type : result[i].type,
          id : result[i].id,
          user: result[i].user,
          content : result[i].content,
          createAt : result[i].createAt,
          updateAt : result[i].updateAt,
          images : {
            size : result[i].count,
            path : path
          },
          province : "",
          like : {
            size : result[i].likes?result[i].likes : 0,
            user : likes
          },
          comment : {
            size : result[i].comments?result[i].comments : 0,
            content : comments
          },
          rating : 0
        }
        list.push(item);
      }

      res.json({ code:error_code.SUCCESS, data : list, msg : "Lay danh sach bai dang "
      });
    }
  })
}

function insert_status(data, db){
  console.log(data);
  var type = data.type;
  db.beginTransaction(function(err){
    if(err)  {
      db.rollback(function() {
        console.log("err" + err);
        return false;
      });
    }
    var query = "INSERT INTO `status`( `CONTENT`, `PUBLIC`, `USER_ID`) VALUES (?,?,?)";
      db.query(query, [data.content,'0', data.userId], function(err, result) {

        if(err) {
          db.rollback(function() {
            console.log("err" + err);
            return false;
          });
        }

        console.log("So dong insert " + result.affectedRows)
        var status_id = result.insertId;
        var datetime = new Date();

        if(type == constant.SHARE_IMAGE) {

          query = "INSERT INTO `album_photo`(`NAME`) VALUES (?)";
          db.query(query, ['Album '  + datetime ], function(err, result) {
              if(err){
                db.rollback(function() {
                  console.log("err" + err);
                  return false;
                });
              }
              console.log("So dong insert " + result.affectedRows)

    
              var album_id = result.insertId;
              var count = data.images.size;
              for(i = 0; i < count; i++)
              {
                  query = "UPDATE `photo` SET `ALBUM_ID`=? WHERE `ID`=? ";
                  db.query(query, [album_id, data.images.Id[i]], function(err, result){
                    if(err){
                      db.rollback(function() {
                        console.log("err" + err);
                        return false;
                      });
                    }

                  })
              }

              query = "INSERT INTO `status_album`(`STATUS_ID`, `ALBUM_ID`, `COUNT`) VALUES (?,?,?)";
              db.query(query, [status_id, album_id, count], function(err, result) {
                  if(err){
                    db.rollback(function() {
                      console.log("err" + err);
                      return false;
                    });
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

              });

          });
        } else {
          query = "INSERT INTO `status_tour`(`STATUS_ID`, `TOUR_ID`) VALUES (?,?)";
          db.query(query, [status_id, data.tour.id], function(err, result){
            if(err){
              db.rollback(function() {
                console.log("err" + err);
                return false;
              });
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
          })
        }
      });
  });
  return true;
}


exports.add_newfeed = function(req, res){
  var data = req.body;
  var test = insert_status(data, db);
  if(!test){
    res.json({ code : error_code.ERROR, msg : "Loi Trong Luc Insert"});
  }else{
    res.json({code : error_code.SUCCESS, msg : "Thanh Cong"});
  }
}
