<template>
  <div class="box">
    <el-card shadow="always" class="sys1"> 违规处理 
      <el-table :data="userdata" style="width: 100%">
        <el-table-column label="ID" prop="id"></el-table-column>
        <el-table-column label="姓名" prop="name"></el-table-column>
        <el-table-column label="类型" prop="type">
          <template #default="{ row }">
            {{ row.type === 0 ? '普通用户' : row.type === 1 ? '教师' : row.type === 3 ? '管理员' : '' }}
          </template>
        </el-table-column>
        <el-table-column label="日期" prop="date"></el-table-column>
        <el-table-column label="原因" prop="cause"></el-table-column>
        <el-table-column label="操作">
          <template #default="{ row }">
            <el-button type="success" @click="upre(row)">解除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <el-card shadow="always" class="sys2"> 黑名单 
      <el-table :data="userblack" style="width: 100%">
        <el-table-column label="ID" prop="id"></el-table-column>
        <el-table-column label="姓名" prop="name"></el-table-column>
        <el-table-column label="类型" prop="type">
          <template #default="{ row }">
            {{ row.type === 0 ? '普通用户' : row.type === 1 ? '教师' : row.type === 3 ? '管理员' : '' }}
          </template>
        </el-table-column>
        <el-table-column label="日期" prop="date"></el-table-column>
        <el-table-column label="原因" prop="cause"></el-table-column>
      </el-table>
    </el-card>
  </div>
  <div class="boxtwo">
    <el-card shadow="always" class="sys3">当前状态 
      <el-table :data="userlist" style="width: 100%; overflow: auto;">
        <el-table-column label="ID" prop="id"></el-table-column>
        <el-table-column label="姓名" prop="name"></el-table-column>
        <el-table-column label="类型" prop="type">
          <template #default="{ row }">
            {{ row.type === 0 ? '普通用户' : row.type === 1 ? '教师' : row.type === 3 ? '管理员' : '' }}
          </template>
        </el-table-column>
        <el-table-column label="日期" prop="date"></el-table-column>
        <el-table-column label="原因" prop="cause"></el-table-column>
        <el-table-column label="违规" prop="illegal">
          <template #default="{ row }">
            <span :class="{ 'red-text': row.illegal === 1 }">{{ row.illegal === 1 ? '有' : '无' }}</span>
          </template>
        </el-table-column>
        <el-table-column label="黑名单" prop="blacklist">
          <template #default="{ row }">
            <span :class="{ 'red-text': row.blacklist === 1 }">{{ row.blacklist === 1 ? '有' : '无' }}</span>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { getUserdate, getUserblack, getUserlist, upUserillegal } from '../../api/index'
import { ref, onMounted } from 'vue'

const userdata = ref([])
const userblack = ref([])
const userlist = ref([])

const getLeftusers = async () => {
  const res = await getUserdate();
  userdata.value = res.data.data.illegal;
  console.log("查询成功");
}
const getLeftblack = async () => {
  const res = await getUserblack();
  userblack.value = res.data.data.black;
}
const getList = async () => {
  const res = await getUserlist();
  userlist.value = res.data.data.user;
}

// 定义upre方法
const upre = async (row) => {
  const { id } = row;
  await upUserillegal({ id: id });
  await getLeftusers();
  await getList();
}

onMounted(() => {
  getLeftusers();
  getLeftblack();
  getList();
})
</script>

<style scoped>
.box {
  float: left;
}

.boxtwo {
  float: left;
}

.sys1 {
  width: 700px;
  height: 400px;
  margin-top: 5px;
  margin-left: 5px;
}

.sys2 {
  width: 700px;
  height: 300px;
  margin-top: 5px;
  margin-left: 5px;
}

.sys3 {
  width: 850px;
  height: 705px;
  margin-left: 10px;
  margin-top: 5px;
}
.red-text {
  color: red;
}
</style>