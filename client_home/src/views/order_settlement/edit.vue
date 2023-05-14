<template>
	<div class="diy_edit page_order_settlement" id="order_settlement_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
						<div v-if="$check_field('set','number') || $check_field('add','number') || $check_field('get','number')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								编号:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_number" v-model="form['number']" placeholder="请输入编号" v-if="(form['number'] && $check_field('set','number')) || (!form['number'] && $check_field('add','number'))" :disabled="true"/>
							<span v-else-if="$check_field('get','number')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','name') || $check_field('add','name') || $check_field('get','name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								名称:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_name" v-model="form['name']" placeholder="请输入名称" v-if="(form['name'] && $check_field('set','name')) || (!form['name'] && $check_field('add','name'))"  :disabled="disabledObj['name_isDisabled']"/>
							<span v-else-if="$check_field('get','name')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','picture') || $check_field('add','picture') || $check_field('get','picture')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								图片:
							</span>
						</div>
								<!-- 图片 -->
						<input type="file" :disabled="disabledObj['picture_isDisabled']" style="display: none;" id="form_img_picture" title="picture" @change="change_file($event.target.files,'picture')"/>
						<!-- 修改权限 -->
						<div class="diy_field diy_img" v-if="form['picture'] && $check_field('set','picture')">
							<label for="form_img_picture">
								<img :src="$fullUrl(form['picture'])" />
							</label>
						</div>
						<!-- 添加权限 -->
						<div class="diy_field diy_img" v-else-if="!form['picture'] && $check_field('add','picture')">
							<label for="form_img_picture">
								<div class="btn_add_img">
									<span>+</span>
								</div>
							</label>
						</div>
						<!-- 查询权限 -->
						<div class="diy_field diy_img" v-else-if="$check_field('get','picture')">
							<img :src="$fullUrl(form['picture'])" />
						</div>
							</div>
							<div v-if="$check_field('set','price') || $check_field('add','price') || $check_field('get','price')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								价格:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_price" v-model="form['price']" placeholder="请输入价格" v-if="(form['price'] && $check_field('set','price')) || (!form['price'] && $check_field('add','price'))"  :disabled="disabledObj['price_isDisabled']"/>
							<span v-else-if="$check_field('get','price')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','user_no') || $check_field('add','user_no') || $check_field('get','user_no')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								用户编号:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_user_no" :disabled="disabledObj['user_no_isDisabled']" v-model="form['user_no']" v-if="(form['user_no'] && $check_field('set','user_no')) || (!form['user_no'] && $check_field('add','user_no'))" >
								<option v-for="o in list_user_user_no" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','user_no')">{{ form['user_no'] }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','full_name') || $check_field('add','full_name') || $check_field('get','full_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								姓名:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_full_name" v-model="form['full_name']" placeholder="请输入姓名" v-if="(form['full_name'] && $check_field('set','full_name')) || (!form['full_name'] && $check_field('add','full_name'))"  :disabled="disabledObj['full_name_isDisabled']"/>
							<span v-else-if="$check_field('get','full_name')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','purchase_time') || $check_field('add','purchase_time') || $check_field('get','purchase_time')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								购买时间:
							</span>
						</div>
								<!-- 日期 -->
						<div class="diy_field diy_date">
							<input type="date" :disabled="disabledObj['purchase_time_isDisabled']" id="form_purchase_time" v-model="form['purchase_time']" placeholder="请输入购买时间" v-if="(form['purchase_time'] && $check_field('set','purchase_time')) || (!form['purchase_time'] && $check_field('add','purchase_time'))" />
							<span v-else-if="$check_field('get','purchase_time')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','purchase_quantity') || $check_field('add','purchase_quantity') || $check_field('get','purchase_quantity')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								购买数量:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_purchase_quantity" v-model="form['purchase_quantity']" placeholder="请输入购买数量" v-if="(form['purchase_quantity'] && $check_field('set','purchase_quantity')) || (!form['purchase_quantity'] && $check_field('add','purchase_quantity'))"  :disabled="disabledObj['purchase_quantity_isDisabled']"/>
							<span v-else-if="$check_field('get','purchase_quantity')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','total_amount') || $check_field('add','total_amount') || $check_field('get','total_amount')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								合计金额:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_total_amount" v-model="form['total_amount']" placeholder="请输入合计金额" v-if="(form['total_amount'] && $check_field('set','total_amount')) || (!form['total_amount'] && $check_field('add','total_amount'))"  @focus="set_total_amount()" :disabled="disabledObj['total_amount_isDisabled']"/>
							<span v-else-if="$check_field('get','total_amount')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','annotation_notes') || $check_field('add','annotation_notes') || $check_field('get','annotation_notes')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								标注说明:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_annotation_notes" v-model="form['annotation_notes']" placeholder="请输入标注说明" v-if="(form['annotation_notes'] && $check_field('set','annotation_notes')) || (!form['annotation_notes'] && $check_field('add','annotation_notes'))"  :disabled="disabledObj['annotation_notes_isDisabled']"/>
							<span v-else-if="$check_field('get','annotation_notes')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
	




				</div>
				<div class="diy_edit_submit_box row">
					<div class="col-12">
						<div class="btn_box">
							<button class="btn_submit" @click="submit()">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import mixin from "@/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {},
		data() {
			return {
				url_get_obj: "~/api/order_settlement/get_obj?",
				url_add: "~/api/order_settlement/add?",
				url_set: "~/api/order_settlement/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
						"number": "",
							"name": "",
							"picture": "",
							"price": 0,
							"user_no": 0,
							"full_name": "",
							"purchase_time": "",
							"purchase_quantity": "",
							"total_amount": "",
							"annotation_notes": "",
						"order_settlement_id": 0,
				},

				obj: {
						"number": this.$get_stamp(), // 编号
							"name":  '', // 名称
							"picture":  '', // 图片
							"price":  0, // 价格
							"user_no": 0, // 用户编号
							"full_name":  '', // 姓名
							"purchase_time": new Date().getTime(),
							"purchase_quantity":  '', // 购买数量
							"total_amount":  '', // 合计金额
							"annotation_notes":  '', // 标注说明
						"order_settlement_id": 0,
				},

				// 表单字段
				form: {
						"number": this.$get_stamp(), // 编号
							"name":  '', // 名称
							"picture":  '', // 图片
							"price":  0, // 价格
							"user_no": 0, // 用户编号
							"full_name":  '', // 姓名
							"purchase_time": new Date().getTime(),
							"purchase_quantity":  '', // 购买数量
							"total_amount":  '', // 合计金额
							"annotation_notes":  '', // 标注说明
						"order_settlement_id": 0,
				},
				disabledObj:{
						"number_isDisabled": false,
							"name_isDisabled": false,
							"picture_isDisabled": false,
									"user_no_isDisabled": false,
							"full_name_isDisabled": false,
							"purchase_time_isDisabled": false,
							"purchase_quantity_isDisabled": false,
							"total_amount_isDisabled": false,
							"annotation_notes_isDisabled": false,
					},

														// 用户列表
				list_user_user_no: [],
											
				// ID字段
				field: "order_settlement_id",

			}
		},
		methods: {
			
				
				
				
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
					async get_user_session_user_no(){
				var _this = this;
				var json = await this.$get("~/api/user_group/get_obj?name=注册用户");
				if(json.result && json.result.obj){
					var source_table = json.result.obj.source_table;
					var user_id = _this.$store.state.user.user_id;
					if (user_id){
						var url = "~/api/"+source_table+"/get_obj?"
						this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
							if (res.result && res.result.obj) {
								var arr = []
								for (let key in res.result.obj) {
									arr.push(key)
								}
								var arrForm = []
								for (let key in _this.form) {
									arrForm.push(key)
								}
								_this.form["user_no"] = user_id
								_this.disabledObj['user_no' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
                  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                    for (var j = 0; j < arrForm.length; j++) {
                      if (arr[i] === arrForm[j]) {
                        if (arr[i] !== "user_no") {
                          _this.form[arrForm[j]] = res.result.obj[arr[i]]
                          _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                          break;
                        }
                      }
                    }
                  }
								}
							}
						});
					}
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
				
				
				
				
									set_total_amount(){
				this.form.total_amount = parseFloat(this.form.price) * parseFloat(this.form.purchase_quantity)
        let r = /^\+?[1-9][0-9]*$/; // 正整数
        if(!r.test(this.form.total_amount) ){
          this.form.total_amount = this.form.total_amount.toFixed(2);
        }
			},
									
	
			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/order_settlement/upload?", form, (res) => {
					if (res.result) {
						this.form[str] = res.result.url;
					} else if (res.error) {
						this.$toast(res.error.message);
					}
				});
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_before(param){
				var form = $.db.get("form");
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
        //   this.obj = $.push(this.obj ,form);
				// 	this.form = $.push(this.form ,form);
				// }
				// var arr = []
				// for (let key in form) {
				// 	arr.push(key)
				// }
				// for (var i=0;i<arr.length;i++){
				// 	this.disabledObj[arr[i] + '_isDisabled'] = true
				// }
        if (form) {
          var arr = []
          for (let key in form) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arrForm[j] === arr[i]) {
                  this.form[arrForm[j]] = form[arr[i]]
                  this.obj[arrForm[j]] = form[arr[i]]
                  this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  break;
                }
              }
            }
          }
        }
														        if (JSON.stringify(this.form["purchase_time"]).indexOf("-")===-1) {
          this.form["purchase_time"] = this.$toTime(parseInt(this.form["purchase_time"]), "yyyy-MM-dd")
        }
							
        $.db.del("form");
				return param;
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json ,func){
				// var form = $.db.get("form");
				// var obj = Object.assign({} ,form ,this.obj);
				// if (obj) {
        //   delete(obj.examine_state)
        //   delete(obj.examine_reply)
				// 	this.obj = $.push(this.obj ,obj);
				// }
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
				// 	this.form = $.push(this.form ,form);
				// }
				if(func){
					func(json);
				}
			},

		},
		created() {
																	this.get_user_session_user_no();
					this.get_list_user_user_no();
																		},
	}
</script>

<style>




</style>
