  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html >
<style>
			form {
				margin: 0;
			}
			textarea {
				display: block;
			}
		</style>
	<link rel="stylesheet" type="text/css" href="assets/question/css/wenjuan_ht.css">
	<link href="assets/plugins/jqvmap/jqvmap.css" rel="stylesheet" />
<link href="assets/plugins/bootstrap-fileinput/css/fileinput.css"
	media="all" rel="stylesheet" type="text/css" />
	<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
		<link href="assets/editor/themes/default/default.css" rel="stylesheet" type="text/css"/>
		<link href="assets/css/jquery-confirm.css" rel="stylesheet" type="text/css"/>
		<script charset="utf-8" src="assets/editor/kindeditor-min.js"></script>
		<script charset="utf-8" src="assets/editor/lang/zh_CN.js"></script>
		<script type="text/javascript" src="assets/js/jquery.js"></script>
			<script type="text/javascript" src="assets/js/jquery-confirm.js"></script>
        <script type="text/javascript" src=".assets/plugins/jquery-validation/js/jquery.validate.js"></script>
		<script type="text/javascript" src="assets/js/page/notice/twnotice.js"></script>
		<script>
		$(document).ready(function(e) {
			alert("ddd");
			alert(KindEditor);
			var editor;
			KindEditor.ready(function(K) {
				alert("dd");
				editor = K.create('textarea[name="content"]', {
					allowFileManager : true,
					items: ['source', '|', 'undo', 'redo', '|', 'preview',   'cut', 'copy', 'paste', 'plainpaste', 'wordpaste',
					        '|', 'justifyleft', 'justifycenter', 'justifyright', 'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 
					        'outdent', 'subscript', 'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/', 'formatblock', 'fontname',
					         'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|',
					         'image', 'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons',   'link', 'unlink',
					         '|'],
					       uploadJson : 'upload_image.html',
				});
				K('input[name=getHtml]').click(function(e) {
					alert(editor.html());
				});
				K('input[name=isEmpty]').click(function(e) {
					alert(editor.isEmpty());
				});
				K('input[name=getText]').click(function(e) {
					alert(editor.text());
				});
				K('input[name=selectedHtml]').click(function(e) {
					alert(editor.selectedHtml());
				});
				K('input[name=setHtml]').click(function(e) {
					editor.html('<h3>Hello KindEditor</h3>');
				});
				K('input[name=setText]').click(function(e) {
					editor.text('<h3>Hello KindEditor</h3>');
				});
				K('input[name=insertHtml]').click(function(e) {
					editor.insertHtml('<strong>插入HTML</strong>');
				});
				K('input[name=appendHtml]').click(function(e) {
					editor.appendHtml('<strong>添加HTML</strong>');
				});
				K('input[name=clear]').click(function(e) {
					editor.html('');
				});
			});
		});
		</script>

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
						enctype="multipart/form-data"   class="form-horizontal ">
						
						<div class="form-group">
							<label class="col-md-3 control-label"></label>
							<div class="col-md-9">
								<p class="form-control-static"></p>
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
							<textarea rows="3" cols=""  id="desc" name="desc" class="form-control">${question.desc}</textarea>

							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label" for="text-input">调查时间:</label>
							<div class="col-md-8">
								<div class="input-daterange input-group" data-plugin-datepicker>
									<span class="input-group-addon"> <i
										class="fa fa-calendar"></i>
									</span> <input type="text" class="form-control" id="startime" name="starttime" format="yyyy-mm-dd"  value="${question.starttime}" /> <span
										class="input-group-addon">to</span> <input type="text"
										class="form-control" name="endtime" name="endtime" value="${question.endtime}"  />
								</div>

							</div>
						</div>
						
					 
					
						<div class="form-group">
							<label class="col-md-3 control-label" for="text-input">感谢词:</label>
							<div class="col-md-8">
							<textarea rows="3" id="bz" name="bz" class="form-control"
									>${question.bz}</textarea>

							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3  control-label" for="text-input">封面图片:<span
								class="required">*</span></label>
							<c:if test="${question.id!=0 }">
							
							<div class="col-md-8"><label><font color="red">已上传图片，点击删除按钮即已删除，请谨慎删除</font></label></div>
							</c:if>
							<div class="col-md-8">
								<input id="imgFile" style="width: 60%" name="imgFile" class="file"
									type="file" multiple data-preview-file-type="any"
									data-upload-url="#" data-preview-file-icon="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" for="text-input">工作函:</label>
							<div class="col-md-8">
			       <textarea id="content" name="content" style="width:800px;height:600px;">${twNotice.content}</textarea>


							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-9 col-sm-offset-3">
								<button class="bk-margin-5 btn btn-success   btn-labeled "
									id="save_button" type="button" onclick="save_question()">
									<span class="btn-label"><i class="fa fa-check"></i></span>保存
								</button>
								<button class="bk-margin-5 btn btn-labeled btn-success"
									type="button" onClick="change_menu('question/question_list.html')">
									<span class="btn-label"><i class="fa fa-arrow-left"></i></span>返回
								</button>
							</div>
						</div>


						<br />
                 	 <input type="hidden" id="id"  name="id" value="${question.id}">
                 

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
		<script src="assets/plugins/bootstrap-fileinput/js/fileinput.js"
	type="text/javascript"></script>
	<script type="text/javascript" src="assets/vendor/js/jquery.form.js"></script>
	<script type="text/javascript" src="assets/vendor/js/jquery-confirm.js"></script>
<script
	src="assets/plugins/bootstrap-fileinput/js/fileinput_locale_zh.js"
	type="text/javascript"></script>
	<script
	src="assets/plugins/bootstrap-fileinput/js/fileinput_locale_zh.js"
	type="text/javascript"></script>
		<script type="text/javascript" src="jquery-1.3.2.min.js"></script>
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
	             	<c:if test="${question.id!=0}">
	                 "<img src='..${question.img}' class='file-preview-image'>"
	                </c:if> 
		             	],

	initialPreviewConfig : [
	                        
	                    	]
});
</script>
<!-- end: JavaScript-->

</body>
