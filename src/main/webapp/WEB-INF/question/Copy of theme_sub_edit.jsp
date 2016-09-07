  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html >
	<link rel="stylesheet" type="text/css" href="assets/question/css/wenjuan_ht.css">
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
							<h2>子问题维护</h2>
						</div>					
					</div>		
					<!-- End Page Header -->

<script src="assets/question/js/jquery-1.8.0.min.js"></script>
<script>
$(document).ready(function(e) {
   
	$(".xxk_title li").click(function(){
		var xxkjs = $(this).index(); 
		$(this).addClass("on").siblings().removeClass("on");
		$(".xxk_conn").children(".xxk_xzqh_box").eq(xxkjs).show().siblings().hide();
		$(".xxk_conn").children(".xxk_xzqh_box").eq(xxkjs).removeClass("hide");
	});	 
	
		
	//鼠标移上去显示按钮
	$(".movie_box").live({ 
      mouseenter:
   function()
   {
      //todo
    	var	html_cz = "<div class='kzqy_czbut'><a href='javascript:void(0)' class='sy'>上移</a><a href='javascript:void(0)'  class='xy'>下移</a><a href='javascript:void(0)'  class='bianji'>编辑</a><a href='javascript:void(0)' class='del' >删除</a></div>" 
 		 $(this).css({"border":"1px solid #0099ff"}); 
		 $(this).children(".wjdc_list").after(html_cz);
   },
   mouseleave:
   function()
   {
     	$(this).css({"border":"1px solid #fff"}); 
		$(this).children(".kzqy_czbut").remove();
   }
	});
	
	//下移
		$(".xy").live("click", function() {  
			//文字的长度 
			var leng = $(".yd_box").children(".movie_box").length;
			var dqgs = $(this).parent(".kzqy_czbut").parent(".movie_box").index();  
			 
			if(dqgs < leng-1){
				var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box");  
				var xyghtml = czxx.next().html();
				var syghtml = czxx.html(); 
				czxx.next().html(syghtml);
				czxx.html(xyghtml);
				//序号
				czxx.children(".wjdc_list").find(".nmb").text(dqgs+1);
				czxx.next().children(".wjdc_list").find(".nmb").text(dqgs+2);
				}else{
					alert("到底了");
					}  
		});
		
			//上移
		$(".sy").live("click", function() {
			//文字的长度 
		    var leng = $(".yd_box").children(".movie_box").length;
			var dqgs = $(this).parent(".kzqy_czbut").parent(".movie_box").index(); 
			if(dqgs > 0){
			var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box");  
			var xyghtml = czxx.prev().html();
  			var syghtml = czxx.html();   
			czxx.prev().html(syghtml);
			czxx.html(xyghtml);
			//序号
			czxx.children(".wjdc_list").find(".nmb").text(dqgs+1);
			czxx.prev().children(".wjdc_list").find(".nmb").text(dqgs);
			
				}else{
					alert("到头了");
					}  
		});
			//删除
		$(".del").live("click", function() {  
			var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box"); 
			var zgtitle_gs = czxx.parent(".yd_box").find(".movie_box").length;
			var xh_num = 0; 
			//重新编号
			czxx.parent(".yd_box").find(".movie_box").each(function() { 
				$(".yd_box").children(".movie_box").eq(xh_num).find(".nmb").text(xh_num);
				 xh_num++;
				//alert(xh_num);
            }); 
			 czxx.remove(); 	  		 
		});
			//编辑
		$(".bianji").live("click", function() {  
		 $(this).siblings().hide();
		    var pingfen = $(".pingfen").html();
			var singeltext = $(".singeltext").html();
			var doubletext = $(".doubletext").html();
			var uploadfile = $(".uploadfile").html();
				//接受编辑内容的容器
			var dx_rq = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".dx_box");  
		    var title = dx_rq.attr("data-t");
		    	//题目选项的个数
			var timlrxm = $(this).parent(".kzqy_czbut").parent(".movie_box").children(".wjdc_list").children("li").length; 
				//单选题目
			if(title==0){
				dx_rq.show().html(pingfen);
				 //赋值文本框 
				 //题目标题
					var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();  
					var countvalue =$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(1).find("input").length;
					dx_rq.find(".btwen_text").val(texte_bt_val);  
				   var min=$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(1).find("input").eq(0).val();
				   var max=$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(1).find("input").eq(countvalue-1).val();
				   	dx_rq.find(".minvalue").val(min);  
				   	dx_rq.find(".maxvalue").val(max);  
			}else if(title==1){
		     	dx_rq.show().html(singeltext);
		     	var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();  
				dx_rq.find(".btwen_text").val(texte_bt_val);  
				var ismust = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val();; 
				if(ismust==1){
			    	dx_rq.find(".ismust").attr("checked","checked"); 
				}else{
					dx_rq.find(".ismust").removeAttr("checked"); 
				}  
			}else if(title==2){
			
				dx_rq.show().html(doubletext);
		     	var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();  
				dx_rq.find(".btwen_text").val(texte_bt_val);  
				var ismust = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val();; 
				if(ismust==1){
			    	dx_rq.find(".ismust").attr("checked","checked"); 
				}else{
					dx_rq.find(".ismust").removeAttr("checked"); 
				}  
		
			}else if(title==3){
				dx_rq.show().html(uploadfile);
		     	var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();  
				dx_rq.find(".btwen_text").val(texte_bt_val); 
				 var max=$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".maxvalue").val();
				 	dx_rq.find(".maxvalue").val(max);  
				 
			}
		});
		
			//取消编辑
		$(".dx_box .qxbj_but").live("click", function() {  
			  $(this).parent(".bjqxwc_box").parent(".title_itram").parent(".dx_box").empty().hide();
			  $(this).parent(".bjqxwc_box").parent(".dx_box").empty().hide();
			  $(".movie_box").css({"border":"1px solid #fff"});
			  $(".kzqy_czbut").remove(); 
			  // 			  
		});
	


