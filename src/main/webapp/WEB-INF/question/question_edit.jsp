
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html >
<link rel="stylesheet" type="text/css"
	href="assets/question/css/wenjuan_ht.css">
<link href="assets/plugins/jqvmap/jqvmap.css" rel="stylesheet" />
<link href="assets/plugins/bootstrap-fileinput/css/fileinput.css"
	media="all" rel="stylesheet" type="text/css" />
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<link href="assets/editor/themes/default/default.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/jquery-confirm.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="assets/js/jquery.js"></script>
	<!-- Vendor CSS-->
		<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/vendor/skycons/css/skycons.css" rel="stylesheet" />
		<link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
		<link href="assets/vendor/css/pace.preloader.css" rel="stylesheet" />
		
		<!-- Plugins CSS-->
		<link href="assets/plugins/bootkit/css/bootkit.css" rel="stylesheet" />
		<link href="assets/plugins/fullcalendar/css/fullcalendar.css" rel="stylesheet" />				
		<link href="assets/plugins/summernote/css/summernote.css" rel="stylesheet" />
		<link href="assets/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" />
		
		<!-- Theme CSS -->
		<link href="assets/css/jquery.mmenu.css" rel="stylesheet" />
		
		<!-- Page CSS -->		
		<link href="assets/css/style.css" rel="stylesheet" />
		<link href="assets/css/add-ons.min.css" rel="stylesheet" />
		


