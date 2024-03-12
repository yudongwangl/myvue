<template>
  <div class="item2">
  <el-button type="primary" plain @click="drawer = true">
    资料设置
  </el-button>

  <el-drawer v-model="drawer" title="I am the title" :with-header="false" placement="left" direction="ltr" ref="drawerRef" >
    <el-avatar :size="200" class="img" src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png" />
    <el-form :model="form">
      <el-form-item label="姓名">
      <el-input v-model="form.name" />
    </el-form-item>
    <el-form-item label="专业">
      <el-input v-model="form.name" />
    </el-form-item>
    <el-form-item label="经验">
      <el-input v-model="form.name" />
    </el-form-item>
    <el-form-item label="电话">
      <el-input v-model="form.name" />
    </el-form-item>
    <el-form-item label="邮箱">
      <el-input v-model="form.name" />
    </el-form-item>
    <div class="buttf">
    <el-form-item>
      <el-button type="primary" @click="onSubmit">确定</el-button>
      <el-button @click="cancelForm">取消</el-button>
    </el-form-item>
  </div>
    </el-form>
  </el-drawer>
  </div>
</template>

<script setup>
import { ref,reactive  } from 'vue'
const drawer = ref(false)

const form = reactive({
  name: '',
})
const cancelForm = () => {
  drawer.value = false
}
</script>

<style scoped>
.img{
  margin-left: 30%;
}
.buttf{
  display: flex;
  justify-content: flex-end;
}
</style>
