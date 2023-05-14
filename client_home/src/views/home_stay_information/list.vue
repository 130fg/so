<template>
	<div class="diy_list page_home_stay_information" id="home_stay_information_list">
		<div class="warp">
			<div class="container diy_list_container">
				<div class="diy_list_title">
					<div class="col">
						<span class="title">民宿信息列表</span>
					</div>
				</div>
				<div class="row diy_list_search">
					<div class="col">
						<!-- 搜索栏 -->
						<div class="view">
							<span class="diy_list_search_title">关键字搜索：</span>
								<b-form-input size="sm" class="mr-sm-2" placeholder="标题搜索" v-model="query['title']" />
										<b-form-input size="sm" class="mr-sm-2" placeholder="类型搜索" v-model="query['type']" />
															<b-button size="sm" @click="search()" >
								<b-icon icon="search"/>
							</b-button>
						</div>
						<!-- /搜索栏 -->
					</div>
				</div>
				<div class="diy_list_select_box">
					<span class="diy_list_select_title">下拉搜索：</span>
						<div class="diy_list_dropdown_box">
						<div class="col">
							<!-- 筛选 -->
							<div class="view">
											<div class="bar_filter">
				<div class="bar_filter" style="font-weight: 700;
    color: #fff;
    font-size: 22px;">类型</div>
				<button type="button" class="btn btn-secondary"
						@click="filter_set('全部','type')">全部</button>
				<button type="button" class="btn btn-secondary" v-for="(o, i) in list_type"
						:key="i"
						@click="filter_set(o['type_name'],'type')">{{ o['type_name'] }}</button>
			</div>
																	</div>
							<!-- /筛选 -->
						</div>
					</div>
					<div class="diy_list_sort_box">
						<div class="col">
							<!-- 排序 -->
							<div class="view">
								<div class="bar_filter" style="font-weight: 700;
    color: #fff;
    font-size: 22px;">排序</div>
                                <!-- 排序 -->
                                <div
                                        class="bar_sort"
                                        :class="{ active: query.orderby == '`hits` desc' }"
                                >
                                    <button type="button" class="btn btn-secondary" v-for="(o, i) in list_sort"
                                    :key="i" @click="set_sort(o)">{{ o.name }}</button>
                                </div>
							</div>
							<!--/排序 -->
						</div>
					</div>
				</div>

				<div class="row diy_list_box">
					<div class="col">
						<!-- 列表 -->
						<list_home_stay_information :list="list" />
						<!-- /列表 -->
					</div>
				</div>
				<div class="row diy_list_page_box">
					<div class="col overflow-auto flex_cc">
						<!-- 分页器 -->
<!--						<diy_pager v-model="query['page']" :size="query['size']" :count="count" v-on:toPage="toPage" v-on:toSize="toSize" ></diy_pager>-->
            <b-pagination
                v-model="query.page"
                :total-rows="count"
                :per-page="query.size"
                @change="goToPage"
            />
						<!-- /分页器 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import list_home_stay_information from "@/components/diy/list_home_stay_information.vue";
	import diy_pager from "@/components/diy/diy_pager";
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		components: {
			diy_pager,
			list_home_stay_information
		},
		data() {
			return {
				url_get_list: "~/api/home_stay_information/get_list?like=0",

				// 查询条件
				query: {
					keyword: "",
					page: 1,
					size: 10,
								"title": "", // 标题
												"type": "", // 类型
														},

				// 排序内容
				list_sort: [{
						name: "创建时间从高到低",
						value: "create_time desc",
					},
					{
						name: "创建时间从低到高",
						value: "create_time asc",
					},
					{
						name: "更新时间从高到低",
						value: "update_time desc",
					},
					{
						name: "更新时间从低到高",
						value: "update_time asc",
					},
						{
						name: "标题正序",
						value: "title asc",
					},
					{
						name: "标题倒序",
						value: "title desc",
					},
								{
						name: "类型正序",
						value: "type asc",
					},
					{
						name: "类型倒序",
						value: "type desc",
					},
												],

									// 类型列表
				"list_type": [""],
																
			}
		},
		methods: {
      get_list_before(param) {
      },
			/**
			 * 筛选选择
			 */
			filter_set(o,key) {
			    if (o == "全部") {
			        this.query[key] = "";
			    } else {
			        this.query[key] = o;
			    }
			    this.search();
			},

			/**
			 * 排序
			 */
			set_sort(o) {
			    this.query.orderby = o.value;
			    this.search();
			},


						/**
			 * 获取类型列表
			 */
			async get_list_type() {
				var json = await this.$get("~/api/type_of_homestay/get_list?");
				if (json.result) {
					this.list_type = json.result.list;
				} else if (json.error) {
					console.log(json.error);
				}
			},
								
			/**
			 * 筛选
			 */
													filter_type(o) {
				if (o == "全部") {
					this.query["type"] = "";
				} else {
					this.query["type"] = o;
				}
				this.search();
			},
															/**
			 * 重置
			 */
			reset() {
							this.query.title = ""
											this.query.type = ""
														this.search();
			},

			// 返回条数
			toSize(i){
				this.query.size = i;
				this.first();
			},

			// 返回页数
			toPage(i){
				this.query.page = i;
				this.first();
			},

      goToPage(v){
        this.query.page = v;
        this.goToNew(v)
      },

		},
		computed: {
		},
		created() {
								/**
			 * 获取类型列表
			 */
			this.get_list_type();
																		}
	}
</script>

<style>
</style>
