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
								<li class="active"><i class="fa fa-laptop"></i>问卷管理</li>
							</ol>						
						</div>
						<div class="pull-right">
							<h2>问题维护</h2>
						</div>					
					</div>		
					<!-- End Page Header -->
					<div class="row">		
						<div class="col-lg-12">
							<div class="panel panel-default bk-bg-white">
								<div class="panel-heading bk-bg-white">
									<h6><i class="fa fa-table"></i><span class="break"></span>问题列表</h6>
									  <div class="form-group" style="float:right;">
			       						<a href="#" onclick="change_menu('question/theme_edit.html?questionid=${questionPage.questionid}')">
											<button class="bk-margin-5 btn btn-labeled btn-success" type="button">
												<span class="btn-label">
												<i class="fa fa-edit"></i>
												</span>编辑
											</button>
											
										 </a>
										 <button class="bk-margin-5 btn btn-labeled btn-success"
									type="button" onClick="change_menu('question/question_list.html')">
									<span class="btn-label"><i class="fa fa-arrow-left"></i></span>返回
								</button>
									</div>
								</div>
								<div class="panel-body">
									<div class="table-responsive">	
										<table class="table table-bordered table-striped" id="datatable-default1">
											<thead>
												<tr>
													<th>标题</th>
													<th>题目类型</th>
													<th>子题目数量</th>
													<th>可答人员</th>
													<th>维护子题目</th>
												</tr>
											</thead>   
											<tbody>	
											<c:forEach items="${questionPage.themes }" var="theme">						
												<tr>
													<td>${theme.title}</td>
													<td>${theme.typename }</td>
													<td>
													 ${theme.subcount }
													</td>
													<td>
													<c:choose>
													<c:when test="${theme.answerrole ==0 }">全部人员</c:when>
													<c:when test="${theme.answerrole ==1 }">建设人员</c:when>
													<c:when test="${theme.answerrole ==4 }">运维人员</c:when>
													</c:choose>
													</td>
													
													
													<td>
														<a class="btn btn-info" href="#" onclick="change_menu('question/theme_sub_edit.html?themeid=${theme.id}')" title="问题列表">
															<i class="fa  fa-list "></i> 
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
					
		<!-- Pages JS -->
				<!-- Pages JS -->
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
