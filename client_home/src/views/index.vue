<template>
  <div class="page_root" id="root_demo">
    <div class="warp">
      <div class="container">
        <div class="row">
          <div class="col">
            <div class="card_ad">
              <!-- 页头 -->
              <list_ad
                :list="list_ad"
                location="店招"
                v-if="$check_action('/ad/list', 'get')"
                style="marginbottom: 0.5rem"
              />
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="warp">
      <div class="container swiper_box">
        <div class="row">
          <div class="col-12">
            <div class="sw_no">
              <!-- 轮播图组件 -->
              <div class="swiper_img">
                <swiper_img :list="list_slide" />
              </div>
                            <div class="card_notice">
                <div class="notice_title">
                    公告消息 <router-link to="notice/list">More</router-link>
                </div>
                <!-- 公告组件 -->
                <swiper_notice :list="list_notice" />
              </div>
                          </div>
          </div>
        </div>
      </div>
    </div>

    <div class="warp">
      <div class="container">
        <div class="row">
          <div class="col">
            <div class="card_ad">
              <!-- 顶部 -->
              <list_ad
                :list="list_ad"
                v-if="$check_action('/ad/list', 'get')"
                location="顶部广告"
              />
            </div>
          </div>
        </div>
      </div>
    </div>

    
    <div class="warp">
      <div class="container">
        <div class="row">
          <div class="col">
            <div class="card_ad">
              <!-- 中部 -->
              <list_ad
                :list="list_ad"
                v-if="$check_action('/ad/list', 'get')"
                location="中部广告"
              />
            </div>
          </div>
        </div>
      </div>
    </div>

        <div class="warp">
      <!-- 容器 -->
      <div class="container">
        <div class="row">
          <div class="col-12">
            <!-- 标题栏组件 -->
            <div class="article_recommend">
              <div class="title">
                <span> 旅游资讯 </span>
              </div>
              <div class="more_box">
                <router-link to="/article/list" class="more">
                  <span>More</span>
                </router-link>
              </div>
            </div>
            <!-- 旅游资讯列表组件 -->
            <list_article v-if="show_list_article" :list="list_article" />
            <div class="overflow-auto" v-else>
              <table
                id="list_article"
                role="table"
                aria-busy="false"
                :aria-colcount="fields_article.length"
                class="table b-table table-striped table-hover"
              >
                <thead>
                  <tr>
                    <th v-for="(o, i) in fields_article" :key="i">
                      {{ o.label }}
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(o, i) in list_table_article" :key="i">
                    <td
                      v-for="(oj, n) in fields_goods"
                      @click="to_details('goods', o)"
                    >
                      <img
                        v-if="oj.type && oj.type == '图片'"
                        :src="$fullUrl(o[oj.key])"
                        alt=""
                        v-default-img="'/img/default.png'"
                      />
                      <span v-else>{{ o[oj.key] }}</span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="warp">
      <div class="container">
        <div class="row">
          <div class="col">
            <div class="card_ad">
              <!-- 底部 -->
              <list_ad
                :list="list_ad"
                v-if="$check_action('/ad/list', 'get')"
                location="底部广告"
              />
            </div>
          </div>
        </div>
      </div>
    </div>

           <!-- 推荐旅游分享模块(开始) -->
    <div class="warp" v-if="$check_action('/tourism_sharing/list', 'get')">
      <!-- 容器 -->
      <div class="container">
        <div class="row">
          <div class="col-12">
            <!-- 标题栏组件 -->
            <div class="diy_recommend">
              <div class="title">
                <span> 旅游分享推荐 </span>
              </div>
              <div class="more_box">
                <router-link to="/tourism_sharing/list" class="more">
                  <span>More</span>
                </router-link>
              </div>
            </div>
            <!-- 旅游分享推荐列表组件 -->
            <list_tourism_sharing v-if="show_list_tourism_sharing" :list="list_tourism_sharing" />
            <div class="overflow-auto" v-else>
              <table
                id="list_diy"
                role="table"
                aria-busy="false"
                :aria-colcount="fields_tourism_sharing.length"
                class="table b-table table-striped table-hover"
              >
                <thead>
                  <tr>
                    <th v-for="(o,i) in fields_tourism_sharing" :key="i">
                      {{ o.label }}
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(o, i) in list_table_tourism_sharing"
                    :key="i"
                    @click="to_details('tourism_sharing', o, 'tourism_sharing_id')"
                  >
                    <td v-for="(oj,n) in fields_tourism_sharing">
                      <img
                        v-if="oj.type && oj.type == '图片'"
                        :src="$fullUrl(o[oj.key])"
                        alt=""
                        v-default-img="'/img/default.png'"
                      />
                      <span v-else-if="oj.type && oj.type == 'UID'">
                        <span style="display: none">
                          {{ get_user_by_user_id(o, oj, oj.key) }}
                        </span>
                        {{ oj.value }}
                      </span>
                      <span v-else>{{ o[oj.key] }}</span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 推荐旅游分享模块(结束) -->
          <!-- 推荐主题活动模块(开始) -->
    <div class="warp" v-if="$check_action('/thematic_activities/list', 'get')">
      <!-- 容器 -->
      <div class="container">
        <div class="row">
          <div class="col-12">
            <!-- 标题栏组件 -->
            <div class="diy_recommend">
              <div class="title">
                <span> 主题活动推荐 </span>
              </div>
              <div class="more_box">
                <router-link to="/thematic_activities/list" class="more">
                  <span>More</span>
                </router-link>
              </div>
            </div>
            <!-- 主题活动推荐列表组件 -->
            <list_thematic_activities v-if="show_list_thematic_activities" :list="list_thematic_activities" />
            <div class="overflow-auto" v-else>
              <table
                id="list_diy"
                role="table"
                aria-busy="false"
                :aria-colcount="fields_thematic_activities.length"
                class="table b-table table-striped table-hover"
              >
                <thead>
                  <tr>
                    <th v-for="(o,i) in fields_thematic_activities" :key="i">
                      {{ o.label }}
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(o, i) in list_table_thematic_activities"
                    :key="i"
                    @click="to_details('thematic_activities', o, 'thematic_activities_id')"
                  >
                    <td v-for="(oj,n) in fields_thematic_activities">
                      <img
                        v-if="oj.type && oj.type == '图片'"
                        :src="$fullUrl(o[oj.key])"
                        alt=""
                        v-default-img="'/img/default.png'"
                      />
                      <span v-else-if="oj.type && oj.type == 'UID'">
                        <span style="display: none">
                          {{ get_user_by_user_id(o, oj, oj.key) }}
                        </span>
                        {{ oj.value }}
                      </span>
                      <span v-else>{{ o[oj.key] }}</span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 推荐主题活动模块(结束) -->
            <!-- 推荐民宿信息模块(开始) -->
    <div class="warp" v-if="$check_action('/home_stay_information/list', 'get')">
      <!-- 容器 -->
      <div class="container">
        <div class="row">
          <div class="col-12">
            <!-- 标题栏组件 -->
            <div class="diy_recommend">
              <div class="title">
                <span> 民宿信息推荐 </span>
              </div>
              <div class="more_box">
                <router-link to="/home_stay_information/list" class="more">
                  <span>More</span>
                </router-link>
              </div>
            </div>
            <!-- 民宿信息推荐列表组件 -->
            <list_home_stay_information v-if="show_list_home_stay_information" :list="list_home_stay_information" />
            <div class="overflow-auto" v-else>
              <table
                id="list_diy"
                role="table"
                aria-busy="false"
                :aria-colcount="fields_home_stay_information.length"
                class="table b-table table-striped table-hover"
              >
                <thead>
                  <tr>
                    <th v-for="(o,i) in fields_home_stay_information" :key="i">
                      {{ o.label }}
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(o, i) in list_table_home_stay_information"
                    :key="i"
                    @click="to_details('home_stay_information', o, 'home_stay_information_id')"
                  >
                    <td v-for="(oj,n) in fields_home_stay_information">
                      <img
                        v-if="oj.type && oj.type == '图片'"
                        :src="$fullUrl(o[oj.key])"
                        alt=""
                        v-default-img="'/img/default.png'"
                      />
                      <span v-else-if="oj.type && oj.type == 'UID'">
                        <span style="display: none">
                          {{ get_user_by_user_id(o, oj, oj.key) }}
                        </span>
                        {{ oj.value }}
                      </span>
                      <span v-else>{{ o[oj.key] }}</span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 推荐民宿信息模块(结束) -->
            <!-- 推荐特产信息模块(开始) -->
    <div class="warp" v-if="$check_action('/specialty_information/list', 'get')">
      <!-- 容器 -->
      <div class="container">
        <div class="row">
          <div class="col-12">
            <!-- 标题栏组件 -->
            <div class="diy_recommend">
              <div class="title">
                <span> 特产信息推荐 </span>
              </div>
              <div class="more_box">
                <router-link to="/specialty_information/list" class="more">
                  <span>More</span>
                </router-link>
              </div>
            </div>
            <!-- 特产信息推荐列表组件 -->
            <list_specialty_information v-if="show_list_specialty_information" :list="list_specialty_information" />
            <div class="overflow-auto" v-else>
              <table
                id="list_diy"
                role="table"
                aria-busy="false"
                :aria-colcount="fields_specialty_information.length"
                class="table b-table table-striped table-hover"
              >
                <thead>
                  <tr>
                    <th v-for="(o,i) in fields_specialty_information" :key="i">
                      {{ o.label }}
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    v-for="(o, i) in list_table_specialty_information"
                    :key="i"
                    @click="to_details('specialty_information', o, 'specialty_information_id')"
                  >
                    <td v-for="(oj,n) in fields_specialty_information">
                      <img
                        v-if="oj.type && oj.type == '图片'"
                        :src="$fullUrl(o[oj.key])"
                        alt=""
                        v-default-img="'/img/default.png'"
                      />
                      <span v-else-if="oj.type && oj.type == 'UID'">
                        <span style="display: none">
                          {{ get_user_by_user_id(o, oj, oj.key) }}
                        </span>
                        {{ oj.value }}
                      </span>
                      <span v-else>{{ o[oj.key] }}</span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 推荐特产信息模块(结束) -->
           
    <div class="warp">
      <div class="container">
        <div class="row">
          <div class="col">
            <div class="card_link">
              <!-- 底部友情链接 -->
              <list_link
                v-if="$check_action('/link/list', 'get')"
                :list="list_link"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
	import mixin from "@/mixins/page.js";
			import list_tourism_sharing from "@/components/diy/list_tourism_sharing.vue";
			import list_thematic_activities from "@/components/diy/list_thematic_activities.vue";
				import list_home_stay_information from "@/components/diy/list_home_stay_information.vue";
				import list_specialty_information from "@/components/diy/list_specialty_information.vue";
					import bar_title from "@/components/diy/bar_title.vue";
	import list_article from "@/components/diy/list_article.vue";
	import swiper_img from "@/components/diy/swiper_img.vue";
	import list_ad from "@/components/diy/list_ad.vue";
	import list_link from "@/components/diy/list_link.vue";
	import swiper_notice from "@/components/diy/swiper_notice.vue";

	export default {
		mixins: [mixin],
		components: {
					list_tourism_sharing,
					list_thematic_activities,
						list_home_stay_information,
						list_specialty_information,
							bar_title,
			list_article,
			swiper_img,
			swiper_notice,
			list_ad,
			list_link,
		},
		data() {
			return {
				isSmall: false,
				sendValue: "",
				chatList:[],
				showChat: false,
				isAdmin: false,
				token:"",
        "list_type_commodity_type": [],
				// 文章模型数组
				list_article: [],
				vm_arr_article: [
				    "img",
				    "title",
				    "description",
				    "hits",
				    "type",
				    "tag",
				    "source",
				    "url",
				    "create_time",
				],
				fields_article: [
				    {key: "img", label: "图片"},
				    {key: "title", label: "标题"},
				    {key: "description", label: "描述"},
				    {key: "hits", label: "点击量"},
				    {key: "type", label: "分类"},
				    {key: "tag", label: "标签"},
				    {key: "source", label: "来源"},
				    {key: "url", label: "来源地址"},
				    {key: "create_time", label: "发布时间"},
				],
				show_list_article: true,
						show_list_tourism_sharing: true,
				list_tourism_sharing: [],
				vm_arr_tourism_sharing: [
					"tourism_sharing_id",
							"title",
							"cover",
							"type",
							"tourist_location",
							"release_time",
							"user_no",
							"full_name",
							"related_videos",
							"resource_acquisition",
							"details",
						],
				fields_tourism_sharing: [
										{
						key: "title",
						label: "标题",
						type: "文本"
					},
													{
						key: "cover",
						label: "封面",
						type: "图片"
					},
													{
						key: "type",
						label: "类型",
						type: "文本"
					},
													{
						key: "tourist_location",
						label: "旅游地点",
						type: "文本"
					},
													{
						key: "release_time",
						label: "发布时间",
						type: "日期"
					},
													{
						key: "user_no",
						label: "用户编号",
						type: "UID"
					},
													{
						key: "full_name",
						label: "姓名",
						type: "文本"
					},
													{
						key: "related_videos",
						label: "相关视频",
						type: "视频"
					},
													{
						key: "resource_acquisition",
						label: "资源获取",
						type: "网址"
					},
													{
						key: "details",
						label: "详情介绍",
						type: "编辑"
					},
									],
						show_list_thematic_activities: true,
				list_thematic_activities: [],
				vm_arr_thematic_activities: [
					"thematic_activities_id",
							"activity_name",
							"picture",
							"activity_type",
							"event_location",
							"activity_time",
							"event_details",
						],
				fields_thematic_activities: [
										{
						key: "activity_name",
						label: "活动名称",
						type: "文本"
					},
													{
						key: "picture",
						label: "图片",
						type: "图片"
					},
													{
						key: "activity_type",
						label: "活动类型",
						type: "文本"
					},
													{
						key: "event_location",
						label: "活动地点",
						type: "文本"
					},
													{
						key: "activity_time",
						label: "活动时间",
						type: "日期"
					},
													{
						key: "event_details",
						label: "活动详情",
						type: "编辑"
					},
									],
							show_list_home_stay_information: true,
				list_home_stay_information: [],
				vm_arr_home_stay_information: [
					"home_stay_information_id",
							"title",
							"cover",
							"type",
							"house_type",
							"square",
							"price",
							"supporting_facilities",
							"advance_deposit",
							"home_address",
							"details",
						],
				fields_home_stay_information: [
										{
						key: "title",
						label: "标题",
						type: "文本"
					},
													{
						key: "cover",
						label: "封面",
						type: "图片"
					},
													{
						key: "type",
						label: "类型",
						type: "下寻"
					},
													{
						key: "house_type",
						label: "户型",
						type: "文本"
					},
													{
						key: "square",
						label: "平方",
						type: "文本"
					},
													{
						key: "price",
						label: "价格",
						type: "文本"
					},
													{
						key: "supporting_facilities",
						label: "配套设施",
						type: "文本"
					},
													{
						key: "advance_deposit",
						label: "预付定金",
						type: "数字"
					},
													{
						key: "home_address",
						label: "民宿地址",
						type: "文本"
					},
													{
						key: "details",
						label: "详情介绍",
						type: "编辑"
					},
									],
							show_list_specialty_information: true,
				list_specialty_information: [],
				vm_arr_specialty_information: [
					"specialty_information_id",
							"number",
							"name",
							"picture",
							"type",
							"price",
							"details",
						],
				fields_specialty_information: [
										{
						key: "number",
						label: "编号",
						type: "文本"
					},
													{
						key: "name",
						label: "名称",
						type: "文本"
					},
													{
						key: "picture",
						label: "图片",
						type: "图片"
					},
													{
						key: "type",
						label: "类型",
						type: "文本"
					},
													{
						key: "price",
						label: "价格",
						type: "数字"
					},
													{
						key: "details",
						label: "详情",
						type: "编辑"
					},
									],
								list_slide: [],
				list_menu: [],
				list_link: [],
				list_notice: [],
				list_ad: []
			};
		},
		created(){
			this.get_token();
		},
		methods: {
			get_token(){
				let token = this.$route.query.token
				if (token){
					$.db.set("token",token,120);
					location.href = "http://localhost:8081/"
				}
			},
					// toggle
			toToggle(){
				this.isAdmin = !this.isAdmin;
			},

					// 获取旅游分享列表
			get_tourism_sharing() {
				let url = "~/api/tourism_sharing/get_list?";
								// url = "~/api/tourism_sharing/get_list?orderby=hits desc";
								this.$get(url, {
									"orderby": "hits desc",
							"page": 1,
					"size": 8
				}, (json) => {
					if (json.result) {
						this.list_tourism_sharing = json.result.list;
					}
				})
			},
					// 获取主题活动列表
			get_thematic_activities() {
				let url = "~/api/thematic_activities/get_list?";
										this.$get(url, {
									"page": 1,
					"size": 8
				}, (json) => {
					if (json.result) {
						this.list_thematic_activities = json.result.list;
					}
				})
			},
						// 获取民宿信息列表
			get_home_stay_information() {
				let url = "~/api/home_stay_information/get_list?";
										this.$get(url, {
									"page": 1,
					"size": 8
				}, (json) => {
					if (json.result) {
						this.list_home_stay_information = json.result.list;
					}
				})
			},
						// 获取特产信息列表
			get_specialty_information() {
				let url = "~/api/specialty_information/get_list?";
										this.$get(url, {
									"page": 1,
					"size": 8
				}, (json) => {
					if (json.result) {
						this.list_specialty_information = json.result.list;
					}
				})
			},
				
			/**
			 * 当前年月日时分秒方法
			 * @param {Object} fmt
			 */
			dateFormat(fmt) {
				var myDate = new Date();
				var o = {
					"M+": myDate.getMonth() + 1, // 月份
					"d+": myDate.getDate(), // 日
					"h+": myDate.getHours(), // 小时
					"m+": myDate.getMinutes(), // 分
					"s+": myDate.getSeconds(), // 秒
					"q+": Math.floor((myDate.getMonth() + 3) / 3), // 季度
					"S": myDate.getMilliseconds() // 毫秒
				};
				if (/(y+)/.test(fmt))
					fmt = fmt.replace(RegExp.$1, (myDate.getFullYear() + "").substr(4 - RegExp.$1.length));
				for (var k in o)
					if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
						return fmt;
			},

			// 获取轮播图
			get_slides() {
			    this.$get("~/api/slides/get_list?", {}, (json) => {
			        if (json.result) {
			            this.list_slide = json.result.list;
			        }
			    });
			},
			// 获取导航栏
			get_menu() {
				var user_group = this.user_group;
			    this.$get(
			        "~/api/auth/get_list?",
			        {
			            page: "",
						user_group,
						get: 1,
						position: "top"
			        },
			        (json) => {
			            if (json.result) {
			                this.list_menu = json.result.list;
			            }
			        }
			    );
			},
			// 获取文章
			get_article() {
			    this.$get(
			        "~/api/article/get_list?",
			        {
			            page: 1,
			            size: 4,
			        },
			        (json) => {
			            if (json.result) {
			                var list_article = json.result.list;
			                this.list_article = list_article;
			            }
			        }
			    );
			},
			// 获取广告
			get_ad() {
			    this.$get(
			        "~/api/ad/get_list?",
			        {
			            orderby: '`display` desc'
			        },
			        (json) => {
			            if (json.result) {
			                var list_ad = json.result.list;
			                this.list_ad = list_ad;
			            }
			        }
			    );
			},
			// 获取链接列表
			get_link() {
			    this.$get(
			        "~/api/link/get_list?",
			        {
			            page: 1,
			            size: 8,
			        },
			        (json) => {
			            if (json.result) {
			                var list_link = json.result.list;
			                this.list_link = list_link;
			            }
			        }
			    );
			},
			// 获取公告列表
			get_notice() {
			    this.$get(
			        "~/api/notice/get_list?",
			        {
			            page: 1,
			            size: 3,
			        },
			        (json) => {
			            if (json.result) {
			                var list_notice = json.result.list;
			                this.list_notice = list_notice;
			            }
			        }
			    );
			},
			to_details(key,o,id) {
				if(!id){
					id = key + "_id";
				}
			    this.$router.push('/' + key + '/details?' + id + '=' + o[id]);
			}
		},
		mounted() {
					this.get_tourism_sharing();
					this.get_thematic_activities();
						this.get_home_stay_information();
						this.get_specialty_information();
							this.get_menu();
			this.get_slides();
			this.get_article();
			// this.get_link();
			this.get_notice();
			// this.get_ad();
		},
		computed: {
				    list_table_type_of_homestay() {
		        var list = this.list_tourism_sharing;
		        var list_table = [];
		        for (let i = 0; i < list.length; i++) {
		            list_table[i] = {};
		            this.vm_arr_tourism_sharing.map((o) => {
		                // 第二个中括号是对象的属性
		                list_table[i][o] = list[i][o] || "";
		            });
		        }
		        return list_table;
		    },
				    list_table_type_of_homestay() {
		        var list = this.list_thematic_activities;
		        var list_table = [];
		        for (let i = 0; i < list.length; i++) {
		            list_table[i] = {};
		            this.vm_arr_thematic_activities.map((o) => {
		                // 第二个中括号是对象的属性
		                list_table[i][o] = list[i][o] || "";
		            });
		        }
		        return list_table;
		    },
					    list_table_type_of_homestay() {
		        var list = this.list_home_stay_information;
		        var list_table = [];
		        for (let i = 0; i < list.length; i++) {
		            list_table[i] = {};
		            this.vm_arr_home_stay_information.map((o) => {
		                // 第二个中括号是对象的属性
		                list_table[i][o] = list[i][o] || "";
		            });
		        }
		        return list_table;
		    },
					    list_table_type_of_homestay() {
		        var list = this.list_specialty_information;
		        var list_table = [];
		        for (let i = 0; i < list.length; i++) {
		            list_table[i] = {};
		            this.vm_arr_specialty_information.map((o) => {
		                // 第二个中括号是对象的属性
		                list_table[i][o] = list[i][o] || "";
		            });
		        }
		        return list_table;
		    },
				

		    list_table_article() {
		        var list = this.list_article;
		        var list_table = [];
		        for (let i = 0; i < list.length; i++) {
		            list_table[i] = {};
		            this.vm_arr_article.map((o) => {
		                // 第二个中括号是对象的属性
		                list_table[i][o] = list[i][o] || "";
		            });
		        }
		        return list_table;
		    },
		}
	};
