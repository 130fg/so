<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','activity_name') || $check_field('add','activity_name') || $check_field('set','activity_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="活动名称" prop="activity_name">
												<el-input id="activity_name" v-model="form['activity_name']" placeholder="请输入活动名称"
							  v-if="user_group === '管理员' || (form['registration_record_id'] && $check_field('set','activity_name')) || (!form['registration_record_id'] && $check_field('add','activity_name'))" :disabled="disabledObj['activity_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','activity_name')">{{form['activity_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','picture') || $check_field('add','picture') || $check_field('set','picture')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="图片" prop="picture">
								<el-upload :disabled="disabledObj['picture_isDisabled']" id="picture" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_picture"
						:show-file-list="false" v-if="user_group === '管理员' || (form['registration_record_id'] && $check_field('set','picture')) || (!form['registration_record_id'] && $check_field('add','picture'))">
						<img v-if="form['picture']" :src="$fullUrl(form['picture'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','picture')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['picture'])" :preview-src-list="[$fullUrl(form['picture'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','activity_type') || $check_field('add','activity_type') || $check_field('set','activity_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="活动类型" prop="activity_type">
												<el-input id="activity_type" v-model="form['activity_type']" placeholder="请输入活动类型"
							  v-if="user_group === '管理员' || (form['registration_record_id'] && $check_field('set','activity_type')) || (!form['registration_record_id'] && $check_field('add','activity_type'))" :disabled="disabledObj['activity_type_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','activity_type')">{{form['activity_type']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','event_location') || $check_field('add','event_location') || $check_field('set','event_location')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="活动地点" prop="event_location">
												<el-input id="event_location" v-model="form['event_location']" placeholder="请输入活动地点"
							  v-if="user_group === '管理员' || (form['registration_record_id'] && $check_field('set','event_location')) || (!form['registration_record_id'] && $check_field('add','event_location'))" :disabled="disabledObj['event_location_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','event_location')">{{form['event_location']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','activity_time') || $check_field('add','activity_time') || $check_field('set','activity_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="活动时间" prop="activity_time">
												<el-input id="activity_time" v-model="form['activity_time']" placeholder="请输入活动时间"
							  v-if="user_group === '管理员' || (form['registration_record_id'] && $check_field('set','activity_time')) || (!form['registration_record_id'] && $check_field('add','activity_time'))" :disabled="disabledObj['activity_time_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','activity_time')">{{form['activity_time']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','user_no') || $check_field('add','user_no') || $check_field('set','user_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="用户编号" prop="user_no">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_user_no(form['user_no']) }}
							<!--<el-input id="business_name" v-model="form['user_no']" placeholder="请输入用户编号"-->
							<!--v-if="user_group === '管理员' || (form['registration_record_id'] && $check_field('set','user_no')) || (!form['registration_record_id'] && $check_field('add','user_no'))" :disabled="disabledObj['user_no_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','user_no')">{{form['user_no']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['registration_record_id'] && $check_field('set','user_no')) || (!form['registration_record_id'] && $check_field('add','user_no'))" id="user_no" v-model="form['user_no']" :disabled="disabledObj['user_no_isDisabled']">
								<el-option v-for="o in list_user_user_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','user_no')" id="user_no" v-model="form['user_no']" :disabled="true">
								<el-option v-for="o in list_user_user_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="user_no" v-model="form['user_no']" :disabled="disabledObj['user_no_isDisabled']">
							<el-option v-for="o in list_user_user_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','full_name') || $check_field('add','full_name') || $check_field('set','full_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="姓名" prop="full_name">
												<el-input id="full_name" v-model="form['full_name']" placeholder="请输入姓名"
							  v-if="user_group === '管理员' || (form['registration_record_id'] && $check_field('set','full_name')) || (!form['registration_record_id'] && $check_field('add','full_name'))" :disabled="disabledObj['full_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','full_name')">{{form['full_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','registration_time') || $check_field('add','registration_time') || $check_field('set','registration_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="报名时间" prop="registration_time">
								<el-date-picker :disabled="disabledObj['registration_time_isDisabled']" v-if="user_group === '管理员' || (form['registration_record_id'] && $check_field('set','registration_time')) || (!form['registration_record_id'] && $check_field('add','registration_time'))" id="registration_time"
						v-model="form['registration_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','registration_time')">{{form['registration_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','number_of_applicants') || $check_field('add','number_of_applicants') || $check_field('set','number_of_applicants')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="报名人数" prop="number_of_applicants">
								<el-input-number id="number_of_applicants" v-model.number="form['number_of_applicants']"
						v-if="user_group === '管理员' || (form['registration_record_id'] && $check_field('set','number_of_applicants')) || (!form['registration_record_id'] && $check_field('add','number_of_applicants'))" :disabled="disabledObj['number_of_applicants_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','number_of_applicants')">{{form['number_of_applicants']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','contact_number') || $check_field('add','contact_number') || $check_field('set','contact_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="联系电话" prop="contact_number">
												<el-input id="contact_number" v-model="form['contact_number']" placeholder="请输入联系电话"
							  v-if="user_group === '管理员' || (form['registration_record_id'] && $check_field('set','contact_number')) || (!form['registration_record_id'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','contact_number')">{{form['contact_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','additional_notes') || $check_field('add','additional_notes') || $check_field('set','additional_notes')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="附加说明" prop="additional_notes">
												<el-input id="additional_notes" v-model="form['additional_notes']" placeholder="请输入附加说明"
							  v-if="user_group === '管理员' || (form['registration_record_id'] && $check_field('set','additional_notes')) || (!form['registration_record_id'] && $check_field('add','additional_notes'))" :disabled="disabledObj['additional_notes_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','additional_notes')">{{form['additional_notes']}}</div>
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
				field: "registration_record_id",
				url_add: "~/api/registration_record/add?",
				url_set: "~/api/registration_record/set?",
				url_get_obj: "~/api/registration_record/get_obj?",
				url_upload: "~/api/registration_record/upload?",

				query: {
					"registration_record_id": 0,
				},

				form: {
								"activity_name":  '', // 活动名称
										"picture":  '', // 图片
										"activity_type":  '', // 活动类型
										"event_location":  '', // 活动地点
										"activity_time":  '', // 活动时间
										"user_no": 0, // 用户编号
										"full_name":  '', // 姓名
										"registration_time":  '', // 报名时间
										"number_of_applicants":  0, // 报名人数
										"contact_number":  '', // 联系电话
										"additional_notes":  '', // 附加说明
											"registration_record_id": 0, // ID
						
				},
				disabledObj:{
								"activity_name_isDisabled": false,
										"picture_isDisabled": false,
										"activity_type_isDisabled": false,
										"event_location_isDisabled": false,
										"activity_time_isDisabled": false,
										"user_no_isDisabled": false,
										"full_name_isDisabled": false,
										"registration_time_isDisabled": false,
					          			"number_of_applicants_isDisabled": false,
										"contact_number_isDisabled": false,
										"additional_notes_isDisabled": false,
										},

	
		
		
		
		
		
					// 用户列表
				list_user_user_no: [],
						// 用户组
				group_user_user_no: "",
				
		
		
		
		
	
			}
		},
		methods: {


	
	
						/**
			 * 上传图片
			 * @param {Object} param 图片参数
			 */
			upload_picture(param){
						this.uploadFile(param.file, "picture");
					},
	
	
			
	
			
	
			
	
			
	
				/**
			 * 获取注册用户用户列表
			 */
			async get_list_user_user_no() {
                // if(this.user_group !== "管理员" && this.form["user_no"] === 0) {
                //     this.form["user_no"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=注册用户");
                if(json.result && json.result.list){
                    this.list_user_user_no = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取注册用户用户组
			 */
			async get_group_user_user_no() {
							this.form["user_no"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=注册用户");
				if(json.result && json.result.obj){
					this.group_user_user_no = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_user_no(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_user_no.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
									for (let key in _this.form) {
							arrForm.push(key)
						}
			
									_this.form["user_no"] = id
									_this.disabledObj['user_no' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "user_no") {
												_this.form[arrForm[j]] = res.result.obj[arr[i]]
												_this.disabledObj[arrForm[j] + '_isDisabled'] = true
									break;
								} else {
								  _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								}
							  }
							}
						  }
						}
					}
				});
			},
					get_user_user_no(id){
				var obj = this.list_user_user_no.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
			
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
									// 获取缓存数据附加
				form = $.db.get("form");
							$.push(this.form ,form);
																			
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
																        if (this.form["registration_time"].indexOf("-")===-1){
          this.form["registration_time"] = this.$toTime(parseInt(this.form["registration_time"]),"yyyy-MM-dd")
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


																							        if(this.form["registration_time"]=="0000-00-00"){
          this.form["registration_time"] = null;
        }
				if(parseInt(this.form["registration_time"]) > 9999){
					this.form["registration_time"] = this.$toTime(parseInt(this.form["registration_time"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/registration_record/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/registration_record/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/registration_record/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/registration_record/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/registration_record/view','get');
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
															this.get_list_user_user_no();
					this.get_group_user_user_no();
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
