
$(document).ready(function(e) {
	

	
$(".tigan_save").live("click", function() {  
	//编辑题目选项的个数
	var jcxxxx;
	var update=false;
	var formname="form_tigan";
	if($(this).parent(".bjqxwc_box").parent(".title_itram").parent(".form_tigan").parent(".dx_box").attr("style")=='display: block;'){
	   jcxxxx=$(this).parent(".bjqxwc_box").parent(".title_itram").parent(".form_tigan").parent(".dx_box");
	   update=true;
	   formname="form_tigan_update";
	}
	else{
		 jcxxxx = $(this).parent(".bjqxwc_box").parent(".title_itram").parent("#form_tigan").parent(".tigan");
	}
 
	var title=jcxxxx.find(".input_wenbk").val();
	var answerrole=jcxxxx.find(".answerrole").val();
	if(title==''){
		swal("","请输入标题！","error");
		return;
	}
		
	$.ajax({
		url : "question/theme_save.html",
		type : 'post',
		dataType : "json",
		data :$("."+formname).serialize(),
		error : function(request) {

		},
		success : function(data) {
			if (data.result == 'success') {
				  var themeid=data.msg;
		
		
	         if(update){
	    	    jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".btwenzi").html(title); 
	    	    jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".answerrole").val(answerrole);
	    	    jcxxxx.empty().hide();	
	    	    jcxxxx.parent(".movie_box").attr("style",""); 
	    	    jcxxxx.parent(".movie_box").children(".kzqy_czbut").remove();
		
	           }else{
	        	   var nmb=$(".yd_box").children(".movie_box").length+1;
	        	   var h=" <div class=\"movie_box\">";
	        	   h=h+"<ul class=\"wjdc_list\">";
	        	   h=h+"<li>";
	        	   h=h+"<div class=\"tm_btitlt\"><i class=\"nmb\">"+nmb+"</i>. <i class=\"btwenzi\">"+title+"</i></div>";
	        	   h=h+"<input type=\"hidden\" id=\"id\" value=\""+themeid+"\"  class=\"id\">";
	        	   h=h+"<input type=\"hidden\" id=\"answerrole\" value=\""+answerrole+"\"  class=\"answerrole\">";
	        	   h=h+"</li>";
	      
	        	   h=h+"</ul>";
	        	   h=h+" <div class=\"dx_box\" data-t=\"0\"></div>";
	        	   h=h+"</div>";
	        	   $(".yd_box").append(h);
	        	 
	        	   $(".tigan textarea").val("");
	           }
			} else {
				swal("", data.msg,"error");
				 return 0;
				}

			}
		});

	 
		});





