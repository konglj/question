package com.bolion.question.common.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.client.HttpServerErrorException;

import com.bolion.question.bean.SysUser;

public class SessionUtil {
	
	public static SysUser getSysUser(HttpServletRequest requst){
		SysUser sysUser=(SysUser)requst.getSession().getAttribute("sysuser");
		if(sysUser==null)
			sysUser=new SysUser();
		return sysUser;
	}
	
	public static void setSysUser(HttpServletRequest request,SysUser sysUser){
		request.getSession().setAttribute("sysuser", sysUser);
	}

}
