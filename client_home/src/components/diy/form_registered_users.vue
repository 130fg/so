<template>
	<div>
			<b-form-group v-if="$check_register_field('add','user_no','/registered_users/view')" id="input-group-${idx}" label="用户编号" label-for="input-${idx}">
			<b-form-input id="input-${idx}" v-model="form['user_no']" type="text" placeholder="用户编号" trim></b-form-input>
		</b-form-group>
				<b-form-group v-if="$check_register_field('add','full_name','/registered_users/view')" id="input-group-${idx}" label="姓名" label-for="input-${idx}">
			<b-form-input id="input-${idx}" v-model="form['full_name']" type="text" placeholder="姓名" trim></b-form-input>
		</b-form-group>
				<b-form-group v-if="$check_register_field('add','gender','/registered_users/view')" id="input-group-${idx}" label="性别" label-for="input-${idx}">
			<b-form-select id="input-${idx}" v-model="form['gender']" :options="getDropList(list_gender)"></b-form-select>
		</b-form-group>
		</div>
</template>

<script>
	import mixin from "@/mixins/component.js";

	export default {
		mixins: [mixin],
		model: {
			prop: "form",
			event: "change"
		},
		props: {
			form: {
				type: Object,
				default: () => {
					return {

					}
				}
			}
		},
		data(){
			return {
				url_upload: "~/api/registered_users/upload?",
							        list_gender: "男,女",
						}
		},
		methods: {
			// 下拉数据列表转换
			getDropList(e){
				let resultArr = [];
				if(e){
					let arr = e.split(",");
					arr.forEach(item => {
						resultArr.push({
							value: item,
							text: item
						})
					});
				}
				return resultArr;
			},
									/**
			 * 上传图片
			 * @param {Object} file 文件对象
			 * @param {key} 保存键名
			 */
			uploadFile(file, key = "img") {
				var _this = this;
				var form = new FormData() // FormData 对象
				form.append('file', file[0]) // 文件对象
				this.$upload(this.url_upload, form, function(json) {
					if (json.result) {
						// _this.form[key] = json.result.url;
						_this.$delete(_this.form,key);
						_this.$set(_this.form,key,json.result.url);
						console.log(_this.form[key])
					} else {
						_this.$toast('上传失败！');
					}
				});
			},
		},
    created() {
			    },

	mounted(){
				}
	}
</script>

<style>
</style>
