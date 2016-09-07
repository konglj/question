  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html >
	<link rel="stylesheet" type="text/css" href="assets/question/css/wenjuan_ht.css">
<body>
<style>
 .xxk_title li{width: 132px; }
 .xxk_box {background:#f2f2f2}
 .qxbj_but {background:#ddd}
</style>


<script src="assets/question/js/jquery-1.8.0.min.js"></script>

<script>
$(document).ready(function(e) {
   
	
});

</script>
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
				<h2>答卷详情</h2>
			</div>					
	</div>		
					<!-- End Page Header -->
<div class="row">		
	<div class="col-lg-12">
		<div class="panel panel-default bk-bg-white">
			<div class="panel-heading bk-bg-white">
					<h6><i class="fa fa-table"></i><span class="break"></span>答卷详情</h6>
					</div>
<div class="panel-body">
<div class=" all_660">
  <div class="yd_box">
  
   <c:forEach items="${ questionPage.answerInfos}" var="answerInfo" varStatus="status">
   
    <c:choose>
     <c:when test="${answerInfo.type==0 }">
    	 <div class="movie_box1" >
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1 }</i>. <i class="btwenzi">${answerInfo.title }</i>
					<c:if test="${ answerInfo.subPfCount>0}">
					&nbsp;&nbsp;&nbsp;&nbsp;(评分平均值：${answerInfo.pfavg })
					</c:if>
					</div>
					<input type="hidden" id="id" name="q_${answerInfo.id }" value="${answerInfo.id }"  class="id">
				</li>
				</ul>
				<div class="dx_box" data-t="0"></div>
			</div>
    	
    	
    </c:when>
    <c:when test="${answerInfo.type==1 }">
    	 <div class="movie_box1">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1 }</i>. <i class="btwenzi">${answerInfo.title }</i></div>
					<input type="hidden" name="q_${answerInfo.id }" id="id" value="${answerInfo.id }"  class="id">
				</li>
      			<li>
      		<input name="q_${answerInfo.id }" type="text"  class="input_wenbk" value="${answerInfo.content}" >
				 </li>
     
				</ul>
				<div class="dx_box" data-t="1"></div>
			</div>
    	
    	
    </c:when>
    
    <c:when test="${answerInfo.type==2 }">
    	 <div class="movie_box1">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1 }</i>. <i class="btwenzi">${answerInfo.title }</i><span class="tip_wz" style="color:red;margin-left:5px"><c:if test="${answerInfo.required==1 }">*</c:if></span></div>
				</li>
      			<li>
      			 <label>
					<input name="q_${answerInfo.id }" type="text"  class="input_wenbk" value="${answerInfo.content}" >
				</label>
				 </li>
     
				</ul>
				<div class="dx_box" data-t="2"></div>
			</div>
    	
    	
    </c:when>
    
      <c:when test="${answerInfo.type==3 }">
    	 <div class="movie_box1">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1 }</i>. <i class="btwenzi">${answerInfo.title }</i><span class="tip_wz" style="color:red;margin-left:5px"><c:if test="${answerInfo.required==1 }">*</c:if></span></div>
				</li>
      			<li>
      			 <label>
					 <textarea name="q_${answerInfo.id }" cols="" rows="3"  class="input_wenbk btwen_text btwen_text_dx" > ${answerInfo.content} </textarea>
					 
				</label>
				 </li>
     
				</ul>
				<div class="dx_box" data-t="3"></div>
			</div>
    	
    	
    </c:when>
    
    <c:when test="${answerInfo.type==4 }">
    	 <div class="movie_box1">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1 }</i>. <i class="btwenzi">${answerInfo.title }</i><span class="tip_wz" style="color:red;margin-left:5px"></span></div>
				</li>
      			<li>
      			 <c:choose>
                                  <c:when test="${not empty answerInfo.content }">
                                  <c:set value="${ fn:split(answerInfo.content, ',') }" var="str1" />
									<c:forEach items="${ str1 }" var="s">
											<a href="../..${s} ">点击下载文件 </a><br/>
								 </c:forEach>
                                  </c:when>
								<c:otherwise>
                                 </c:otherwise>
                                   </c:choose>
				 </li>
     
				</ul>
				<div class="dx_box" data-t="4"></div>
			</div>
    	
    	
    </c:when>
    
    
    </c:choose>
    
    
    
      <c:forEach items="${ answerInfo.subAnswerInfo}" var="subAnswerInfo" varStatus="substatus">
   
    <c:choose>
     <c:when test="${subAnswerInfo.type==0 }">
    	 <div class="movie_box1" style="margin-left: 30px">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1}.${substatus.index+1 }</i>. <i class="btwenzi">${subAnswerInfo.title }</i></div>
					<input type="hidden" id="id" value="${subAnswerInfo.id }"  class="id">
				</li>
				</ul>
				<div class="dx_box" data-t="0"></div>
			</div>
    	
    	
    </c:when>
    <c:when test="${subAnswerInfo.type==1 }">
    	 <div class="movie_box1" style="margin-left: 30px">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1}.${substatus.index+1 }</i>. <i class="btwenzi">${subAnswerInfo.title }</i></div>
					<input type="hidden" id="id" value="${subAnswerInfo.id }"  class="id">
				</li>
      			<li>
      				<input name="" type="text" value="${ subAnswerInfo.content}" class="input_wenbk" >
				 </li>
     
				</ul>
				<div class="dx_box" data-t="1"></div>
			</div>
    	
    	
    </c:when>
    
    <c:when test="${subAnswerInfo.type==2 }">
    	 <div class="movie_box1" style="margin-left: 30px">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1}.${substatus.index+1 }</i>. <i class="btwenzi">${subAnswerInfo.title }</i><span class="tip_wz" style="color:red;margin-left:5px"><c:if test="${subAnswerInfo.required==1 }">*</c:if></span></div>
					<input type="hidden" id="id" value="${subAnswerInfo.id }"  class="id">
					<input type="hidden" class="ismust" value="${subAnswerInfo.required}">
				</li>
      			<li>
      			 <label>
					<input name="" type="text" value="${ subAnswerInfo.content}" class="input_wenbk" >
				</label>
				 </li>
     
				</ul>
				<div class="dx_box" data-t="2"></div>
			</div>
    	
    	
    </c:when>
    
      <c:when test="${subAnswerInfo.type==3 }">
    	 <div class="movie_box1" style="margin-left: 30px">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1}.${substatus.index+1 }</i>. <i class="btwenzi">${subAnswerInfo.title }</i><span class="tip_wz" style="color:red;margin-left:5px"><c:if test="${subAnswerInfo.required==1 }">*</c:if></span></div>
				</li>
      			<li>
      			 <label>
					 <textarea name="" cols="" rows="3"  class="input_wenbk btwen_text btwen_text_dx" >${ subAnswerInfo.content}</textarea>
					 
				</label>
				 </li>
     
				</ul>
				<div class="dx_box" data-t="3"></div>
			</div>
    	
    	
    </c:when>
    
    <c:when test="${subAnswerInfo.type==4 }">
    	 <div class="movie_box1" style="margin-left: 30px">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1}.${substatus.index+1 }</i>. <i class="btwenzi">${subAnswerInfo.title }</i><span class="tip_wz" style="color:red;margin-left:5px"></span></div>
				</li>
      			<li>
      			 <label>
						 <c:choose>
                                  <c:when test="${not empty answerInfo.content }">
                                  <c:set value="${ fn:split(answerInfo.content, ',') }" var="str1" />
									<c:forEach items="${ str1 }" var="s">
											<a href="../..${s} ">点击下载文件 </a><br/>
								 </c:forEach>
                                  </c:when>
								<c:otherwise>
                                 </c:otherwise>
                                   </c:choose>
					 
				</label>
				 </li>
     
				</ul>
				<div class="dx_box" data-t="4"></div>
			</div>
    	
    	
    </c:when>
    
    
    </c:choose>
   </c:forEach>
   </c:forEach>
      <div class="row" >
							<div class="col-sm-12 col-sm-offset-3">
								<button class="bk-margin-5 btn btn-labeled btn-success"
									type="button" onClick="change_menu('question/get_answer.html?questionid=${questionPage.questionid}')">
									<span class="btn-label"><i class="fa fa-arrow-left"></i></span>返回
								</button>
							</div>
						</div>
  </div>
  </div>
  </div>
  </div>
  </div>
  </div>
  
  
  
  
</body>
