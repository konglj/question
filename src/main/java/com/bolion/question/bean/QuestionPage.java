package com.bolion.question.bean;

import java.util.List;

public class QuestionPage {
	
	
	private int themeid;
	
	private int questionid;
	
	private int answerid;
	
	private int parentid;
	
	
	
	private String title;
	
	private String desc;
	
	private String starttime;
	
	private String endtime;
	
	private PageInfo pageInfo=new PageInfo();
	
	private List<Question> questions;
	
	private Question question;
	
	private List<Theme> themes;
	
	private Theme theme;

	private List<AnswerInfo> answerInfos;
	
	
	
	public int getThemeid() {
		return themeid;
	}

	public void setThemeid(int themeid) {
		this.themeid = themeid;
	}

	public int getQuestionid() {
		return questionid;
	}

	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}

	
	
	public int getParentid() {
		return parentid;
	}

	public void setParentid(int parentid) {
		this.parentid = parentid;
	}

	public List<Theme> getThemes() {
		return themes;
	}

	public void setThemes(List<Theme> themes) {
		this.themes = themes;
	}

	public Theme getTheme() {
		return theme;
	}

	public void setTheme(Theme theme) {
		this.theme = theme;
	}

	public String getTitle() {
		return title;
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

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public int getAnswerid() {
		return answerid;
	}

	public void setAnswerid(int answerid) {
		this.answerid = answerid;
	}

	public List<AnswerInfo> getAnswerInfos() {
		return answerInfos;
	}

	public void setAnswerInfos(List<AnswerInfo> answerInfos) {
		this.answerInfos = answerInfos;
	}
	
	
	
	

}
