<template>
  <div id="box">
    <div class="hea-li hea-front">首页</div>
    <div class="hea-li">优势</div>
    <div class="hea-li" @click="toGos(id)">介绍</div>
    <div class="hea-li">教育</div>
    <div class="hea-li">下载</div>
    <div class="hea-li">合作</div>
   <div v-if="!route.query.val" class="buf">
         <el-button type="warning" plain size="large" round @click="login">登录</el-button>
         <el-button type="danger" plain size="large" round @click="register">注册</el-button>
       </div>
       <div v-else class="buf">
         {{ name || '未登录' }}, 已登录
         <el-button type="danger" plain size="large" round @click="logout">注销</el-button>
       </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import router from '../../router/index'
import { useRoute } from 'vue-router'

const route = useRoute()
const name = ref(route.query.val || '')
const id = ref(route.query.pid)
const toGos = (id) => {
  router.push({ path: '/sort', query: { id } })
}

const login = () => {
  router.push('/login')
}

const register = () => {
  router.push('/register')
}
const logout = () => {
  router.push('/home', { query: { val: '' } })
}
</script>

<style scoped>
#box {
  height: 8%;
  background-color: #fff;
}
.hea-li {
  width: 150px;
  border-left: 1px solid #c9c9c9;
  display: inline-block;
  text-align: center;
  line-height: 65px;
  font-weight: bold;
  font-size: 18px;
  cursor: pointer;
}
.hea-front {
  margin-left: 18%;
}
.buf{
	position: absolute;
	right: 5%;
	top: 2%;
}
</style>