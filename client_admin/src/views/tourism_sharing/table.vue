<template>
	<el-main class="bg table_wrap">
		<el-form label-position="right" :model="query" class="form p_4" label-width="120">
			<el-row>


							<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="标题">
									<el-input v-model="query.title"></el-input>
								</el-form-item>
				</el-col>
												<el-col :xs="24" :sm="24" :lg="8" class="el_form_search_wrap">
					<el-form-item label="类型">
									<el-input v-model="query.type"></el-input>
								</el-form-item>
				</el-col>
																												<el-col :xs="24" :sm="10" :lg="8" class="search_btn_wrap_1">
					<el-form-item>
						<el-button type="primary" @click="search()" class="search_btn_find">查询</el-button>
						<el-button @click="reset()" style="margin-right: 74px;" class="search_btn_reset">重置</el-button>
						<router-link v-if="user_group == '管理员' || $check_action('/tourism_sharing/table','add') || $check_action('/tourism_sharing/view','add')" class="el-button el-button--default el-button--primary search_btn_add" to="./view?">添加
						</router-link>
            			<el-button v-if="user_group == '管理员' || $check_action('/tourism_sharing/table','del') || $check_action('/tourism_sharing/view','del')" class="search_btn_del" type="danger" @click="delInfo()">删除</el-button>
					</el-form-item>
				</el-col>

			</el-row>
		</el-form>
		<el-table :data="list" @selection-change="selectionChange" @sort-change="$sortChange" style="width: 100%" id="dataTable">
			<el-table-column fixed type="selection" tooltip-effect="dark" width="55">
			</el-table-column>
				<el-table-column prop="title" @sort-change="$sortChange" label="标题"
				v-if="user_group == '管理员' || $check_field('get','title')" min-width="200">
					</el-table-column>
					<el-table-column prop="cover" @sort-change="$sortChange" label="封面"
				v-if="user_group == '管理员' || $check_field('get','cover')" min-width="200">
						<template slot-scope="scope">
					<el-image style="width: 100px; height: 100px" :src="$fullUrl(scope.row['cover'])"
						:preview-src-list="[$fullUrl(scope.row['cover'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
				</template>
					</el-table-column>
					<el-table-column prop="type" @sort-change="$sortChange" label="类型"
				v-if="user_group == '管理员' || $check_field('get','type')" min-width="200">
					</el-table-column>
					<el-table-column prop="tourist_location" @sort-change="$sortChange" label="旅游地点"
				v-if="user_group == '管理员' || $check_field('get','tourist_location')" min-width="200">
					</el-table-column>
					<el-table-column prop="release_time" @sort-change="$sortChange" label="发布时间"
				v-if="user_group == '管理员' || $check_field('get','release_time')" min-width="200">
		                <template slot-scope="scope">
                	{{ $toTime(scope.row["release_time"],"yyyy-MM-dd") }}
                </template>
					</el-table-column>
					<el-table-column prop="user_no" @sort-change="$sortChange" label="用户编号"
				v-if="user_group == '管理员' || $check_field('get','user_no')" min-width="200">
						<template slot-scope="scope">
					{{ get_user_user_no(scope.row['user_no']) }}
				</template>
					</el-table-column>
					<el-table-column prop="full_name" @sort-change="$sortChange" label="姓名"
				v-if="user_group == '管理员' || $check_field('get','full_name')" min-width="200">
					</el-table-column>
					<el-table-column prop="related_videos" @sort-change="$sortChange" label="相关视频"
				v-if="user_group == '管理员' || $check_field('get','related_videos')" min-width="200">
						<template slot-scope="scope">
					<a href="javascript:void(0)" @click="related_videosVideoPlay($fullUrl(scope.row['related_videos']))" >点此播放</a>
				</template>
					</el-table-column>
					<el-table-column prop="resource_acquisition" @sort-change="$sortChange" label="资源获取"
				v-if="user_group == '管理员' || $check_field('get','resource_acquisition')" min-width="200">
						<template slot-scope="scope">
					<a :href="scope.row['resource_acquisition']" target="_blank">{{ scope.row['resource_acquisition'] }}</a>
				</template>
					</el-table-column>
			



            <el-table-column sortable prop="create_time" label="创建时间" min-width="200">
                <template slot-scope="scope">
                	{{ $toTime(scope.row["create_time"],"yyyy-MM-dd hh:mm:ss") }}
                </template>
            </el-table-column>

			<el-table-column sortable prop="update_time" label="更新时间" min-width="200">
                <template slot-scope="scope">
                	{{ $toTime(scope.row["update_time"],"yyyy-MM-dd hh:mm:ss") }}
                </template>
			</el-table-column>







			<el-table-column fixed="right" label="操作" min-width="120" v-if="user_group == '管理员' || $check_action('/tourism_sharing/table','set') || $check_action('/tourism_sharing/view','set') || $check_action('/tourism_sharing/view','get') || $check_action('//table','add') || $check_action('//view','add')" >


				<template slot-scope="scope">
					<router-link class="el-button el-button--small is-plain el-button--success" style="margin: 5px !important;"
					v-if="user_group == '管理员' || $check_action('/tourism_sharing/table','set') || $check_action('/tourism_sharing/view','set') || $check_action('/tourism_sharing/view','get')"
						:to="'./view?' + field + '=' + scope.row[field]"
						 size="small">
						<span>详情</span>
					</router-link>
						<router-link v-if="user_group == '管理员' || $check_comment('/tourism_sharing/table')" class="el-button el-button--small is-plain el-button--primary"
								 :to="'../comment/table?size=10&page=1&source_table=tourism_sharing&source_field=' + field + '&source_id=' + scope.row[field]" size="small">
						查看评论
					</router-link>
					</template>
			</el-table-column>

		</el-table>

		<!-- 分页器 -->
		<div class="mt text_center">
			<el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
				:current-page="query.page" :page-sizes="[7, 10, 30, 100]" :page-size="query.size"
				layout="total, sizes, prev, pager, next, jumper" :total="count">
			</el-pagination>
		</div>
		<!-- /分页器 -->

											<el-dialog
					title="视频详情"
					:visible.sync="related_videosPlayerModalVisible"
					width="30%"
			>
				<video id="related_videosPlayer" :src="related_videosVideoUrl" autoplay="autoplay" width="100%" controls>
					您的浏览器不支持Video标签。
				</video>
				<span slot="footer" class="dialog-footer">
				<el-button @click="related_videosCancelModalVisible">取 消</el-button>
				</span>
			</el-dialog>
			
		<div class="modal_wrap" v-if="showModal">
			<div class="modal_box">
				<!-- <div class="modal_box_close" @click="closeModal">X</div> -->
				<p class="modal_box_title">重要提醒</p>
				<p class="modal_box_text">当前有数据达到预警值！</p>
				<div class="btn_box">
					<span @click="closeModal">取消</span>
					<span @click="closeModal">确定</span>
				</div>
			</div>
		</div>


	</el-main>
