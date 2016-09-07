  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html >
<style>
.title
{
   width:200px;
   white-space:nowrap;
   word-break:keep-all;
   overflow:hidden;
   text-overflow:ellipsis;
}
</style>
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
						<div class="col-lg-12">
							<div class="panel panel-default bk-bg-white">
								<div class="panel-heading bk-bg-white">
									<h6><i class="fa fa-table"></i><span class="break"></span>问卷列表</h6>
									  <div class="form-group" style="float:right;">
			       						<a href="#" onclick="change_menu('question/question_edit.html?questionid=0')">
											<button class="bk-margin-5 btn btn-labeled btn-success" type="button">
												<span class="btn-label">
												<i class="fa fa-plus"></i>
												</span>添加
											</button>
				 </a>
									</div>
								</div>
								<div class="panel-body">
									<div class="table-responsive">	
									<table class="table table-bordered table-striped" id="datatable-default1">
											<thead>
												<tr>
													<th>标题</th>
													<th>问卷状态</th>
													<th>添加时间</th>
													<th>操作</th>
												</tr>
											</thead>   
											<tbody>	
											<c:forEach items="${questionPage.questions }" var="question">						
												<tr>
													<td class="title">${question.title}</td>
													<td>
														<span class="label label-warning">
														${question.statename}
														</span>
													</td>
													<td>${question.addtime}</td>
													
													
													<td>
														<a class="btn btn-info" href="#" onclick="change_menu('question/question_edit.html?questionid='+${question.id})" title="编辑">
															<i class="fa fa-edit "></i>                                            
														</a>
														<a class="btn btn-danger" href="#" onclick="del_question(${question.id})" title="删除">
															<i class="fa fa-trash-o "></i> 
														</a>
														<a class="btn  btn-success" href="#" onclick="change_menu('question/theme_list.html?questionid='+${question.id})" title="问题列表">
															<i class="fa  fa-list "></i> 
														</a>
														<c:if test="${question.issend==0 }">
														<a class="btn btn-warning" href="#" onclick="change_menu('question/send_question.html?questionid='+${question.id})" title="发布问卷">
															<i class="fa  fa-share "></i> 
														</a>
														</c:if>
														<c:if test="${question.issend==1}">
														<a class="btn btn-primary" href="#" onclick="change_menu('question/get_answer.html?questionid='+${question.id})" title="查看答卷">
															<i class="fa   fa-paste  "></i> 
														</a>
														</c:if>
														
														
														
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
