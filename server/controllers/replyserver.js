const db = require('../config/db');

//过滤消息
exports.replyList = (req, res) => {
	let { id } = req.query;
	const Sql = 'SELECT * FROM user JOIN sort ON user.id = sort.id JOIN reply ON sort.id = reply.uid WHERE user.id = ?';
	db.query(Sql,id, (err, results) => {
	  // 错误日志返回
	  if (err) {
		return res.send({ code: 1, message: err.message });
	  }
		res.send({
			  code: 0,
			  reply: results,
			});
		  });
};
//获取消息头像
exports.resoList = (req, res) => {
	let { id } = req.query;
	const Sql = 'select * from sort where id=?';
	db.query(Sql, id, (err, results) => {
	  // 错误日志返回
	  if (err) {
		return res.send({ code: 1, message: err.message });
	  }
	  const  tname= results[0].name;
	  const  timg= results[0].img;
	  const  tid= results[0].id;
		res.send({
			  code: 0,
			  name: tname,
			  img: timg,
			  tid: tid
			});
		  });
};
//消息操作
exports.addsort = (req, res) => {
	const Sql = 'select * from sort';
	db.query(Sql, (err, results) => {
	  // 错误日志返回
	  if (err) {
		return res.send({ code: 1, message: err.message });
	  }
		res.send({
			  code: 0,
			  data: results
			});
		  });
};
//分析有谁
exports.reList = (req, res) => {
	let { tid } = req.query;
	const Sql = 'select * from reply where tid=?';
	db.query(Sql, tid, (err, results) => {
	  // 错误日志返回
	  if (err) {
		return res.send({ code: 1, message: err.message });
	  }
		res.send({
			  code: 0,
			  data: results,
			});
		  });
};
//获取具体消息
exports.retwoList = (req, res) => {
	let { pid } = req.query;
	const Sql = 'select * from reply where pass=0 and tid=?';
	db.query(Sql, pid, (err, results) => {
	  // 错误日志返回
	  if (err) {
		return res.send({ code: 1, message: err.message });
	  }
		res.send({
			  code: 0,
			  data: results,
			});
		  });
};
//添加
exports.addreply = (req, res) => {
	let { uid,data,date,tid,uimg,timg } = req.body;

	const Sql = 'insert into reply (uid,data,date,tid,uimg,timg) value (?,?,?,?,?,?)';
	db.query(Sql, [uid,data,date,tid,uimg,timg], (err, results) => {
	  if (err) {
		return res.send({ code: 1, message: err.message });
	  }
	  res.send({
		code: 0,
		data: {
		  message: '添加成功',
		},
	  });
	});
  };

  //教师模块
exports.uidList = (req, res) => {
	let { id } = req.query;
	const Sql = 'select * from reply where tid=?';
	db.query(Sql,id, (err, results) => {
	  // 错误日志返回
	  if (err) {
		return res.send({ code: 1, message: err.message });
	  }
		res.send({
			  code: 0,
			  reply: results,
			});
		  });
};
//获取消息头像
exports.reusList = (req, res) => {
	let { id } = req.query;
	const Sql = 'select * from user where id=?';
	db.query(Sql, id, (err, results) => {
	  // 错误日志返回
	  if (err) {
		return res.send({ code: 1, message: err.message });
	  }
	  const  uname= results[0].name;
	  const  uimg= results[0].head_img;
	  const  uid= results[0].id;
		res.send({
			  code: 0,
			  name: uname,
			  img: uimg,
			  uid: uid
			});
		  });
};
//获取具体消息
exports.pausList = (req, res) => {
	let { pid } = req.query;
	const Sql = 'select * from reply where pass=0 and uid=?';
	db.query(Sql, pid, (err, results) => {
	  // 错误日志返回
	  if (err) {
		return res.send({ code: 1, message: err.message });
	  }
		res.send({
			  code: 0,
			  data: results,
			});
		  });
};