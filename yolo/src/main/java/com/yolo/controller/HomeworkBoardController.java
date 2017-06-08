package com.yolo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yolo.model.biz.HomeworkBoardService;
import com.yolo.model.biz.NoticeBoardService;
import com.yolo.model.domain.HomeworkBoard;
import com.yolo.model.domain.NoticeBoard;
import com.yolo.model.domain.PageBean;
import com.yolo.util.LoginCheck;

@Controller
public class HomeworkBoardController {
	
	/**
	 * error 처리
	 * 
	 * @ExceptionHandler  Controller에서 오류가 발생하면 처리하는 기능
	 */
	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView model = new ModelAndView("index");
		model.addObject("msg", e.getMessage());
		model.addObject("content", "ErrorHandler.jsp");
		return model;
	}
	
	@Autowired
	private HomeworkBoardService  boardService;
	
	@RequestMapping(value="listHomeworkBoard.do", method=RequestMethod.GET)
	public String listBoard(PageBean bean, Model model ){
		List<HomeworkBoard> list = boardService.searchAll(bean);
		model.addAttribute("list", list);
		model.addAttribute("content", "homework/listBoard.jsp");
		return "index";
	}
	@RequestMapping(value="searchHomeworkBoard.do", method=RequestMethod.GET)
	public String searchBoard(int no, Model model ){
		System.out.println(boardService.search(no));
		model.addAttribute("board", boardService.search(no));
		model.addAttribute("content", "homework/searchBoard.jsp");
		return "index";
	}
	
	@RequestMapping(value="insertHomeworkBoard.do", method=RequestMethod.POST)
	public String insertBoard(HomeworkBoard board, HttpServletRequest request){
		
		String dir = request.getRealPath("upload/");
		boardService.add(board, dir);
		return "redirect:listHomeworkBoard.do";
	}
	
	@RequestMapping(value="insertHomeworkBoardForm.do", method=RequestMethod.GET)
	public String insertBoardForm(Model model, HttpSession session) {
		if(LoginCheck.check(model, session, "insertHomeworkBoardForm.do")) {
			model.addAttribute("content", "homework/insertBoard.jsp");
		} else {
			model.addAttribute("content", "member/login.jsp");
		}
		return "index";
	}
	
	@RequestMapping(value="updateHomeworkBoard.do", method=RequestMethod.GET)
	public String updateNoticeBoard(int no, String content, String returnurl, Model model) {
		HomeworkBoard board = boardService.search(no);
		board.setContents(content);
		boardService.update(board);
		
		return "redirect:searchHomeworkBoard.do?"+returnurl;
	}
	
	@RequestMapping(value="deleteHomeworkBoard.do", method=RequestMethod.GET)
	public String deleteNoticeBoard(int no) {
		System.out.println(no+"======================");
		boardService.remove(no);
		return "index";
	}
}




