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

import com.yolo.model.biz.QnaBoardService;
import com.yolo.model.biz.NoticeBoardService;
import com.yolo.model.domain.HomeworkBoard;
import com.yolo.model.domain.QnaBoard;
import com.yolo.model.domain.NoticeBoard;
import com.yolo.model.domain.PageBean;
import com.yolo.model.domain.QnaBoardReply;
import com.yolo.util.LoginCheck;

@Controller
public class QnaBoardController {
	
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
	private QnaBoardService  boardService;
	
	@RequestMapping(value="listQnaBoard.do", method=RequestMethod.GET)
	public String listBoard(PageBean bean, Model model, HttpSession session ){
		
		if (LoginCheck.check(model, session, "insertBoardForm.do")) {
			List<QnaBoard> list = boardService.searchAll(bean);
			for(QnaBoard board : list) {
				board.setReplyCnt(boardService.getReplyCount(board.getNo()));
			}
			model.addAttribute("list", list);
			model.addAttribute("content", "qna/listBoard.jsp");
		} else {
			model.addAttribute("content", "member/login.jsp");
		}
		
		
		return "index";
	}
	
	
	
	@RequestMapping(value="searchQnaBoard.do", method=RequestMethod.GET)
	public String searchBoard(int no, Model model ){
		System.out.println(boardService.search(no));
		model.addAttribute("board", boardService.search(no));
		model.addAttribute("content", "qna/searchBoard.jsp");
		return "index";
	}
	
	@RequestMapping(value="insertQnaBoard.do", method=RequestMethod.POST)
	public String insertBoard(QnaBoard board, HttpServletRequest request){
		
		String dir = request.getRealPath("upload/");
		boardService.add(board, dir);
		return "redirect:listQnaBoard.do";
	}
	
	@RequestMapping(value="insertQnaBoardReply.do", method=RequestMethod.POST)
	public String insertReply(String returnurl, int no, QnaBoardReply reply) {
		boardService.addReply(reply, no);
		return"redirect:searchQnaBoard.do?"+returnurl;
	}
	
	@RequestMapping(value="insertQnaBoardForm.do", method=RequestMethod.GET)
	public String insertBoardForm(Model model, HttpSession session) {
		if(LoginCheck.check(model, session, "insertQnaBoardForm.do")) {
			model.addAttribute("content", "qna/insertBoard.jsp");
		} else {
			model.addAttribute("content", "member/login.jsp");
		}
		return "index";
	}
	
	@RequestMapping(value="updateQnaBoard.do", method=RequestMethod.GET)
	public String updateNoticeBoard(int no, String contents, String title, String returnurl, Model model) {
		QnaBoard board = boardService.search(no);
		board.setContents(contents);
		board.setTitle(title);
		boardService.update(board);
		
		return "redirect:searchQnaBoard.do?"+returnurl;
	}
	
	@RequestMapping(value="deleteQnaBoard.do", method=RequestMethod.GET)
	public String deleteNoticeBoard(int no) {
		System.out.println(no+"======================");
		boardService.remove(no);
		return "index";
	}
}




