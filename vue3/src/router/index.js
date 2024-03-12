import { createRouter, createWebHashHistory } from 'vue-router';

//路由配置
const router = createRouter({
  history: createWebHashHistory(), //选择hash路由
  routes: [
    {
      path: '/',
      redirect: '/home',
    },
    {
      path: '/home',
      component: () => import('../views/Home'),
      meta: {
        isAuth: true,
      },
    },
    {
      path: '/login',
      component: () => import('../views/front/Login'),
    },
    {
      path: '/register',
      component: () => import('../views/front/Register'),
    },
	{
	  path: '/header',
	  component: () => import('../views/front/Header'),
	},
	{
	  path: '/main',
	  component: () => import('../views/front/Main'),
	},
	{
	  path: '/sort',
	  component: () => import('../views/front/Sort'),
	},
	{
	  path: '/home2',
	  component: () => import('../views/rear/Home'),
	},
	{
	  path: '/teahome',
	  component: () => import('../views/front/Teahome'),
	},
  {
	  path: '/relation',
	  component: () => import('../views/front/Sortrelation'),
	},
  {
	  path: '/userelation',
	  component: () => import('../views/front/subfile/Userrelation'),
	}
  ],
});

//路由拦截
// router.beforeEach((to, from, next) => {
//   if (to.meta.isAuth) {
//     if (localStorage.getItem('data')) {
//       next();
//     } else {
//       ElMessage.error('请先登录');
//     }
//   } else {
//     next();
//   }
// });
export default router;

