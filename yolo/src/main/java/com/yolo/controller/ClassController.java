package com.yolo.controller;

import java.util.List;

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
	
	@RequestMapping(value = "registerForm.do", method = RequestMethod.GET)
	public String registerForm(Model model, ClassInfo classinfo){
		model.addAttribute("content", "class/class_register.jsp");
		return "index";
	}
	
	@RequestMapping(value = "register.do", method = RequestMethod.GET)
	public String register(Model model, ClassInfo classinfo){
		System.out.println("register====" + classinfo);
		classinfoservice.add(classinfo);
		return "redirect:registerform.do";
	}
	
	@RequestMapping(value = "classCheck.do", method = RequestMethod.GET)
	public String classCheck(Model model, PageBean bean){
		List<ClassInfo> classlist = classinfoservice.searchAll(bean);
		System.out.println("classCheck=====" + classlist);
		model.addAttribute("classlist", classlist);
		model.addAttribute("content", "class/class_register.jsp");
		return "index";
	}
	
	@RequestMapping(value = "classUpdateForm.do", method = RequestMethod.GET)
	public String classUpdateForm(Model model, int ccode){
		ClassInfo classinfo = classinfoservice.search(ccode);
		System.out.println("classUpdateForm=====" + classinfo);
		model.addAttribute("classinfo", classinfo);
		model.addAttribute("content", "class/class_updateForm.jsp");
		return "index";
	}
	
	@RequestMapping(value = "classUpdate.do", method = RequestMethod.GET)
	public String classUpdate(Model model, ClassInfo classinfo){
		System.out.println("classUpdate1=====" + classinfo);
		classinfoservice.update(classinfo);
		System.out.println("classUpdate2=====" + classinfo);
		model.addAttribute("content", "class/class_register.jsp");
		return "index";
	}
	
	@RequestMapping(value = "classDelete.do", method = RequestMethod.GET)
	public String classDelete(Model model, int ccode){
		System.out.println("classDelete=====" + ccode);
		classinfoservice.remove(ccode);
		model.addAttribute("content", "class/class_register.jsp");
		return "index";
	}
	
	@RequestMapping(value = "openClassForm.do", method = RequestMethod.GET)
	public String classOpenForm(Model model, ClassInfo classinfo){
		model.addAttribute("content", "class/class_open.jsp");
		return "index";
	}
	
	@RequestMapping(value = "openClassCheck.do", method = RequestMethod.GET)
	public String openClassCheck(Model model, PageBean bean){
		List<OpenClassInfo> openclasslist = openclassinfoservice.searchAll(bean);
		System.out.println("openclassCheck=====" + openclasslist);
		model.addAttribute("openclasslist", openclasslist);
		model.addAttribute("content", "class/class_open.jsp");
		return "index";
	}
	
	@RequestMapping(value = "openClassRegister.do", method = RequestMethod.GET)
	public String openClassRegister(Model model, OpenClassInfo openclassinfo){
		openclassinfoservice.add(openclassinfo);
		return "redirect:openClassForm.do";
	}
	
}