</template>
<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				// 弹框
				showModal: false,
				// 获取数据地址
				url_get_list: "~/api/tourism_sharing/get_list?like=0",
				url_del: "~/api/tourism_sharing/del?",

				// 字段ID
				field: "tourism_sharing_id",

				// 查询
				query: {
					"size": 7,
					"page": 1,
								"title": "",
												"type": "",
															"login_time": "",
					"create_time": "",
					"orderby": `create_time desc`
				},

				// 数据
				list: [],
												related_videosPlayerModalVisible:false,
				related_videosVideoUrl:"",
																					// 用户列表
				list_user_user_no: [],
												}
		},
		methods: {
			// 关闭弹框
			closeModal(){
				this.showModal = false;
				},

			get_list_before(param){
				var user_group = this.user.user_group;
				if(user_group != "管理员"){
						let sqlwhere = "(";
																																			if(user_group=="注册用户"){
						sqlwhere+= "user_no = " + this.user.user_id + " or ";
					}
																														if (sqlwhere.length>1){
						sqlwhere = sqlwhere.substr(0,sqlwhere.length-4);
						sqlwhere += ")";
						param["sqlwhere"] = sqlwhere;
					}
									}
				return param;
			},

																				

	
														/**
			 * 获取注册用户用户列表
			 */
			async get_list_user_user_no() {
				var json = await this.$get("~/api/user/get_list?user_group=注册用户");
				if(json.result && json.result.list){
					this.list_user_user_no = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},

			get_user_user_no(id){
				var obj = this.list_user_user_no.getObj({"user_id":id});
				var ret = "";
				if(obj){
					ret = obj.nickname+"-"+obj.username;
					// if(obj.nickname){
					// 	ret = obj.nickname;
					// }
					// else{
					// 	ret = obj.username;
					// }
				}
				return ret;
			},
									related_videosVideoPlay(v) {
				this.related_videosVideoUrl = v
				this.related_videosPlayerModalVisible = true
			},

			related_videosCancelModalVisible(){
				this.related_videosVideoUrl = ""
				this.related_videosPlayerModalVisible = false
			},

								deleteRow(index, rows) {
				rows.splice(index, 1);
			}

		},
		created() {
																	this.get_list_user_user_no();
											}
	}
</script>

<style type="text/css">
	.bg {
		background: white;
	}

	.form.p_4 {
		padding: 1rem;
	}

	.form .el-input {
		width: initial;
	}

	.mt {
		margin-top: 1rem;
	}

	.text_center {
		text-align: center;
	}

	.float-right {
		float: right;
	}


	.modal_wrap{
		width: 100vw;
		height: 100vh;
		position: fixed;
		top: 0;
		left: 0;
		background: rgba(0,0,0,0.5);
		z-index: 9999999999;
	}
	.modal_wrap .modal_box{
		width: 400px;
		height: 200px;
		background: url("../../assets/modal_bg.jpg") no-repeat center;
		background-size: cover;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-left: -200px;
		margin-top: -100px;
		border-radius: 10px;
		}
	.modal_wrap .modal_box .modal_box_close{
		font-size: 20px;
		position: absolute;
		top: 10px;
		right: 10px;
		cursor: pointer;
		}
	.modal_wrap .modal_box .modal_box_title{
	  text-align: center;
    font-size: 18px;
    margin: 16px auto;
    color: #fff;
    border-bottom: 1px solid rgba(117, 116, 116,0.5);
    padding-bottom: 16px;
    width: 356px;
		}
	.modal_wrap .modal_box .modal_box_text{
			text-align: center;
		font-size: 15px;
		color: #fff;
		margin-top: 25px;
		}
	.modal_wrap .modal_box .btn_box{
		display: flex;
		flex-direction: row;
		justify-content: center;
		margin-top: 42px;
		}
			.modal_wrap .modal_box .btn_box span{
				display: inline-block;
				width: 80px;
				height: 30px;
				line-height: 30px;
				text-align: center;
				border: 1px solid #ccc;
				font-size: 14px;
				cursor: pointer;
				color: #fff;
			}
	.modal_wrap .modal_box .btn_box span:nth-child(2){
		background: #409EFF;
		color: #fff;
		border-color: #409EFF;
		margin-left: 15px;
	}
</style>
