package com.yolo.model.biz;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yolo.model.domain.PageBean;
import com.yolo.model.domain.QnaBoard;
import com.yolo.model.domain.QnaBoardReply;
import com.yolo.model.domain.UpdateException;
import com.yolo.util.PageUtility;

@Service("qnaBoardService")
public class QnaBoardServiceImpl implements QnaBoardService {
	@Autowired
	@Qualifier("qnaBoardDao")
	private QnaBoardDao dao;

	@Override
	public void add(QnaBoard board, String dir) {
		try {
			int bno = dao.getQnaBoardNo();
			board.setNo(bno);

			dao.add(board);

		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 작성 중 오류 발생");
		}
	}

	@Override
	public void update(QnaBoard board) {
		try {
			dao.update(board);

		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 수정 중 오류 발생");
		}
	}

	@Override
	public void remove(int no) {
		try {
			dao.removeFiles(no);
			dao.remove(no);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 삭제 중 오류 발생");
		}
	}

	@Override
	public QnaBoard search(int no) {
		try {
			QnaBoard board = dao.search(no);
			List<QnaBoardReply> replys = dao.searchReply(no);
			board.setReplys(replys);
			
			return board;
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 검색 중 오류 발생");
		}
	}

	@Override
	public List<QnaBoard> searchAll(PageBean bean) {
		try {
			int total = dao.getCount(bean);

			PageUtility bar = new PageUtility(bean.getInterval(), total,
					bean.getPageNo(), "images/");
			System.out.println(bar);
			bean.setPagelink(bar.getPageBar());
			System.out.println(bar.getPageBar());
			return dao.searchAll(bean);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 검색 중 오류 발생");
		}
	}

	@Override
	public void addReply(QnaBoardReply reply, int no) {
		reply.setBno(no);
		dao.addReply(reply);
	}

}
