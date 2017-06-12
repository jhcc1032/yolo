package com.yolo.controller;

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
import com.yolo.model.biz.OpenClassInfoService;
import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.OpenClassInfo;
import com.yolo.model.domain.PageBean;

@Controller
public class ClassController {

	@Autowired
	private ClassInfoService classinfoservice;
	
	@Autowired
	private OpenClassInfoService openclassinfoservice;
	
	@ExceptionHandler
	public ModelAndView handler(Exception e){
		System.out.println(e.getMessage());
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage());
		model.addObject("content", "ErrorHandler.jsp");
		return model;
	}
	
	// 왼쪽 메뉴에서 과목 등록을 눌렀을 때
	@RequestMapping(value = "registerForm.do", method = RequestMethod.GET)
	public String registerForm(Model model){
		model.addAttribute("content", "class/class_register.jsp");
		return "index";
	}
	
	// 과목 등록화면에서 submit 버튼을 눌럿을 때
	@RequestMapping(value = "register.do", method = RequestMethod.GET)
	public String register(Model model, ClassInfo classinfo){
		System.out.println("register====" + classinfo);
		classinfoservice.add(classinfo);
		model.addAttribute("content", "class/class_register.jsp");
		return "index";
	}
	
	// 과목 조회에서 check 버튼을 눌렀을 때
	@RequestMapping(value = "classCheck.do", method = RequestMethod.GET)
	public String classCheck(Model model, PageBean bean){
		List<ClassInfo> classlist = classinfoservice.searchAll(bean);
		System.out.println("classCheck=====" + classlist);
		model.addAttribute("classlist", classlist);
		model.addAttribute("content", "class/class_register.jsp");
		return "index";
	}
	
	// 과목 edit 버튼을 클릭했을 때
	@RequestMapping(value = "classUpdateForm.do", method = RequestMethod.GET)
	public String classUpdateForm(Model model, int ccode){
		ClassInfo classinfo = classinfoservice.search(ccode);
		System.out.println("classUpdateForm=====" + classinfo);
		model.addAttribute("classinfo", classinfo);
		model.addAttribute("content", "class/class_updateForm.jsp");
		return "index";
	}
	
	// 과목 edit창에서 업데이트 버튼을 클릭했을 때
	@RequestMapping(value = "classUpdate.do", method = RequestMethod.GET)
	public String classUpdate(Model model, ClassInfo classinfo){
		System.out.println("classUpdate1=====" + classinfo);
		classinfoservice.update(classinfo);
		System.out.println("classUpdate2=====" + classinfo);
		model.addAttribute("content", "class/class_register.jsp");
		return "index";
	}
	
	// 과목 delete 버튼을 클릭했을 때
	@RequestMapping(value = "classDelete.do", method = RequestMethod.GET)
	public String classDelete(Model model, int ccode){
		System.out.println("classDelete=====" + ccode);
		classinfoservice.remove(ccode);
		model.addAttribute("content", "class/class_register.jsp");
		return "index";
	}
	
	// 왼쪽 메뉴에서 과목 개설을 눌렀을 때
	@RequestMapping(value = "openClassForm.do", method = RequestMethod.GET)
	public String classOpenForm(Model model, PageBean bean){
		List<ClassInfo> classinfo = classinfoservice.searchAll(bean);
		model.addAttribute("classinfo", classinfo);
		model.addAttribute("content", "class/class_open.jsp");
		return "index";
	}
	
	// 개설 과목 조회에서 check 버튼을 눌렀을 때
	@RequestMapping(value = "openClassCheck.do", method = RequestMethod.GET)
	public String openClassCheck(Model model, PageBean bean){
		// 개설 과목 조회 데이터
		List<OpenClassInfo> openclasslist = openclassinfoservice.searchAll(bean);
		model.addAttribute("openclasslist", openclasslist);
		
		// 등록되어 있는 과목 코드를 보여주기 위한 데이터
		List<ClassInfo> classinfo = classinfoservice.searchAll(bean);
		model.addAttribute("classinfo", classinfo);
		
		model.addAttribute("content", "class/class_open.jsp");
		return "index";
	}
	
	// 과목 개설에서 submit 버튼을 눌렀을 때
	@RequestMapping(value = "openClassRegister.do", method = RequestMethod.GET)
	public String openClassRegister(Model model, OpenClassInfo openclassinfo){
		// 과목 개설을 위한 add
		openclassinfoservice.add(openclassinfo);
		return "redirect:openClassForm.do";
	}
	
	// 과목 조회에서 edit 버튼을 눌렀을 때
	@RequestMapping(value = "openClassupdateForm.do", method = RequestMethod.GET)
	public String openClassupdateForm(Model model, int createcode){
		// 기존 값을 edit 창에 입력해주기 위한 데이터
		OpenClassInfo openclassinfo = openclassinfoservice.search(createcode);
		
		// 등록되어 있는 과목 코드를 보여주기 위한 데이터
		ClassInfo classinfo = classinfoservice.search(openclassinfo.getCcode());
		String classtitle = classinfo.getCtitle();
		
		model.addAttribute("classtitle", classtitle);	
		model.addAttribute("openclassinfo", openclassinfo);
		model.addAttribute("content", "class/class_openUpdateForm.jsp");
		return "index";
	}
	
	// 개설 과목 edit 창에서 update 버튼을 눌렀을 때
	@RequestMapping(value = "openClassupdate.do", method = RequestMethod.GET)
	public String openClassupdate(Model model, OpenClassInfo openclassinfo){
		openclassinfoservice.update(openclassinfo);
		return "redirect:openClassForm.do";
	}
	
	// 개설 과목 delete 버튼을 눌렀을 때
	@RequestMapping(value = "openClassDelete.do", method = RequestMethod.GET)
	public String openClassDelete(Model model, int createcode){
		openclassinfoservice.remove(createcode);
		return "redirect:openClassForm.do";
	}
	
	@RequestMapping(value = "insertGradeForm.do", method = RequestMethod.GET)
	public String insertGradeForm(Model model, HttpSession session) {
		String cid = (String)session.getAttribute("id");
		List<ClassInfo> slist = openclassinfoservice.subject(cid);
		System.out.println(slist);
		model.addAttribute("slist", slist);
		model.addAttribute("content", "member/insertGradeForm.jsp");
		return "index";
	}
}
