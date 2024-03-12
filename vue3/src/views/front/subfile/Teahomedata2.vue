<template>
    <el-badge :value="3" class="item">
    <el-button type="primary" plain @click="drawer = true">
        系统消息
    </el-button>
  
    <el-drawer v-model="drawer" title="I am the title" :with-header="false">
      <el-scrollbar height="800px">
    <p v-for="item in Datali.li" :key="item.id" class="scrollbar-demo-item">{{ item.p }}</p>
  </el-scrollbar>
    </el-drawer>
</el-badge>
  </template>
  
  <script setup>
  import { ref,reactive } from 'vue'

  const drawer = ref(false)
  
  
  const Datali = reactive({
  li: [
  	  {id:0,p:"你收到一条通知！"},
  	  {id:1,p:"你的申请系统处理"},
  	  {id:2,p:"你有一个代办事项"},
  	  {id:3,p:"有活动请点击"},
  	  {id:4,p:"你收到一条学员通知"},
  	  {id:5,p:"你有一个代办事项"},
      {id:6,p:"你收到一条通知！"},
  	  {id:7,p:"你的申请系统处理"},
  	  {id:8,p:"你有一个代办事项"},
  	  {id:9,p:"有活动请点击"},
  	  {id:10,p:"你收到一条学员通知"},
  	  {id:11,p:"你有一个代办事项"}
  ], 
});

  </script>

<style scoped>
.scrollbar-demo-item {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 50px;
  margin: 10px;
  text-align: center;
  border-radius: 4px;
  color: rgb(239, 249, 248); /* 修改文字颜色为蓝色 */
  background-color: rgb(234, 60, 103); /* 修改背景颜色为黄色 */
}
</style>