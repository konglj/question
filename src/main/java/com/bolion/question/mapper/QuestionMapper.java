package com.bolion.question.mapper;

import java.util.List;
import java.util.Map;

import com.bolion.question.bean.Answer;
import com.bolion.question.bean.AnswerInfo;
import com.bolion.question.bean.Question;
import com.bolion.question.bean.QuestionPage;
import com.bolion.question.bean.Theme;

public interface QuestionMapper {

	/**
	 * 获取问卷列表
	 * @param questionPage
	 * @return
	 */
	public List<Question> getQuestions(QuestionPage questionPage);
	
	/**
	 * 获取问卷列表数量
	 * @param questionPage
	 * @return
	 */
	public int getQuestionsCount(QuestionPage questionPage);
	
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
	public int updateThemeOrder(Theme theme);
	
	
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
	
	/**
	 * 插入问卷结果总表
	 * @param answer
	 * @return
	 */
	public int insertAnswer(Answer answer);
	
	/**
	 * 插入问卷答案对应表
	 * @param answer
	 * @return
	 */
	public int insertAnswerInfo(AnswerInfo answerinfo);
	
	/**
	 * 获取问卷结果表
	 * @param questionid
	 * @return
	 */
	public List<Answer> getAnswerResult(int questionid);
	
	/**
	 * 
	 * @param answerid
	 * @return
	 */
	public Answer getAnswerResultByAnswerid(int answerid);
	
	
	/**
	 * 获取题目答案
	 * @param answerid
	 * @return
	 */
	public List<AnswerInfo> getAnserResultInfo(QuestionPage questionPage);
	
	
	/**
	 * 获取问卷详细
	 * @param id
	 * @return
	 */
	public Question getQuestionInfoByAnswerid(int answerid);
	
	public int setQuestionSend(int question);
	
	
}
