package com.yolo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.helpers.CyclicBuffer;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.model.biz.ClassInfoService;
import com.yolo.model.biz.SubjectInfoService;
import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.PageBean;
import com.yolo.model.domain.SubjectInfo;
import com.yolo.model.domain.SubjectMlist;

@Controller
public class GradeController {

	@Autowired
	private SubjectInfoService subservice;

	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		System.out.println(e.getMessage());
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage());
		model.addObject("content", "ErrorHandler.jsp");
		return model;
	}

	@RequestMapping(value = "insertGradeForm.do", method = RequestMethod.GET)
	public String register(Model model, HttpSession session, int createcode,
			int cscore) {
		String id = (String) session.getAttribute("id");
		List<SubjectInfo> sub = subservice.searchSubject(id);
		model.addAttribute("slist", sub);
		model.addAttribute("cscore", cscore);

		if (createcode > 0 && createcode <= 100000) {
			List<SubjectMlist> mlist = subservice.searchMlist(createcode);
			model.addAttribute("mlist", mlist);
		}
		model.addAttribute("content", "grade/insertGradeForm.jsp");
		return "index";
	}

}
