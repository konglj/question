function user_save(){
	$.ajax({
		url : "user/save_user.html",
		type : 'post',
		dataType : "json",
		data :$("#user_save_form").serialize(),
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
					change_menu("user/user_list.html");

				});
			} else {
				swal("", data.msg,"error");
			}

		}
	});
}


function del_user(userid){
	
	$.ajax({
		url : "user/del_user.html",
		type : 'post',
		dataType : "json",
		data :{
			userid : userid
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
					change_menu("user/user_list.html");

				});
			} else {
				swal("", data.msg,"error");
			}

		}
	});
	
}