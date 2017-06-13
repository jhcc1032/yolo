package com.yolo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.model.biz.ClassInfoService;
import com.yolo.model.biz.CreateClassInfoService;
import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.ClassTotalInfo;
import com.yolo.model.domain.CreateClassInfo;
import com.yolo.model.domain.PageBean;

@Controller
public class ClassController {

	@Autowired
	private ClassInfoService classinfoservice;
	
	@Autowired
	private CreateClassInfoService createclassinfoservice;
	
	@ExceptionHandler
	public ModelAndView handler(Exception e){
		System.out.println(e.getMessage());
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage());
		model.addObject("content", "ErrorHandler.jsp");
		return model;
	}
	
	
	/*
	 * 
	 * 여기부터는 과목 등록 파트.
	 * 
	 * 
	 * 
	 * 
	 * */
	
	// 왼쪽 메뉴에서 과목 등록을 눌렀을 때
	@RequestMapping(value = "registerForm.do", method = RequestMethod.GET)
	public String registerForm(Model model){
		// 등록 JSP로 이동
		model.addAttribute("content", "class/class_register.jsp");
		return "index";
	}
	
	// 과목 등록화면에서 submit 버튼을 눌럿을 때
	@RequestMapping(value = "register.do", method = RequestMethod.GET)
	public String register(Model model, ClassInfo classinfo){
		// 과목 등록
		classinfoservice.add(classinfo);
		
		//model.addAttribute("content", "class/class_register.jsp");
		return "redirect:classCheck.do";
	}
	
	// 과목 조회에서 check 버튼을 눌렀을 때
	@RequestMapping(value = "classCheck.do", method = RequestMethod.GET)
	public String classCheck(Model model, PageBean bean){
		// 전체 등록과목 데이터를 보여주기 위해 추출.
		List<ClassInfo> classinfo = classinfoservice.searchAll(bean);
		
		model.addAttribute("classinfo", classinfo);
		model.addAttribute("content", "class/class_register.jsp");
		return "index";
	}
	
	// 과목 edit 버튼을 클릭했을 때
	@RequestMapping(value = "classUpdateForm.do", method = RequestMethod.GET)
	public String classUpdateForm(Model model, int ccode){
		// 해당 데이터를 edit 창에 보여주기 위해 추출.
		ClassInfo classinfo = classinfoservice.search(ccode);

		model.addAttribute("classinfo", classinfo);
		model.addAttribute("content", "class/class_updateForm.jsp");
		return "index";
	}
	
	// 과목 edit창에서 업데이트 버튼을 클릭했을 때
	@RequestMapping(value = "classUpdate.do", method = RequestMethod.GET)
	public String classUpdate(Model model, ClassInfo classinfo){
		// 해당 과목 업데이트
		classinfoservice.update(classinfo);
		
		//model.addAttribute("content", "class/class_register.jsp");
		return "redirect:classCheck.do";
	}
	
	// 과목 delete 버튼을 클릭했을 때
	@RequestMapping(value = "classDelete.do", method = RequestMethod.GET)
	public String classDelete(Model model, int ccode){
		// 등록되어 잇는 과목 삭제
		classinfoservice.remove(ccode);
		
		//model.addAttribute("content", "class/class_register.jsp");
		return "redirect:classCheck.do";
	}

	/*
	 * 
	 * 여기부터는 등록되어 있는 과목 개설 파트.
	 * 
	 * 
	 * 
	 * 
	 * */
	
	// 왼쪽 메뉴에서 과목 개설을 눌렀을 때
	@RequestMapping(value = "createClassForm.do", method = RequestMethod.GET)
	public String createClassForm(Model model, PageBean bean){
		// 등록되어 있는 과목 코드를 보여주기 위해 추출.
		List<ClassInfo> classinfo = classinfoservice.searchAll(bean);
				
		model.addAttribute("classinfo", classinfo);
		model.addAttribute("content", "class/create_class_register.jsp");
		return "index";
	}
	
	// 개설 과목 조회에서 check 버튼을 눌렀을 때
	@RequestMapping(value = "createClassCheck.do", method = RequestMethod.GET)
	public String createClassCheck(Model model, PageBean bean){	
		// 등록되어 있는 과목 코드를 보여주기 위해 추출.
		List<ClassInfo> classinfo = classinfoservice.searchAll(bean);		
		// 개설 교육과정 정보를 추출
		List<ClassTotalInfo> classtotalinfo = createclassinfoservice.searchClassInfo(bean);
		
		model.addAttribute("classinfo", classinfo);
		model.addAttribute("classtotalinfo", classtotalinfo);
		model.addAttribute("content", "class/create_class_register.jsp");
		return "index";
	}
	
	// 과목 개설에서 submit 버튼을 눌렀을 때
	@RequestMapping(value = "createClassRegister.do", method = RequestMethod.GET)
	public String createClassRegister(Model model, CreateClassInfo createclassinfo){
		// 과목 개설을 위한 add
		createclassinfoservice.add(createclassinfo);
		
		return "redirect:createClassCheck.do";
	}
	
	// 개설과목 조회에서 edit 버튼을 눌렀을 때
	@RequestMapping(value = "createClassUpdateForm.do", method = RequestMethod.GET)
	public String createClassUpdateForm(Model model, int createcode, PageBean bean){
		// 저장 데이터를 edit 창에 보여주기 위해 추출
		CreateClassInfo createclassinfo = createclassinfoservice.search(createcode);
		// 등록되어 있는 과목 코드를 보여주기 위해 추출.
		List<ClassInfo> classinfo = classinfoservice.searchAll(bean);
		
		model.addAttribute("classinfo", classinfo);	
		model.addAttribute("createclassinfo", createclassinfo);
		model.addAttribute("content", "class/create_class_updateForm.jsp");
		return "index";
	}
	
	// 개설 과목 edit 창에서 update 버튼을 눌렀을 때
	@RequestMapping(value = "createClassUpdate.do", method = RequestMethod.GET)
	public String createClassUpdate(Model model, CreateClassInfo createclassinfo){
		// 개설 과목 업데이트
		createclassinfoservice.update(createclassinfo);
		
		return "redirect:createClassCheck.do";
	}
	
	// 개설 과목 delete 버튼을 눌렀을 때
	@RequestMapping(value = "createClassDelete.do", method = RequestMethod.GET)
	public String createClassDelete(Model model, int createcode){
		// 개설 과목 삭제
		createclassinfoservice.remove(createcode);
		
		return "redirect:createClassCheck.do";
	}

	// 개설 과목 자세히 보기 버튼을 눌렀을 때.
	@RequestMapping(value = "createClassDetailedView.do", method = RequestMethod.GET)
	public String createClassDetailedView(Model model, int createcode) {
		// 해당 개설 과목의 자세한 정보를 보여주기 위해 통합데이터를 추출.
		ClassTotalInfo classtotalinfo = createclassinfoservice.searchClassInfo(createcode);	

		model.addAttribute("classtotalinfo", classtotalinfo);
		model.addAttribute("content", "class/create_class_detailview.jsp");
		return "index";
	}

	
	@RequestMapping(value = "insertGradeForm.do", method = RequestMethod.GET)
	public String insertGradeForm(Model model, HttpSession session) {
		String cid = (String)session.getAttribute("id");
		List<ClassInfo> slist = createclassinfoservice.subject(cid);
		System.out.println(slist);
		model.addAttribute("slist", slist);
		model.addAttribute("content", "member/insertGradeForm.jsp");
		return "index";
	}
}
