package com.bolion.question.bean;

import java.util.List;

public class AnswerInfo {

	private int id;
	
	private int answerid;
	
	private int questionid;
	
	private int themeid;
	
  private String title;
	
	private int issub;
	
	private int type;
	
	private int minscore;
	
	private int maxscore;
	
	private int required;
	
	private int textmaxlen;
	
	private int filemaxsize;
	
	private int parentid;
	
	private int orderby;
	
	
	private String jscontent;
	
	private String ywcontent;
	
	private String content="";

	private int role;
	
	private int subPfCount;
	
	private double pfavg;
	
	private List<AnswerInfo> subAnswerInfo;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAnswerid() {
		return answerid;
	}

	public void setAnswerid(int answerid) {
		this.answerid = answerid;
	}

	

	public int getQuestionid() {
		return questionid;
	}

	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}

	public int getThemeid() {
		return themeid;
	}

	public void setThemeid(int themeid) {
		this.themeid = themeid;
	}

	public String getJscontent() {
		return jscontent;
	}

	public void setJscontent(String jscontent) {
		this.jscontent = jscontent;
	}

	public String getYwcontent() {
		return ywcontent;
	}

	public void setYwcontent(String ywcontent) {
		this.ywcontent = ywcontent;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getIssub() {
		return issub;
	}

	public void setIssub(int issub) {
		this.issub = issub;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getMinscore() {
		return minscore;
	}

	public void setMinscore(int minscore) {
		this.minscore = minscore;
	}

	public int getMaxscore() {
		return maxscore;
	}

	public void setMaxscore(int maxscore) {
		this.maxscore = maxscore;
	}

	public int getRequired() {
		return required;
	}

	public void setRequired(int required) {
		this.required = required;
	}

	public int getTextmaxlen() {
		return textmaxlen;
	}

	public void setTextmaxlen(int textmaxlen) {
		this.textmaxlen = textmaxlen;
	}

	public int getFilemaxsize() {
		return filemaxsize;
	}

	public void setFilemaxsize(int filemaxsize) {
		this.filemaxsize = filemaxsize;
	}

	public int getParentid() {
		return parentid;
	}

	public void setParentid(int parentid) {
		this.parentid = parentid;
	}

	public int getOrderby() {
		return orderby;
	}

	public void setOrderby(int orderby) {
		this.orderby = orderby;
	}

	public List<AnswerInfo> getSubAnswerInfo() {
		return subAnswerInfo;
	}

	public void setSubAnswerInfo(List<AnswerInfo> subAnswerInfo) {
		this.subAnswerInfo = subAnswerInfo;
	}

	public int getSubPfCount() {
		return subPfCount;
	}

	public void setSubPfCount(int subPfCount) {
		this.subPfCount = subPfCount;
	}

	public double getPfavg() {
		return pfavg;
	}

	public void setPfavg(double pfavg) {
		this.pfavg = pfavg;
	}
	
	
	
	
	
}
