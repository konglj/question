  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html >

<body>
<!-- Page Header -->
					<div class="page-header">
						<div class="pull-left">
							<ol class="breadcrumb visible-sm visible-md visible-lg">								
								<li><a href="index.html"><i class="icon fa fa-home"></i>首页</a></li>
								<li class="active"><i class="fa fa-laptop"></i>用户管理</li>
							</ol>						
						</div>
						<div class="pull-right">
							<h2>用户详情</h2>
						</div>					
					</div>		
					<!-- End Page Header -->
				<div class="row">
		<div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
			<div class="panel panel-default bk-bg-white">
				<div class="panel-heading bk-bg-white">
					<h6>
						<i class="fa fa-indent red"></i>用户详情
					</h6>
					<div class="panel-actions">
						<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
					</div>
				</div>
				<div class="panel-body">
					<form id="role_save_form" name="role_save_form"
						class="form-horizontal ">

                        <div class="form-group">
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label">&nbsp;&nbsp;用户名: </label> <label
								class="col-md-4 ">${user.username}</label>
						</div>
						<div class="form-group">
								<label class="col-md-4 control-label">&nbsp;&nbsp;手机号: </label> <label class="col-md-6 ">${user.usertele}</label>
						</div>
						<div class="form-group">
								<label class="col-md-4 control-label">&nbsp;&nbsp;邮箱: </label> <label class="col-md-6 ">${user.usermail}</label>
						</div>

						<div class="form-group">

								<label class="col-md-4 control-label">微信名:</label> <label class="col-md-6 ">${user.wxname}</label>
						</div>
						<div class="form-group">
								<label class="col-md-4 control-label">区域:</label> <label class="col-md-6 ">${user.areaname}</label>
						</div>
						<div class="form-group">
								<label class="col-md-4 control-label">运营商:</label> <label class="col-md-6 ">${user.usertypename}</label>
						</div>
						<div class="form-group">
								<label class="col-md-4 control-label">角色:</label> <label class="col-md-6">${user.userrolename}</label>
						</div>
						<div class="form-group">
								<label class="col-md-4 control-label">添加时间:</label> <label class="col-md-6">${user.addtime}</label>
						</div>
						<div class="form-group">
								<label class="col-md-4 control-label">注册状态:</label> <label class="col-md-6">${user.isregistname}</label>
						</div>
						<div class="form-group">
								<label class="col-md-4 control-label">注册时间:</label> <label class="col-md-6 " >${user.registtime}</label>
						</div>
						<div class="form-group">
						<label class="col-md-4 control-label">备注:</label> <label class="col-md-6 " >${user.userbz}</label>
						</div>
						<div class="form-group"></div>


						<div class="row">
							<div class="col-sm-9 col-sm-offset-3">
								<button class="bk-margin-5 btn btn-labeled btn-success"
									type="button" onClick="change_menu('user/user_list.html')">
									<span class="btn-label"><i class="fa fa-arrow-left"></i></span>返回
								</button>
							</div>
						</div>


						<br />


					</form>
				</div>
			</div>
		</div>
	</div>
					
		<!-- Pages JS -->
		
</body>
