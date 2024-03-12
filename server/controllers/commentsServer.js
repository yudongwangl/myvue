const db = require('../config/db');
//查询用户管理
exports.commentsList=(req,res)=>{
	const Sql = 'select * from comments where del=0';
	db.query(Sql,(err, results) => {
		//错误日志返回
	  if (err) {
	    return res.send({ code: 1, message: err.message });
	  }
	  res.send({
		code: 0,
	    data: {comments:results},
	  });
	});
};

//添加comments
exports.addComments = (req, res) => {
  let { name,comment } = req.body;

  const Sql = 'insert into comments (name,comment) value (?,?)';
  db.query(Sql, [name,comment], (err, results) => {
    if (err) {
      return res.send({ code: 1, message: err.message });
    }
    res.send({
      code: 0,
      data: {
        message: 'comments添加成功',
      },
    });
  });
};

//删除后端comments
exports.deLcomments = (req, res) => {
  let { id } = req.query;

  let Sql = 'update comments set del=1 where id=?';
  db.query(Sql, id, (err, results) => {
    if (err) {
      return res.send({ code: 1, message: err.message });
    }
    res.send({
      code: 0,
      data: {
        message: 'comments删除成功',
      },
    });
  });
};

//更新后端comments
exports.upDcomments = (req, res) => {
  let { name,comment,id } = req.query;

  let Sql = 'update comments set name=?,comment=? where id=?';
  db.query(Sql, [name,comment,id], (err, results) => {
    if (err) {
      return res.send({ code: 1, message: err.message });
    }
    res.send({
      code: 0,
      data: {
        message: 'comments更新成功',
      },
    });
  });
};