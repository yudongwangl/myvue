import router from '../router/index';
import axios from 'axios';
/**
 * 创建axios实例
 */
const ENV = process.env.NODE_ENV;
const host =
  ENV === 'development' ? 'http://127.0.0.1:3000' : 'localhost';
const service = axios.create({
  baseURL: host,
  timeout: '3000',
});

/**
 * 请求拦截
 */
// service.interceptors.request.use((config) => {
//   if (config.url.indexOf('register') < 0 && config.url.indexOf('login') < 0) {
//     config.headers.authorization = localStorage.getItem('data');
//   }
//   return config;
// });

/**
 * 响应拦截
 */
// service.interceptors.response.use((res) => {
//   const { code, data, message } = res.data;
//   if (code === 0) {
//     return data;
//   } else {
//     ElMessage({
//       message: message,
//       type: 'error',
//     });
//   }
//   if (message === '身份认证失败') {
//     router.push('/login');
//   }
// });

/**
 * 封装请求函数
 */
const request = (options) => {
  if (options.method === 'get') {
    options.params = options.data;
  }
  return service(options);
};

export default request;

