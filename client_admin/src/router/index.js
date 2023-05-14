import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			index: 0,
			title: '首页'
		}
	},

	// 登录
	{
		path: '/login',
		name: 'login',
		component: login,
		meta: {
			index: 0,
			title: '登录'
		}
	},


	// 忘记密码
	{
		path: '/forgot',
		name: "forgot",
		component: forgot,
		meta: {
			index: 0,
			title: '忘记密码'
		}
	},

	// 修改密码
	{
		path: '/user/password',
		name: "password",
		component: () => import("../views/user/password.vue"),
		meta: {
			index: 0,
			title: '修改密码'
		}
	},

	// 视频播放页
	{
		path: "/media/video",
		name: "video",
		component: () => import('../views/media/video.vue'),
		meta: {
			index: 0,
			title: "视频"
		}
	},

	// 音频播放页
	{
		path: "/media/audio",
		name: "audio",
		component: () => import('../views/media/audio.vue'),
		meta: {
			index: 0,
			title: "音频"
		}
	},

	// 友情链接路由
	// {
	// 	path: '/link/table',
	// 	name: 'link_table',
	// 	component: () => import('../views/link/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接列表'
	// 	}
	// },
	// {
	// 	path: '/link/view',
	// 	name: 'link_view',
	// 	component: () => import('../views/link/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接详情'
	// 	}
	// },

	// 轮播图路由
	{
		path: '/slides/table',
		name: 'slides_table',
		component: () => import('../views/slides/table.vue'),
		meta: {
			index: 0,
			title: '轮播图列表'
		}
	},
	{
		path: '/slides/view',
		name: 'slides_view',
		component: () => import('../views/slides/view.vue'),
		meta: {
			index: 0,
			title: '轮播图详情'
		}
	},
		// 文章路由
	{
		path: '/article/table',
		name: 'article_table',
		component: () => import('../views/article/table.vue'),
		meta: {
			index: 0,
			title: '文章列表'
		}
	},
	{
		path: '/article/view',
		name: 'article_view',
		component: () => import('../views/article/view.vue'),
		meta: {
			index: 0,
			title: '文章详情'
		}
	},

	// 文章分类路由
	{
		path: '/article_type/table',
		name: 'article_type_table',
		component: () => import('../views/article_type/table.vue'),
		meta: {
			index: 0,
			title: '文章分类列表'
		}
	},
	{
		path: '/article_type/view',
		name: 'article_type_view',
		component: () => import('../views/article_type/view.vue'),
		meta: {
			index: 0,
			title: '文章分类详情'
		}
	},
	
	// 广告路由
	// {
	// 	path: '/ad/table',
	// 	name: 'ad_table',
	// 	component: () => import('../views/ad/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告列表'
	// 	}
	// },
	// {
	// 	path: '/ad/view',
	// 	name: 'ad_view',
	// 	component: () => import('../views/ad/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告详情'
	// 	}
	// },



	// 公告路由
	{
		path: '/notice/table',
		name: 'notice_table',
		component: () => import('../views/notice/table.vue'),
		meta: {
			index: 0,
			title: '公告消息列表'
		}
	},
	{
		path: '/notice/view',
		name: 'notice_view',
		component: () => import('../views/notice/view.vue'),
		meta: {
			index: 0,
			title: '公告消息详情'
		}
	},


	// 评论路由
	{
		path: '/comment/table',
		name: 'comment_table',
		component: () => import('../views/comment/table.vue'),
		meta: {
			index: 0,
			title: '评论列表'
		}
	},
	{
		path: '/comment/view',
		name: 'comment_view',
		component: () => import('../views/comment/view.vue'),
		meta: {
			index: 0,
			title: '评论详情'
		}
	},

	// 注册用户路由
	{
		path: '/registered_users/table',
		name: 'registered_users_table',
		component: () => import('../views/registered_users/table.vue'),
		meta: {
			index: 0,
			title: '注册用户列表'
		}
	},
	{
		path: '/registered_users/view',
		name: 'registered_users_view',
		component: () => import('../views/registered_users/view.vue'),
		meta: {
			index: 0,
			title: '注册用户详情'
		}
	},
	// 旅游分享路由
	{
		path: '/tourism_sharing/table',
		name: 'tourism_sharing_table',
		component: () => import('../views/tourism_sharing/table.vue'),
		meta: {
			index: 0,
			title: '旅游分享列表'
		}
	},
	{
		path: '/tourism_sharing/view',
		name: 'tourism_sharing_view',
		component: () => import('../views/tourism_sharing/view.vue'),
		meta: {
			index: 0,
			title: '旅游分享详情'
		}
	},
	// 主题活动路由
	{
		path: '/thematic_activities/table',
		name: 'thematic_activities_table',
		component: () => import('../views/thematic_activities/table.vue'),
		meta: {
			index: 0,
			title: '主题活动列表'
		}
	},
	{
		path: '/thematic_activities/view',
		name: 'thematic_activities_view',
		component: () => import('../views/thematic_activities/view.vue'),
		meta: {
			index: 0,
			title: '主题活动详情'
		}
	},
	// 报名记录路由
	{
		path: '/registration_record/table',
		name: 'registration_record_table',
		component: () => import('../views/registration_record/table.vue'),
		meta: {
			index: 0,
			title: '报名记录列表'
		}
	},
	{
		path: '/registration_record/view',
		name: 'registration_record_view',
		component: () => import('../views/registration_record/view.vue'),
		meta: {
			index: 0,
			title: '报名记录详情'
		}
	},
	// 民宿信息路由
	{
		path: '/home_stay_information/table',
		name: 'home_stay_information_table',
		component: () => import('../views/home_stay_information/table.vue'),
		meta: {
			index: 0,
			title: '民宿信息列表'
		}
	},
	{
		path: '/home_stay_information/view',
		name: 'home_stay_information_view',
		component: () => import('../views/home_stay_information/view.vue'),
		meta: {
			index: 0,
			title: '民宿信息详情'
		}
	},
	// 预订信息路由
	{
		path: '/reservation_information/table',
		name: 'reservation_information_table',
		component: () => import('../views/reservation_information/table.vue'),
		meta: {
			index: 0,
			title: '预订信息列表'
		}
	},
	{
		path: '/reservation_information/view',
		name: 'reservation_information_view',
		component: () => import('../views/reservation_information/view.vue'),
		meta: {
			index: 0,
			title: '预订信息详情'
		}
	},
	// 特产信息路由
	{
		path: '/specialty_information/table',
		name: 'specialty_information_table',
		component: () => import('../views/specialty_information/table.vue'),
		meta: {
			index: 0,
			title: '特产信息列表'
		}
	},
	{
		path: '/specialty_information/view',
		name: 'specialty_information_view',
		component: () => import('../views/specialty_information/view.vue'),
		meta: {
			index: 0,
			title: '特产信息详情'
		}
	},
	// 订单结算路由
	{
		path: '/order_settlement/table',
		name: 'order_settlement_table',
		component: () => import('../views/order_settlement/table.vue'),
		meta: {
			index: 0,
			title: '订单结算列表'
		}
	},
	{
		path: '/order_settlement/view',
		name: 'order_settlement_view',
		component: () => import('../views/order_settlement/view.vue'),
		meta: {
			index: 0,
			title: '订单结算详情'
		}
	},
	// 访问数据路由
	{
		path: '/access_data/table',
		name: 'access_data_table',
		component: () => import('../views/access_data/table.vue'),
		meta: {
			index: 0,
			title: '访问数据列表'
		}
	},
	{
		path: '/access_data/view',
		name: 'access_data_view',
		component: () => import('../views/access_data/view.vue'),
		meta: {
			index: 0,
			title: '访问数据详情'
		}
	},
	// 民宿类型路由
	{
		path: '/type_of_homestay/table',
		name: 'type_of_homestay_table',
		component: () => import('../views/type_of_homestay/table.vue'),
		meta: {
			index: 0,
			title: '民宿类型列表'
		}
	},
	{
		path: '/type_of_homestay/view',
		name: 'type_of_homestay_view',
		component: () => import('../views/type_of_homestay/view.vue'),
		meta: {
			index: 0,
			title: '民宿类型详情'
		}
	},

	// 用户路由
	{
		path: '/user/table',
		name: 'user_table',
		component: () => import('../views/user/table.vue'),
		meta: {
			index: 0,
			title: '用户列表'
		}
	},
	{
		path: '/user/view',
		name: 'user_view',
		component: () => import('../views/user/view.vue'),
		meta: {
			index: 0,
			title: '用户详情'
		}
	},
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue'),
		meta: {
			index: 0,
			title: '个人信息'
		}
	},
	// 用户组路由
	{
		path: '/user_group/table',
		name: 'user_group_table',
		component: () => import('../views/user_group/table.vue'),
		meta: {
			index: 0,
			title: '用户组列表'
		}
	},
	{
		path: '/user_group/view',
		name: 'user_group_view',
		component: () => import('../views/user_group/view.vue'),
		meta: {
			index: 0,
			title: '用户组详情'
		}
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.beforeEach((to, from, next) => {
	let token = to.query.token;
	if (token){
		$.db.set("token",token,120);
	}
	next();
})

router.afterEach((to, from, next) => {
	let title = "以画眉弄为例的特色乡村旅游推介系统-admin";
	document.title = title;
})

export default router
