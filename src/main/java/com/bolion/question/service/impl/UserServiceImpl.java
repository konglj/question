package com.bolion.question.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bolion.question.bean.UserArea;
import com.bolion.question.bean.UserInfo;
import com.bolion.question.bean.UserPage;
import com.bolion.question.bean.UserRole;
import com.bolion.question.bean.UserType;
import com.bolion.question.mapper.UserMapper;
import com.bolion.question.service.UserService;

/**
 * 
 * @author 交 
 *
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 获取用户列表
	 */
	@Override
	public List<UserInfo> getUsers(UserPage userPage) {
		int count=userMapper.getUsersCount(userPage);
		List<UserInfo> userInfos=userMapper.getUsers(userPage);
		userPage.setUsers(userInfos);
		userPage.getPageInfo().setCount(count);;
		return userMapper.getUsers(userPage);
	}
	
	/**
	 * 获取用户详情
	 * @param userPage
	 * @return
	 */
	public UserInfo getUserInfo(int id){
		return userMapper.getUserInfo(id);
	}

	/**
	 * 更新用户
	 */
	@Override
	public int updateUser(UserInfo userInfo) {
		return userMapper.updateUser(userInfo);
	}

	/**
	 * 删除用户
	 */
	@Override
	public int deleteUser(int id) {
		return userMapper.deleteUser(id);
	}

	/**
	 * 插入用户
	 */
	@Override
	public int insertUser(UserInfo userInfo) {
		return userMapper.insertUser(userInfo);
	}
	
	/**
	 * 获取用户区域
	 * @return
	 */
	@Override
	public List<UserArea> getUserAreas(){
		return userMapper.getUserAreas();
	}
	
	/**
	 * 获取用户类型
	 * @return
	 */
	@Override
	public List<UserType> getUserTypes(){
		return userMapper.getUserTypes();
	}
	

	/**
	 * 获取用户角色
	 * @return
	 */
	@Override
	public List<UserRole> getUserRoles(){
		return userMapper.getUserRoles();
	}
	
	
	/**
	 * 验证用户手机号是否已经存在
	 * @param map
	 * @return
	 */
	@Override
	public int checkUserPhoneExist(UserInfo userInfo){
		return userMapper.checkUserPhoneExist(userInfo);
	}

	@Override
	public int checkUserTypeExist(UserInfo userInfo) {
		return userMapper.checkUserTypeExist(userInfo);
	}
}
