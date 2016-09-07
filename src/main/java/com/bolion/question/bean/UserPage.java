package com.bolion.question.bean;

import java.util.ArrayList;
import java.util.List;

public class UserPage {
	
	private String username;
	
	private String usertele;
	
	private String wxname;
	
	private int  isregist=-1;
	
	private int  registtime;
	
	private int userarea;
	
	private int usertype;
	
	private List<UserInfo> users;
	
	private UserInfo user;
	
	private PageInfo pageInfo=new PageInfo();
	
	private List<UserArea> userAreas;
	
	private List<UserType> userTypes;
	
	private List<UserRole> userRoles;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	

	public String getUsertele() {
		return usertele;
	}

	public void setUsertele(String usertele) {
		this.usertele = usertele;
	}

	public String getWxname() {
		return wxname;
	}

	public void setWxname(String wxname) {
		this.wxname = wxname;
	}

	public int getIsregist() {
		return isregist;
	}

	public void setIsregist(int isregist) {
		this.isregist = isregist;
	}

	public int getRegisttime() {
		return registtime;
	}

	public void setRegisttime(int registtime) {
		this.registtime = registtime;
	}

	public List<UserInfo> getUsers() {
		return users;
	}

	public void setUsers(List<UserInfo> users) {
		this.users = users;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public int getUserarea() {
		return userarea;
	}

	public void setUserarea(int userarea) {
		this.userarea = userarea;
	}

	public int getUsertype() {
		return usertype;
	}

	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}

	public List<UserArea> getUserAreas() {
		return userAreas;
	}

	public void setUserAreas(List<UserArea> userAreas) {
		this.userAreas = userAreas;
	}

	public List<UserType> getUserTypes() {
		return userTypes;
	}

	public void setUserTypes(List<UserType> userTypes) {
		this.userTypes = userTypes;
	}

	public List<UserRole> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(List<UserRole> userRoles) {
		this.userRoles = userRoles;
	}
	
	
	
	
	

}
