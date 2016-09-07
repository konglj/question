function validateForm() {
	return $("#update_pwd_form").validate({
		rules : {
			oldpwd : {
				required : true
			},
			newpwd : {
				required : true,
				rangelength : [ 6, 15 ]
			},
			newpwd2 : {
				required : true,
				rangelength : [ 6, 15 ],
				equalTo : "#newpwd"
			}
		}
	}).form();
}

function update_pwd() {
	if (!validateForm()) 
		return;
	$.ajax({
			type : "POST",
			url : "update_pwd.html",
			data : $('#update_pwd_form').serialize(),
			dataType : 'json',
			error : function(request) {
					swal("",data.msg);
			},
			success : function(data) {
				if (data.result == 'success') {
					swal( "", "修改成功");
				} else {
					swal("",data.msg);
				}
			}

		});
	

}