<template>
    <div class="box">
      <div class="lef">
        <div>
          <el-input v-model="input1" size="large" class="sea" placeholder="Please Input" :prefix-icon="Search" />
          <el-col :span="8" class="col">
            <el-dropdown trigger="click">
              <span class="el-dropdown-link" @click="adduser">添加<el-icon class="el-icon--right"><arrow-down /></el-icon></span>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item :icon="Plus" v-for="item in sortData" :key="item.id" @click="sortadd(item.id)">{{item.name}}</el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
          </el-col>
        </div>
        <div v-for="item in mergedArray" :key="item.id" class="lef-bom" @click="handleClick(item.uid)">
          <el-checkbox size="large" />
          
          <el-image
            style="width: 100px; height: 60px"
            :src="require(`../../static/${item.img}`)"
            :zoom-rate="1.2"
            :initial-index="0" 
            fit="contain"
          />
          <p class="btmp">{{ item.name }}</p>
        </div>
        <div class="lebtm">
          <el-button plain>全选</el-button>
          <el-button plain>删除</el-button>
        </div>
      </div>
      <div class="right">
        <div class="top">
          <div v-for="item in twoData" :key="item.id">
                    <div class="divre">
  
  
                      <p class="tp">{{ item.data }}</p>
                      <span class="datespan">{{ item.date }}</span>
                    </div>
          </div>
         </div>
         
        <div class="bot">
          <el-form :model="replyData">
            <el-form-item>
            <el-input type="textarea" v-model="replyData.data" />
          </el-form-item>
          <el-button plain class="botton-ent" @click="addusReply">ENTER</el-button>
        </el-form>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted,reactive } from 'vue'
  import { Search, ArrowDown, Plus } from '@element-plus/icons-vue'
  import { getuid, getreus,getpaus,addReply,adDsort } from '../../../api/index'
  import { useRoute } from 'vue-router'
  
  const input1 = ref('')
  const lefBoms = ref([])
  const mergedArray = ref([])
  const route = useRoute()
  const id = route.query.pid
  const topData = ref([])
  const twoData = ref([])
  const sortData = ref([])
  const currentDate = new Date();  //时间
  const chinaTime = currentDate.toLocaleString('zh-CN', { timeZone: 'Asia/Shanghai' });
  const replyData = reactive({
        uid: '',
        data: '开始聊天吧！',
        date: chinaTime,
        tid: id,
        uimg: "tzxl.png",
        timg: "tzxl02.png"
      });
  
  const getupReply = async (id) => {
    const res = await getuid({ id: id });
    lefBoms.value = res.data.reply;
    const wwid = [...new Set(lefBoms.value.map(item => item.uid))]; //过滤消息
    console.log(wwid, 'wwid');  //查询教师分别联系了谁(用户)
    const resall = await Promise.all(wwid.map(id => getreus({ id: id })));
    mergedArray.value = resall.flatMap(item => item.data);
  }
  
  const getredata = async (uid) => {
    const res = await getpaus({ pid: uid });  //过滤分析
    topData.value = res.data.data;
    const pid = topData.value.find(item => item.uid === item.uid)?.uid;
    if (pid) {
      replyData.uid = pid;
      const res2 = await getpaus({ pid: pid });  //获取具体消息
      twoData.value = res2.data.data;
    }
  }
  /**
   * 发送
   */
  const addusReply = async () => {
          await addReply(replyData);
          const uid = replyData.uid;
          getredata(uid);
  }
  const adduserlist = async () => {
          const res = await adDsort();
          sortData.value = res.data.data;
          
  }
  
  const handleClick = (uid) => {
    getredata(uid);
  }
  const adduser = () => {
    adduserlist();
  }
  const sortadd = (pid) => {
    replyData.tid=pid;
    addusReply();
    getupReply(id);
  
  }
  
  onMounted(() => {
    getupReply(id);
  })
  </script>
  
  
  <style scoped>
  .box {
    display: flex;
    flex-wrap: wrap;
    width: 100%;
    height: 100%;
    background-color: #ccc;
  }
  .lef {
    width: 300px;
    height: 835px;
    background-color: #f4f4f4;
  }
  .right {
    display: flex;
    flex-direction: column;
  }
  .top {
    width: 1390px;
    height: 635px;
    background-color: rgb(228 228 228);
    overflow: auto;
  }
  .bot {
    width: 1390px;
    height: 200px;
  }
  .sea {
    width: 250px;
  }
  .col {
    display: inline-block;
    width: 49px;
    height: 40px;
    background-color: #e8f0f0;
    position: absolute;
    top: 0;
  }
  .lef-bom {
    width: 300px;
    height: 70px;
    background-color: #e3dbea;
    margin-top: 2px;
  }
  .lebtm {
    width: 300px;
    height: 40px;
    background-color: rgb(223 223 224);
    position: absolute;
    bottom: 0;
  }
  .btmp {
    margin-left: 41%;
    margin-top: -22%;
  }
  .divre{
    width: 400px;
    height: 70px;
    margin-top: 5px;
    position: relative;
  }
  .divre2{
    width: 400px;
    height: 70px;
    right: 0;
    margin-top: 5px;
  }
  .tp{
    position: absolute;
    left: 23%;
    background-color: #fff;
    width: 202px;
    height: 35px;
    line-height: 35px;
    display: inline-block;
  }
  .tp2{
    right: 7%;
    background-color: #fff;
    width: 202px;
    height: 35px;
    line-height: 35px;
    display: inline-block;
  }
  .imgge{
    height: 60px;
    border-radius: 50%
  }
  .imgge2{
    height: 60px;
    border-radius: 50%;
  }
  .botton-ent{
    margin-left: 10px;
  }
  .datespan{
    position: absolute;
    top: 51px;
    right: 107px;
    font-size: 10px;
  }
  </style>