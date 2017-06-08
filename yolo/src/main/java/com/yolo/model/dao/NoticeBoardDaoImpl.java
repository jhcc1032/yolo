package com.yolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yolo.model.biz.NoticeBoardDao;
import com.yolo.model.domain.NoticeBoard;
import com.yolo.model.domain.NoticeBoardFile;
import com.yolo.model.domain.PageBean;

@Repository("noticeBoardDao")
public class NoticeBoardDaoImpl implements NoticeBoardDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public void add(NoticeBoard board) {
		session.insert("noticeboard.insert", board);
	}

	public void update(NoticeBoard board) {
		session.update("noticeboard.update", board);
	}

	public void remove(int no) {
		session.delete("noticeboard.delete", no);
	}

	public NoticeBoard search(int no) {
		return session.selectOne("noticeboard.search", no);
	}

	public List<NoticeBoard> searchAll(PageBean bean) {
		
		/*
		 * RowBounds(offset, limit)
		 * offset 추출할 row의 시작 위치 (0부터 시작)
		 * limit 추출할 개수
		 */
		
		RowBounds rows = new RowBounds(bean.getStart()-1, bean.getInterval());
		return session.selectList("noticeboard.searchAll", bean, rows);
	}

	public int getCount(PageBean bean) {
		return session.selectOne("noticeboard.getCount", bean);
	}

	public int getNoticeBoardNo() {
		return session.selectOne("noticeboard.getNoticeBoardNo");
	}

	public void addFiles(List<NoticeBoardFile> files, int bno) {
		for(NoticeBoardFile BoardFile : files) {
			BoardFile.setBno(bno);
			session.insert("noticeboard.insertFile", BoardFile);
		}
	}

	public void removeFiles(int bno) {
		session.delete("noticeboard.delete", bno);
	}


}
