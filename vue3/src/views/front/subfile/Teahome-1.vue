<template>
    <el-row>
      <el-col :span="6">
        <el-statistic title="今日访问" :value="100" />
      </el-col>
      <el-col :span="6">
        <el-statistic title="历史访问" :value="765" />
      </el-col>
      <el-col :span="6">
        <el-statistic title="新增访问" :value="35" />
      </el-col>
      <el-col :span="6">
        <el-statistic title="今日留言" :value="62">
          <template #suffix>
            <el-icon style="vertical-align: -0.125em">
              <ChatLineRound />
            </el-icon>
          </template>
        </el-statistic>
      </el-col>
    </el-row>
  </template>
  
  <script setup>
  import { ChatLineRound } from '@element-plus/icons-vue'
  </script>
  
  <style scoped>
  .el-col {
    text-align: center;
  }
  </style>
  