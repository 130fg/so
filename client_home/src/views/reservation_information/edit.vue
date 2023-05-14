<template>
	<div class="diy_edit page_reservation_information" id="reservation_information_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
						<div v-if="$check_field('set','title') || $check_field('add','title') || $check_field('get','title')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								标题:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_title" v-model="form['title']" placeholder="请输入标题" v-if="(form['title'] && $check_field('set','title')) || (!form['title'] && $check_field('add','title'))"  :disabled="disabledObj['title_isDisabled']"/>
							<span v-else-if="$check_field('get','title')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','cover') || $check_field('add','cover') || $check_field('get','cover')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								封面:
							</span>
						</div>
								<!-- 图片 -->
						<input type="file" :disabled="disabledObj['cover_isDisabled']" style="display: none;" id="form_img_cover" title="cover" @change="change_file($event.target.files,'cover')"/>
						<!-- 修改权限 -->
						<div class="diy_field diy_img" v-if="form['cover'] && $check_field('set','cover')">
							<label for="form_img_cover">
								<img :src="$fullUrl(form['cover'])" />
							</label>
						</div>
						<!-- 添加权限 -->
						<div class="diy_field diy_img" v-else-if="!form['cover'] && $check_field('add','cover')">
							<label for="form_img_cover">
								<div class="btn_add_img">
									<span>+</span>
								</div>
							</label>
						</div>
						<!-- 查询权限 -->
						<div class="diy_field diy_img" v-else-if="$check_field('get','cover')">
							<img :src="$fullUrl(form['cover'])" />
						</div>
							</div>
							<div v-if="$check_field('set','house_type') || $check_field('add','house_type') || $check_field('get','house_type')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								户型:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_house_type" v-model="form['house_type']" placeholder="请输入户型" v-if="(form['house_type'] && $check_field('set','house_type')) || (!form['house_type'] && $check_field('add','house_type'))"  :disabled="disabledObj['house_type_isDisabled']"/>
							<span v-else-if="$check_field('get','house_type')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','supporting_facilities') || $check_field('add','supporting_facilities') || $check_field('get','supporting_facilities')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								配套设施:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_supporting_facilities" v-model="form['supporting_facilities']" placeholder="请输入配套设施" v-if="(form['supporting_facilities'] && $check_field('set','supporting_facilities')) || (!form['supporting_facilities'] && $check_field('add','supporting_facilities'))"  :disabled="disabledObj['supporting_facilities_isDisabled']"/>
							<span v-else-if="$check_field('get','supporting_facilities')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','advance_deposit') || $check_field('add','advance_deposit') || $check_field('get','advance_deposit')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								预付定金:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_advance_deposit" v-model="form['advance_deposit']" placeholder="请输入预付定金" v-if="(form['advance_deposit'] && $check_field('set','advance_deposit')) || (!form['advance_deposit'] && $check_field('add','advance_deposit'))"  :disabled="disabledObj['advance_deposit_isDisabled']"/>
							<span v-else-if="$check_field('get','advance_deposit')">{{ form['${obj.name}'] }}</span>
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
							<div v-if="$check_field('set','check_in_time') || $check_field('add','check_in_time') || $check_field('get','check_in_time')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								入住时间:
							</span>
						</div>
								<!-- 日期 -->
						<div class="diy_field diy_date">
							<input type="date" :disabled="disabledObj['check_in_time_isDisabled']" id="form_check_in_time" v-model="form['check_in_time']" placeholder="请输入入住时间" v-if="(form['check_in_time'] && $check_field('set','check_in_time')) || (!form['check_in_time'] && $check_field('add','check_in_time'))" />
							<span v-else-if="$check_field('get','check_in_time')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','contact_number') || $check_field('add','contact_number') || $check_field('get','contact_number')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								联系电话:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_contact_number" v-model="form['contact_number']" placeholder="请输入联系电话" v-if="(form['contact_number'] && $check_field('set','contact_number')) || (!form['contact_number'] && $check_field('add','contact_number'))"  :disabled="disabledObj['contact_number_isDisabled']"/>
							<span v-else-if="$check_field('get','contact_number')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','remarks') || $check_field('add','remarks') || $check_field('get','remarks')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								备注:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_remarks" v-model="form['remarks']" placeholder="请输入备注" v-if="(form['remarks'] && $check_field('set','remarks')) || (!form['remarks'] && $check_field('add','remarks'))"  :disabled="disabledObj['remarks_isDisabled']"/>
							<span v-else-if="$check_field('get','remarks')">{{ form['${obj.name}'] }}</span>
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
				url_get_obj: "~/api/reservation_information/get_obj?",
				url_add: "~/api/reservation_information/add?",
				url_set: "~/api/reservation_information/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
						"title": "",
							"cover": "",
							"house_type": "",
							"supporting_facilities": "",
							"advance_deposit": "",
							"user_no": 0,
							"full_name": "",
							"check_in_time": "",
							"contact_number": "",
							"remarks": "",
						"reservation_information_id": 0,
				},

				obj: {
						"title":  '', // 标题
							"cover":  '', // 封面
							"house_type":  '', // 户型
							"supporting_facilities":  '', // 配套设施
							"advance_deposit":  '', // 预付定金
							"user_no": 0, // 用户编号
							"full_name":  '', // 姓名
							"check_in_time": new Date().getTime(),
							"contact_number":  '', // 联系电话
							"remarks":  '', // 备注
						"reservation_information_id": 0,
				},

				// 表单字段
				form: {
						"title":  '', // 标题
							"cover":  '', // 封面
							"house_type":  '', // 户型
							"supporting_facilities":  '', // 配套设施
							"advance_deposit":  '', // 预付定金
							"user_no": 0, // 用户编号
							"full_name":  '', // 姓名
							"check_in_time": new Date().getTime(),
							"contact_number":  '', // 联系电话
							"remarks":  '', // 备注
						"reservation_information_id": 0,
				},
				disabledObj:{
						"title_isDisabled": false,
							"cover_isDisabled": false,
							"house_type_isDisabled": false,
							"supporting_facilities_isDisabled": false,
							"advance_deposit_isDisabled": false,
							"user_no_isDisabled": false,
							"full_name_isDisabled": false,
							"check_in_time_isDisabled": false,
							"contact_number_isDisabled": false,
							"remarks_isDisabled": false,
					},

																// 用户列表
				list_user_user_no: [],
									
				// ID字段
				field: "reservation_information_id",

			}
		},
		methods: {
      //submit_check(param){
        //   //做是否预定的处理
       // this.form.check_in_time
       // if()
       //   return "已被预定"
        //else
       //   return null
     // },




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
	
				
				
				
				
	
			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/reservation_information/upload?", form, (res) => {
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
																        if (JSON.stringify(this.form["check_in_time"]).indexOf("-")===-1) {
          this.form["check_in_time"] = this.$toTime(parseInt(this.form["check_in_time"]), "yyyy-MM-dd")
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
