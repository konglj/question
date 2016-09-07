package com.bolion.question.bean;

import java.util.ArrayList;
import java.util.List;

public class Answer {

	private int id;
	
	private int questionid;
	
	private String title;
	
	private String desc;
	
	private String bz;
	
	private String addtime;
	
	private String starttime;
	
	private String endtime;
	
	private String img;
	
	private int  jsstate;
	
	private int ywstate;
	
	private String jstime;
	
	private String ywtime;
	
	private int usertype;
	
	private int area;
	
	private String typename;
	
	private String areaname;
	
	private String jsstatename;
	
	private String ywstatename;
	
	private String file;
	
	private List<Theme> themes=new ArrayList<Theme>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	
	
	

	public int getQuestionid() {
		return questionid;
	}

	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getAddtime() {
		return addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}


	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public List<Theme> getThemes() {
		return themes;
	}

	public void setThemes(List<Theme> themes) {
		this.themes = themes;
	}

	public int getJsstate() {
		return jsstate;
	}

	public void setJsstate(int jsstate) {
		this.jsstate = jsstate;
	}

	

	public int getYwstate() {
		return ywstate;
	}

	public void setYwstate(int ywstate) {
		this.ywstate = ywstate;
	}

	public String getJstime() {
		return jstime;
	}

	public void setJstime(String jstime) {
		this.jstime = jstime;
	}

	public String getYwtime() {
		return ywtime;
	}

	public void setYwtime(String ywtime) {
		this.ywtime = ywtime;
	}

	public int getUsertype() {
		return usertype;
	}

	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getAreaname() {
		return areaname;
	}

	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}

	public String getJsstatename() {
		return jsstatename;
	}

	public void setJsstatename(String jsstatename) {
		this.jsstatename = jsstatename;
	}

	public String getYwstatename() {
		return ywstatename;
	}

	public void setYwstatename(String ywstatename) {
		this.ywstatename = ywstatename;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
	
	
	
	
}