<body>
	<!-- Page Header -->
	<div class="page-header">
		<div class="pull-left">
			<ol class="breadcrumb visible-sm visible-md visible-lg">
				<li><a href="index.html"><i class="icon fa fa-home"></i>首页</a></li>
				<li class="active"><i class="fa fa-laptop"></i>问卷管理</li>
			</ol>
		</div>
		<div class="pull-right">
			<h2>问卷维护</h2>
		</div>
	</div>
	<!-- End Page Header -->

	<div class="row">
		<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
			<div class="panel panel-default bk-bg-white">
				<div class="panel-heading bk-bg-white">
					<h6>
						<i class="fa fa-indent red"></i>问卷编辑
					</h6>
					<div class="panel-actions">
						<a href="#" class="btn-minimize"><i class="fa fa-caret-up"></i></a>
						<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
					</div>
				</div>
				<div class="panel-body">
					<form id="question_save_form" method="post"
						enctype="multipart/form-data" class="form-horizontal ">
						
						<div class="form-group">
							<label class="col-md-3 control-label"></label>
							<div class="col-md-9">
								<textarea name="xy" id="xy" hidden >${question.xy }</textarea>
							</div>
						</div>


						<div class="form-group">
							<label class="col-md-3 control-label" for="text-input">问卷标题:</label>
							<div class="col-md-8">
								<input type="text" id="title" name="title" class="form-control"
									value="${question.title}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" for="text-input">欢迎词:</label>
							<div class="col-md-8">
								<textarea rows="3" cols="" id="desc" name="desc"
									class="form-control">${question.desc}</textarea>

							</div>
						</div>

						<div class="form-group">
							<label class="col-md-3 control-label" for="text-input">调查时间:</label>
							<div class="col-md-8">
								<div class="input-daterange input-group" data-plugin-datepicker>
									<span class="input-group-addon"> <i
										class="fa fa-calendar"></i>
									</span> <input type="text" class="form-control" id="startime"
										name="starttime" format="yyyy-mm-dd"
										value="${question.starttime}" /> <span
										class="input-group-addon">to</span> <input type="text"
										class="form-control" name="endtime" name="endtime"
										value="${question.endtime}" />
								</div>

							</div>
						</div>



						<div class="form-group">
							<label class="col-md-3 control-label" for="text-input">感谢词:</label>
							<div class="col-md-8">
								<textarea rows="3" id="bz" name="bz" class="form-control">${question.bz}</textarea>

							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3  control-label" for="text-input">封面图片:<span
								class="required">*</span></label>
							<c:if test="${question.id!=0 }">

								<div class="col-md-8">
									<label><font color="red">已上传图片，点击删除按钮即已删除，请谨慎删除</font></label>
								</div>
							</c:if>
							<div class="col-md-8">
								<input id="imgFile" style="width: 60%" name="imgFile" value="${question.img }"
									class="file" type="file" multiple data-preview-file-type="any"
									data-upload-url="#" data-preview-file-icon="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" for="text-input">工作函:</label>
							<div class="col-md-8">

	                    <div class="summernote" data-plugin-summernote data-plugin-options='{ "height": 230}'></div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-9 col-sm-offset-3">
								<button class="bk-margin-5 btn btn-success   btn-labeled "
									id="save_button" type="button" onclick="save_question()">
									<span class="btn-label"><i class="fa fa-check"></i></span>保存
								</button>
								<button class="bk-margin-5 btn btn-labeled btn-success"
									type="button"
									onClick="change_menu('question/question_list.html')">
									<span class="btn-label"><i class="fa fa-arrow-left"></i></span>返回
								</button>
							</div>
						</div>


						<br /> <input type="hidden" id="id" name="id"
							value="${question.id}">


					</form>
				</div>
			</div>
		</div>
	</div>



	<!-- Plugins JS-->

		<!-- Pages JS -->
			<!-- Vendor JS-->				
		<script src="assets/vendor/js/jquery.min.js"></script>
		<script src="assets/vendor/js/jquery-2.1.1.min.js"></script>
					<!-- Plugins JS-->
		<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
		<script src="assets/js/pages/form-elements.js"></script>
		
	<script
	src="assets/plugins/bootstrap-fileinput/js/fileinput_locale_zh.js"
	type="text/javascript"></script>
		<script type="text/javascript" src="jquery-1.3.2.min.js"></script>
		 <script type="text/javascript" src="assets/plugins/jquery-validation/js/jquery.validate.js"></script>
		<!-- start: JavaScript-->
		
		<!-- Vendor JS-->				
		<script src="assets/vendor/js/jquery.min.js"></script>
		<script src="assets/vendor/js/jquery-2.1.1.min.js"></script>
		<script src="assets/vendor/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/vendor/skycons/js/skycons.js"></script>
		<script src="assets/vendor/js/pace.min.js"></script>
		
		<!-- Plugins JS-->
		<script src="assets/plugins/moment/js/moment.min.js"></script>	
		<script src="assets/plugins/fullcalendar/js/fullcalendar.min.js"></script>
		<script src="assets/plugins/summernote/js/summernote.js"></script>
		<script src="assets/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
		<script src="assets/plugins/bootstrap-markdown/js/markdown.js"></script>
		<script src="assets/plugins/bootstrap-markdown/js/to-markdown.js"></script>
		<script src="assets/plugins/sparkline/js/jquery.sparkline.min.js"></script>
		
		<!-- Theme JS -->		
		<script src="assets/js/jquery.mmenu.min.js"></script>
		<script src="assets/js/core.min.js"></script>
		
		<!-- Pages JS -->
		<script src="assets/js/pages/form-editors.js"></script>
		<script type="text/javascript" src="assets/vendor/js/jquery.form.js"></script>
	<script type="text/javascript" src="assets/vendor/js/jquery-confirm.js"></script>
	<script src="assets/plugins/bootstrap-fileinput/js/fileinput.js"
	type="text/javascript"></script>
	
<script
	src="assets/plugins/bootstrap-fileinput/js/fileinput_locale_zh.js"
	type="text/javascript"></script>
		
		<!-- end: JavaScript-->
		<script type="text/javascript">

		$(document).ready(function(e) {
			$('.summernote').code($("#xy").val());
			});
		</script>
	<script>
$('#imgFile').fileinput({
	
	uploadAsync : true,
	showCaption : true,
	showUpload : false,//是否显示上传按钮  
	showRemove : true,//是否显示删除按钮  
	showCaption : true,//是否显示输入框  
	showPreview : true,
	showCancel : true,
	dropZoneEnabled : false,
	maxFileCount : 1,
	initialPreviewCount:2,
	msgFilesTooMany : "选择上传的文件数量  超过允许的最大数值！",
	initialDelimiter:'@@',
	previewFileIcon : '<i class="fa fa-file"></i>',
	allowedPreviewTypes : [ 'image' ],
	initialPreview :[
	             	<c:if test="${question.id>0}">
	                 "<img src='..${question.img}' class='file-preview-image'>"
	                </c:if> 
		             	],

	initialPreviewConfig : [
	                        
	                    	]
});
</script>
	<!-- end: JavaScript-->

</body>
