<template>

<div id="box">
    <div class="hea-li hea-front" @click="toGos">首页</div>
    <div class="hea-li">优势</div>
    <div class="hea-li">介绍</div>
    <div class="hea-li">教育</div>
    <div class="hea-li">下载</div>
    <div class="hea-li">合作</div>
  </div>

	<el-tabs :tab-position="tabPosition" style="height: 1000px" class="demo-tabs">
	  <!-- 通过 v-for 循环生成 el-tab-pane -->
	  <el-tab-pane v-for="(tab, index) in tabs" :key="index" :label="tab.label">
		<div class="hea-sort">
		  <el-space wrap style="margin-top: 1%;">
			<!-- 使用 v-for 循环生成 el-card -->
			<el-card v-for="item in sortli.sortget[index]" :key="item.id" class="box-card" style="width: 100%; height: 100%;">
			  <template #header>
				<div class="card-header">
				  <el-image style="width: 300px; height: 300px; object-fit: contain;" :src="item.img" />
				  <h2>姓名：{{item.name}}</h2>
				  <h3>资历：{{item.workingtime}}年</h3>
				  <el-button type="primary" @click="torela(id)">联系</el-button>
				  <el-button type="success">收藏</el-button>

				</div>
			  </template>
			</el-card>
		  </el-space>
		</div>
	  </el-tab-pane>
	</el-tabs>
  </template>
  
  <script setup>
  import { getSort } from '../../api/index'
  import router from '../../router/index'
  import { ref, onMounted, reactive } from 'vue'
  import { useRoute } from 'vue-router'
  
  const tabPosition = ref('left')
  const route = useRoute()
  const id = route.query.id
  console.log(id, "id");
  
  // 初始化 tabs 数组
  const tabs = [
	{ label: '语文' },
	{ label: '数学' },
	{ label: '英语' },
	{ label: '化学' },
	{ label: '物理' },
	{ label: '生物' },
	{ label: '地理' },
	{ label: '历史' },
	{ label: '大学' },
	{ label: '其它' },
  ]
  
  const toGos = () => {
  router.push('/home')
}
const torela = () => {
  if (id !== undefined || '') {
    router.push({ path: '/relation', query: { id } })
  } else {
    ElMessage({
      message: "请先登录！",
      type: 'error',
    })
  }
}

  // 初始化 sortli.sortget
  const sortli = reactive({
	sortget: Array(tabs.length).fill([]) // 创建一个与 tabs 数组长度相同的空数组
  })
  
  const getSorts = async (types) => {
	const res = await getSort({ types });
  
	const absolutePaths = res.data.data.sort.map(item => {
	  const relativePath = item.img;
	  return require(`../static/${relativePath}`);
	});
  
	sortli.sortget[types - 1] = res.data.data.sort.map((item, index) => {
	  return {
		id: item.id,
		img: absolutePaths[index],
		name: item.name,
		workingtime: item.workingtime
	  };
	});
  };
  
  onMounted(() => {
	// 循环调用 getSorts
	tabs.forEach((tab, index) => {
	  getSorts(index + 1);
	});
  })
  </script>  

<style scoped>
.demo-tabs > .el-tabs__content {
  padding: 32px;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}

.el-tabs--right .el-tabs__content,
.el-tabs--left .el-tabs__content {
  height: 100%;
}
.hea-sort{
	height: 1000px;
	margin-left: 6%;
}
h2,h3{
	text-align: center;
	color: rgb(113, 109, 109);
}
#box {
  height: 8%;
  background-color: #343333;
  color: #f0ecec;
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
</style>