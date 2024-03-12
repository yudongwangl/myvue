import request from '../utils/request';

/**
 * 注册接口
 */
export const getRegister = (data) => {
  return request({ method: 'post', url: '/user/register', data });
};
/**
 * 登录接口
 */
export const getLogin = (data) => {
  return request({ method: 'post', url: '/user/login', data });
};

/**
 * adduser接口
 */
export const getAdduser = (data) => {
  return request({ method: 'post', url: '/user/adduser', data });
};
/**
 * userdelete接口
 */
export const deleteUser = (data) => {
  return request({ method: 'get', url: '/user/deluser', data });
};
/**
 * getLeftuser接口
 */
export const getLeftuser = () => {
  return request({ method: 'get', url: '/user/users'});
};
/**
 * userupdate接口
 */
export const updateUser = (data) => {
  return request({ method: 'get', url: '/user/upduser', data });
};

/**
 * sort接口
 */
export const getSort = (data) => {
  return request({ method: 'get', url: '/user/sort',data});
};
/**
 * getLeftsort接口
 */
export const getLeftsort = () => {
  return request({ method: 'get', url: '/user/sortlist2'});
};
/**
 * sortdelete接口
 */
export const deleteSort = (data) => {
  return request({ method: 'get', url: '/user/delsort', data });
};
/**
 * sortupdate接口
 */
export const updateSort = (data) => {
  return request({ method: 'get', url: '/user/updsort', data });
};
/**
 * addsort接口
 */
export const getAddsort = (data) => {
  return request({ method: 'post', url: '/user/addsort', data });
};

/**
 * getaddComments接口
 */
export const getaddComments = (data) => {
  return request({ method: 'post', url: '/user/addcomments', data });
};
/**
 * deleteComments接口
 */
export const deleteComments = (data) => {
  return request({ method: 'get', url: '/user/delcomments', data });
};
/**
 * getLeftcomments接口
 */
export const getLeftcomments = () => {
  return request({ method: 'get', url: '/user/comment'});
};
/**
 * updateComments接口
 */
export const updateComments = (data) => {
  return request({ method: 'get', url: '/user/updcomments', data });
};

/**
 * getAddinforion接口
 */
export const getAddinforion = (data) => {
  return request({ method: 'post', url: '/user/addinforion', data });
};
/**
 * deleteInforion接口
 */
export const deleteInforion = (data) => {
  return request({ method: 'get', url: '/user/delinforion', data });
};
/**
 * getLeftinforion接口
 */
export const getLeftinforion = () => {
  return request({ method: 'get', url: '/user/inforion'});
};
/**
 * updateInforion接口
 */
export const updateInforion = (data) => {
  return request({ method: 'get', url: '/user/updinforion', data });
};
/**
 * getUserlist接口
 */
export const getUserlist = () => {
  return request({ method: 'get', url: '/user/userlist'});
};
/**
 * getUserdate接口
 */
export const getUserdate = () => {
  return request({ method: 'get', url: '/user/userdate'});
};
/**
 * getUserblack接口
 */
export const getUserblack = () => {
  return request({ method: 'get', url: '/user/userblack'});
};
/**
 * upUserillegal接口
 */
export const upUserillegal = (data) => {
  return request({ method: 'get', url: '/user/upillegal', data });
};
/**
 * 消息接口
 */
export const upReply = (data) => {
  return request({ method: 'get', url: '/user/reply', data });
};
/**
 * 回复接口
 */
export const addReply = (data) => {
  return request({ method: 'post', url: '/user/addReply', data });
};
/**
 * 回复接口
 */
export const adDsort = () => {
  return request({ method: 'get', url: '/user/addSort'});
};
/**
 * 信息接口
 */
export const getreso = (data) => {
  return request({ method: 'get', url: '/user/reso', data });
};
/**
 * 信息接口
 */
export const getrelist = (data) => {
  return request({ method: 'get', url: '/user/relist', data });
};
/**
 * 信息接口
 */
export const getretwo = (data) => {
  return request({ method: 'get', url: '/user/retwo', data });
};
/**
 * 教师消息接口
 */
export const getuid = (data) => {
  return request({ method: 'get', url: '/user/replyuid', data });
};
export const getreus = (data) => {
  return request({ method: 'get', url: '/user/reus', data });
};
export const getpaus = (data) => {
  return request({ method: 'get', url: '/user/paus', data });
};
