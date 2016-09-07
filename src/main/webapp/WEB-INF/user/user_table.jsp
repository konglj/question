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
						<div class="col-lg-12">
							<div class="panel panel-default bk-bg-white">
								<div class="panel-heading bk-bg-white">
									<h6><i class="fa fa-table"></i><span class="break"></span>用户列表</h6>
									  <div class="form-group" style="float:right;">
			       						<a href="#" onclick="change_menu('user/user_edit.html?userid=0')">
											<button class="bk-margin-5 btn btn-labeled btn-success" type="button">
												<span class="btn-label">
												<i class="fa fa-plus"></i>
												</span>添加
											</button>
				 </a>
									</div>
								</div>
								<div class="panel-body">
									<table class="table table-bordered table-striped" id="datatable-default1">
											<thead>
												<tr>
													<th>姓名</th>
													<th>手机号</th>
													<th>微信名称</th>
													<th>区域</th>
													<th>运营商</th>
													<th>角色</th>
													<th>是否注册</th>
													<th>操作</th>
												</tr>
											</thead>   
											<tbody>	
											<c:forEach items="${userPage.users }" var="user">						
												<tr>
													<td>${user.username}</td>
													<td>${user.usertele }</td>
													<td>${user.wxname }</td>
													
													<td>${user.areaname}</td>
													<td>${user.usertypename}</td>
													<td>${user.userrolename }</td>
													<td>
														<span class="label label-warning">
														 ${user.isregistname}
														</span>
													</td>
													<td>
														<a class="btn btn-success" href="#" onclick="change_menu('user/user_info.html?userid='+${user.userid})" title="详情">
															<i class="fa fa-search-plus "></i>                                            
														</a>
														<a class="btn btn-info" href="#" onclick="change_menu('user/user_edit.html?userid='+${user.userid})" title="编辑">
															<i class="fa fa-edit "></i>                                            
														</a>
														<a class="btn btn-danger" href="#" onclick="del_user(${user.userid})" title="删除">
															<i class="fa fa-trash-o "></i> 

														</a>
													</td>
												</tr>
											</c:forEach>		
											</tbody>
										</table>
									</div>
								</div>
							</div>
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
		<script src="assets/plugins/moment/js/moment.min.js"></script>
		<script src="assets/plugins/select2/select2.js"></script>				
		<script src="assets/plugins/jquery-datatables/media/js/jquery.dataTables.js"></script>
		<script src="assets/plugins/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
		<script src="assets/plugins/jquery-datatables-bs3/js/datatables.js"></script>		
		<script src="assets/plugins/sparkline/js/jquery.sparkline.min.js"></script>
		
		<!-- Theme JS -->		
		<script src="assets/js/jquery.mmenu.min.js"></script>
		<script src="assets/js/core.min.js"></script>
		
		<!-- Pages JS -->
		<script src="assets/js/pages/table-advanced.js"></script>
			<script type="text/javascript">
		  $(document).ready(function() {
	            $("#datatable-default1").dataTable({
	            	 ordering:false
		            });
		  });
		</script>
</body>
