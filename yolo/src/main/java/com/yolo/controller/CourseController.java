package com.yolo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yolo.model.biz.ClassInfoService;
import com.yolo.model.biz.CourseService;
import com.yolo.model.biz.OpenClassInfoService;
import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.OpenClassInfo;
import com.yolo.model.domain.PageBean;

@Controller
public class CourseController {
	@Autowired
	private CourseService courseService;
	@Autowired
	private ClassInfoService classInfoService;
	@Autowired
	private OpenClassInfoService openClassInfoService;
	
	@RequestMapping(value = "openRegisterCourseForm.do" , method = RequestMethod.GET)
	public String openCourseForm(Model model, PageBean bean) { 
		//수강신청 첫페이지 수행사항		
		List<ClassInfo> list = classInfoService.searchAll(bean);
		/*List<ClassInfo> listClass = classInfoService.searchAll(bean);
		List<OpenClassInfo> listOpenClass = openClassInfoService.searchAll(bean);
		for (ClassInfo classInfo : listClass) {
			for (OpenClassInfo openClassInfo : listOpenClass) {
				//각 리스트의 ccode가 같은것(과목이 개설되어 있으면 출력)을 select에 뿌려주도록
				if(true) {
					
				}
			}
		}*/
		
		model.addAttribute("classList", list);
		model.addAttribute("content", "course/openRegisterCourseForm.jsp");
		return "index";
	}
	
	@RequestMapping(value = "courseRegister.do" , method = RequestMethod.GET)
	public String registerCourse(Model model, PageBean bean, HttpServletRequest request) { 
		System.out.println("course controller 0");
		int seletcValue= Integer.parseInt(request.getParameter("selected_value"));	//class ccode
		//select 선택되었을때 수행사항
		ClassInfo selectedClass = null;
		if (openClassInfoService.searchByCcode(seletcValue) != null) {
			if(classInfoService.search(seletcValue).getCcode() 
						== openClassInfoService.searchByCcode(seletcValue).getCcode()){
					//개설table ccode와 class ccode가 동일하면 (강의가 개설되어있으면)
					//개설된 강의만 표현하도록 
				System.out.println(seletcValue);
				selectedClass = classInfoService.search(seletcValue);
			}
			else{	
				System.out.println("개설되어있지않음");
			}
		}
		else {
			System.out.println("빈 openclass");
		}
		
		List<ClassInfo> list = classInfoService.searchAll(bean);
		model.addAttribute("classList", list);
		model.addAttribute("selectedClass", selectedClass);
		model.addAttribute("content", "course/openRegisterCourseForm.jsp");
		return "index";
	}
	
	
}