$(".save_pingfen").live("click", function() {   
	var jcxxxx;
	var update=false;
	var formname="form_pingfen";
	if($(this).parent(".bjqxwc_box").parent(".title_itram").parent(".form_pingfen").parent(".dx_box").attr("style")=='display: block;'){
	   jcxxxx=$(this).parent(".bjqxwc_box").parent(".title_itram").parent(".form_pingfen").parent(".dx_box");
	   update=true;
	   var formname="form_pingfen_update";
	}
	else{
		 jcxxxx = $(this).parent(".bjqxwc_box").parent(".title_itram").parent(".form_pingfen").parent(".pingfen");
	}

		//编辑题目选项的个数
	var title=jcxxxx.find(".input_wenbk").val();	
	var answerrole=jcxxxx.find(".answerrole").val();
	if(title==''){
		swal("","请输入标题！","error");
		return;
	}
   var min=jcxxxx.find(".minscore").val();
   var max=jcxxxx.find(".maxscore").val();
   if(min=='' ||max==''|| min<0||Number(min)>=Number(max)){
		swal("","正确输入最小值！","error");
		return;
	}
   if(max>10||max<=1){
		swal("","最大为2-10！","error");
		return;
	}
   var ch=jcxxxx.find(".ismust").is(':checked');
	if(ch)
		$(".ismust").val(1);
	else
		$(".ismust").val(0);
   $.ajax({
		url : "question/theme_save.html",
		type : 'post',
		dataType : "json",
		data :$("."+formname).serialize(),
		error : function(request) {

		},
		success : function(data) {
			if (data.result == 'success') {
				  var themeid=data.msg;
				  if(update){
					  jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".answerrole").val(answerrole);
					  jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".btwenzi").html(title); 
					  jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".maxscore").val(max); 
					  jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".minscore").val(min); 
					  if(ch){
						  
						  		
						  jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tip_wz").html("*"); 
						  jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val(1); 
					  }else{
						  $(".ismust").val(0);
						  jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val(0); 
						  jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tip_wz").html(""); 
					  }


					    jcxxxx.empty().hide();	
			    	    jcxxxx.parent(".movie_box").attr("style",""); 
			    	    jcxxxx.parent(".movie_box").children(".kzqy_czbut").remove();
	
				  }else{
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
					  h=h+"<input type=\"hidden\" id=\"id\" value=\""+themeid+"\"  class=\"id\">";
					  h=h+"<input type=\"hidden\" id=\"answerrole\" value=\""+answerrole+"\"  class=\"answerrole\">";
					  h=h+"<input type=\"hidden\" id=\"maxscore\" value=\""+max+"\"  class=\"maxscore\">";
					  h=h+"<input type=\"hidden\" id=\"minscore\" value=\""+min+"\"  class=\"minscore\">";
					  h=h+"</li>"; 
					  h=h+"<li>";
					  h=h+"<label>"; 
					  h=h+"   <input name=\"\" type=\"text\"  class=\"input_wenbk\" >";
					  h=h+"  </label>";
							h=h+"</li>";
						h=h+"</ul>";
						h=h+"<div class=\"dx_box\" data-t=\"1\"></div>";
						h=h+"</div>";
					  $(".yd_box").append(h);
					
					  $(".pingfen textarea").val("");
				  }
				} else {
					swal("", data.msg,"error");

					}

				}
			});
	});



		$(".save_singeltext").live("click", function() { 
			var jcxxxx;
			var update=false;
			var formname="form_singeltext";
			if($(this).parent(".bjqxwc_box").parent(".form_singeltext").parent(".dx_box").attr("style")=='display: block;'){
				jcxxxx=$(this).parent(".bjqxwc_box").parent(".form_singeltext").parent(".dx_box");
				update=true;
				 formname="form_singeltext_update";
			}
			else{
				jcxxxx = $(this).parent(".bjqxwc_box").parent(".form_singeltext").parent(".singeltext"); 
			}
			var title=jcxxxx.find(".input_wenbk").val();
			var answerrole=jcxxxx.find(".answerrole").val();
			
			if(title==''){
				swal("","请输入标题！","error");
				return;
			}
			var ch=jcxxxx.find(".ismust").is(':checked');
			if(ch)
				$(".ismust").val(1);
			else
				$(".ismust").val(0);
			 $.ajax({
					url : "question/theme_save.html",
					type : 'post',
					dataType : "json",
					data :$("."+formname).serialize(),
					error : function(request) {

					},
					success : function(data) {
					if (data.result == 'success') {
							  var themeid=data.msg;
							  if(update){
								   jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".answerrole").val(answerrole);
								  jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".btwenzi").html(title); 
								  if(ch){
									  
									  		
									  jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tip_wz").html("*"); 
									  jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val(1); 
								  }else{
									  $(".ismust").val(0);
									  jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val(0); 
									  jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tip_wz").html(""); 
								  }
 

								  jcxxxx.empty().hide();	
						    	    jcxxxx.parent(".movie_box").attr("style",""); 
						    	    jcxxxx.parent(".movie_box").children(".kzqy_czbut").remove();
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
								  h=h+"<input type=\"hidden\" id=\"id\" value=\""+themeid+"\"  class=\"id\">";
								  h=h+"<input type=\"hidden\" id=\"answerrole\" value=\""+answerrole+"\"  class=\"answerrole\">";
								  h=h+"</li>"; 
								  h=h+"<li>";
								  h=h+"<label>"; 
								  h=h+"   <input name=\"\" type=\"text\"  class=\"input_wenbk\" >";
								  h=h+"  </label>";
										h=h+"</li>";
									h=h+"</ul>";
									h=h+"<div class=\"dx_box\" data-t=\"2\"></div>";
									h=h+"</div>";
									$(".yd_box").append(h);
									$(".singeltext textarea").val("");
									$(".singeltext .ismust").attr("checked",false);
							  }
						} else {
							swal("", data.msg,"error");

						}

						}
					});
		}); 
	
		


				$(".save_doubletext").live("click", function() { 
					var jcxxxx;
					var update=false;
					var formname="form_doubletext";
					if($(this).parent(".bjqxwc_box").parent(".form_doubletext").parent(".dx_box").attr("style")=='display: block;'){
						jcxxxx=$(this).parent(".bjqxwc_box").parent(".form_doubletext").parent(".dx_box");
						update=true;
						formname="form_doubletext_update";
					}
					else{
						jcxxxx = $(this).parent(".bjqxwc_box").parent(".form_doubletext").parent(".doubletext"); 
					}
					var title=jcxxxx.find(".input_wenbk").val();	
					var ch=jcxxxx.find(".ismust").is(':checked');
					var answerrole=jcxxxx.find(".answerrole").val();
					if(ch)
						$(".ismust").val(1);
					else
						$(".ismust").val(0);
					$.ajax({
						url : "question/theme_save.html",
						type : 'post',
						dataType : "json",
						data :$("."+formname).serialize(),
						error : function(request) {
							
						},
						success : function(data) {
							if (data.result == 'success') {
								var themeid=data.msg;
								if(update){
									   jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".answerrole").val(answerrole);
									jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".btwenzi").html(title); 
									if(ch){
		 
										jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tip_wz").html("*"); 
										jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val(1); 
									}else{
										jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val(0); 
										jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tip_wz").html(""); 
									}
		 
	    
									 jcxxxx.empty().hide();	
							    	    jcxxxx.parent(".movie_box").attr("style",""); 
							    	    jcxxxx.parent(".movie_box").children(".kzqy_czbut").remove();
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
									  h=h+"<input type=\"hidden\" id=\"id\" value=\""+themeid+"\"  class=\"id\">";
									  h=h+"<input type=\"hidden\" id=\"answerrole\" value=\""+answerrole+"\"  class=\"answerrole\">";
									h=h+"</li>"; 
									h=h+"<li>";
									h=h+"<label>"; 
									h=h+"   <textarea name=\"\" cols=\"\" rows=\"3\"  class=\"input_wenbk btwen_text btwen_text_dx\" ></textarea>";
									h=h+"  </label>"
									h=h+"</li>";
									h=h+"</ul>";
									h=h+"<div class=\"dx_box\" data-t=\"3\"></div>";
									h=h+"</div>";
									$(".yd_box").append(h);
									$(".doubletext textarea").val("");
									$(".doubletext .ismust").attr("checked",false);
								}	
							} else {
								swal("", data.msg,"error");

							}

						}
					});
	 	
				}); 
				
				
				
				$(".save_file").live("click", function() { 
					var jcxxxx;
					var update=false;
					var formname="form_file";
					if($(this).parent(".bjqxwc_box").parent(".form_file").parent(".dx_box").attr("style")=='display: block;'){
						jcxxxx=$(this).parent(".bjqxwc_box").parent(".form_file").parent(".dx_box");
						update=true;
						formname="form_file_update";
					}
					else{
						jcxxxx = $(this).parent(".bjqxwc_box").parent(".form_file").parent(".uploadfile"); 
					}
					var title=jcxxxx.find(".input_wenbk").val();	
				 	var max=jcxxxx.find(".maxvalue").val();	
				 	var answerrole=jcxxxx.find(".answerrole").val();
				 	$.ajax({
						url : "question/theme_save.html",
						type : 'post',
						dataType : "json",
						data :$("."+formname).serialize(),
						error : function(request) {
							
						},
						success : function(data) {
							if (data.result == 'success') {
								var themeid=data.msg;
								if(update){
									jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".answerrole").val(answerrole);
									jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".btwenzi").html(title); 
									jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tip_wz").html("(最大"+max+"M)"); 
									jcxxxx.parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".maxvalue").val(max); 
									jcxxxx.empty().hide();	
									jcxxxx.parent(".movie_box").attr("style",""); 
									jcxxxx.parent(".movie_box").children(".kzqy_czbut").remove();
				 	
								}else{
									var nmb=$(".yd_box").children(".movie_box").length+1;
									var h=" <div class=\"movie_box\">";
									h=h+"<ul class=\"wjdc_list\">";
									h=h+"<li>";
				       
									h=h+ "<div class=\"tm_btitlt\"><i class=\"nmb\">"+nmb+"</i>.  <i class=\"btwenzi\">"+title+"</i><span class=\"tip_wz\" style=\"color:red;margin-left:5px\">(最大"+max+"M)</span></div>";
									h=h+ "<input type=\"hidden\" class=\"maxvalue\" value=\""+max+"\">";
									h=h+"<input type=\"hidden\" id=\"id\" value=\""+themeid+"\"  class=\"id\">";
								 h=h+"<input type=\"hidden\" id=\"answerrole\" value=\""+answerrole+"\"  class=\"answerrole\">";
									h=h+"</li>"; 
									h=h+"<li>";
									h=h+"<label>"; 
									h=h+"   <input name=\"\" type=\"file\"  class=\"input_wenbk\" >";
									h=h+"  </label>"
									h=h+"</li>";
									h=h+"</ul>";
									h=h+"<div class=\"dx_box\" data-t=\"4\"></div>";
									h=h+"</div>";
									$(".yd_box").append(h);
									$(".uploadfile textarea").val("");
									$(".uploadfile .maxvalue").val("");
								}
				    
								} else {
									swal("", data.msg,"error");
								
								}

							}
				 		});
				}); 



