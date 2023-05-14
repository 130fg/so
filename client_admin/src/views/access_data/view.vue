<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','title') || $check_field('add','title') || $check_field('set','title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题" prop="title">
												<el-input id="title" v-model="form['title']" placeholder="请输入标题"
							  v-if="user_group === '管理员' || (form['access_data_id'] && $check_field('set','title')) || (!form['access_data_id'] && $check_field('add','title'))" :disabled="disabledObj['title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title')">{{form['title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','access_period') || $check_field('add','access_period') || $check_field('set','access_period')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="访问时段" prop="access_period">
								<el-date-picker :disabled="disabledObj['access_period_isDisabled']" v-if="user_group === '管理员' || (form['access_data_id'] && $check_field('set','access_period')) || (!form['access_data_id'] && $check_field('add','access_period'))" id="access_period"
						v-model="form['access_period']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','access_period')">{{form['access_period']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','user_location') || $check_field('add','user_location') || $check_field('set','user_location')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="用户位置" prop="user_location">
												<el-input id="user_location" v-model="form['user_location']" placeholder="请输入用户位置"
							  v-if="user_group === '管理员' || (form['access_data_id'] && $check_field('set','user_location')) || (!form['access_data_id'] && $check_field('add','user_location'))" :disabled="disabledObj['user_location_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','user_location')">{{form['user_location']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','number_of_visitors') || $check_field('add','number_of_visitors') || $check_field('set','number_of_visitors')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="访问人数" prop="number_of_visitors">
								<el-input-number id="number_of_visitors" v-model.number="form['number_of_visitors']"
						v-if="user_group === '管理员' || (form['access_data_id'] && $check_field('set','number_of_visitors')) || (!form['access_data_id'] && $check_field('add','number_of_visitors'))" :disabled="disabledObj['number_of_visitors_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','number_of_visitors')">{{form['number_of_visitors']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','notes') || $check_field('add','notes') || $check_field('set','notes')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="备注说明" prop="notes">
												<el-input id="notes" v-model="form['notes']" placeholder="请输入备注说明"
							  v-if="user_group === '管理员' || (form['access_data_id'] && $check_field('set','notes')) || (!form['access_data_id'] && $check_field('add','notes'))" :disabled="disabledObj['notes_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','notes')">{{form['notes']}}</div>
											</el-form-item>
			</el-col>
					
	
	

	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "access_data_id",
				url_add: "~/api/access_data/add?",
				url_set: "~/api/access_data/set?",
				url_get_obj: "~/api/access_data/get_obj?",
				url_upload: "~/api/access_data/upload?",

				query: {
					"access_data_id": 0,
				},

				form: {
								"title":  '', // 标题
										"access_period":  '', // 访问时段
										"user_location":  '', // 用户位置
										"number_of_visitors":  0, // 访问人数
										"notes":  '', // 备注说明
											"access_data_id": 0, // ID
						
				},
				disabledObj:{
								"title_isDisabled": false,
										"access_period_isDisabled": false,
										"user_location_isDisabled": false,
					          			"number_of_visitors_isDisabled": false,
										"notes_isDisabled": false,
										},

	
		
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																			
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
				        if (this.form["access_period"].indexOf("-")===-1){
          this.form["access_period"] = this.$toTime(parseInt(this.form["access_period"]),"yyyy-MM-dd")
        }
											$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


					        if(this.form["access_period"]=="0000-00-00"){
          this.form["access_period"] = null;
        }
				if(parseInt(this.form["access_period"]) > 9999){
					this.form["access_period"] = this.$toTime(parseInt(this.form["access_period"]),"yyyy-MM-dd")
				}
											


			},

			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
			submit_check(param) {
				let msg = null
																					return msg;
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/access_data/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/access_data/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/access_data/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/access_data/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/access_data/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},


		},
		created() {
												},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