$(".save_pingfen").live("click", function() {   
	var jcxxxx;
	var update=false;
	if($(this).parent(".bjqxwc_box").parent(".title_itram").parent(".dx_box").attr("style")=='display: block;'){
	   jcxxxx=$(this).parent(".bjqxwc_box").parent(".title_itram").parent(".dx_box");
	   update=true;
	}
	else{
		 jcxxxx = $(this).parent(".bjqxwc_box").parent(".title_itram").parent(".pingfen");
	}

 
		//编辑题目选项的个数
	var title=jcxxxx.find(".input_wenbk").val();	
   var min=jcxxxx.find(".minvalue").val();
    var max=jcxxxx.find(".maxvalue").val();
    if(update){
      jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".btwenzi").html(title); 
      var h='';
        for(var i=min;i<=max;i++){
        h=h+"<label style=\"margin-right:5%\">";
        h=h+"<input name=\"a\" type=\"radio\" value=\""+i+"\">";
        h=h+"<span>"+i+"</span></label>";
           }; 
         jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(1).html(h);   
         $(this).parent(".bjqxwc_box").parent(".title_itram").parent(".dx_box").empty().hide();	
         $(this).parent(".bjqxwc_box").parent(".title_itram").parent(".dx_box").parent(".movie_box").attr("style",""); 
         $(this).parent(".bjqxwc_box").parent(".title_itram").parent(".dx_box").parent(".movie_box").children(".kzqy_czbut").remove();
	
    }else{
    var nmb=$(".yd_box").children(".movie_box").length+1;
    if(title=="")
       title="1234555";
    var h=" <div class=\"movie_box\">";
    	h=h+"<ul class=\"wjdc_list\">";
        h=h+"<li>";

         h=h+"<div class=\"tm_btitlt\"><i class=\"nmb\">"+nmb+"</i>. <i class=\"btwenzi\">"+title+"</i></div>";
     
        h=h+"</li>";
      
        h=h+"<li>";
          for(var i=min;i<=max;i++){
        h=h+"<label style=\"margin-right:5%\">";
        h=h+"<input name=\"a\" type=\"radio\" value=\""+i+"\">";
        h=h+"<span>"+i+"</span></label>";
           };
        h=h+"</li>";
     
        h=h+"</ul>";
     	h=h+" <div class=\"dx_box\" data-t=\"0\"></div>";
        h=h+"</div>";
    $(".yd_box").append(h);
    $(".pingfen input").val("");
    $(".pingfen textarea").val("");
    }
 
});

 	$(".save_singeltext").live("click", function() { 
 	var jcxxxx;
	var update=false;
	if($(this).parent(".bjqxwc_box").parent(".dx_box").attr("style")=='display: block;'){
	   jcxxxx=$(this).parent(".bjqxwc_box").parent(".dx_box");
	   update=true;
	}
	else{
	  jcxxxx = $(this).parent(".bjqxwc_box").parent(".singeltext"); 
	}
	var title=jcxxxx.find(".input_wenbk").val();	
     var ch=jcxxxx.find(".ismust").is(':checked');
	if(update){
	 jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".btwenzi").html(title); 
	 if(ch){
	 
	 jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tip_wz").html("*"); 
	 jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val(1); 
	 }else{
	 	 jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val(0); 
	 	 jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tip_wz").html(""); 
	 }
	 
    
         $(this).parent(".bjqxwc_box").parent(".dx_box").empty().hide();	
	}
  else{
 	 
      var nmb=$(".yd_box").children(".movie_box").length+1;
      var h=" <div class=\"movie_box\">";
    	h=h+"<ul class=\"wjdc_list\">";
        h=h+"<li>";
        if(ch){
        h=h+ "<div class=\"tm_btitlt\"><i class=\"nmb\">"+nmb+"</i>.  <i class=\"btwenzi\">"+title+"</i><span class=\"tip_wz\" style=\"color:red;margin-left:5px\">*</span></div>";
         h=h+ "<input type=\"hidden\" class=\"ismust\" value=\""+1+"\">";
        }else{
         h=h+ "<div class=\"tm_btitlt\"><i class=\"nmb\">"+nmb+"</i>.  <i class=\"btwenzi\">"+title+"</i><span class=\"tip_wz\"  style=\"color:red;margin-left:5px\"></span></div>";
         h=h+ "<input type=\"hidden\" class=\"ismust\" value=\""+0+"\">";
        }
        
        h=h+"</li>"; 
        h=h+"<li>";
        h=h+"<label>"; 
        h=h+"   <input name=\"\" type=\"text\"  class=\"input_wenbk\" >";
        h=h+"  </label>"
        h=h+"</li>";
        h=h+"</ul>";
        h=h+"<div class=\"dx_box\" data-t=\"1\"></div>";
    	h=h+"</div>";
    	$(".yd_box").append(h);
    	$(".singeltext textarea").val("");
    	$(".singeltext .ismust").attr("checked",false);
    	}
 	
 	}); 
 	
 	$(".save_doubletext").live("click", function() { 
 		var jcxxxx;
	var update=false;
	if($(this).parent(".bjqxwc_box").parent(".dx_box").attr("style")=='display: block;'){
	   jcxxxx=$(this).parent(".bjqxwc_box").parent(".dx_box");
	   update=true;
	}
	else{
   	jcxxxx = $(this).parent(".bjqxwc_box").parent(".doubletext"); 
   	}
   	 var title=jcxxxx.find(".input_wenbk").val();	
     var ch=jcxxxx.find(".ismust").is(':checked');
   	if(update){
   	 jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".btwenzi").html(title); 
	 if(ch){
	 
	 jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tip_wz").html("*"); 
	 jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val(1); 
	 }else{
	 	 jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val(0); 
	 	 jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tip_wz").html(""); 
	 }
	 
    
         $(this).parent(".bjqxwc_box").parent(".dx_box").empty().hide();	
   	}else{
   	 
      var nmb=$(".yd_box").children(".movie_box").length+1;
      var h=" <div class=\"movie_box\">";
    	h=h+"<ul class=\"wjdc_list\">";
        h=h+"<li>";
        if(ch){
        h=h+ "<div class=\"tm_btitlt\"><i class=\"nmb\">"+nmb+"</i>.  <i class=\"btwenzi\">"+title+"</i><span class=\"tip_wz\" style=\"color:red;margin-left:5px\">*</span></div>";
          h=h+ "<input type=\"hidden\" class=\"ismust\" value=\""+1+"\">";
        }else{
         h=h+ "<div class=\"tm_btitlt\"><i class=\"nmb\">"+nmb+"</i>.  <i class=\"btwenzi\">"+title+"</i><span class=\"tip_wz\" style=\"color:red;margin-left:5px\"></span></div>";
           h=h+ "<input type=\"hidden\" class=\"ismust\" value=\""+0+"\">";
        }
        h=h+"</li>"; 
        h=h+"<li>";
        h=h+"<label>"; 
        h=h+"   <textarea name=\"\" cols=\"\" rows=\"3\"  class=\"input_wenbk btwen_text btwen_text_dx\" ></textarea>";
        h=h+"  </label>"
        h=h+"</li>";
        h=h+"</ul>";
        h=h+"<div class=\"dx_box\" data-t=\"2\"></div>";
    	h=h+"</div>";
    	$(".yd_box").append(h);
    	$(".doubletext textarea").val("");
    	$(".doubletext .ismust").attr("checked",false);
    }	
 	
 	}); 



	$(".save_file").live("click", function() { 
		var jcxxxx;
	var update=false;
	if($(this).parent(".bjqxwc_box").parent(".dx_box").attr("style")=='display: block;'){
	   jcxxxx=$(this).parent(".bjqxwc_box").parent(".dx_box");
	   update=true;
	}
	else{
	   	 jcxxxx = $(this).parent(".bjqxwc_box").parent(".uploadfile"); 
	  }
	 	 var title=jcxxxx.find(".input_wenbk").val();	
	 	var max=jcxxxx.find(".maxvalue").val();	
	 	if(update){
	 	jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".btwenzi").html(title); 
	 	jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tip_wz").html("(最大"+max+"M)"); 
	 	jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".maxvalue").val(max); 
	 	 $(this).parent(".bjqxwc_box").parent(".dx_box").empty().hide();	
	 	
	 	}else{
	      var nmb=$(".yd_box").children(".movie_box").length+1;
	      var h=" <div class=\"movie_box\">";
	    	h=h+"<ul class=\"wjdc_list\">";
	        h=h+"<li>";
	       
	         h=h+ "<div class=\"tm_btitlt\"><i class=\"nmb\">"+nmb+"</i>.  <i class=\"btwenzi\">"+title+"</i><span class=\"tip_wz\" style=\"color:red;margin-left:5px\">(最大"+max+"M)</span></div>";
	          h=h+ "<input type=\"hidden\" class=\"maxvalue\" value=\""+max+"\">";
	        h=h+"</li>"; 
	        h=h+"<li>";
	        h=h+"<label>"; 
	        h=h+"   <input name=\"\" type=\"file\"  class=\"input_wenbk\" >";
	        h=h+"  </label>"
	        h=h+"</li>";
	        h=h+"</ul>";
	        h=h+"<div class=\"dx_box\" data-t=\"3\"></div>";
	    	h=h+"</div>";
	    	$(".yd_box").append(h);
	    	$(".uploadfile textarea").val("");
	    	$(".uploadfile .maxvalue").val("");
	    	}
	    
	 	
	 	}); 
 	


});

