<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<!-- Basic -->
<meta charset="UTF-8" />

<title></title>


<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<!-- start: CSS file-->

<!-- Vendor CSS-->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/vendor/skycons/css/skycons.css" rel="stylesheet" />
<link href="assets/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="assets/vendor/css/pace.preloader.css" rel="stylesheet" />

<!-- Plugins CSS-->
<link href="assets/plugins/bootkit/css/bootkit.css" rel="stylesheet" />
<link href="assets/plugins/scrollbar/css/mCustomScrollbar.css"
	rel="stylesheet" />
<link href="assets/plugins/magnific-popup/css/magnific-popup.css"
	rel="stylesheet" />
<link href="assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css"
	rel="stylesheet" />

<!-- Theme CSS -->
<link href="assets/css/jquery.mmenu.css" rel="stylesheet" />

<!-- Page CSS -->
<link href="assets/css/style.css" rel="stylesheet" />
<link href="assets/css/add-ons.min.css" rel="stylesheet" />
<link href="assets/plugins/sweetalert/css/sweetalert.css" media="all" rel="stylesheet" type="text/css" />
<!-- end: CSS file-->


<!-- Head Libs -->
<script src="assets/plugins/modernizr/js/modernizr.js"></script>


<!--[if lt IE 9]>
	        <script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->

</head>

<body>

	<!-- Main Page -->
	<div class="main">
		<!-- Page Header -->
		<div class="page-header">
			<div class="pull-left">
				<ol class="breadcrumb visible-sm visible-md visible-lg">
					<li><a href="../index_content.html"><i class="icon fa fa-home"></i>Home</a></li>

					<li class="active">密码设置</li>
				</ol>
			</div>
			<div class="pull-right">
				<h2>密码设置</h2>
			</div>
		</div>
		<!-- End Page Header -->
		<div class="row profile ">
			<div class="col-lg-8 col-md-8 col-sm-8">
				<div class="panel"  >
					<div class="panel-body">
						<div class="tabs tabs-warning">
							<ul class="nav nav-tabs">
								<li><a href="#pwd" data-toggle="tab">修改密码</a></li>
							</ul>
							<div class="tab-content">
								<div id="pwd" class="tab-pane updateProfile active">
									<form id="update_pwd_form" name="update_pwd_form" class="form-horizontal">
										<div
											class="bk-bg-white bk-padding-top-10 bk-padding-bottom-10">
											<h4>修改密码</h4>
											<fieldset>
												<div class="form-group">
													<label for="profileNewPassword">旧密码<span class="required">*</span></label> <input
														type="password" class="form-control" id="oldpwd" name="oldpwd"
														placeholder="请输入您的旧密码" />
												</div>
												<div class="form-group">
													<label for="profileNewPassword">新密码<span class="required">*</span></label> <input
														type="password" class="form-control" id="newpwd" name="newpwd"
														placeholder="请输入您的新密码,长度6-15" />
												</div>
												<div class="form-group">
													<label for="profileNewPasswordRepeat">确认密码<span class="required">*</span></label> <input
														type="password" class="form-control "
														id="newpwd2" name="newpwd2"  placeholder="请再次输入您的密码" />
												</div>
											</fieldset>
											<div class="bk-bg-white">
												<div class="row">
													<div class="col-md-12">
														<div class="pull-right">
															<button type="button" class="btn btn-primary" onclick="update_pwd()">提交</button>
															<button type="reset" class="btn btn-default">重置</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>

	</div>

	<!-- End Main Page -->




	<div class="clearfix"></div>

	</div>
	</div>
	<!-- start: JavaScript-->

	<!-- Vendor JS-->
	<script src="assets/vendor/js/jquery.min.js"></script>
	<script src="assets/vendor/js/jquery-2.1.1.min.js"></script>
	<script src="assets/vendor/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/skycons/js/skycons.js"></script>
	<script src="assets/vendor/js/pace.min.js"></script>

	<!-- Plugins JS-->

	<script src="assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
	<script
		src="assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="assets/plugins/bootkit/js/bootkit.js"></script>
	<script src="assets/plugins/moment/js/moment.min.js"></script>
	<script src="assets/plugins/magnific-popup/js/magnific-popup.js"></script>
	<script src="assets/plugins/sparkline/js/jquery.sparkline.min.js"></script>
	<script src="assets/plugins/jquery-validation/js/jquery.validate.js"></script>
		<script src="assets/plugins/pnotify/js/pnotify.custom.js"></script>
		<script src="assets/plugins/magnific-popup/js/magnific-popup.js"></script>
		<script src="assets/plugins/sparkline/js/jquery.sparkline.min.js"></script>
	<!-- Theme JS -->
	<script src="assets/js/jquery.mmenu.min.js"></script>
	<script src="assets/js/core.min.js"></script>

	<!-- Pages JS -->
	<script type="text/javascript" src="assets/js/jquery.form.js"></script>

       <script type="text/javascript" src="assets/plugins/sweetalert/js/sweetalert-dev.js"></script>
	<!-- end: JavaScript-->

</body>

</html>