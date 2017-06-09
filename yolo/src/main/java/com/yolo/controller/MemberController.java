package com.yolo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.model.biz.MemberService;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.PageBean;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		System.out.println(e.getMessage());
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage());
		model.addObject("content", "ErrorHandler.jsp");
		return model;
	}

	@RequestMapping(value = "allMemberList.do", method = RequestMethod.GET)
	public String listBoard(PageBean bean, Model model, String key, String word) {
		bean.setKey(key);
		bean.setWord(word);
		System.out.println(bean);
		List<Member> list = memberService.searchAll(bean);
		System.out.println(bean);
		model.addAttribute("list", list);
		model.addAttribute("content", "member/memberlist.jsp");
		return "index";
	}

	@RequestMapping(value = "insertMemberForm.do", method = RequestMethod.GET)
	public String insertMemberForm(Model model) {
		model.addAttribute("content", "member/insertMember.jsp");
		return "index";
	}

	@RequestMapping(value = "insertMember.do", method = RequestMethod.POST)
	public String insertMember(Member member, Model model) {
		memberService.add(member);
		model.addAttribute("content", "member/login.jsp");
		return "index";
	}

	// @RequestMapping(value = "pwcheck.do", method = RequestMethod.GET)
	// public String pwcheck(Model model, String password, HttpSession session){
	//
	// String id = (String)session.getAttribute("id");
	// Member m = memberService.search(id);
	//
	// if(m.getPassword().equals(password)){
	// model.addAttribute("member" ,m);
	// model.addAttribute("content", "member/updateMember.jsp");
	// } else{
	//
	// }
	//
	// return "index";
	// }

	@RequestMapping(value = "pwcheck.do", method = RequestMethod.GET)
	public String pwcheck(Model model) {

		model.addAttribute("content", "member/pwcheck.jsp");

		return "index";
	}

	@RequestMapping(value = "memberUpdateForm.do", method = RequestMethod.GET)
	public String updateMemberForm(Model model, HttpSession session,
			String password) {
		String id = session.getAttribute("id").toString();
		Member m = memberService.search(id);
		
		if (m.getPassword().equals(password)) {
			model.addAttribute("member", m);
			model.addAttribute("content", "member/updateMember.jsp");
		} else {

		}
		return "index";
	}

	@RequestMapping(value = "update.do", method = RequestMethod.GET)
	public String update(Model model, String id) {
		Member m = memberService.search(id);
		model.addAttribute("member", m);
		model.addAttribute("content", "member/updateMember.jsp");
		return "index";
	}

	@RequestMapping(value = "updateMember.do", method = RequestMethod.POST)
	public String updateMember(Member member) {

		memberService.update(member);
		return "index";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String insertMember(Model model, HttpSession session, String id,
			String password) {
		if (memberService.login(id, password)) {
			System.out.println("로그인 성공");
			Member member = memberService.search(id);
			String role = "";
			if (member.getAuth().equals("1")) {
				role = "교육생";
			} else if (member.getAuth().equals("2")) {
				role = "강사";
			} else if (member.getAuth().equals("3")) {
				role = "관리자";
			}
			session.setAttribute("id", id);
			session.setAttribute("role", role);
		} else {
			System.out.println("로그인 실패");
		}
		return "index";
	}

	@RequestMapping(value = "delete.do", method = RequestMethod.GET)
	public String delete(HttpSession session) {
		String id = (String) session.getAttribute("id");
		memberService.withdraw(id);
		session.removeAttribute("id");
		return "index";
	}

	@RequestMapping(value = "kick.do", method = RequestMethod.GET)
	public String kick(String id) {
		System.out.println(id);
		memberService.withdraw(id);
		return "redirect:allMemberList.do";
	}

	@RequestMapping(value = "loginform.do", method = RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute("content", "member/login.jsp");
		return "index";
	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String loginout(HttpSession session) {
		session.removeAttribute("id");
		return "index";
	}

	@RequestMapping(value = "myPage.do", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session) {
		String id = session.getAttribute("id").toString();
		model.addAttribute("member", memberService.search(id));
		model.addAttribute("content", "member/memberUpdateForm.jsp");

		return "index";
	}
}