</script>
</head>

<body>
<div class=" all_660">
  <div class="yd_box">
    
  </div>
  
  
  <!--选项卡区域  模板区域---------------------------------------------------------------------------------------------------------------------------------------->
  
  <div class="xxk_box" >
    <ul class="xxk_title">
      <li class="on">评分</li>
      <li>单行文本</li>
      <li>多行文本</li>
      <li>文件上传</li>
    </ul>
    <div class="xxk_conn"> 
      <!--评分----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box pingfen ">
        <textarea name="" cols="" rows=""  class="input_wenbk btwen_text btwen_text_dx" placeholder="评分题目"></textarea>
        <div class="title_itram">
          <div class="kzjxx_iteam">
            <label>
              <span>最小值：</span></label>
           <input name="" type="text" class="input_wenbk minvalue" placeholder="最小值" onblur="if(!this.value)this.value='最小值'" onclick="if(this.value&&this.value=='最小值' )  this.value=''">
           
            
        </div>
        <div class="kzjxx_iteam">
            <label>
              <span>最大值：</span></label>
           <input name="" type="text" class="input_wenbk maxvalue" placeholder="最大值" onblur="if(!this.value)this.value='最大值'" onclick="if(this.value&&this.value=='最大值' )  this.value=''">
        </div>
        
        <!--完成编辑-->
        <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);"  class="swcbj_but save_pingfen" > 完成编辑</a> </div>
      </div>
      </div>
      
      
      <!-- 单行文本----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box singeltext hide">
        <textarea name=""  cols="" rows="" class="input_wenbk btwen_text btwen_text_tk" placeholder="单行文本题目" ></textarea>
           <label>
              <input name="" type="checkbox" value="" class="fxk ismust">
              <span>是否为必填项</span></label>
             
        <!--完成编辑-->
        <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but save_singeltext" > 完成编辑</a> </div>
      </div>
      
      
      <!--多行文本框----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box doubletext hide">
        <textarea name=""  cols="" rows="" class="input_wenbk btwen_text btwen_text_tk" placeholder="多行文本题目" ></textarea>
           <label>
              <input name="" type="checkbox" value="" class="fxk ismust">
              <span>是否为必填项</span></label>
             
        
        <!--完成编辑-->
       <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but save_doubletext" > 完成编辑</a> </div>
      </div>
      
      
      
      <!--文件上传----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box  uploadfile hide">
        <textarea name=""  cols="" rows="" class="input_wenbk btwen_text btwen_text_tk" placeholder="文件上传题目" ></textarea>
         <div class="kzjxx_iteam">
            <label>
              <span>最大文件大小（M）：</span></label>
           <input name="" type="text" class="input_wenbk maxvalue" placeholder="最大值" onblur="if(!this.value)this.value='最大值'" onclick="if(this.value&&this.value=='最大值' )  this.value=''">
        </div>
        
          
          
          <!--完成编辑-->
         <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but save_file" > 完成编辑</a> </div>
        </div>
      </div>
    </div>
  </div>
</body>