</script>

<style scoped>
.page_root {
  position: relative;
}
.support_entry {
  position: fixed;
  top: 400px;
  right: 20px;
  width: 80px;
  height: 80px;
  cursor: pointer;
  z-index: 99999;
}
.support_module .container {
  /* height: 650px; */
  height: 70%;
  width: 700px;
  border-radius: 4px;
  border: 0.5px solid #e0e0e0;
  background-color: #f5f5f5;
  /* display: flex;
        flex-flow: column; */
  overflow: hidden;
  position: fixed;
  /* top: 100px; */
  padding: 0;
  margin-left: -350px;
  z-index: 99999999;
}
.support_module .small_css {
  height: 40px;
  width: 200px;
  right: 0;
  bottom: 0px;
}
.support_module .big_css {
  top: 60px;
  left: 50%;
}
.support_module .content {
  width: calc(100% - 0px);
  padding: 20px 30px;
  overflow-y: scroll;
  height: 70%;
}
.support_module .content::-webkit-scrollbar {
  display: none;
}
.support_module_title {
  text-align: right;
  height: 40px;
  line-height: 40px;
  border-bottom: 1px solid #ccc;
}
.support_module_title .title_btn {
  font-size: 20px;
  cursor: pointer;
  margin-right: 20px;
  color: #888;
}
.support_module .content:hover::-webkit-scrollbar-thumb {
  background: rgba(0, 0, 0, 0.1);
}
.support_module .bubble {
  max-width: 400px;
  padding: 10px;
  border-radius: 5px;
  position: relative;
  color: #000;
  word-wrap: break-word;
  word-break: normal;
}
.support_module .item_left .bubble {
  margin-left: 15px;
  background-color: #fff;
}
.support_module .item_left .bubble:before {
  content: '';
  position: absolute;
  width: 0;
  height: 0;
  border-left: 10px solid transparent;
  border-top: 10px solid transparent;
  border-right: 10px solid #fff;
  border-bottom: 10px solid transparent;
  left: -20px;
}
.support_module .item_right .bubble {
  margin-right: 15px;
  background-color: #9eea6a;
}
.support_module .item_right .bubble:before {
  content: '';
  position: absolute;
  width: 0;
  height: 0;
  border-left: 10px solid #9eea6a;
  border-top: 10px solid transparent;
  border-right: 10px solid transparent;
  border-bottom: 10px solid transparent;
  left: none;

  right: -20px;
}
.support_module .item {
  margin-top: 15px;
  display: flex;
  width: 100%;
}
.support_module .item.item_right {
  justify-content: flex-end;
  min-width: 400px;
}
.support_module .item.item-center {
  justify-content: center;
}
.support_module .item.item-center span {
  font-size: 12px;
  padding: 2px 4px;
  color: #fff;
  background-color: #dadada;
  border-radius: 3px;
  -moz-user-select: none; /*火狐*/
  -webkit-user-select: none; /*webkit浏览器*/
  -ms-user-select: none; /*IE10*/
  -khtml-user-select: none; /*早期浏览器*/
  user-select: none;
}

