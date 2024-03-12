<template>
  <el-table :data="paginatedSort" style="width: 100%" :fit="false" :stripe="true">
    <el-table-column prop="id" label="ID" width="300" />
    <el-table-column prop="name" label="名字" width="300" />
    <el-table-column label="照片" width="300">
      <template v-slot="scope">
          <el-image
            style="width: 100px; height: 100px"
            :src="require(`../static/${scope.row.img}`)"
            :zoom-rate="1.2"
            :initial-index="0" 
            fit="contain"
          />
      </template>
    </el-table-column>

    <el-table-column prop="workingtime" label="资历" width="300" />
    <el-table-column align="right" width="400">
      <template #header>
        <el-input v-model="search" placeholder="name to search" style="width: 280px;margin-right: 5px;" />
		<el-button @click="dialogVisible2 = true" width="300" type="warning">添加</el-button>
		<el-dialog v-model="dialogVisible2" 
		title="添加" width="30%" 
		:modal="false" 
		:append-to-body="true" 
		:show-close="false" 
		:center="true" style="background-color: #f3c386;">
		<el-form label-width="50px">
		  <el-form-item label="名字">
		    <el-input v-model="sortData.name" />
		  </el-form-item>
		  <el-form-item label="照片">
		    <el-input v-model="sortData.img" placeholder="只能填写路径" />
		  </el-form-item>
		  <el-form-item label="资历">
		    <el-input v-model="sortData.workingtime" />
		  </el-form-item>
		  <el-form-item label="类型">
		    <el-input v-model="sortData.type" placeholder="请从1,2,3中填写" />
		  </el-form-item>
		  </el-form>
		  <template #footer>
		    <span class="dialog-footer">
		      <el-button @click="dialogVisible2 = false">取消</el-button>
		      <el-button type="primary" @click="addSort">添加</el-button>
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
      <el-form-item label="照片">
        <el-input v-model="selectedRow.img" />
      </el-form-item>
      <el-form-item label="资历">
        <el-input v-model="selectedRow.workingtime" />
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
import { deleteSort,updateSort,getAddsort } from '../../api/index'

const dialogVisible = ref(false)
const dialogVisible2 = ref(false)
const selectedRow = ref(null)

const props = defineProps(['leftsortdata']);
const emits = defineEmits(['delete2','updateSort']);
const search = ref('');
const leftdatatwo = computed(() =>
  props.leftsortdata.filter(
    (data) =>
      !search.value || data.name.toLowerCase().includes(search.value.toLowerCase())
  )
);
/**
 * 删除用户
 */
const todel = async (id) => {
  try {
    await deleteSort({ id: id });
    emits('delete2', id);
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
    await updateSort(selectedRow.value);
    // 更新成功后的逻辑
    console.log('教师管理更新成功');
    dialogVisible.value = false; // 关闭Dialog对话框
    // 更新el-table的数据，可以重新获取数据或者更新对应行的数据
    emits('updateSort');
  } catch (error) {
    console.error(error);
  }
};
/**
 * 添加
 */
const sortData = reactive({
      name: '',
      img: '',
      workingtime: '',
	  type: ''
    });
const addSort = async () => {
        await getAddsort(sortData);
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
const paginatedSort = computed(() => {
  const start = (currentPage.value - 1) * pageSize.value;
  const end = currentPage.value * pageSize.value;
  return leftdatatwo.value.slice(start, end);
});

</script>

<style scoped>

</style>