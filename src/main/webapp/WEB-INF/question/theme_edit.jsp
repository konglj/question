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
 .answerrole{margin: 0px 2px 2px 2px;}
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
				<h2>一级题目维护</h2>
			</div>					
	</div>		
					<!-- End Page Header -->
<div class="row">		
	<div class="col-lg-12">
		<div class="panel panel-default bk-bg-white">
			<div class="panel-heading bk-bg-white">
					<h6><i class="fa fa-table"></i><span class="break"></span>一级题目</h6>
					</div>
<div class="panel-body">
<div class=" all_660">
  <div class="yd_box">
  
   <c:forEach items="${ questionPage.themes}" var="theme" varStatus="status">
   
    <c:choose>
     <c:when test="${theme.type==0 }">
    	 <div class="movie_box">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1 }</i>. <i class="btwenzi">${theme.title }</i></div>
					<input type="hidden" id="id" value="${theme.id }"  class="id">
					<input type="hidden" class="answerrole" value="${theme.answerrole}">
				</li>
				</ul>
				<div class="dx_box" data-t="0"></div>
			</div>
    	
    	
    </c:when>
    <c:when test="${theme.type==1 }">
    	 <div class="movie_box">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1 }</i>. <i class="btwenzi">${theme.title }</i><span class="tip_wz" style="color:red;margin-left:5px"><c:if test="${theme.required==1 }">*</c:if></span></div>
					<input type="hidden" id="id" value="${theme.id }"  class="id">
					<input type="hidden" class="answerrole" value="${theme.answerrole}">
					<input type="hidden" class="minscore" value="${theme.minscore}">
					<input type="hidden" class="maxscore" value="${theme.maxscore}">
					<input type="hidden" class="ismust" value="${theme.required}">
				</li>
      			<li>
      				<input name="" type="text"  class="input_wenbk" >
				 </li>
     
				</ul>
				<div class="dx_box" data-t="1"></div>
			</div>
    	
    	
    </c:when>
    
    <c:when test="${theme.type==2 }">
    	 <div class="movie_box">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1 }</i>. <i class="btwenzi">${theme.title }</i><span class="tip_wz" style="color:red;margin-left:5px"><c:if test="${theme.required==1 }">*</c:if></span></div>
					<input type="hidden" id="id" value="${theme.id }"  class="id">
					<input type="hidden" class="ismust" value="${theme.required}">
					<input type="hidden" class="answerrole" value="${theme.answerrole}">
				</li>
      			<li>
      			 <label>
					<input name="" type="text"  class="input_wenbk" >
				</label>
				 </li>
     
				</ul>
				<div class="dx_box" data-t="2"></div>
			</div>
    	
    	
    </c:when>
    
      <c:when test="${theme.type==3 }">
    	 <div class="movie_box">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1 }</i>. <i class="btwenzi">${theme.title }</i><span class="tip_wz" style="color:red;margin-left:5px"><c:if test="${theme.required==1 }">*</c:if></span></div>
					<input type="hidden" id="id" value="${theme.id }"  class="id">
					<input type="hidden" class="ismust" value="${theme.required}">
					<input type="hidden" class="answerrole" value="${theme.answerrole}">
				</li>
      			<li>
      			 <label>
					 <textarea name="" cols="" rows="3"  class="input_wenbk btwen_text btwen_text_dx" ></textarea>
					 
				</label>
				 </li>
     
				</ul>
				<div class="dx_box" data-t="3"></div>
			</div>
    	
    	
    </c:when>
    
    <c:when test="${theme.type==4 }">
    	 <div class="movie_box">
			<ul class="wjdc_list">
				<li>
					<div class="tm_btitlt"><i class="nmb">${status.index+1 }</i>. <i class="btwenzi">${theme.title }</i><span class="tip_wz" style="color:red;margin-left:5px">(最大${theme.filemaxsize }M)</span></div>
					<input type="hidden" id="id" value="${theme.id }"  class="id">
					<input type="hidden" class="maxvalue" value="${theme.filemaxsize }">
					<input type="hidden" class="answerrole" value="${theme.answerrole}">
				</li>
      			<li>
      			 <label>
					 <input name="" type="file"  class="input_wenbk" >
					 
				</label>
				 </li>
     
				</ul>
				<div class="dx_box" data-t="4"></div>
			</div>
    	
    	
    </c:when>
    
    
    </c:choose>
   </c:forEach>
    
  </div>
  
  
  <!--选项卡区域  模板区域---------------------------------------------------------------------------------------------------------------------------------------->
  
  <div class="xxk_box" >
    <ul class="xxk_title">
      <li class="on" >一级题目</li>
      <li>评分</li>
      <li>单行文本</li>
      <li>多行文本</li>
      <li>文件上传</li>
    </ul>
    <div class="xxk_conn"> 
    
      <!--评分----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box tigan ">
     
      <form id="form_tigan" class="form_tigan" >
        <input type="hidden" name="id" class="id" value="0">
        <input type="hidden" name="type" value="0">
         <input type="hidden" name="questionid" value="${questionPage.questionid }">
          <label style="float: left;">
              <span>可答人员：</span></label>
 		<select class="answerrole" name="answerrole">
        <option value="0">全部人员</option>
        <option value="1">建设员工</option>
        <option value="4">运维员工</option>
        </select>
        <textarea name="title" id="title" cols="" rows=""  class="input_wenbk btwen_text btwen_text_dx" placeholder="题干标题"></textarea>
       
      	 <div class="title_itram">
        <!--完成编辑-->
        
        <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);"  class="swcbj_but tigan_save" > 完成编辑</a> </div>
        </div>
       </form> 
      </div>
      
      <!--评分----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box pingfen hide">
       <form id="form_pingfen" class="form_pingfen">
        <input type="hidden" name="id" class="id" value="0">
        <input type="hidden" name="questionid" value="${questionPage.questionid }">
        <input type="hidden" name="type" value="1">
         <label style="float: left;">
              <span>可答人员：</span></label>
 		<select class="answerrole" name="answerrole">
        <option value="0">全部人员</option>
        <option value="1">建设员工</option>
        <option value="4">运维员工</option>
        </select>
        <textarea name="title" cols="" rows=""  class="input_wenbk btwen_text btwen_text_dx" placeholder="评分题目"></textarea>
        <div class="title_itram">
          <div class="kzjxx_iteam">
            <label style="float: left;">
              <span>最小值：</span></label>
           <input name="minscore" type="text" class="input_wenbk minscore" placeholder="最小值">
           
            
        </div>
        <div class="kzjxx_iteam">
            <label style="float: left;">
              <span>最大值：</span></label>
           <input name="maxscore" type="text" class="input_wenbk maxscore" placeholder="最大值" >
        </div>
        <div class="kzjxx_iteam">
          <label>
              <input name="required" type="checkbox" value="" class="fxk ismust">
              <span>是否为必填项</span></label>
         </div>     
        
        <!--完成编辑-->
        <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);"  class="swcbj_but save_pingfen" > 完成编辑</a> </div>
      </div>
      </form>
      </div>
      
      
      <!-- 单行文本----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box singeltext hide">
       <form id="form_singeltext" class="form_singeltext">
        <input type="hidden" name="id" class="id" value="0">
        <input type="hidden" name="type" value="2"> 
        <input type="hidden" name="questionid" value="${questionPage.questionid }">
         <label style="float: left;">
              <span>可答人员：</span></label>
 		<select class="answerrole" name="answerrole">
        <option value="0">全部人员</option>
        <option value="1">建设员工</option>
        <option value="4">运维员工</option>
        </select>
        <textarea name="title"  cols="" rows="" class="input_wenbk btwen_text btwen_text_tk" placeholder="单行文本题目" ></textarea>
           <label>
              <input name="required" type="checkbox" value="" class="fxk ismust">
              <span>是否为必填项</span></label>
             
        <!--完成编辑-->
        <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but save_singeltext" > 完成编辑</a> </div>
       </form>
      </div>
      
      
      <!--多行文本框----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box doubletext hide">
       <form id="form_doubletext" class="form_doubletext">
        <input type="hidden" name="id" class="id" value="0">
        <input type="hidden" name="type" value="3">
        <input type="hidden" name="questionid" value="${questionPage.questionid }">
         <label style="float: left;">
              <span>可答人员：</span></label>
 		<select class="answerrole" name="answerrole">
        <option value="0">全部人员</option>
        <option value="1">建设员工</option>
        <option value="4">运维员工</option>
        </select>
        <textarea name="title"  cols="" rows="" class="input_wenbk btwen_text btwen_text_tk" placeholder="多行文本题目" ></textarea>
           <label>
              <input name="required" type="checkbox" value="" class="fxk ismust">
              <span>是否为必填项</span></label>
             
        
        <!--完成编辑-->
       <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but save_doubletext" > 完成编辑</a> </div>
     </form>
      </div>
      
      
      
      <!--文件上传----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box  uploadfile hide">
      <form id="form_file" class="form_file">
        <input type="hidden" name="id" class="id" value="0">
        <input type="hidden" name="type" value="4">
        <input type="hidden" name="questionid" value="${questionPage.questionid }">
         <label style="float: left;">
              <span>可答人员：</span></label>
 		<select class="answerrole" name="answerrole">
        <option value="0">全部人员</option>
        <option value="1">建设员工</option>
        <option value="4">运维员工</option>
        </select>
        <textarea name="title"  cols="" rows="" class="input_wenbk btwen_text btwen_text_tk" placeholder="文件上传题目" ></textarea>
         <div class="kzjxx_iteam">
             <label style="float: left;">
              <span>最大文件大小（M）：</span></label>
           <input name="filemaxsize" type="text" class="input_wenbk maxvalue" placeholder="最大值" onblur="if(!this.value)this.value='最大值'" onclick="if(this.value&&this.value=='最大值' )  this.value=''">
        </div>
          <!--完成编辑-->
         <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but save_file" > 完成编辑</a> </div>
       </form>
        </div>
      
    </div>
    <!-- xxk_conn -->
  </div>
  </div>
  <div class="row" ></div>
    <div class="row" ></div>
    </br>
  <div class="row" >
							<div class="col-sm-12 col-sm-offset-3">
								<button class="bk-margin-5 btn btn-labeled btn-success"
									type="button" onClick="change_menu('question/theme_list.html?questionid=${questionPage.questionid }')">
									<span class="btn-label"><i class="fa fa-arrow-left"></i></span>返回
								</button>
							</div>
						</div>
  </div>
  </div>
  </div>

  
		  </div>
		 
<script type="text/javascript">
$(document).ready(function(e) {
	

	$(".xxk_title li").click(function(){
		var xxkjs = $(this).index(); 
		$(this).addClass("on").siblings().removeClass("on");
	
		$(".xxk_conn").children(".xxk_xzqh_box").eq(xxkjs).show().siblings().hide();
		$(".xxk_conn").children(".xxk_xzqh_box").eq(xxkjs).removeClass("hide");
		
	});	 
});
</script>
  
</body>
