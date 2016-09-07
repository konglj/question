package com.bolion.question.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bolion.question.bean.UserArea;
import com.bolion.question.bean.UserInfo;
import com.bolion.question.bean.UserPage;
import com.bolion.question.bean.UserRole;
import com.bolion.question.bean.UserType;
import com.bolion.question.common.util.AlertStr;
import com.bolion.question.common.util.ResultUtil;
import com.bolion.question.service.UserService;

/**
 * 
 * @author 交 
 *
 */
@Controller
@RequestMapping("/user")
public class UserWeb {
	
	@Autowired
	private UserService userService;

	/**
	 * 获取用户列表
	 * @return
	 */
	@RequestMapping("/user_list")
	public ModelAndView getUsers(UserPage userPage){
		userService.getUsers(userPage);
		return new ModelAndView("/user/user_table","userPage",userPage);
	}
	
	/**
	 * 用户详情
	 * @return
	 */
	@RequestMapping("/user_info")
	public ModelAndView getUserInfo(int userid){
		UserInfo userInfo=new UserInfo();
		userInfo=userService.getUserInfo(userid);
		return new ModelAndView("/user/user_look","user",userInfo);
	}
	/**
	 * 用户编辑页面
	 * @return
	 */
	@RequestMapping("/user_edit")
	public ModelAndView getUserEdit(int userid){
		UserPage userPage=new UserPage();
		List<UserArea> userAreas=userService.getUserAreas();
		List<UserType> userTypes=userService.getUserTypes();
		List<UserRole> userRoles=userService.getUserRoles();
		userPage.setUserAreas(userAreas);
		userPage.setUserTypes(userTypes);
		userPage.setUserRoles(userRoles);
		UserInfo userInfo=new UserInfo();
		if(userid!=0){
		  userInfo=userService.getUserInfo(userid);
		}
		 userPage.setUser(userInfo);
		return new ModelAndView("/user/user_edit","userPage",userPage);
	}
	
	/**
	 * 用户保存
	 * @param userInfo
	 * @return
	 */
	@RequestMapping("/save_user")
	@ResponseBody
	public Object  saveUser(UserInfo userInfo){
		int count=0;
		count=userService.checkUserPhoneExist(userInfo);
		if(count>0){
			return ResultUtil.generateResponseMsg("error",AlertStr.user_save_phone_exist);
		}
		count=userService.checkUserTypeExist(userInfo);
		if(count>0){
			return ResultUtil.generateResponseMsg("error",AlertStr.user_save_type_exist);
		}
		if(userInfo.getUserid()==0){
			count=userService.insertUser(userInfo);
		}else{
			count=userService.updateUser(userInfo);
		}
		if(count==0){
			return ResultUtil.generateResponseMsg("error",AlertStr.user_save_error);
		}
		return ResultUtil.generateResponseMsg("success", AlertStr.user_save_success);
	}
	
	/**
	 * 删除用户
	 * @param userid
	 * @return
	 */
	@RequestMapping("/del_user")
	@ResponseBody
	public Object  deleteUser(int userid){
		int count=userService.deleteUser(userid);
		if(count==0){
			return ResultUtil.generateResponseMsg("error",AlertStr.user_del_error);
		}
		return ResultUtil.generateResponseMsg("success", AlertStr.user_del_success);
	}
}
