<template>
	<div class="diy_edit page_registration_record" id="registration_record_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
						<div v-if="$check_field('set','activity_name') || $check_field('add','activity_name') || $check_field('get','activity_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								活动名称:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_activity_name" v-model="form['activity_name']" placeholder="请输入活动名称" v-if="(form['activity_name'] && $check_field('set','activity_name')) || (!form['activity_name'] && $check_field('add','activity_name'))"  :disabled="disabledObj['activity_name_isDisabled']"/>
							<span v-else-if="$check_field('get','activity_name')">{{ form['${obj.name}'] }}</span>
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
							<div v-if="$check_field('set','activity_type') || $check_field('add','activity_type') || $check_field('get','activity_type')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								活动类型:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_activity_type" v-model="form['activity_type']" placeholder="请输入活动类型" v-if="(form['activity_type'] && $check_field('set','activity_type')) || (!form['activity_type'] && $check_field('add','activity_type'))"  :disabled="disabledObj['activity_type_isDisabled']"/>
							<span v-else-if="$check_field('get','activity_type')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','event_location') || $check_field('add','event_location') || $check_field('get','event_location')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								活动地点:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_event_location" v-model="form['event_location']" placeholder="请输入活动地点" v-if="(form['event_location'] && $check_field('set','event_location')) || (!form['event_location'] && $check_field('add','event_location'))"  :disabled="disabledObj['event_location_isDisabled']"/>
							<span v-else-if="$check_field('get','event_location')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','activity_time') || $check_field('add','activity_time') || $check_field('get','activity_time')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								活动时间:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_activity_time" v-model="form['activity_time']" placeholder="请输入活动时间" v-if="(form['activity_time'] && $check_field('set','activity_time')) || (!form['activity_time'] && $check_field('add','activity_time'))"  :disabled="disabledObj['activity_time_isDisabled']"/>
							<span v-else-if="$check_field('get','activity_time')">{{ form['${obj.name}'] }}</span>
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
							<div v-if="$check_field('set','registration_time') || $check_field('add','registration_time') || $check_field('get','registration_time')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								报名时间:
							</span>
						</div>
								<!-- 日期 -->
						<div class="diy_field diy_date">
							<input type="date" :disabled="disabledObj['registration_time_isDisabled']" id="form_registration_time" v-model="form['registration_time']" placeholder="请输入报名时间" v-if="(form['registration_time'] && $check_field('set','registration_time')) || (!form['registration_time'] && $check_field('add','registration_time'))" />
							<span v-else-if="$check_field('get','registration_time')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','number_of_applicants') || $check_field('add','number_of_applicants') || $check_field('get','number_of_applicants')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								报名人数:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_number_of_applicants" v-model="form['number_of_applicants']" placeholder="请输入报名人数" v-if="(form['number_of_applicants'] && $check_field('set','number_of_applicants')) || (!form['number_of_applicants'] && $check_field('add','number_of_applicants'))"  :disabled="disabledObj['number_of_applicants_isDisabled']"/>
							<span v-else-if="$check_field('get','number_of_applicants')">{{ form['${obj.name}'] }}</span>
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
							<div v-if="$check_field('set','additional_notes') || $check_field('add','additional_notes') || $check_field('get','additional_notes')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								附加说明:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_additional_notes" v-model="form['additional_notes']" placeholder="请输入附加说明" v-if="(form['additional_notes'] && $check_field('set','additional_notes')) || (!form['additional_notes'] && $check_field('add','additional_notes'))"  :disabled="disabledObj['additional_notes_isDisabled']"/>
							<span v-else-if="$check_field('get','additional_notes')">{{ form['${obj.name}'] }}</span>
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
				url_get_obj: "~/api/registration_record/get_obj?",
				url_add: "~/api/registration_record/add?",
				url_set: "~/api/registration_record/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
						"activity_name": "",
							"picture": "",
							"activity_type": "",
							"event_location": "",
							"activity_time": "",
							"user_no": 0,
							"full_name": "",
							"registration_time": "",
							"number_of_applicants": 0,
							"contact_number": "",
							"additional_notes": "",
						"registration_record_id": 0,
				},

				obj: {
						"activity_name":  '', // 活动名称
							"picture":  '', // 图片
							"activity_type":  '', // 活动类型
							"event_location":  '', // 活动地点
							"activity_time":  '', // 活动时间
							"user_no": 0, // 用户编号
							"full_name":  '', // 姓名
							"registration_time": new Date().getTime(),
							"number_of_applicants":  0, // 报名人数
							"contact_number":  '', // 联系电话
							"additional_notes":  '', // 附加说明
						"registration_record_id": 0,
				},

				// 表单字段
				form: {
						"activity_name":  '', // 活动名称
							"picture":  '', // 图片
							"activity_type":  '', // 活动类型
							"event_location":  '', // 活动地点
							"activity_time":  '', // 活动时间
							"user_no": 0, // 用户编号
							"full_name":  '', // 姓名
							"registration_time": new Date().getTime(),
							"number_of_applicants":  0, // 报名人数
							"contact_number":  '', // 联系电话
							"additional_notes":  '', // 附加说明
						"registration_record_id": 0,
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
									"contact_number_isDisabled": false,
							"additional_notes_isDisabled": false,
					},

																// 用户列表
				list_user_user_no: [],
											
				// ID字段
				field: "registration_record_id",

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
	
				
				
				
				
				
	
			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/registration_record/upload?", form, (res) => {
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
																        if (JSON.stringify(this.form["registration_time"]).indexOf("-")===-1) {
          this.form["registration_time"] = this.$toTime(parseInt(this.form["registration_time"]), "yyyy-MM-dd")
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
