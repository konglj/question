package com.bolion.question.service;

import java.util.Map;

import com.bolion.question.bean.SysUser;

public interface LoginService {

	
	public SysUser getUserInfo(Map map);
	
	public int updateUserPassword(Map map);
}