.support_module .avatar img {
  width: 42px;
  height: 42px;
  border-radius: 50%;
}
.support_module .input-area {
  border-top: 0.5px solid #e0e0e0;
  height: 16%;

  background-color: #fff;
}
.support_module textarea {
  flex: 1;
  padding: 10px;
  font-size: 14px;
  border: none;
  overflow-y: auto;
  overflow-x: hidden;
  outline: none;
  resize: none;
  width: 102%;
  height: 100%;
  min-height: 100%;
  max-height: 100%;
}
.support_module .button-area {
  display: flex;
  height: 50px;
  line-height: 50px;
  padding: 5px;
  justify-content: flex-end;
  text-align: right;
  width: 100%;
  background: #fff;
}
.support_module .button-area button {
  width: 80px;
  height: 40px;
  line-height: 40px;
  border: none;
  outline: none;
  border-radius: 4px;
  float: right;
  cursor: pointer;
  background: #9eea6a;
  color: #333;
  margin: 0px;
}

/* 设置滚动条的样式 */
::-webkit-scrollbar {
  width: 10px;
}
/* 滚动槽 */
::-webkit-scrollbar-track {
  -webkit-box-shadow: inset006pxrgba(0, 0, 0, 0.3);
  border-radius: 8px;
}
/* 滚动条滑块 */
::-webkit-scrollbar-thumb {
  border-radius: 10px;
  background: rgba(0, 0, 0, 0);
  -webkit-box-shadow: inset006pxrgba(0, 0, 0, 0.5);
}

