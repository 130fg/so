<template>
  <div class="page_search">
	<div class="warp">
	  <div class="container">
		<div class="row">
		  <div class="col-12">
			<div class="card_result_search">
			  <div class="title">搜索结果</div>

				<!--{if filter.article}-->
				<!-- 文章搜索结果 -->
			  <list_result_search
				:list="result_article"
				title="旅游资讯"
				source_table="article"
			  ></list_result_search>
				<!--{/if}-->


									  <list_result_search
				v-if="$check_action('/registered_users/list', 'get')"
				:list="result_registered_users_full_name"
				title="注册用户姓名"
				source_table="registered_users"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/tourism_sharing/list', 'get')"
				:list="result_tourism_sharing_title"
				title="旅游分享标题"
				source_table="tourism_sharing"
			  ></list_result_search>
											  <list_result_search
				v-if="$check_action('/tourism_sharing/list', 'get')"
				:list="result_tourism_sharing_type"
				title="旅游分享类型"
				source_table="tourism_sharing"
			  ></list_result_search>
																														  <list_result_search
				v-if="$check_action('/thematic_activities/list', 'get')"
				:list="result_thematic_activities_activity_name"
				title="主题活动活动名称"
				source_table="thematic_activities"
			  ></list_result_search>
																								  <list_result_search
				v-if="$check_action('/registration_record/list', 'get')"
				:list="result_registration_record_activity_name"
				title="报名记录活动名称"
				source_table="registration_record"
			  ></list_result_search>
																							  <list_result_search
				v-if="$check_action('/registration_record/list', 'get')"
				:list="result_registration_record_full_name"
				title="报名记录姓名"
				source_table="registration_record"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/home_stay_information/list', 'get')"
				:list="result_home_stay_information_title"
				title="民宿信息标题"
				source_table="home_stay_information"
			  ></list_result_search>
											  <list_result_search
				v-if="$check_action('/home_stay_information/list', 'get')"
				:list="result_home_stay_information_type"
				title="民宿信息类型"
				source_table="home_stay_information"
			  ></list_result_search>
																														  <list_result_search
				v-if="$check_action('/reservation_information/list', 'get')"
				:list="result_reservation_information_title"
				title="预订信息标题"
				source_table="reservation_information"
			  ></list_result_search>
																							  <list_result_search
				v-if="$check_action('/reservation_information/list', 'get')"
				:list="result_reservation_information_full_name"
				title="预订信息姓名"
				source_table="reservation_information"
			  ></list_result_search>
																		  <list_result_search
				v-if="$check_action('/specialty_information/list', 'get')"
				:list="result_specialty_information_number"
				title="特产信息编号"
				source_table="specialty_information"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/specialty_information/list', 'get')"
				:list="result_specialty_information_name"
				title="特产信息名称"
				source_table="specialty_information"
			  ></list_result_search>
																								  <list_result_search
				v-if="$check_action('/order_settlement/list', 'get')"
				:list="result_order_settlement_name"
				title="订单结算名称"
				source_table="order_settlement"
			  ></list_result_search>
																	  <list_result_search
				v-if="$check_action('/order_settlement/list', 'get')"
				:list="result_order_settlement_full_name"
				title="订单结算姓名"
				source_table="order_settlement"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/access_data/list', 'get')"
				:list="result_access_data_title"
				title="访问数据标题"
				source_table="access_data"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/type_of_homestay/list', 'get')"
				:list="result_type_of_homestay_type_name"
				title="民宿类型类型名称"
				source_table="type_of_homestay"
			  ></list_result_search>
						</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</template>

<script>
import mixin from "../../mixins/page.js";
import list_result_search from "../../components/diy/list_result_search.vue";

