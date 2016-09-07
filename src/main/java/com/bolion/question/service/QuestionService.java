package com.bolion.question.service;

import java.util.List;
import java.util.Map;

import com.bolion.question.bean.Answer;
import com.bolion.question.bean.AnswerInfo;
import com.bolion.question.bean.Question;
import com.bolion.question.bean.QuestionPage;
import com.bolion.question.bean.Theme;

public interface QuestionService {
	
	/**
	 * 获取问卷列表
	 * @param questionPage
	 * @return
	 */
	public List<Question> getQuestions(QuestionPage questionPage);
	
	
	/**
	 * 获取问卷详细
	 * @param id
	 * @return
	 */
	public Question getQuestionInfo(int id);
	
	/**
	 * 插入问卷
	 * @param question
	 * @return
	 */
	public int insertQuestion(Question question);
	
	
	/**
	 * 更新问卷
	 * @param question
	 * @return
	 */
	public int updateQuestion(Question question);
	
	
	/**
	 * 删除问卷
	 * @param id
	 * @return
	 */
	public int delQuestion(int id);
	
	
	/**
	 * 获取题目列表
	 * @param map
	 * @return
	 */
	public List<Theme> getThemes(Map map);
	
	
	/**
	 * 更新题目列表
	 * @param map
	 * @return
	 */
	public int insertTheme(Theme theme);
	
	
	/**
	 * 更新题目列表
	 * @param map
	 * @return
	 */
	public int updateTheme(Theme theme);
	
	
	/**
	 * 删除题目列表
	 * @param map
	 * @return
	 */
	public int delTheme(int themeid);
	
	
	/**
	 * 更新题目顺序
	 * @param map
	 * @return
	 */
	public int updateThemeOrder(int themeid1,int themeid2);
	
	
	
	/**
	 * 获取题目详情
	 * @param themeid
	 * @return
	 */
	public Theme getThemeInfo(int themeid);

	/**
	 * 获取orderby数值最大的
	 * @param parentid
	 * @return
	 */
	public Theme getLastTheme(Map map);
	
	public int sendQuestion(int question,String areas,String types);
	
	
	public List<Answer> getAnswers(int questionid);
	
	
	public List<AnswerInfo> getAnswerInfos(QuestionPage questionPage);
	
	public int setQuestionSend(int question);
}
