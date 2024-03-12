<template>
  <div>
    <transition name="fade">
      <div v-if="!showDialog" class="box-heag">
        <el-avatar :size="200" class="img" src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png" />
        <h2>欢迎回来，{{props.username}}</h2>
      </div>
      <div v-else class="dialog">
        <!-- 对话框内容 -->
      </div>
    </transition>
    <div class="main-li-fixed">
      <teahomedata class="item2" />
      <el-badge :value="12" class="item">
        <el-button @click="toggleDialog">消息回复</el-button>
      </el-badge>
      <el-badge :value="100" :max="20" class="item">
        <el-button @click="togo">我的评论</el-button>
      </el-badge>
      <teahomedata2 class="item" />
    </div>
  </div>
</template>

<script setup>
import teahomedata from './Teahomedata'
import teahomedata2 from './Teahomedata2'
import router from '../../../router/index'
import { ref,defineProps } from 'vue'

const showDialog = ref(false)
const props = defineProps(['username','id']);

const togo = () => {
          router.push(`/userelation?pid=${props.id}`);
          console.log(props.id, 'props.id');
          
  	  };

const toggleDialog = () => {
  showDialog.value = !showDialog.value
}
</script>

<style scoped>
.img{
  margin-left: 45%;
  margin-top: 8%;
}
h2{
  margin-left: 45%;
}
.main-li-fixed {
position: fixed;
top: 65%;
left: 0;
width: 100%;
height: 400px;
background-color: #ecf5ff;
}
.item {
margin-left: 10%;
margin-top: 5%;
float: left;
}
.item2 {
  margin-left: 22%;
  margin-top: 5%;
  float: left;
}

.fade-enter-active,
.fade-leave-active {
transition: opacity 0.2s, transform 0.5s;
}
.fade-enter,
.fade-leave-to {
opacity: 0;
transform: translateY(-100%);
}
.dialog {
/* 样式设置为对话框的样式 */
background-color: #fff;
margin: 50px auto;
}
</style>