export default {
  mixins: [mixin],
  data() {
	return {
	  "query": {
		word: "",
	  },
	  "result_article": [],
									"result_registered_users_full_name":[],
												"result_tourism_sharing_title":[],
											"result_tourism_sharing_type":[],
																														"result_thematic_activities_activity_name":[],
																								"result_registration_record_activity_name":[],
																							"result_registration_record_full_name":[],
																					"result_home_stay_information_title":[],
											"result_home_stay_information_type":[],
																														"result_reservation_information_title":[],
																							"result_reservation_information_full_name":[],
																		"result_specialty_information_number":[],
								"result_specialty_information_name":[],
																								"result_order_settlement_name":[],
																	"result_order_settlement_full_name":[],
																					"result_access_data_title":[],
																					"result_type_of_homestay_type_name":[],
				};
  },
  methods: {
	/**
	 * 获取文章
	 */
	get_article() {
	  this.$get("~/api/article/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_article = json.result.list;
		}
	  });
	},

							/**
	 * 获取full_name
	 */
	get_registered_users_full_name(){
		let url = "~/api/registered_users/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "full_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_registered_users_full_name = json.result.list;
			result_registered_users_full_name.map(o => o.title = o['full_name'])
	  			this.result_registered_users_full_name = result_registered_users_full_name
		 	}
		});
	},
										/**
	 * 获取title
	 */
	get_tourism_sharing_title(){
		let url = "~/api/tourism_sharing/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "title": this.query.word }, (json) => {
		  if (json.result) {
			var result_tourism_sharing_title = json.result.list;
			result_tourism_sharing_title.map(o => o.title = o['title'])
	  			this.result_tourism_sharing_title = result_tourism_sharing_title
		 	}
		});
	},
									/**
	 * 获取type
	 */
	get_tourism_sharing_type(){
		let url = "~/api/tourism_sharing/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "type": this.query.word }, (json) => {
		  if (json.result) {
			var result_tourism_sharing_type = json.result.list;
			result_tourism_sharing_type.map(o => o.title = o['type'])
	  			this.result_tourism_sharing_type = result_tourism_sharing_type
		 	}
		});
	},
																												/**
	 * 获取activity_name
	 */
	get_thematic_activities_activity_name(){
		let url = "~/api/thematic_activities/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "activity_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_thematic_activities_activity_name = json.result.list;
			result_thematic_activities_activity_name.map(o => o.title = o['activity_name'])
	  			this.result_thematic_activities_activity_name = result_thematic_activities_activity_name
		 	}
		});
	},
																						/**
	 * 获取activity_name
	 */
	get_registration_record_activity_name(){
		let url = "~/api/registration_record/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "activity_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_registration_record_activity_name = json.result.list;
			result_registration_record_activity_name.map(o => o.title = o['activity_name'])
	  			this.result_registration_record_activity_name = result_registration_record_activity_name
		 	}
		});
	},
																					/**
	 * 获取full_name
	 */
	get_registration_record_full_name(){
		let url = "~/api/registration_record/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "full_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_registration_record_full_name = json.result.list;
			result_registration_record_full_name.map(o => o.title = o['full_name'])
	  			this.result_registration_record_full_name = result_registration_record_full_name
		 	}
		});
	},
																			/**
	 * 获取title
	 */
	get_home_stay_information_title(){
		let url = "~/api/home_stay_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "title": this.query.word }, (json) => {
		  if (json.result) {
			var result_home_stay_information_title = json.result.list;
			result_home_stay_information_title.map(o => o.title = o['title'])
	  			this.result_home_stay_information_title = result_home_stay_information_title
		 	}
		});
	},
									/**
	 * 获取type
	 */
	get_home_stay_information_type(){
		let url = "~/api/home_stay_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "type": this.query.word }, (json) => {
		  if (json.result) {
			var result_home_stay_information_type = json.result.list;
			result_home_stay_information_type.map(o => o.title = o['type'])
	  			this.result_home_stay_information_type = result_home_stay_information_type
		 	}
		});
	},
																												/**
	 * 获取title
	 */
	get_reservation_information_title(){
		let url = "~/api/reservation_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "title": this.query.word }, (json) => {
		  if (json.result) {
			var result_reservation_information_title = json.result.list;
			result_reservation_information_title.map(o => o.title = o['title'])
	  			this.result_reservation_information_title = result_reservation_information_title
		 	}
		});
	},
																					/**
	 * 获取full_name
	 */
	get_reservation_information_full_name(){
		let url = "~/api/reservation_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "full_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_reservation_information_full_name = json.result.list;
			result_reservation_information_full_name.map(o => o.title = o['full_name'])
	  			this.result_reservation_information_full_name = result_reservation_information_full_name
		 	}
		});
	},
																/**
	 * 获取number
	 */
	get_specialty_information_number(){
		let url = "~/api/specialty_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "number": this.query.word }, (json) => {
		  if (json.result) {
			var result_specialty_information_number = json.result.list;
			result_specialty_information_number.map(o => o.title = o['number'])
	  			this.result_specialty_information_number = result_specialty_information_number
		 	}
		});
	},
						/**
	 * 获取name
	 */
	get_specialty_information_name(){
		let url = "~/api/specialty_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "name": this.query.word }, (json) => {
		  if (json.result) {
			var result_specialty_information_name = json.result.list;
			result_specialty_information_name.map(o => o.title = o['name'])
	  			this.result_specialty_information_name = result_specialty_information_name
		 	}
		});
	},
																						/**
	 * 获取name
	 */
	get_order_settlement_name(){
		let url = "~/api/order_settlement/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "name": this.query.word }, (json) => {
		  if (json.result) {
			var result_order_settlement_name = json.result.list;
			result_order_settlement_name.map(o => o.title = o['name'])
	  			this.result_order_settlement_name = result_order_settlement_name
		 	}
		});
	},
															/**
	 * 获取full_name
	 */
	get_order_settlement_full_name(){
		let url = "~/api/order_settlement/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "full_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_order_settlement_full_name = json.result.list;
			result_order_settlement_full_name.map(o => o.title = o['full_name'])
	  			this.result_order_settlement_full_name = result_order_settlement_full_name
		 	}
		});
	},
																			/**
	 * 获取title
	 */
	get_access_data_title(){
		let url = "~/api/access_data/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "title": this.query.word }, (json) => {
		  if (json.result) {
			var result_access_data_title = json.result.list;
			result_access_data_title.map(o => o.title = o['title'])
	  			this.result_access_data_title = result_access_data_title
		 	}
		});
	},
																			/**
	 * 获取type_name
	 */
	get_type_of_homestay_type_name(){
		let url = "~/api/type_of_homestay/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "type_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_type_of_homestay_type_name = json.result.list;
			result_type_of_homestay_type_name.map(o => o.title = o['type_name'])
	  			this.result_type_of_homestay_type_name = result_type_of_homestay_type_name
		 	}
		});
	},
			
  },
  components: { list_result_search },
	created(){
    this.query.word = this.$route.query.word || "";
  },
  mounted() {
	this.get_article();
								this.get_registered_users_full_name();
											this.get_tourism_sharing_title();
										this.get_tourism_sharing_type();
																													this.get_thematic_activities_activity_name();
																							this.get_registration_record_activity_name();
																						this.get_registration_record_full_name();
																				this.get_home_stay_information_title();
										this.get_home_stay_information_type();
																													this.get_reservation_information_title();
																						this.get_reservation_information_full_name();
																	this.get_specialty_information_number();
							this.get_specialty_information_name();
																							this.get_order_settlement_name();
																this.get_order_settlement_full_name();
																				this.get_access_data_title();
																				this.get_type_of_homestay_type_name();
			  },
  watch: {
	$route() {
	  $.push(this.query, this.$route.query);
	  this.get_article();
							  this.get_registered_users_full_name();
										  this.get_tourism_sharing_title();
									  this.get_tourism_sharing_type();
																												  this.get_thematic_activities_activity_name();
																						  this.get_registration_record_activity_name();
																					  this.get_registration_record_full_name();
																			  this.get_home_stay_information_title();
									  this.get_home_stay_information_type();
																												  this.get_reservation_information_title();
																					  this.get_reservation_information_full_name();
																  this.get_specialty_information_number();
						  this.get_specialty_information_name();
																						  this.get_order_settlement_name();
															  this.get_order_settlement_full_name();
																			  this.get_access_data_title();
																			  this.get_type_of_homestay_type_name();
				},
  },
};
</script>

<style scoped>
.card_search {
  text-align: center;
}
.card_result_search>.title {
  text-align: center;
  padding: 10px 0;
}
</style>
