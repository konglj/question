package com.bolion.question.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import net.sf.ezmorph.object.NumberMorpher;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.tags.ThemeTag;

import com.bolion.question.bean.Answer;
import com.bolion.question.bean.Question;
import com.bolion.question.bean.QuestionPage;
import com.bolion.question.bean.Setting;
import com.bolion.question.bean.Theme;
import com.bolion.question.bean.UserArea;
import com.bolion.question.bean.UserType;
import com.bolion.question.common.util.AlertStr;
import com.bolion.question.common.util.ResultUtil;
import com.bolion.question.service.QuestionService;
import com.bolion.question.service.SettingService;
import com.bolion.question.service.UserService;

@Controller
@RequestMapping("/question")
public class QuestionWeb {

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SettingService settingService;

	@RequestMapping("/question_list")
	public ModelAndView getQuestions(QuestionPage questionPage){
		
		questionService.getQuestions(questionPage);
		return new ModelAndView("/question/question_table","questionPage",questionPage);
		
	}
	
	
	@RequestMapping("/question_edit")
	public ModelAndView getEditQuestion(int questionid){
	    Question question=new Question();
		if(questionid!=0)
			question=questionService.getQuestionInfo(questionid);
		else{
			Setting setting=settingService.getSettingByKey("xy");
			if(setting!=null){
			 question.setXy(setting.getContent());
			}
		}
		return new ModelAndView("/question/question_edit","question",question);
		
	}
	
	@RequestMapping("/save_question")
	@ResponseBody
	public Object saveQuestion(HttpServletRequest request,Question question){
		String image="";
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			// 获得文件：
			List<MultipartFile> files=multipartRequest.getFiles("imgFile");
			for (MultipartFile file : files) {
				
				String path = request.getSession().getServletContext()
						.getRealPath("/").replace("\\", "/");
				if (path.endsWith("/")) {
					path = path.substring(0, path.length()-1);
				}
				path = path.substring(0, path.lastIndexOf("/"));
				
				path=path+"/question_file/images/";
				
				
//				String webPath = path.substring(0, index);
				
//				System.out.println("webPath="+webPath);
				System.out.println("path="+path);
				
				String oldname=file.getOriginalFilename();
				String extname=oldname.substring(oldname.indexOf("."));
				// 获得文件名：
				String filename =UUID.randomUUID().toString().replace("-", "")+extname;
				System.out.println(filename);
				File targetFile = new File(path, filename);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}

				file.transferTo(targetFile);
				image+="/question_file/images/"+filename+"";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		int result = 0;
		if (image != null && !image.equals("")) {
				question.setImg(image);
				
		}else{
		//	return ResultUtil.generateResponseMsg("error", AlertStr.question_save_img_error);
		}
		
		
		
		int count=0;
		if(question.getId()==0)
		  count=questionService.insertQuestion(question);
		else
			count=questionService.updateQuestion(question);
		if(count==0)
			return ResultUtil.generateResponseMsg("error", AlertStr.question_save_error);
		return ResultUtil.generateResponseMsg("success", AlertStr.question_save_success);
		
	}
	
	
	
	@RequestMapping("/del_question")
	@ResponseBody
	public Object delQuestion(int questionid){
		int count=0;
		  count=questionService.delQuestion(questionid);
		if(count==0)
			return ResultUtil.generateResponseMsg("error", AlertStr.question_del_error);
		return ResultUtil.generateResponseMsg("success", AlertStr.question_del_success);
		
	}
	
	@RequestMapping("/theme_list")
	public ModelAndView getThemes(QuestionPage questionPage){
		Map map=new HashMap();
		map.put("questionid", questionPage.getQuestionid());
		map.put("parentid",0);
		List<Theme> themes=questionService.getThemes(map);
		questionPage.setThemes(themes);
		return new ModelAndView("/question/theme_table","questionPage",questionPage);
	}
	