.sw_no {
  margin: 0.5rem;
  display: flex;
  flex-wrap: wrap;
}

.swiper_img {
  width: 60%;
  height: 18.75rem;
}

.card_notice {
  width: 40%;
  padding-left: 1rem;
  height: 18.75rem;
}

.notice_title {
  font-size: 1.2rem;
  font-weight: bold;
  color: white;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #d2d2d2;
  height: 3rem;
  padding: 0 1.5rem;
}

.article_recommend > * {
  display: flex;
  justify-content: center;
  align-items: center;
}

.article_recommend {
  display: block;
  margin: 1.5rem 0.5rem;
  height: 4rem;
  border-radius: 0.5rem;
  background-color: var(--color_primary);
}

.diy_recommend > * {
  display: flex;
  justify-content: center;
  align-items: center;
}

.diy_recommend {
  display: block;
  margin: 1.5rem 0.5rem;
  height: 4rem;
  border-radius: 0.5rem;
  background-color: var(--color_primary);
}

.title {
  float: left;
  height: 4rem;
  color: white;
  font-size: 1.5rem;
  font-weight: bold;
  padding-left: 1rem;
}

.more_box {
  float: right;
  height: 4rem;
  color: white;
  font-size: 1.5rem;
  padding-right: 1rem;
}

