<template>
  <el-table :data="paginated" style="width: 100%" :fit="false" :stripe="true">
    <el-table-column prop="id" label="ID" width="150" />
    <el-table-column prop="name" label="名字" width="150" />
    <el-table-column prop="age" label="年龄" width="150" />
    <el-table-column prop="gender" label="性别" width="150" />
	<el-table-column prop="subject" label="科目" width="150" />
	<el-table-column prop="price" label="价格" width="150" />
	<el-table-column prop="location" label="地点" width="150" />
	<el-table-column prop="experience" label="经验" width="150" />
	<el-table-column prop="qualification" label="证书" width="150" />
    <el-table-column align="right" width="400">
      <template #header>
        <el-input v-model="search" placeholder="name to search" style="width: 280px;margin-right: 5px;" />
		<el-button @click="dialogVisible2 = true" width="300" type="warning">添加</el-button>
		<el-dialog v-model="dialogVisible2" 
		title="添加" width="30%" 
		:modal="false" 
		:append-to-body="true" 
		:show-close="false" 
		:center="true" style="background-color: #f3f3f3;">
		<el-form label-width="50px">
		  <el-form-item label="名字">
		    <el-input v-model="sortData.name" />
		  </el-form-item>
		  <el-form-item label="年龄">
		    <el-input v-model="sortData.age" />
		  </el-form-item>
		  <el-form-item label="性别">
		    <el-input v-model="sortData.gender" />
		  </el-form-item>
		  <el-form-item label="科目">
		    <el-input v-model="sortData.subject" />
		  </el-form-item>
		  <el-form-item label="价格">
		    <el-input v-model="sortData.price" />
		  </el-form-item>
		  <el-form-item label="地点">
		    <el-input v-model="sortData.location" />
		  </el-form-item>
		  <el-form-item label="经验">
		    <el-input v-model="sortData.experience" />
		  </el-form-item>
		  <el-form-item label="证书">
		    <el-input v-model="sortData.qualification" />
		  </el-form-item>
		  </el-form>
		  <template #footer>
		    <span class="dialog-footer">
		      <el-button @click="dialogVisible2 = false">取消</el-button>
		      <el-button type="primary" @click="addSort">更新</el-button>
		    </span>
		  </template>
		</el-dialog>
      </template>
      <template #default="scope">
        <el-button type="info" @click="editRow(scope.row)">编辑</el-button>
        <el-button type="danger" @click="todel(scope.row.id)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>
  
  <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[11, 22, 33, 44]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      >
  	  </el-pagination>
  
  <el-dialog v-model="dialogVisible" title="编辑" width="30%" :show-close="false" :center="true">
    <el-form :model="selectedRow" label-width="50px">
      <el-form-item label="ID">
        <el-input v-model="selectedRow.id" disabled />
      </el-form-item>
      <el-form-item label="名字">
        <el-input v-model="selectedRow.name" />
      </el-form-item>
      <el-form-item label="年龄">
        <el-input v-model="selectedRow.age" />
      </el-form-item>
      <el-form-item label="性别">
        <el-input v-model="selectedRow.gender" />
      </el-form-item>
	  <el-form-item label="科目">
	    <el-input v-model="selectedRow.subject" />
	  </el-form-item>
	  <el-form-item label="价格">
	    <el-input v-model="selectedRow.price" />
	  </el-form-item>
	  <el-form-item label="地点">
	    <el-input v-model="selectedRow.location" />
	  </el-form-item>
	  <el-form-item label="经验">
	    <el-input v-model="selectedRow.experience" />
	  </el-form-item>
	  <el-form-item label="证书">
	    <el-input v-model="selectedRow.qualification" />
	  </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="toupd">更新</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script setup>
import { defineProps, ref, computed,defineEmits,reactive } from 'vue'
import { deleteInforion,updateInforion,getAddinforion } from '../../api/index'

const dialogVisible = ref(false)
const dialogVisible2 = ref(false)
const selectedRow = ref(null)

const props = defineProps(['leftinforiondata']);
const emits = defineEmits(['delete4','updateinf']);
const search = ref('');
const leftdatatwo = computed(() =>
  props.leftinforiondata.filter(
    (data) =>
      !search.value || data.name.toLowerCase().includes(search.value.toLowerCase())
  )
);

/**
 * 删除用户
 */
const todel = async (id) => {
  try {
    await deleteInforion({ id: id });
    emits('delete4', id);
  } catch (err) {
    console.error(err);
  }
};

/**
 * 编辑
 */
const editRow = (row) => {
  selectedRow.value = { ...row };
  dialogVisible.value = true;
};
/**
 * 编辑更新用户
 */
const toupd = async () => {
  try {
    // 调用后端服务的更新方法，传递selectedRow的值
    await updateInforion(selectedRow.value);
    // 更新成功后的逻辑
    console.log('教师管理更新成功');
    dialogVisible.value = false; // 关闭Dialog对话框
    // 更新el-table的数据，可以重新获取数据或者更新对应行的数据
    emits('updateinf');
  } catch (error) {
    console.error(error);
  }
};
/**
 * 添加
 */
const sortData = reactive({
      name: '',
      age: '',
      gender: '',
	  subject: '',
	  price: '',
	  location: '',
	  experience: '',
	  qualification: ''
    });
const addSort = async () => {
        await getAddinforion(sortData);
        // 关闭对话框
        dialogVisible2.value = false;
        emits('updateSort');
};

const currentPage = ref(1); // 当前页数
const pageSize = ref(11); // 每页显示的条数
const total = computed(() => leftdatatwo.value.length); // 总条数

// 监听每页显示条数变化
const handleSizeChange = (val) => {
  pageSize.value = val;
};

// 监听当前页数变化
const handleCurrentChange = (val) => {
  currentPage.value = val;
};

// 根据当前页数和每页显示的条数计算分页后的数据
const paginated = computed(() => {
  const start = (currentPage.value - 1) * pageSize.value;
  const end = currentPage.value * pageSize.value;
  return leftdatatwo.value.slice(start, end);
});

</script>

<style scoped>
.dialog-footer button:first-child {
  margin-right: 10px;
}
</style>