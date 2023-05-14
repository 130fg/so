<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','title') || $check_field('add','title') || $check_field('set','title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题" prop="title">
												<el-input id="title" v-model="form['title']" placeholder="请输入标题"
							  v-if="user_group === '管理员' || (form['tourism_sharing_id'] && $check_field('set','title')) || (!form['tourism_sharing_id'] && $check_field('add','title'))" :disabled="disabledObj['title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title')">{{form['title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','cover') || $check_field('add','cover') || $check_field('set','cover')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="封面" prop="cover">
								<el-upload :disabled="disabledObj['cover_isDisabled']" id="cover" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_cover"
						:show-file-list="false" v-if="user_group === '管理员' || (form['tourism_sharing_id'] && $check_field('set','cover')) || (!form['tourism_sharing_id'] && $check_field('add','cover'))">
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
												<el-input id="type" v-model="form['type']" placeholder="请输入类型"
							  v-if="user_group === '管理员' || (form['tourism_sharing_id'] && $check_field('set','type')) || (!form['tourism_sharing_id'] && $check_field('add','type'))" :disabled="disabledObj['type_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','type')">{{form['type']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','tourist_location') || $check_field('add','tourist_location') || $check_field('set','tourist_location')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="旅游地点" prop="tourist_location">
												<el-input id="tourist_location" v-model="form['tourist_location']" placeholder="请输入旅游地点"
							  v-if="user_group === '管理员' || (form['tourism_sharing_id'] && $check_field('set','tourist_location')) || (!form['tourism_sharing_id'] && $check_field('add','tourist_location'))" :disabled="disabledObj['tourist_location_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','tourist_location')">{{form['tourist_location']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','release_time') || $check_field('add','release_time') || $check_field('set','release_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="发布时间" prop="release_time">
								<el-date-picker :disabled="disabledObj['release_time_isDisabled']" v-if="user_group === '管理员' || (form['tourism_sharing_id'] && $check_field('set','release_time')) || (!form['tourism_sharing_id'] && $check_field('add','release_time'))" id="release_time"
						v-model="form['release_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','release_time')">{{form['release_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','user_no') || $check_field('add','user_no') || $check_field('set','user_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="用户编号" prop="user_no">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_user_no(form['user_no']) }}
							<!--<el-input id="business_name" v-model="form['user_no']" placeholder="请输入用户编号"-->
							<!--v-if="user_group === '管理员' || (form['tourism_sharing_id'] && $check_field('set','user_no')) || (!form['tourism_sharing_id'] && $check_field('add','user_no'))" :disabled="disabledObj['user_no_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','user_no')">{{form['user_no']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['tourism_sharing_id'] && $check_field('set','user_no')) || (!form['tourism_sharing_id'] && $check_field('add','user_no'))" id="user_no" v-model="form['user_no']" :disabled="disabledObj['user_no_isDisabled']">
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
							  v-if="user_group === '管理员' || (form['tourism_sharing_id'] && $check_field('set','full_name')) || (!form['tourism_sharing_id'] && $check_field('add','full_name'))" :disabled="disabledObj['full_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','full_name')">{{form['full_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','related_videos') || $check_field('add','related_videos') || $check_field('set','related_videos')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="相关视频" prop="related_videos">
												<el-upload v-if="user_group === '管理员' || (form['tourism_sharing_id'] && $check_field('set','related_videos')) || (!form['tourism_sharing_id'] && $check_field('add','related_videos'))" class="upload-demo" drag
						action="" style="max-width: 300px;width: 100%;" :http-request="upload_related_videos" :limit="1" accept="video/ogg,video/mp4,video/webm">
						<i class="el-icon-upload"></i>
						<div class="el-upload__text">将视频拖到此处，或<em>点击上传</em></div>
					</el-upload>
					<div v-else-if="$check_field('get','related_videos')">
						<el-button type="primary" @click="download(form['related_videos'])">下载<i
								class="el-icon-download el-icon--right"></i></el-button>
					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','resource_acquisition') || $check_field('add','resource_acquisition') || $check_field('set','resource_acquisition')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="资源获取" prop="resource_acquisition">
												<el-input id="resource_acquisition" v-model="form['resource_acquisition']" placeholder="请输入资源获取"
							  v-if="user_group === '管理员' || (form['tourism_sharing_id'] && $check_field('set','resource_acquisition')) || (!form['tourism_sharing_id'] && $check_field('add','resource_acquisition'))" :disabled="disabledObj['resource_acquisition_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','resource_acquisition')">{{form['resource_acquisition']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','details') || $check_field('add','details') || $check_field('set','details')" :xs="24" :sm="24" :lg="24" class="el_form_editor_warp">
				<el-form-item label="详情介绍" prop="details">
					<quill-editor v-model.number="form['details']"
						v-if="user_group === '管理员' || (form['tourism_sharing_id'] && $check_field('set','details')) || (!form['tourism_sharing_id'] && $check_field('add','details')) ">
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
				field: "tourism_sharing_id",
				url_add: "~/api/tourism_sharing/add?",
				url_set: "~/api/tourism_sharing/set?",
				url_get_obj: "~/api/tourism_sharing/get_obj?",
				url_upload: "~/api/tourism_sharing/upload?",

				query: {
					"tourism_sharing_id": 0,
				},

				form: {
								"title":  '', // 标题
										"cover":  '', // 封面
										"type":  '', // 类型
										"tourist_location":  '', // 旅游地点
										"release_time":  '', // 发布时间
										"user_no": 0, // 用户编号
										"full_name":  '', // 姓名
										"related_videos":  '', // 相关视频
										"resource_acquisition":  '', // 资源获取
										"details":  '', // 详情介绍
											"tourism_sharing_id": 0, // ID
						
				},
				disabledObj:{
								"title_isDisabled": false,
										"cover_isDisabled": false,
										"type_isDisabled": false,
										"tourist_location_isDisabled": false,
										"release_time_isDisabled": false,
										"user_no_isDisabled": false,
										"full_name_isDisabled": false,
										"related_videos_isDisabled": false,
										"resource_acquisition_isDisabled": false,
										"details_isDisabled": false,
										},

	
		
		
		
		
		
					// 用户列表
				list_user_user_no: [],
						// 用户组
				group_user_user_no: "",
				
		
		
		
	
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
			 * 上传相关视频
			 * @param {Object} param 视频参数
			 */
			upload_related_videos(param){
						this.uploadFile(param.file, "related_videos");
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
										        if (this.form["release_time"].indexOf("-")===-1){
          this.form["release_time"] = this.$toTime(parseInt(this.form["release_time"]),"yyyy-MM-dd")
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


														        if(this.form["release_time"]=="0000-00-00"){
          this.form["release_time"] = null;
        }
				if(parseInt(this.form["release_time"]) > 9999){
					this.form["release_time"] = this.$toTime(parseInt(this.form["release_time"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/tourism_sharing/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/tourism_sharing/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/tourism_sharing/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/tourism_sharing/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/tourism_sharing/view','get');
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
