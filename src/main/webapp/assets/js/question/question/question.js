function save_question(){
	if($("#title").val()=='')
	{
		swal("", "请填写问卷题目","error");
		return ;
	}
	if($("#starttime").val()=='')
	{
		swal("", "请填写问卷开始时间","error");
		return ;
	}
	if($("#endtime").val()=='')
	{
		swal("", "请填写问卷结束时间","error");
		return ;
	}
	if($("#starttime").val()>=$("#endtime"))
	{
		swal("", "请正确填写时间","error");
		return ;
	}
		
	if($(".file-preview-image").length==0){
		swal("", "请上传背景图片","error");
		return ;
	}
	if( $('.summernote').code()==''){
		swal("", "请填写工作函","error");
		return ;
	}
	$("#xy").val($('.summernote').code());
	
	$("#question_save_form").ajaxSubmit({
		url : "question/save_question.html",
		type : 'post',
		dataType : "json",
		error : function(request) {

		},
		success : function(data) {
			if (data.result == 'success') {
				swal({
					type:"success",
					title : "",
					text :data.msg,
					confirmButtonText : "确定",
					closeOnConfirm: true
				}, function(isConfirm) {
					
					sweetAlert.close();
					change_menu("question/question_list.html");

				});
			} else {
				swal("", data.msg,"error");
			}

		}
	});
}


function del_question(questionid){
	
	$.ajax({
		url : "question/del_question.html",
		type : 'post',
		dataType : "json",
		data :{
			questionid : questionid
		},
		error : function(request) {

		},
		success : function(data) {
			if (data.result == 'success') {
				swal({
					type:"success",
					title : "",
					text :data.msg,
					confirmButtonText : "确定",
					closeOnConfirm: true
				}, function(isConfirm) {
					
					sweetAlert.close();
					change_menu("question/question_list.html");

				});
			} else {
				swal("", data.msg,"error");
			}

		}
	});
	
}




function check_all(ob,name) {
	 if ($(ob).attr("checked")) {  
			$('input[type="checkbox"][name="'+name+'"]').each(function() {
				$(this).attr("checked", true);
			});
	    } else {  
	    	$('input[type="checkbox"][name="'+name+'"]').each(function() {
				$(this).attr("checked", false);
			});
	    }  
}

//子复选框的事件  
function set_check_all(ob,name){  
	
   //当没有选中某个子复选框时，SelectAll取消选中  
   if (!$(ob).attr("checked")) {  
   	$("#"+name+'').attr("checked", false);
   	return;
   }  
   var chsub = $('input[type="checkbox"][name="'+$(ob).attr("name")+'"]').length; //获取subcheck的个数  
   var checkedsub = $('input[type="checkbox"][name="'+$(ob).attr("name")+'"]:checked').length; //获取选中的subcheck的个数  
   if (checkedsub == chsub) {  
   	$("#"+name+"").attr("checked", true);
   }else{
		$("#"+name+"").attr("checked", false); 
   }  
}  


function send_question(){
	   var checkedtype = $('input[type="checkbox"][name="type"]:checked').length; //获取选中的subcheck的个数  
	   if(checkedtype==0){
		   swal("","请选择运营商","error");
		   return;
	   }
	   
	   var checkedarea = $('input[type="checkbox"][name="area"]:checked').length; //获取选中的subcheck的个数  
	   if(checkedarea==0){
		   swal("","请选择发送区域","error");
		   return;
	   }
	   
	   
	   $.ajax({
			url : "question/question_send.html",
			type : 'post',
			dataType : "json",
			data :$("#send_question_form").serialize(),
			error : function(request) {

			},
			success : function(data) {
				if (data.result == 'success') {
					swal({
						type:"success",
						title : "",
						text :data.msg,
						confirmButtonText : "确定",
						closeOnConfirm: true
					}, function(isConfirm) {
						
						sweetAlert.close();
						change_menu("question/question_list.html");

					});
				} else {
					swal("", data.msg,"error");
				}

			}
	   });
}