	@RequestMapping("/theme_edit")
	public ModelAndView getThemesEdit(QuestionPage questionPage){
		Map map=new HashMap();
		map.put("questionid", questionPage.getQuestionid());
		map.put("parentid", questionPage.getParentid());
		List<Theme> themes=questionService.getThemes(map);
		questionPage.setThemes(themes);
		return new ModelAndView("/question/theme_edit","questionPage",questionPage);
	}
	
	@RequestMapping("/theme_save")
	@ResponseBody
	public Object insertTheme(Theme theme){
		int count=0;
		if(theme.getId()==0){
			count=questionService.insertTheme(theme);
		}else{
			count=questionService.updateTheme(theme);
			
		}
		if(count==0){
			return ResultUtil.generateResponseMsg("error", AlertStr.theme_save_error);
		}
		return ResultUtil.generateResponseMsg("success",theme.getId());
	}
	
	
	@RequestMapping("/theme_del")
	@ResponseBody
	public Object delTheme(int themeid){
		int count=questionService.delTheme(themeid);
		if(count==0){
			return ResultUtil.generateResponseMsg("error", AlertStr.theme_del_error);
		}
		return ResultUtil.generateResponseMsg("success");
	}
	
	
	@RequestMapping("/theme_sub_edit")
	public ModelAndView getThemeSubList(QuestionPage questionPage){
		Theme theme=questionService.getThemeInfo(questionPage.getThemeid());
		Map map=new HashMap();
		map.put("questionid",theme.getQuestionid());
		map.put("parentid", theme.getId());
		questionPage.setTheme(theme);
		List<Theme> themes=questionService.getThemes(map);
		questionPage.setThemes(themes);
		return new ModelAndView("/question/theme_sub_edit","questionPage",questionPage);
	}
	
	@RequestMapping("/theme_change")
	@ResponseBody
	public Object setThemeChange(int themeid1,int themeid2){
		int count=0;
		try {
			count=questionService.updateThemeOrder(themeid1,themeid2);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		if(count==0){
			return ResultUtil.generateResponseMsg("error", AlertStr.theme_save_error);
		}
		return ResultUtil.generateResponseMsg("success");
		
	}
	
	/**
	 * 跳转问卷发布页面
	 * @param questionid
	 * @return
	 */
	@RequestMapping("/send_question")
	public ModelAndView getSendPage(int questionid){
	    List<UserArea> userAreas =userService.getUserAreas();
	    List<UserType> userTypes =userService.getUserTypes();
	    ModelAndView modelAndView=new ModelAndView("/question/send");
	    modelAndView.addObject("userAreas", userAreas);
	    modelAndView.addObject("userTypes", userTypes);
	    modelAndView.addObject("questionid", questionid);
	    return modelAndView;
	}
	
	/**
	 * 发布问卷
	 * @param questionid
	 * @param areaids
	 * @return
	 */
	@RequestMapping("/question_send")
	@ResponseBody
	public Object sendQuestion(int questionid,String area,String type){
		if(questionid==0||area==null||area.equals("")||type==null ||type.equals("")){
			return ResultUtil.generateResponseMsg("error",AlertStr.send_question_error);
		}
		int count=questionService.sendQuestion(questionid, area,type);
		if(count==0){
			 ResultUtil.generateResponseMsg("error",AlertStr.send_question_error);
		}
				
		return  ResultUtil.generateResponseMsg("success",AlertStr.send_question_success);
	}
	
	/**
	 * 获取问卷汇总表
	 * @param question
	 * @return
	 */
	@RequestMapping("/get_answer")
	public ModelAndView getQuestionResult(int questionid){
		List<Answer> answers=questionService.getAnswers(questionid);
		return new ModelAndView("/question/answer_table","answers",answers);
		
	}
	
	/**
	 * 答卷详情
	 * @return
	 */
	@RequestMapping("/answer_info")
	public ModelAndView getQuestionResultInfo(QuestionPage questionPage){
		System.out.println("11111111111111111111");
		questionService.getAnswerInfos(questionPage);
		System.out.println("2222222222222222");
		return new ModelAndView("/question/answer_info","questionPage",questionPage);
	}
	
	

}
