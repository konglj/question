  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
							<h2>发布问卷</h2>
						</div>					
					</div>		
					<!-- End Page Header -->
<form id="send_question_form" >
<input type="hidden" name="questionid" value="${questionid }">
<div class="row">
		<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
			<div class="panel panel-default bk-bg-white">
			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9"
						style="margin-top: 20px">
						
						<div class="panel panel-default " style="background-color: #000">
							<div class="panel-heading " >
								<h6>
								 <div class="checkbox-custom   " >
										<input type="checkbox" id="types" name="types" onclick="check_all(this,'type');"
										 checked="checked"	value="types"> <label for="checkbox1">全部运营商</label>
									</div>
									
								</h6>
							</div>
							<div class="panel-body">
							      <div class="row" style="margin-left: 10px">
							   
							    <c:forEach items="${ userTypes}" var="type">
							     <div class="checkbox-custom  col-md-3 ">
										<input type="checkbox" id="" name="type" checked="checked"  onclick="set_check_all(this,'types')"
											value="${type.typeid }"> <label for="checkbox1">${type.name}</label>
								</div>
								</c:forEach>				
									
								   </div>
								    <div class="row" style="margin-left:10px">
									
								</div>


							</div>
						</div>
					</div>
			
					<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9"
						style="margin-top: 20px">
						
						<div class="panel panel-default " style="background-color: #000">
							<div class="panel-heading ">
								<h6>
								 <div class="checkbox-custom ">
										<input type="checkbox" id="areas" name="areas" onclick="check_all(this,'area');"
										 checked="checked"	value="areas"> <label for="checkbox1">全部区域</label>
									</div>
								</h6>
							</div>
							<div class="panel-body">
							      <div class="row" style="margin-left: 10px">
							      <c:forEach items="${ userAreas}" var="area">
							    <div class="checkbox-custom  col-md-3 ">
										<input type="checkbox" id="area" name="area" checked="checked"  onclick="set_check_all(this,'areas')"
											value="${area.areaid }"> <label for="checkbox1">${area.areaname }</label>
										
									</div>
									</c:forEach>
								   </div>
								    <div class="row" style="margin-left:10px">
									
								</div>


							</div>
						</div>
					</div>
              
              

				</div>
				
				<div class="row">
							<div class="col-sm-9 col-sm-offset-3">
								<button class="bk-margin-5 btn btn-success   btn-labeled "
									id="save_button" type="button" onclick="send_question()">
									<span class="btn-label"><i class="fa fa-check"></i></span>发布
								</button>
								<button class="bk-margin-5 btn btn-labeled btn-success"
									type="button" onClick="change_menu('question/question_list.html')">
									<span class="btn-label"><i class="fa fa-arrow-left"></i></span>返回
								</button>
							</div>
						</div>
						</div>
				</div>
		
              </form>

</body>
</html>