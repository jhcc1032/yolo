package com.yolo.util;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public class LoginCheck {
	public static boolean check(Model model, HttpSession session, String url) {
		String id = (String)session.getAttribute("id");
		if(id == null) {
			session.setAttribute("referer", url);
			System.out.println(url);
			model.addAttribute("content", "member/login.jsp");
			return false;
		} else {
			return true;
		}
	}
}
