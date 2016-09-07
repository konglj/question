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
							<h2>用户管理</h2>
						</div>					
					</div>		
					<!-- End Page Header -->
	<div class="row">
		<div class="col-lg-9 col-md-11 col-sm-11 col-xs-11">
			<div class="panel panel-default bk-bg-white">
				<div class="panel-heading bk-bg-white">
					<h6>
						<i class="fa fa-indent red"></i>用户编辑
					</h6>
					<div class="panel-actions">
						<a href="#" class="btn-minimize"><i class="fa fa-caret-up"></i></a>
						<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
					</div>
				</div>
				<div class="panel-body">
					<form id="user_save_form" method="post"  class="form-horizontal ">
						
						<div class="form-group">
							<label class="col-md-3 control-label"></label>
							<div class="col-md-9">
								<p class="form-control-static"></p>
							</div>
						</div>
					

						<div class="form-group">
							<label class="col-md-3 control-label" for="text-input">用户名:</label>
							<div class="col-md-8">
								<input type="text" id="username" name="username" class="form-control"
									value="${userPage.user.username}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" for="text-input">手机号:</label>
							<div class="col-md-8">
								<input type="text" id="usertele" name="usertele" class="form-control"
									value="${userPage.user.usertele}" />

							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label" for="text-input">邮箱:</label>
							<div class="col-md-8">
								<input type="text" id="usermail" name="usermail" class="form-control"
									value="${userPage.user.usermail}" />

							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label" for="text-input">用户区域:</label>
							<div class="col-md-8">
								<select class="form-control" id="userarea" name="userarea">
								 <optgroup label="请选择用户区域">
								<c:forEach items="${userPage.userAreas }" var="area">
								 <option value="${area.areaid }" <c:if test="${area.areaid==userPage.user.userarea }"> selected="selected"</c:if>>${area.areaname }</option>
								</c:forEach>
								 </optgroup>
								</select>

							</div>
						</div>
						
					 <div class="form-group">
							<label class="col-md-3 control-label" for="text-input">运营商:</label>
							<div class="col-md-8">
								<select class="form-control" id="usertype" name="usertype">
								 <optgroup label="请选择运营商">
								<c:forEach items="${userPage.userTypes }" var="type">
								 <option value="${type.typeid }" <c:if test="${type.typeid == userPage.user.usertype }"> selected="selected"</c:if>>${type.name }</option>
								</c:forEach>
								 </optgroup>
								</select>

							</div>
					</div>
					 <div class="form-group">
							<label class="col-md-3 control-label" for="text-input">角色:</label>
							<div class="col-md-8">
								<select class="form-control" id="userrole" name="userrole">
								 <optgroup label="请选择用户角色">
								<c:forEach items="${userPage.userRoles }" var="role">
								 <option value="${role.roleid }" <c:if test="${role.roleid == userPage.user.userrole }"> selected="selected"</c:if>>${role.rolename }</option>
								</c:forEach>
								 </optgroup>
								</select>

							</div>
					</div>
					
					
						<div class="form-group">
							<label class="col-md-3 control-label" for="text-input">备注:</label>
							<div class="col-md-8">
							<textarea rows="3" id="userbz" name="userbz" class="form-control"
								>${userPage.user.userbz}</textarea>

							</div>
						</div>
						
						<div class="row" >
							<div class="col-sm-9 col-sm-offset-3">
								<button class="bk-margin-5 btn btn-success   btn-labeled "
									id="save_button" type="button" onclick="user_save()">
									<span class="btn-label"><i class="fa fa-check"></i></span>保存
								</button>
								<button class="bk-margin-5 btn btn-labeled btn-success"
									type="button" onClick="change_menu('user/user_list.html')">
									<span class="btn-label"><i class="fa fa-arrow-left"></i></span>返回
								</button>
							</div>
						</div>


						<br />
                  <input type="hidden" id="userid"  name="userid" value="${userPage.user.userid}">
                 

					</form>
				</div>
			</div>
		</div>
	</div>
					
		<!-- Pages JS -->
		
</body>
