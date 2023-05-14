<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','title') || $check_field('add','title') || $check_field('set','title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题" prop="title">
												<el-input id="title" v-model="form['title']" placeholder="请输入标题"
							  v-if="user_group === '管理员' || (form['home_stay_information_id'] && $check_field('set','title')) || (!form['home_stay_information_id'] && $check_field('add','title'))" :disabled="disabledObj['title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title')">{{form['title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','cover') || $check_field('add','cover') || $check_field('set','cover')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="封面" prop="cover">
								<el-upload :disabled="disabledObj['cover_isDisabled']" id="cover" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_cover"
						:show-file-list="false" v-if="user_group === '管理员' || (form['home_stay_information_id'] && $check_field('set','cover')) || (!form['home_stay_information_id'] && $check_field('add','cover'))">
						<img v-if="form['cover']" :src="$fullUrl(form['cover'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','cover')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['cover'])" :preview-src-list="[$fullUrl(form['cover'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','type') || $check_field('add','type') || $check_field('set','type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="类型" prop="type">
								<el-select id="type" v-model="form['type']"
						v-if="user_group === '管理员' || (form['home_stay_information_id'] && $check_field('set','type')) || (!form['home_stay_information_id'] && $check_field('add','type'))">
						<el-option v-for="o in list_type" :key="o['type_name']" :label="o['type_name']"
							:value="o['type_name']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','type')">{{form['type']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','house_type') || $check_field('add','house_type') || $check_field('set','house_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="户型" prop="house_type">
												<el-input id="house_type" v-model="form['house_type']" placeholder="请输入户型"
							  v-if="user_group === '管理员' || (form['home_stay_information_id'] && $check_field('set','house_type')) || (!form['home_stay_information_id'] && $check_field('add','house_type'))" :disabled="disabledObj['house_type_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','house_type')">{{form['house_type']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','square') || $check_field('add','square') || $check_field('set','square')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="平方" prop="square">
												<el-input id="square" v-model="form['square']" placeholder="请输入平方"
							  v-if="user_group === '管理员' || (form['home_stay_information_id'] && $check_field('set','square')) || (!form['home_stay_information_id'] && $check_field('add','square'))" :disabled="disabledObj['square_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','square')">{{form['square']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','price') || $check_field('add','price') || $check_field('set','price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="价格" prop="price">
												<el-input id="price" v-model="form['price']" placeholder="请输入价格"
							  v-if="user_group === '管理员' || (form['home_stay_information_id'] && $check_field('set','price')) || (!form['home_stay_information_id'] && $check_field('add','price'))" :disabled="disabledObj['price_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','price')">{{form['price']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','supporting_facilities') || $check_field('add','supporting_facilities') || $check_field('set','supporting_facilities')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="配套设施" prop="supporting_facilities">
												<el-input id="supporting_facilities" v-model="form['supporting_facilities']" placeholder="请输入配套设施"
							  v-if="user_group === '管理员' || (form['home_stay_information_id'] && $check_field('set','supporting_facilities')) || (!form['home_stay_information_id'] && $check_field('add','supporting_facilities'))" :disabled="disabledObj['supporting_facilities_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','supporting_facilities')">{{form['supporting_facilities']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','advance_deposit') || $check_field('add','advance_deposit') || $check_field('set','advance_deposit')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="预付定金" prop="advance_deposit">
								<el-input-number id="advance_deposit" v-model.number="form['advance_deposit']"
						v-if="user_group === '管理员' || (form['home_stay_information_id'] && $check_field('set','advance_deposit')) || (!form['home_stay_information_id'] && $check_field('add','advance_deposit'))" :disabled="disabledObj['advance_deposit_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','advance_deposit')">{{form['advance_deposit']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','home_address') || $check_field('add','home_address') || $check_field('set','home_address')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="民宿地址" prop="home_address">
												<el-input id="home_address" v-model="form['home_address']" placeholder="请输入民宿地址"
							  v-if="user_group === '管理员' || (form['home_stay_information_id'] && $check_field('set','home_address')) || (!form['home_stay_information_id'] && $check_field('add','home_address'))" :disabled="disabledObj['home_address_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','home_address')">{{form['home_address']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','details') || $check_field('add','details') || $check_field('set','details')" :xs="24" :sm="24" :lg="24" class="el_form_editor_warp">
				<el-form-item label="详情介绍" prop="details">
					<quill-editor v-model.number="form['details']"
						v-if="user_group === '管理员' || (form['home_stay_information_id'] && $check_field('set','details')) || (!form['home_stay_information_id'] && $check_field('add','details')) ">
					</quill-editor>
					<div v-else-if="$check_field('get','details')" v-html="form['details']"></div>
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
				field: "home_stay_information_id",
				url_add: "~/api/home_stay_information/add?",
				url_set: "~/api/home_stay_information/set?",
				url_get_obj: "~/api/home_stay_information/get_obj?",
				url_upload: "~/api/home_stay_information/upload?",

				query: {
					"home_stay_information_id": 0,
				},

				form: {
								"title":  '', // 标题
										"cover":  '', // 封面
										"type":  '', // 类型
										"house_type":  '', // 户型
										"square":  '', // 平方
										"price":  '', // 价格
										"supporting_facilities":  '', // 配套设施
										"advance_deposit":  0, // 预付定金
										"home_address":  '', // 民宿地址
										"details":  '', // 详情介绍
											"home_stay_information_id": 0, // ID
						
				},
				disabledObj:{
								"title_isDisabled": false,
										"cover_isDisabled": false,
										"type_isDisabled": false,
										"house_type_isDisabled": false,
										"square_isDisabled": false,
										"price_isDisabled": false,
										"supporting_facilities_isDisabled": false,
					          			"advance_deposit_isDisabled": false,
										"home_address_isDisabled": false,
										"details_isDisabled": false,
										},

	
		
						// 类型选项列表
				list_type: [""],
	
		
		
		
		
		
		
		
	
			}
		},
		methods: {


	
	
						/**
			 * 上传封面
			 * @param {Object} param 图片参数
			 */
			upload_cover(param){
						this.uploadFile(param.file, "cover");
					},
	
	
			
				/**
			 * 获取类型列表
			 */
			async get_list_type() {
				var json = await this.$get("~/api/type_of_homestay/get_list?");
				if(json.result && json.result.list){
					this.list_type = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
			
	
			
	
			
	
			
	
			
	
			
	
			
	
		
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
																								$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


																														


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
					bl = this.$check_action('/home_stay_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/home_stay_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/home_stay_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/home_stay_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/home_stay_information/view','get');
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
								this.get_list_type();
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
