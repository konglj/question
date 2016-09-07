package com.bolion.question.service.impl;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.log4j.helpers.QuietWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bolion.question.bean.Answer;
import com.bolion.question.bean.AnswerInfo;
import com.bolion.question.bean.Question;
import com.bolion.question.bean.QuestionPage;
import com.bolion.question.bean.Theme;
import com.bolion.question.bean.UserType;
import com.bolion.question.mapper.QuestionMapper;
import com.bolion.question.mapper.UserMapper;
import com.bolion.question.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	private QuestionMapper questionMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 获取问卷列表
	 * @param questionPage
	 * @return
	 */
	@Override
	public List<Question> getQuestions(QuestionPage questionPage){
	     int count=questionMapper.getQuestionsCount(questionPage);
	     List<Question> questions=questionMapper.getQuestions(questionPage);
	     questionPage.setQuestions(questions);
	     questionPage.getPageInfo().setCount(count);
	     return null;
	}

	/**
	 * 获取问卷详细
	 * @param id
	 * @return
	 */
	@Override
	public Question getQuestionInfo(int id){
		return questionMapper.getQuestionInfo(id);
	}
	
	@Override
	public int insertQuestion(Question question) {
	   
		return questionMapper.insertQuestion(question);
	}

	@Override
	public int updateQuestion(Question question) {
	
		return questionMapper.updateQuestion(question);
	}

	@Override
	public int delQuestion(int id) {
	
		return questionMapper.delQuestion(id);
	}
	
	
	/**
	 * 获取题目列表
	 * @param map
	 * @return
	 */
	public List<Theme> getThemes(Map map){
		return questionMapper.getThemes(map);
	}

	@Override
	public int insertTheme(Theme theme) {
	Map map=new HashMap();
	map.put("parentid",theme.getParentid());
	map.put("questionid",theme.getQuestionid());
	Theme lastTheme=questionMapper.getLastTheme(map);
	if(lastTheme!=null){
		theme.setOrderby(lastTheme.getOrderby()+1);
	}else{
		theme.setOrderby(1);
	}
	return questionMapper.insertTheme(theme);
	}

	@Override
	public int updateTheme(Theme theme) {
		return questionMapper.updateTheme(theme);
	}

	@Override
	public int delTheme(int themeid) {
		return questionMapper.delTheme(themeid);
	}

	@Override
	@Transactional
	public int updateThemeOrder(int themeid1,int themeid2) {
		Theme theme1=questionMapper.getThemeInfo(themeid1);
		if(theme1==null)
			return 0;
		
		Theme theme2=questionMapper.getThemeInfo(themeid2);
		if(theme2==null)
			return 0;
		int ordertheme1=theme1.getOrderby();
		int ordertheme2=theme2.getOrderby();
		theme1.setOrderby(ordertheme2);
		theme2.setOrderby(ordertheme1);
		int count=questionMapper.updateThemeOrder(theme1);
		if(count==0)
			return  0;
		count=questionMapper.updateThemeOrder(theme2);
		if(count==0)
			throw new RuntimeException();
		return 	count;
	}
	
	
	/**
	 * 获取题目详情
	 * @param themeid
	 * @return
	 */
	public Theme getThemeInfo(int themeid){
		return questionMapper.getThemeInfo(themeid);
	}
	
	
	/**
	 * 获取orderby数值最大的
	 * @param parentid
	 * @return
	 */
	public Theme getLastTheme(Map map){
		return questionMapper.getLastTheme( map);
	}

	@Override
	@Transactional
	public int sendQuestion(int question,String areas,String types) {
		String  [] areaids=areas.split(",");
		Map map=new HashMap();
		map.put("questionid", question);
		List<Theme> themes=questionMapper.getThemes(map);
		//修改发送记录
		String []usertypes=types.split(",");
		int count=0;
		Answer answer=new Answer();
		AnswerInfo answerInfo=new AnswerInfo();
		count =questionMapper.setQuestionSend(question);
		
		for (String type : usertypes) {
			int typeid=Integer.valueOf(type);
			for (String area : areaids) {
				//插入问卷
				answer=new Answer();
				answer.setQuestionid(question);
				answer.setUsertype(typeid);
				answer.setArea(Integer.valueOf(area));
				answer.setJsstate(0);
				answer.setYwstate(0);
				count=questionMapper.insertAnswer(answer);
				if(count==0||answer.getId()==0)
					throw new RuntimeException();
				//插入问卷详情
				for (Theme theme : themes) {
					answerInfo=new AnswerInfo();
					answerInfo.setAnswerid(answer.getId());
					answerInfo.setQuestionid(question);
					answerInfo.setThemeid(theme.getId());
					count=questionMapper.insertAnswerInfo(answerInfo);
					if(count==0)
						throw new RuntimeException();
				}
				
			}
			
			
		}
		
		
		return count;
	}

	@Override
	public List<Answer> getAnswers(int questionid) {
		return questionMapper.getAnswerResult(questionid);
	}

	@Override
	public List<AnswerInfo> getAnswerInfos(QuestionPage questionPage) {
		List<AnswerInfo> answerInfos=questionMapper.getAnserResultInfo(questionPage);
		questionPage.setAnswerInfos(answerInfos);
		Answer answer=questionMapper.getAnswerResultByAnswerid(questionPage.getAnswerid());
		questionPage.setQuestionid(answer.getQuestionid());
		double fz=0;
		int count=0;
			for (AnswerInfo answerInfo : answerInfos) {
			
				answerInfo.setContent(getAnswerResult(answer,answerInfo));
			if(answerInfo.getSubAnswerInfo()!=null && answerInfo.getSubAnswerInfo().size()>0){
				for (AnswerInfo subTheme : answerInfo.getSubAnswerInfo()) {
					
					subTheme.setContent(getAnswerResult(answer,subTheme));
					if(subTheme.getType()==1){
						count++;
						fz+=Double.valueOf(subTheme.getContent());
					}
				}
			}
			 DecimalFormat df = new DecimalFormat("#.0");  
			answerInfo.setSubPfCount(count);
			if(count==0||fz==0){
				answerInfo.setPfavg(0);
			}else{
			answerInfo.setPfavg(Double.valueOf(df.format((Double)fz/count)));
			}
		}
		
	
		return null;
	}
	
	private String getAnswerResult(Answer answer,AnswerInfo theme){
		int type=theme.getType();
		if(answer.getYwstate()==3&&answer.getJsstate()==3){
		
		String jscont=theme.getJscontent();
		String ywcontent=theme.getYwcontent();
		 DecimalFormat df = new DecimalFormat("#.0");  
		if(type==1){
			double js=0;
			double yw=-1;
			if((jscont==null || jscont.length()==0)){
				js=-1;
			}else{
				js=Double.valueOf(jscont);
			}
			if(ywcontent==null ||ywcontent.length()==0)
				yw=-1;
			else{
				yw=Double.valueOf(ywcontent);
			}
			if(js!=-1&&yw!=-1)
				
				return df.format((Double)((yw+js)/2));
			else if(js!=-1&&yw==-1)
				return jscont;
			else if(js==-1&&yw!=-1)
				return ywcontent;
			else 
				return "0";
				
			
		}else if(type==4){
			if((ywcontent==null ||ywcontent.length()==0)&&(jscont==null || jscont.length()==0))
				return null;
			if((ywcontent==null ||ywcontent.length()==0)&&(jscont!=null &&jscont.length()>0))
			return jscont;
			if((ywcontent!=null &&ywcontent.length()>0)&&(jscont==null|| jscont.length()==0))
				return ywcontent;
			return jscont+","+ywcontent;
		}
		
		return jscont+" "+ywcontent;
	}else{
		if(type==1)
			return "0";
	}
		return null;
		
	}

	@Override
	public int setQuestionSend(int question) {
		return 0;
	}



}
