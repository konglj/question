package com.bolion.question.mapper;

import java.util.Map;

import com.bolion.question.bean.SysUser;

public interface LoginMapper {
	
	public SysUser getUserInfo(Map map);
	
	public int updateUserPassword(Map map);

}
