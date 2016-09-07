package com.bolion.question.bean;

import java.util.ArrayList;
import java.util.List;

public class Theme {
	
	private int id;
	
	private int questionid;
	
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
	
	private String typename;
	
	private int subcount;
	
	
	private String result;
	
	private int answerrole;
	
	private List<Theme> subThemes=new ArrayList<Theme>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	public int getQuestionid() {
		return questionid;
	}

	public void setQuestionid(int questionid) {
		this.questionid = questionid;
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

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public int getSubcount() {
		return subcount;
	}

	public void setSubcount(int subcount) {
		this.subcount = subcount;
	}

	public List<Theme> getSubThemes() {
		return subThemes;
	}

	public void setSubThemes(List<Theme> subThemes) {
		this.subThemes = subThemes;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getAnswerrole() {
		return answerrole;
	}

	public void setAnswerrole(int answerrole) {
		this.answerrole = answerrole;
	}

	

	
}
