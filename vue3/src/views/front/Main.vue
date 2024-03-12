<template>
	<div class="boye">
  <el-carousel :interval="3000" type="card" height="400px">
    <el-carousel-item v-for="item in carouseli.img" :key="item.id">
		<img :src="item.idimg" style="object-fit: scale-down; width: 100%; height: 100%;">
    </el-carousel-item>
  </el-carousel>
  
   <div class="boye2">
	  <h1 style="padding: 25px 0; font-size: 43px;">互动1对1定制辅导专属个性化测评</h1>
	  <h2>针对孩子做个性化智能测评制定1对1专属辅导计划</h2>
   </div>
   
   <div class="boye3">
	   <el-space wrap style="margin-top: 1%;">
	        <el-card v-for="item in imgListto.imglist" :key="item.id" class="box-card" style="width: 350px; height: 350px;">
	             <template #header>
	               <div class="card-header">
	                 <el-image style="width: 300px; height: 200px" :src="item.idView" />
					 <h2>{{item.idtext}}</h2>
					 <h3>{{item.idtext2}}</h3>
	               </div>
	             </template>
	           </el-card>
		  </el-space>
   </div>
  
		<div class="boye4">
			  <div class="boye4-img"></div>
			  <div class="boye4-zi">
				  <ul>
					  <h1>科技驱动，助力教育变革</h1>
					  <li>微软MSMarco机器阅读理解排行榜，荣获全球第一。</li>
					  <li>斯坦福问答数据集水平测试，荣获全球第一。成为 AI 实力获“互联网女皇”赞许的在线教育公司。</li>
					  <li>辅导AI研究院，向业界开源共享超过五项自主研发技术。</li>
				  </ul>
			  </div>
		</div>
   
  </div>
  
</template>

<script setup>
import { onMounted,reactive } from 'vue'
import request from '@/utils/request';

/**
 * 获取图片信息
 */
const carouseli = reactive({
  img: [
  	  {id:0,idimg:require("../static/boye3-1.png")},
  	  {id:1,idimg:require("../static/boye3-2.png")},
  	  {id:2,idimg:require("../static/boye3-3.png")},
  	  {id:3,idimg:require("../static/boye3-4.png")},
  	  {id:4,idimg:require("../static/boye3-5.png")},
  	  {id:5,idimg:require("../static/boye3-6.png")}
  ], 
});

/**
 * 获取六图片信息
 */
const imgListto = reactive({
  imglist: [
	  {id:0,idView:require("../static/boye3-1.png"),idtext:"广纳全国名校精英",idtext2:"中高考佼佼者精通学习技巧"},
	  {id:1,idView:require("../static/boye3-2.png"),idtext:"一对一定制学习方案",idtext2:"因材施教1位学生1套专属学习方法"},
	  {id:2,idView:require("../static/boye3-3.png"),idtext:"方便快捷预约体验",idtext2:"随时随地想学就学时间地点随你定"},
	  {id:3,idView:require("../static/boye3-4.png"),idtext:"家长随时自由旁听",idtext2:"全面跟踪孩子学习进度随时了解学习情况"},
	  {id:4,idView:require("../static/boye3-5.png"),idtext:"辅导过程精彩回播",idtext2:"学习内容时刻记录回顾课堂重点知识"},
	  {id:5,idView:require("../static/boye3-6.png"),idtext:"海量千万级学习题库",idtext2:"分难度梯度式练习题巩固基础提升解题技巧"}
  ],
});

</script>

<style scoped>
.el-carousel__item h3 {
  color: #f6f6f6;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
  text-align: center;
}

.el-carousel__item:nth-child(2n) {
  background-color: #f9f9f9;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #fcfcfc;
}
.boye{
	/* height: 1330px; */
	background-color: #ffffff;
}
.boye2{
	height: 200px;
	background-color: #f4f4f4;
	
	}
.boye2 h1,h2{
	text-align: center;
}
.boye3{
	width: 1080px;
	margin-left: 18%;
	}
.boye3 span{
	width: 300px;
	height: 200px;
}
.boye4{
	height: 400px;
	background-color: #e2ecf6;
	}
.boye4 .boye4-img{
	background-image: url(../static/20230917141334.jpg);
	background-position: center;
	background-size: cover;
	width: 545px;
	height: 300px;
	float: left;
	margin-left: 14%;
	margin-top: 3%;
}
.boye4 .boye4-zi{
	float: left;
	margin-top: 3%;
	margin-left: 32px;
}
.boye4 .boye4-zi ul li{
	line-height: 68px;
	font-family: 'Courier New', Courier, monospace;
	font-size: 18px;
}
</style>