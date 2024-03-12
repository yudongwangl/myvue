const express = require('express')
const app = express()

const bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

const cors = require('cors')
app.use(cors())

const userRouter = require('./router/user');
app.use('/user', userRouter);



app.listen(3000,()=>{
	console.log('服务启动在http://127.0.0.1:3000')
})