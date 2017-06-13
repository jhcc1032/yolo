package com.yolo.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.model.biz.ClassInfoService;
import com.yolo.model.biz.CourseService;
import com.yolo.model.biz.CreateClassInfoService;
import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.Course;
import com.yolo.model.domain.CreateClassInfo;
import com.yolo.model.domain.PageBean;


@Controller
public class CourseController {
	@Autowired
	private CourseService courseService;
	@Autowired
	private ClassInfoService classInfoService;
	@Autowired
	private CreateClassInfoService createClassInfoService;
	
	//errorHandler
	@ExceptionHandler
	public ModelAndView handler(Exception e){
		System.out.println(e.getMessage());
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage());
		model.addObject("content", "ErrorHandler.jsp");
		return model;
	}
	
	//onload
	@RequestMapping(value = "openRegisterCourseForm.do" , method = RequestMethod.GET)
	public String openCourseForm(Model model, PageBean bean, HttpServletRequest request) { 
		//수강신청 첫페이지 수행사항		
		
		
		List<ClassInfo> listClass = classInfoService.searchAll(bean);
		List<CreateClassInfo> listOpenClass = createClassInfoService.searchAll(bean);
		
		//개설된 강의를 추가할 list
		List<ClassInfo> outputClassList = new ArrayList<ClassInfo>();
						
		int seletcValue = 0;
		if (request.getParameter("selected_value") != null) {
			//select에서 받아온 ccode값
			seletcValue= Integer.parseInt(request.getParameter("selected_value"));	
		}
		
		CreateClassInfo selectedOpenClass = null;
		ClassInfo selectedClass = null;		
		
		if (createClassInfoService.searchByCcode(seletcValue) != null) {
			if(classInfoService.search(seletcValue).getCcode() 
						== createClassInfoService.searchByCcode(seletcValue).getCcode()){
					//개설table ccode와 class ccode가 동일하면 (강의가 개설되어있으면)
					//개설된 강의만 표현하도록 
				
				selectedOpenClass = createClassInfoService.searchByCcode(seletcValue);
				selectedClass = classInfoService.search(seletcValue);
				
				model.addAttribute("selectedOpenClass", selectedOpenClass);
				model.addAttribute("selectedClass", selectedClass);
			}
			else{	
				System.out.println("개설되어있지않음");
			}
		}
		
		//select에 표시할 class목록
		for (CreateClassInfo openClassInfo : listOpenClass) {
			for (ClassInfo classInfo : listClass) {
				if(classInfo.getCcode() == openClassInfo.getCcode()) {					
					//추가
					outputClassList.add(classInfo);
				}
			}	
		}
		
		model.addAttribute("classList", outputClassList);		
		model.addAttribute("content", "course/openRegisterCourseForm.jsp");
		
		try {
			//날짜 시간 차이 계산 (progressbar)
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date beginDate;
			
			Calendar calendar = Calendar.getInstance();
			Date date = calendar.getTime();
			//현재 시간 받기
			Date endDate = formatter.parse(formatter.format(date));
			long diff;
			long diffDays;
			double result;
			/*
			long diff = endDate.getTime() - beginDate.getTime();
		    long diffDays = diff / (24 * 60 * 60 * 1000);
		    */	
		    
		    //현재 수강정보 받아오기
			List<Course> courseList = courseService.searchAll(bean);
			for (Course course : courseList) {
				for (CreateClassInfo openClassInfo : listOpenClass) {
					if (course.getCreatecode() == openClassInfo.getCreatecode())
						for (ClassInfo classInfo : outputClassList) {
							if(openClassInfo.getCcode() == classInfo.getCcode()) {
								course.setCtitle(classInfo.getCtitle());
								course.setCcode(classInfo.getCcode());
								course.setChour(classInfo.getChour());
								course.setCscore(classInfo.getCscore());
								course.setCreatedate(openClassInfo.getCreatedate());
								
								//progressbar;;
								beginDate = formatter.parse(openClassInfo.getCreatedate());
								diff = endDate.getTime() - beginDate.getTime();
								diffDays = diff / (24 * 60 * 60 * 1000);
								result = ((double)diffDays/ (double)(7 * course.getCscore()) )* 100.0;
								if(result > 0) {
									course.setProgressPercentage(Integer.toString((int)result) + "%");
								}
							}
						}
				}
			}
	    
		model.addAttribute("courseList", courseList);
		} 
		catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return "index";
	}
	
	
	//select에서 선택한 수강정보중 선택된 수강정보를 수강신청 버튼 눌렀을때
	@RequestMapping(value ="registerCourse.do", method = RequestMethod.GET )
	public String registerCourse (Model model, HttpSession session, int createcode) {
		
		Course course = new Course(createcode, session.getAttribute("id").toString());
		courseService.add(course);
		return "redirect:openRegisterCourseForm.do";
	}
	
	
	//현재 수강정보에서 삭제 버튼 눌렀을때
	@RequestMapping( value = "courseDelete.do", method = RequestMethod.GET)
	public String courseDelete(Model model, int coursecode) {
		
		courseService.remove(coursecode);
		return "redirect:openRegisterCourseForm.do";
	}	
}





