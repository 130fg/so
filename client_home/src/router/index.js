import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue'
import login from '../views/account/login.vue';

Vue.use(VueRouter)

const routes = [
	// 主页ss
	{
		path: '/',
		name: 'index',
		component: index
	},
	// 登录
	{
		path: '/account/login',
		name: 'login',
		component: login
	},
	// 忘记密码
	{
		path: '/account/forgot',
		name: 'forgot',
		component: () => import('../views/account/forgot.vue')
	},
	// 注册账号
	{
		path: '/account/register',
		name: 'register',
		component: () => import('../views/account/register.vue')
	},
	// 媒体图片
	{
		path: '/media/image',
		name: 'media_image',
		component: () => import('../views/media/image.vue')
	},
	// 音乐
	{
		path: '/media/music',
		name: 'media_music',
		component: () => import('../views/media/music.vue')
	},
	// 媒体视频
	{
		path: '/media/video',
		name: 'media_video',
		component: () => import('../views/media/video.vue')
	},
	// 文章路由
	{
		path: '/article/list',
		name: 'article_list',
		component: () => import('../views/article/list.vue')
	},
	{
		path: '/article/details',
		name: 'article_details',
		component: () => import('../views/article/details.vue')
	},
	// 浏览网站
	// 收藏路由
	{
		path: '/user/collect',
		name: 'collect_list',
		component: () => import('../views/user/collect.vue')
	},






	// 公告路由
	{
		path: '/notice/list',
		name: 'notice_list',
		component: () => import('../views/notice/list.vue')
	},
	{
		path: '/notice/details',
		name: 'notice_details',
		component: () => import('../views/notice/details.vue')
	},
	
	
		
		// 旅游分享列表路由
	{
		path: '/tourism_sharing/list',
		name: '/tourism_sharing_list',
		component: () => import('../views/tourism_sharing/list.vue')
	},
	
		// 旅游分享详情路由
	{
		path: '/tourism_sharing/details',
		name: '/tourism_sharing_details',
		component: () => import('../views/tourism_sharing/details.vue')
	},
		
		// 主题活动列表路由
	{
		path: '/thematic_activities/list',
		name: '/thematic_activities_list',
		component: () => import('../views/thematic_activities/list.vue')
	},
	
		// 主题活动详情路由
	{
		path: '/thematic_activities/details',
		name: '/thematic_activities_details',
		component: () => import('../views/thematic_activities/details.vue')
	},
			// 报名记录添加路由
	{
		path: '/registration_record/edit',
		name: '/registration_record_edit',
		component: () => import('../views/registration_record/edit.vue')
	},
	
	
		
		// 民宿信息列表路由
	{
		path: '/home_stay_information/list',
		name: '/home_stay_information_list',
		component: () => import('../views/home_stay_information/list.vue')
	},
	
		// 民宿信息详情路由
	{
		path: '/home_stay_information/details',
		name: '/home_stay_information_details',
		component: () => import('../views/home_stay_information/details.vue')
	},
			// 预订信息添加路由
	{
		path: '/reservation_information/edit',
		name: '/reservation_information_edit',
		component: () => import('../views/reservation_information/edit.vue')
	},
	
	
		
		// 特产信息列表路由
	{
		path: '/specialty_information/list',
		name: '/specialty_information_list',
		component: () => import('../views/specialty_information/list.vue')
	},
	
		// 特产信息详情路由
	{
		path: '/specialty_information/details',
		name: '/specialty_information_details',
		component: () => import('../views/specialty_information/details.vue')
	},
			// 订单结算添加路由
	{
		path: '/order_settlement/edit',
		name: '/order_settlement_edit',
		component: () => import('../views/order_settlement/edit.vue')
	},
	
	
		
	
		
	
	
	// 用户路由
	{
		path: '/user/index',
		name: 'user_index',
		component: () => import('../views/user/index.vue')
	},
	// 基本信息
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue')
	},
	// 找回密码
	{
		path: '/user/password',
		name: 'user_password',
		component: () => import('../views/user/password.vue')
	},

	// 搜索
	{
		path: '/search',
		name: 'search',
		component: () => import('../views/search/index.vue')
	},
	// 局部搜索
	{
		path: '/search/details',
		name: 'search_details',
		component: () => import('../views/search/details.vue')
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.afterEach((to, from, next) => {
	let title = "以画眉弄为例的特色乡村旅游推介系统-home";
	document.title = title;
	document.logo = "以画眉弄为例的特色乡村旅游推介系统"
})

export default router
