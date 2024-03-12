const db = require('../config/db');

//主页专业各类查询
exports.sortList=(req,res)=>{
	let {types} = req.query;
	const Sql = 'select * from sort where type=?';
	db.query(Sql,types,(err, results) => {
		//错误日志返回
	  if (err) {
	    return res.send({ code: 1, message: err.message });
	  }
	  res.send({
		code: 0,
	  data: {sort:results}
	  });
	});
};

//查询用户管理
exports.userList=(req,res)=>{
	const Sql = 'select * from user where del=0';
	db.query(Sql,(err, results) => {
		//错误日志返回
	  if (err) {
	    return res.send({ code: 1, message: err.message });
	  }
	  res.send({
		code: 0,
	    data: {user:results},
	  });
	});
};

//删除后端user
exports.deLuser = (req, res) => {
  let { id } = req.query;

  let Sql = 'update user set del=1 where id=?';
  db.query(Sql, id, (err, results) => {
    if (err) {
      return res.send({ code: 1, message: err.message });
    }
    res.send({
      code: 0,
      data: {
        message: '用户管理删除成功',
      },
    });
  });
};

//更新后端user
exports.upDuser = (req, res) => {
  let { name,pwd,head_img,id } = req.query;

  let Sql = 'update user set name=?,pwd=?,head_img=? where id=?';
  db.query(Sql, [name,pwd,head_img,id], (err, results) => {
    if (err) {
      return res.send({ code: 1, message: err.message });
    }
    res.send({
      code: 0,
      data: {
        message: '用户管理更新成功',
      },
    });
  });
};

//查询sort管理
exports.sortList2=(req,res)=>{
	const Sql = 'select * from sort where del=0';
	db.query(Sql,(err, results) => {
		//错误日志返回
	  if (err) {
	    return res.send({ code: 1, message: err.message });
	  }
	  res.send({
		code: 0,
	    data: {sort:results},
	  });
	});
};

//删除后端sort
exports.deLsort = (req, res) => {
  let { id } = req.query;

  let Sql = 'update sort set del=1 where id=?';
  db.query(Sql, id, (err, results) => {
    if (err) {
      return res.send({ code: 1, message: err.message });
    }
    res.send({
      code: 0,
      data: {
        message: '教师管理删除成功',
      },
    });
  });
};

//更新后端sort
exports.upDsort = (req, res) => {
  let { name,img,workingtime,id } = req.query;

  let Sql = 'update sort set name=?,img=?,workingtime=? where id=?';
  db.query(Sql, [name,img,workingtime,id], (err, results) => {
    if (err) {
      return res.send({ code: 1, message: err.message });
    }
    res.send({
      code: 0,
      data: {
        message: '教师管理更新成功',
      },
    });
  });
};

//添加user
exports.addUser = (req, res) => {
  let { name,pwd,himg } = req.body;

  const Sql = 'insert into user (name,pwd,head_img) value (?,?,?)';
  db.query(Sql, [name,pwd,himg], (err, results) => {
    if (err) {
      return res.send({ code: 1, message: err.message });
    }
    res.send({
      code: 0,
      data: {
        message: '用户管理添加成功',
      },
    });
  });
};

//添加sort
exports.addSort = (req, res) => {
  let { name,img,workingtime,type } = req.body;

  const Sql = 'insert into sort (name,img,workingtime,type) value (?,?,?,?)';
  db.query(Sql, [name,img,workingtime,type], (err, results) => {
    if (err) {
      return res.send({ code: 1, message: err.message });
    }
    res.send({
      code: 0,
      data: {
        message: 'sort管理添加成功',
      },
    });
  });
};
