const db = require('../config/db');
//查询用户管理
exports.informationList=(req,res)=>{
	const Sql = 'select * from information where del=0';
	db.query(Sql,(err, results) => {
		//错误日志返回
	  if (err) {
	    return res.send({ code: 1, message: err.message });
	  }
	  res.send({
		code: 0,
	    data: {information:results},
	  });
	});
};

//添加information
exports.addinFormation = (req, res) => {
  let { name,age,gender,subject,price,location,experience,qualification } = req.body;

  const Sql = 'insert into information (name,age,gender,subject,price,location,experience,qualification) value (?,?,?,?,?,?,?,?)';
  db.query(Sql, [name,age,gender,subject,price,location,experience,qualification], (err, results) => {
    if (err) {
      return res.send({ code: 1, message: err.message });
    }
    res.send({
      code: 0,
      data: {
        message: 'information添加成功',
      },
    });
  });
};

//删除后端information
exports.deLinformation = (req, res) => {
  let { id } = req.query;

  let Sql = 'update information set del=1 where id=?';
  db.query(Sql, id, (err, results) => {
    if (err) {
      return res.send({ code: 1, message: err.message });
    }
    res.send({
      code: 0,
      data: {
        message: 'information删除成功',
      },
    });
  });
};

//更新后端information
exports.upDinformation = (req, res) => {
  let { name,age,gender,subject,price,location,experience,qualification,id } = req.query;

  let Sql = 'update information set name=?,age=?,gender=?,subject=?,price=?,location=?,experience=?,qualification=? where id=?';
  db.query(Sql, [name,age,gender,subject,price,location,experience,qualification,id], (err, results) => {
    if (err) {
      return res.send({ code: 1, message: err.message });
    }
    res.send({
      code: 0,
      data: {
        message: 'information更新成功',
      },
    });
  });
};