//编辑
				$(".bianji").live("click", function() {  
					$(this).siblings().hide();
					  $(".dx_box").html("");
					  $(".dx_box").attr("style","display: none;");
					  
					var tigan = $(".tigan").html();
					var pingfen = $(".pingfen").html();
					var singeltext = $(".singeltext").html();
					var doubletext = $(".doubletext").html();
					var uploadfile = $(".uploadfile").html();
					//接受编辑内容的容器
					var dx_rq = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".dx_box");  
					var title = dx_rq.attr("data-t");
					//题目选项的个数
					
					//单选题目
					if(title==0){
						dx_rq.show().html(tigan);
						//赋值文本框 
						//题目标题
						var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();  
						var id =$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".id").val();
						var answerrole =$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".answerrole").val();
						dx_rq.find(".answerrole").val(answerrole);
							dx_rq.find(".btwen_text").val(texte_bt_val);  
							dx_rq.find(".id").val(id);
							dx_rq.find("#form_tigan").addClass("form_tigan_update");
			
					}else if(title==1){
						dx_rq.show().html(pingfen);
						//赋值文本框 
						//题目标题
						var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();  
						var countvalue =$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(1).find("input").length;
						var id =$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".id").val();
						dx_rq.find(".btwen_text").val(texte_bt_val);  
						var min=$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".minscore").val();
						var max=$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".maxscore").val();
						var ismust=$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val();
						var answerrole =$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".answerrole").val();
						dx_rq.find(".answerrole").val(answerrole);
						dx_rq.find(".minscore").val(min);  
						dx_rq.find(".maxscore").val(max);  
						dx_rq.find(".form_pingfen").addClass("form_pingfen_update");
						dx_rq.find(".id").val(id);
						if(ismust==1){
							dx_rq.find(".ismust").attr("checked","checked"); 
						}else{
							dx_rq.find(".ismust").removeAttr("checked"); 
						}  
					}else if(title==2){
						dx_rq.show().html(singeltext);
						var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();  
						var id =$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".id").val();
						dx_rq.find(".btwen_text").val(texte_bt_val);  
						var ismust = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val();; 
							dx_rq.find(".id").val(id);
							dx_rq.find(".form_singeltext").addClass("form_singeltext_update");
									if(ismust==1){
										dx_rq.find(".ismust").attr("checked","checked"); 
									}else{
										dx_rq.find(".ismust").removeAttr("checked"); 
									}  
	
					}else if(title==3){
	
						dx_rq.show().html(doubletext);
						var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();  
						var id =$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".id").val();
						dx_rq.find(".btwen_text").val(texte_bt_val);  
						var ismust = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".ismust").val();; 
						var answerrole =$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".answerrole").val();
						dx_rq.find(".answerrole").val(answerrole);
						dx_rq.find(".id").val(id);
						dx_rq.find(".form_doubletext").addClass("form_doubletext_update");
						if(ismust==1){
							dx_rq.find(".ismust").attr("checked","checked"); 
						}else{
							dx_rq.find(".ismust").removeAttr("checked"); 
						}  

					}else if(title==4){
						dx_rq.show().html(uploadfile);
						var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();  
						var id =$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".id").val();
						var answerrole =$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".answerrole").val();
						dx_rq.find(".answerrole").val(answerrole);
						dx_rq.find(".btwen_text").val(texte_bt_val); 
						dx_rq.find(".id").val(id);
						var max=$(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".maxvalue").val();
						dx_rq.find(".maxvalue").val(max); 
						dx_rq.find(".form_file").addClass("form_file_update");
		 
					}
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
				
				//删除
				$(".del").live("click", function() {  
					var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box"); 
					swal({
						type:"warning",
						title : "",
						text :"是否删除题目",
						 showCancelButton: true,
						confirmButtonText : "确定",
						closeOnConfirm: true
						}, function(isConfirm) {
							sweetAlert.close();
							if(!isConfirm){
								return;
							}
						
							
					
							var themeid=czxx.find(".id").val();
							
							$.ajax({
								url : "question/theme_del.html",
								type : 'post',
								dataType : "json",
								data :{
									themeid:themeid
								},
								error : function(request) {
									
								},
								success : function(data) {
									if (data.result == 'success') {
										var xh_num = 0; 
										//重新编号
										czxx.parent(".yd_box").find(".movie_box").each(function() { 
											if(xh_num==0){
												$(".yd_box").children(".movie_box").eq(xh_num).find(".nmb").text(1);
											}else{
												$(".yd_box").children(".movie_box").eq(xh_num).find(".nmb").text(xh_num);
											}
											xh_num++;
									
										}); 
										czxx.remove(); 
									}else{
										swal("", data.msg,"error");
									}
								}
					
							});
					

						});
				});
				
				
				//下移
				$(".xy").live("click", function() {  
					//文字的长度 
						var leng = $(".yd_box").children(".movie_box").length;
						var dqgs = $(this).parent(".kzqy_czbut").parent(".movie_box").index();  
					 
						if(dqgs < leng-1){
							var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box");
							var id1=czxx.find(".id").val();
							var id2=czxx.next().find(".id").val();
							$.ajax({
								url : "question/theme_change.html",
								type : 'post',
								dataType : "json",
								data :{
									themeid1:id1,
									themeid2:id2
								},
								error : function(request) {
								
								},
								success : function(data) {
									if (data.result == 'success') {
										var xyghtml = czxx.next().html();
										var syghtml = czxx.html(); 
										czxx.next().html(syghtml);
										czxx.html(xyghtml);
										//序号
										czxx.children(".wjdc_list").find(".nmb").text(dqgs+1);
										czxx.next().children(".wjdc_list").find(".nmb").text(dqgs+2);
									}else{
										swal("", "下移失败！","error");
									}
								}
							});
						
							}else{
								swal("", "已经是最后一个了！","error");
							}  
					});
				
					//上移
				$(".sy").live("click", function() {
					//文字的长度 
						var leng = $(".yd_box").children(".movie_box").length;
						var dqgs = $(this).parent(".kzqy_czbut").parent(".movie_box").index(); 
						if(dqgs > 0){
							var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box");  
							var id1=czxx.find(".id").val();
							var id2=czxx.prev().find(".id").val();
							$.ajax({
								url : "question/theme_change.html",
								type : 'post',
								dataType : "json",
								data :{
									themeid1:id1,
									themeid2:id2
								},
								error : function(request) {
						
								},
								success : function(data) {
									if (data.result == 'success') {
										var xyghtml = czxx.prev().html();
										var syghtml = czxx.html();   
										czxx.prev().html(syghtml);
										czxx.html(xyghtml);
										//序号
										czxx.children(".wjdc_list").find(".nmb").text(dqgs+1);
										czxx.prev().children(".wjdc_list").find(".nmb").text(dqgs);
										
									}else{
										swal("", "上移失败！","error");
										}
									}
									});
					
						}else{
									swal("", "已经是第一个了！","error");
						}  
								});
				
				
				
				

					

				
					
						//取消编辑
					$(".dx_box .qxbj_but").live("click", function() {  
						  $(this).parent(".bjqxwc_box").parent(".title_itram").parent().parent(".dx_box").empty().hide();
						  $(".movie_box").css({"border":"1px solid #fff"});
						  $(".kzqy_czbut").remove(); 
						  // 			  
					});
				
				


		});
  