.more_box .more {
  border-radius: 0.5rem;
  border: 0.125rem solid white;
  display: flex;
  align-items: center;
  font-size: 1.2rem;
  justify-content: center;
  height: 3rem;
  width: 3.5rem;
}

.switch {
  float: right;
  height: 4rem;
  color: white;
  padding-right: 1rem;
}

.switch_box {
  border-radius: 0.5rem;
  border: 0.125rem solid white;
  display: flex;
  align-items: center;
  font-size: 1.2rem;
  justify-content: center;
  height: 3rem;
  width: 6rem;
}

.switch_box:hover,
.more:hover {
  background-color: white;
  color: var(--color_primary) !important;
}

.overflow-auto .table th,
.overflow-auto .table td {
  text-align: center;
  text-wrap: normal;
  font-size: 1rem;
  vertical-align: middle;
}

/*.page_index {*/
/*    margin: 0 auto;*/
/*    max-width: 1200px;*/
/*}*/

/*.main {*/
/*    display: flex;*/
/*    justify-content: space-between;*/
/*}*/

/*.content {*/
/*    flex: 0 0 79%;*/
/*}*/

/*.aside {*/
/*    flex: 0 0 20%;*/
/*}*/

.card_ad {
  margin-top: 1rem;
}

@media (max-width: 996px) {
  .swiper_img {
    width: 100%;
    height: 12.5rem;
  }

  .card_notice {
    width: 100%;
    padding-left: 0;
  }
}
</style>
