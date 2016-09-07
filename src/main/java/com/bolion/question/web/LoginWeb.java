package com.bolion.question.web;

/**
 * 
 * @author 交 
 *
 */
import java.nio.channels.SeekableByteChannel;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bolion.question.bean.SysUser;
import com.bolion.question.common.util.AlertStr;
import com.bolion.question.common.util.ResultUtil;
import com.bolion.question.common.util.SessionUtil;
import com.bolion.question.service.LoginService;

@Controller
@RequestMapping("/")
public class LoginWeb {
	
	@Autowired
	private LoginService loginService;
	
	
	
	@RequestMapping("/login")
	public ModelAndView getLogin(){
		
		return new ModelAndView("/login");
	}
	
	@RequestMapping("/goLogin")
	@ResponseBody
	public Object getLoginInfo(HttpServletRequest request,String username,String password){
		Map<String,String> map=new HashMap<String,String>();
		map.put("userid", username);
		map.put("password",password);
		SysUser sysUser=loginService.getUserInfo(map);
		if(sysUser==null){
		 return ResultUtil.generateResponseMsg("error",AlertStr.login_error);
		 }
		SessionUtil.setSysUser(request, sysUser);
		
		return ResultUtil.generateResponseMsg("success");
	}
	
	
	@RequestMapping("/index")
	public ModelAndView getIndexPage(HttpServletRequest requst){
		SysUser sysUser=SessionUtil.getSysUser(requst);
		return new ModelAndView("/index","sysuser",sysUser);
	}
	

	@RequestMapping("/index_content")
	public ModelAndView getIndexContent(){
		
		return new ModelAndView("/index_content");
	}

	@RequestMapping("/login_out")
	public ModelAndView goLoginOut(HttpServletRequest request){
		SessionUtil.setSysUser(request, null);
		return new ModelAndView("/login");
	}
	
	
	@RequestMapping("/user_info")
	public ModelAndView goUpdatePwd(HttpServletRequest request){
		return new ModelAndView("/index_userinfo");
	}
	
	@RequestMapping("/update_pwd")
	@ResponseBody
	public Object updatePassword(HttpServletRequest requst,String oldpwd,String newpwd,String newpwd2){
		if(oldpwd==null || newpwd ==null || newpwd2 ==null)
			return ResultUtil.generateResponseMsg("error", AlertStr.pwd_update_error);
		SysUser sysUser=SessionUtil.getSysUser(requst);
		if(!sysUser.getPassword().equals(oldpwd)){
			return ResultUtil.generateResponseMsg("error",AlertStr.old_pwd_error);
		}
		if(!newpwd.equals(newpwd2)){
			return ResultUtil.generateResponseMsg("error",AlertStr.new_pwd_not);
		}
		
		Map map=new HashMap();
		map.put("id", sysUser.getId());
		map.put("password", newpwd);
		int count=loginService.updateUserPassword(map);
		if(count==0)
			return ResultUtil.generateResponseMsg("error", AlertStr.pwd_update_error);
		sysUser.setPassword(newpwd2);
		SessionUtil.setSysUser(requst, sysUser);
		return ResultUtil.generateResponseMsg("success");
		
	}
	

}
