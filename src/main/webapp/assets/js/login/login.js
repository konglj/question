
	$(function() {

				// session超时，跳出iframe返回登录页面
				if (window.top != null
						&& window.top.document.URL != document.URL) {
					window.top.location = document.URL;
				}

				// 回车登录
				document.onkeydown = function(event) {
					var e = event || window.event
							|| arguments.callee.caller.arguments[0];
					if (e && e.keyCode == 13) { // enter 键
						login();
					}
				};
			});
			// 登录操作
			function login(){
				if ($('#username').val() == '') {
					$('.alert').fadeIn();
					$('.alert').html("用户名不能为空!");
					return false;
				}
				if ($('#password').val() == '') {
					$('.alert').fadeIn();
					$('.alert').html("密码不能为空!");
					return false;
				}
				if($('#username').val() != '' && $('#password').val() != ''){
					
				 $.ajax({
						url:"goLogin.html",
						type:'post',
						dataType: "json", 
						data:$("#loginForm").serialize(),
					    success: function(data){
						   if(data.result == "success"){
							  //location.href = "index.html";
							  show_msg("登陆成功！正在为您跳转...","index.html");
						      }
						   else if(data.result == "validate"){
							   $('#validate').fadeIn();
							   $('#loginIndex').val("1");
							   $('.alert').fadeIn();
								$('.alert').html(data.msg)
						   }else 
							$('.alert').fadeIn();
							$('.alert').html(data.msg)
					    }								
					});
			}
				
			}


			
			
			