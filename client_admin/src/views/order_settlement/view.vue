<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','number') || $check_field('add','number') || $check_field('set','number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="编号" prop="number">
												<el-input id="number" v-model="form['number']" placeholder="请输入编号"
							  v-if="user_group === '管理员' || (form['order_settlement_id'] && $check_field('set','number')) || (!form['order_settlement_id'] && $check_field('add','number'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','number')">{{form['number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','name') || $check_field('add','name') || $check_field('set','name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="名称" prop="name">
												<el-input id="name" v-model="form['name']" placeholder="请输入名称"
							  v-if="user_group === '管理员' || (form['order_settlement_id'] && $check_field('set','name')) || (!form['order_settlement_id'] && $check_field('add','name'))" :disabled="disabledObj['name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','name')">{{form['name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','picture') || $check_field('add','picture') || $check_field('set','picture')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="图片" prop="picture">
								<el-upload :disabled="disabledObj['picture_isDisabled']" id="picture" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_picture"
						:show-file-list="false" v-if="user_group === '管理员' || (form['order_settlement_id'] && $check_field('set','picture')) || (!form['order_settlement_id'] && $check_field('add','picture'))">
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
								<el-col v-if="user_group === '管理员' || $check_field('get','price') || $check_field('add','price') || $check_field('set','price')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="价格" prop="price">
								<el-input-number id="price" v-model.number="form['price']"
						v-if="user_group === '管理员' || (form['order_settlement_id'] && $check_field('set','price')) || (!form['order_settlement_id'] && $check_field('add','price'))" :disabled="disabledObj['price_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','price')">{{form['price']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','user_no') || $check_field('add','user_no') || $check_field('set','user_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="用户编号" prop="user_no">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_user_no(form['user_no']) }}
							<!--<el-input id="business_name" v-model="form['user_no']" placeholder="请输入用户编号"-->
							<!--v-if="user_group === '管理员' || (form['order_settlement_id'] && $check_field('set','user_no')) || (!form['order_settlement_id'] && $check_field('add','user_no'))" :disabled="disabledObj['user_no_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','user_no')">{{form['user_no']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['order_settlement_id'] && $check_field('set','user_no')) || (!form['order_settlement_id'] && $check_field('add','user_no'))" id="user_no" v-model="form['user_no']" :disabled="disabledObj['user_no_isDisabled']">
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
							  v-if="user_group === '管理员' || (form['order_settlement_id'] && $check_field('set','full_name')) || (!form['order_settlement_id'] && $check_field('add','full_name'))" :disabled="disabledObj['full_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','full_name')">{{form['full_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','purchase_time') || $check_field('add','purchase_time') || $check_field('set','purchase_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="购买时间" prop="purchase_time">
								<el-date-picker :disabled="disabledObj['purchase_time_isDisabled']" v-if="user_group === '管理员' || (form['order_settlement_id'] && $check_field('set','purchase_time')) || (!form['order_settlement_id'] && $check_field('add','purchase_time'))" id="purchase_time"
						v-model="form['purchase_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','purchase_time')">{{form['purchase_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','purchase_quantity') || $check_field('add','purchase_quantity') || $check_field('set','purchase_quantity')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="购买数量" prop="purchase_quantity">
												<el-input id="purchase_quantity" v-model="form['purchase_quantity']" placeholder="请输入购买数量"
							  v-if="user_group === '管理员' || (form['order_settlement_id'] && $check_field('set','purchase_quantity')) || (!form['order_settlement_id'] && $check_field('add','purchase_quantity'))" :disabled="disabledObj['purchase_quantity_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','purchase_quantity')">{{form['purchase_quantity']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','total_amount') || $check_field('add','total_amount') || $check_field('set','total_amount')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="合计金额" prop="total_amount">
												<el-input id="total_amount" v-model="form['total_amount']" placeholder="请输入合计金额"
							  v-if="user_group === '管理员' || (form['order_settlement_id'] && $check_field('set','total_amount')) || (!form['order_settlement_id'] && $check_field('add','total_amount'))"  @focus="set_total_amount()" :disabled="disabledObj['total_amount_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','total_amount')">{{form['total_amount']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','annotation_notes') || $check_field('add','annotation_notes') || $check_field('set','annotation_notes')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标注说明" prop="annotation_notes">
												<el-input id="annotation_notes" v-model="form['annotation_notes']" placeholder="请输入标注说明"
							  v-if="user_group === '管理员' || (form['order_settlement_id'] && $check_field('set','annotation_notes')) || (!form['order_settlement_id'] && $check_field('add','annotation_notes'))" :disabled="disabledObj['annotation_notes_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','annotation_notes')">{{form['annotation_notes']}}</div>
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
				field: "order_settlement_id",
				url_add: "~/api/order_settlement/add?",
				url_set: "~/api/order_settlement/set?",
				url_get_obj: "~/api/order_settlement/get_obj?",
				url_upload: "~/api/order_settlement/upload?",

				query: {
					"order_settlement_id": 0,
				},

				form: {
								"number": this.$get_stamp(), // 编号
										"name":  '', // 名称
										"picture":  '', // 图片
										"price":  0, // 价格
										"user_no": 0, // 用户编号
										"full_name":  '', // 姓名
										"purchase_time":  '', // 购买时间
										"purchase_quantity":  '', // 购买数量
										"total_amount":  '', // 合计金额
										"annotation_notes":  '', // 标注说明
											"order_settlement_id": 0, // ID
						
				},
				disabledObj:{
								"number_isDisabled": false,
										"name_isDisabled": false,
										"picture_isDisabled": false,
					          			"price_isDisabled": false,
										"user_no_isDisabled": false,
										"full_name_isDisabled": false,
										"purchase_time_isDisabled": false,
										"purchase_quantity_isDisabled": false,
										"total_amount_isDisabled": false,
										"annotation_notes_isDisabled": false,
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
			
	
			
	
			
	
			
	
										set_total_amount(){
				this.form.total_amount = parseFloat(this.form.price) * parseFloat(this.form.purchase_quantity)
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
														        if (this.form["purchase_time"].indexOf("-")===-1){
          this.form["purchase_time"] = this.$toTime(parseInt(this.form["purchase_time"]),"yyyy-MM-dd")
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


																				        if(this.form["purchase_time"]=="0000-00-00"){
          this.form["purchase_time"] = null;
        }
				if(parseInt(this.form["purchase_time"]) > 9999){
					this.form["purchase_time"] = this.$toTime(parseInt(this.form["purchase_time"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/order_settlement/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/order_settlement/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/order_settlement/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/order_settlement/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/order_settlement/view','get');
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
