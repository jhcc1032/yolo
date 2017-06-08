package com.yolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yolo.model.biz.QnaBoardDao;
import com.yolo.model.domain.PageBean;
import com.yolo.model.domain.QnaBoard;
import com.yolo.model.domain.QnaBoardReply;

@Repository("qnaBoardDao")
public class QnaBoardDaoImpl implements QnaBoardDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public void add(QnaBoard board) {
		session.insert("qnaboard.insert", board);
	}

	public void update(QnaBoard board) {
		session.update("qnaboard.update", board);
	}

	public void remove(int no) {
		session.delete("qnaboard.delete", no);
	}

	public QnaBoard search(int no) {
		return session.selectOne("qnaboard.search", no);
	}

	public List<QnaBoard> searchAll(PageBean bean) {
		
		/*
		 * RowBounds(offset, limit)
		 * offset 추출할 row의 시작 위치 (0부터 시작)
		 * limit 추출할 개수
		 */
		
		RowBounds rows = new RowBounds(bean.getStart()-1, bean.getInterval());
		return session.selectList("qnaboard.searchAll", bean, rows);
	}

	public int getCount(PageBean bean) {
		return session.selectOne("qnaboard.getCount", bean);
	}

	public int getQnaBoardNo() {
		return session.selectOne("qnaboard.getqnaBoardNo");
	}

	public void addFiles(List<QnaBoardReply> replys, int bno) {
		for(QnaBoardReply reply : replys) {
			reply.setBno(bno);
			session.insert("qnaboard.insertFile", reply);
		}
	}

	public void removeFiles(int bno) {
		session.delete("qnaboard.delete", bno);
	}

}
