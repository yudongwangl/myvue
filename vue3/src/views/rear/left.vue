<template>
  <div class="hea">
	<div class="imgo"></div>
	<div class="phome">家教信息服务平台</div>
	<el-button type="primary" round class="heabut" @click="quit">注销</el-button>
  </div>
  <el-tabs :tab-position="tabPosition" stripe >
  	    <el-tab-pane label="用户管理" @click="toGox">
			<leftuser :leftuserdata="leftuserdata" @delete="handleDelete" @updateUser="getLeftusers" />
			
  		</el-tab-pane>
  	    <el-tab-pane label="教师管理" @click="toGox2">
  			<leftsort :leftsortdata="leftsortdata" @delete2="handleDelete2" @updateSort="getLeftsorts" />
  		</el-tab-pane>
  	    <el-tab-pane label="评论管理" @click="toGox3">
			<comment :leftcommentdata="leftcommentdata" @delete3="handleDelete3" @updatecom="getLeftcomment" />
		</el-tab-pane>
  	    <el-tab-pane label="信息管理" @click="toGox4">
			<inforion :leftinforiondata="leftinforiondata" @delete4="handleDelete4" @updateinf="getLeftinforions" />
		</el-tab-pane>
  		<el-tab-pane label="系统管理" >
			<syslist />
		</el-tab-pane>
  		<el-tab-pane label="服务管理" >Task</el-tab-pane>
  		<el-tab-pane label="反馈管理" >Task</el-tab-pane>
  		<el-tab-pane label="测试管理" >Task</el-tab-pane>
  	  </el-tabs>
  <div style="height: 100px; background-color: #a0cfff; text-align: center; line-height: 100px; color: #b1b3b8;">
	  <h3>P22计算机应用工程2班-俞东旺-毕设</h3>
  </div>
  </template>
  
  <script setup>
  	import { getLeftuser,getLeftsort,getLeftinforion,getLeftcomments } from '../../api/index'
  	import { ref,onMounted } from 'vue'
	import router from '../../router/index'
  	import leftuser from './Leftuser'
  	import leftsort from './Leftsort'
	import comment from './Comment'
	import inforion from './Inforion'
	import syslist from './Syslist'
  	
  	const tabPosition = ref('left')
	
  
  	/**
  	 * 获取信息
  	 */
	const leftuserdata = ref([])
	const leftsortdata = ref([])
	const leftcommentdata = ref([])
	const leftinforiondata = ref([])
  	
  	  const toGox = () => {
  	      getLeftusers();
  	  };
	  const toGox2 = () => {
	      getLeftsorts();
	  };
	  const toGox3 = () => {
	      getLeftcomment();
	  };
	  const toGox4 = () => {
	      getLeftinforions();
	  };
	  const quit = () => {
	      router.push('/home')
	  };
  	
  	  const getLeftusers = async () => {
  	  const res = await getLeftuser();
  	   leftuserdata.value = res.data.data.user;
  	    console.log("用户管理查询成功");
  	  }
	  
	  const getLeftsorts = async () => {
	  const res = await getLeftsort();
	   leftsortdata.value = res.data.data.sort;
	    console.log("教师管理查询成功");
	  }
	  
	  const getLeftcomment = async () => {
	  const res = await getLeftcomments();
	   leftcommentdata.value = res.data.data.comments;
	    console.log("用户管理查询成功");
	  }
	  
	  const getLeftinforions = async () => {
	  const res = await getLeftinforion();
	   leftinforiondata.value = res.data.data.information;
	    console.log("教师管理查询成功");
	  }
	  
	  onMounted(() => {
	     getLeftusers();
		 getLeftsorts();
		 getLeftcomment();
		 getLeftinforions();
	  })
	  const handleDelete = (id) => {
	      leftuserdata.value = leftuserdata.value.filter((data) => data.id !== id);
	    };
	  const handleDelete2 = (id) => {
		  leftsortdata.value = leftsortdata.value.filter((data) => data.id !== id);
		};
	  const handleDelete3 = (id) => {
	      leftcommentdata.value = leftcommentdata.value.filter((data) => data.id !== id);
	    };
	  const handleDelete4 = (id) => {
	  		  leftinforiondata.value = leftinforiondata.value.filter((data) => data.id !== id);
	  		};
		  
  </script>

<style scoped>
	.heabut{
		position: absolute;
		right: 0;
		margin-top: 1%;
	}
	.hea{
		height: 70px;
		background-color: #a0cfff;
    	color: #f0e8e8;
	}
	.phome{
		float: left;
		font-size: 39px;
		line-height: 70px;
		margin-left: 37%;
	}
	.imgo{
		width: 105px;
    	height: 70px;
		float: left;
		background-image: url('../static/tzxl.png');
		background-color: rgb(245, 245, 245);
		background-size: cover;
  		background-repeat: no-repeat;
  		background-position: center;
	}
</style>