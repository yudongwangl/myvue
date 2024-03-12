<template>
	<div class="box">
	  <el-container>
		<el-header class="box-header">
		<el-button type="warning" round @click="toGox">注销</el-button>
		</el-header>
		<el-main class="box-main">
			<teahome1/>
			<teahome2 :username="username" :id="id" />
		</el-main>
		<el-footer class="box-footer"></el-footer>
	  </el-container>
	</div>
  </template>  

<script setup>
import router from '../../router/index'
import { ref } from 'vue'
import teahome1 from './subfile/Teahome-1'
import teahome2 from './subfile/Teahome-2'
import { useRoute } from 'vue-router'

const route = useRoute()
const username = ref(route.query.val || '')
const id = ref(route.query.pid)

const toGox = () => {
	router.push('/home');
  	  };
</script>

<style scoped>
.box-header {
	background-color: #ecf5ff;
	width: 100%;
	height: 70px;
	line-height: 70px;
}
.box-main {
	background-color: #b3e19d;
	width: 100%;
	
}

</style>