package com.bolion.question.service;

import java.util.List;
import java.util.Map;

import com.bolion.question.bean.UserArea;
import com.bolion.question.bean.UserInfo;
import com.bolion.question.bean.UserPage;
import com.bolion.question.bean.UserRole;
import com.bolion.question.bean.UserType;

/**
 * 
 * @author 交 
 *
 */
public interface UserService {
	
	/**
	 * 获取用户列表
	 * @param userPage
	 * @return
	 */
	public List<UserInfo> getUsers(UserPage userPage);
	
	
	/**
	 * 获取用户详情
	 * @param userPage
	 * @return
	 */
	public UserInfo getUserInfo(int id);
	
	/**
	 * 更新用户
	 * @param userInfo
	 * @return
	 */
	public int updateUser(UserInfo userInfo);
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public int deleteUser(int id);

	/**
	 * 插入用户
	 * @param userInfo
	 * @return
	 */
	public int insertUser(UserInfo userInfo);
	
	
	/**
	 * 获取用户区域
	 * @return
	 */
	public List<UserArea> getUserAreas();
	
	/**
	 * 获取用户类型
	 * @return
	 */
	public List<UserType> getUserTypes();
	
	/**
	 * 获取用户角色
	 * @return
	 */
	public List<UserRole> getUserRoles();
	
	
	/**
	 * 验证用户手机号是否已经存在
	 * @param map
	 * @return
	 */
	public int checkUserPhoneExist(UserInfo userInfo);
	
	/**
	 * 同区域 同运营商 同角色只有一人
	 * @param userInfo
	 * @return
	 */
	public int checkUserTypeExist(UserInfo userInfo);
}
