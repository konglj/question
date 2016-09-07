package com.bolion.question.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bolion.question.bean.SysUser;
import com.bolion.question.mapper.LoginMapper;
import com.bolion.question.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginMapper loginMapper;

	@Override
	public SysUser getUserInfo(Map map) {
		return loginMapper.getUserInfo(map);
	}

	@Override
	public int updateUserPassword(Map map) {
		return loginMapper.updateUserPassword(map);
	}

}
