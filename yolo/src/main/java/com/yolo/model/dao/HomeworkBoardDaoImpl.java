package com.yolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yolo.model.biz.HomeworkBoardDao;
import com.yolo.model.domain.HomeworkBoard;
import com.yolo.model.domain.HomeworkBoardFile;
import com.yolo.model.domain.HomeworkBoardReply;
import com.yolo.model.domain.PageBean;

@Repository("homeworkBoardDao")
public class HomeworkBoardDaoImpl implements HomeworkBoardDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public void add(HomeworkBoard board) {
		session.insert("homeworkboard.insert", board);
	}

	public void update(HomeworkBoard board) {
		session.update("homeworkboard.update", board);
	}

	public void remove(int no) {
		session.delete("homeworkboard.delete", no);
	}

	public HomeworkBoard search(int no) {
		return session.selectOne("homeworkboard.search", no);
	}

	public List<HomeworkBoard> searchAll(PageBean bean) {
		
		/*
		 * RowBounds(offset, limit)
		 * offset 추출할 row의 시작 위치 (0부터 시작)
		 * limit 추출할 개수
		 */
		
		RowBounds rows = new RowBounds(bean.getStart()-1, bean.getInterval());
		return session.selectList("homeworkboard.searchAll", bean, rows);
	}

	public int getCount(PageBean bean) {
		return session.selectOne("homeworkboard.getCount", bean);
	}

	public int getHomeworkBoardNo() {
		return session.selectOne("homeworkboard.gethomeworkBoardNo");
	}

	public void addFiles(List<HomeworkBoardFile> files, int bno) {
		for(HomeworkBoardFile BoardFile : files) {
			BoardFile.setBno(bno);
			session.insert("homeworkboard.insertFile", BoardFile);
		}
	}

	public void removeFiles(int bno) {
		session.delete("homeworkboard.delete", bno);
	}

	@Override
	public List<HomeworkBoardReply> selectReplys(int no) {
		return session.selectList("homeworkboard.searchReply", no);
		
	}

}
