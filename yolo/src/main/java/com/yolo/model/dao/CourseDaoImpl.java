package com.yolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yolo.model.biz.CourseDao;
import com.yolo.model.domain.Course;
import com.yolo.model.domain.CourseScore;
import com.yolo.model.domain.PageBean;
@Repository("courseDao")
public class CourseDaoImpl implements CourseDao {
	@Autowired
	private SqlSessionTemplate session;
	@Override
	public Course search(int coursecode) {
		return session.selectOne("course.search", coursecode);
	}

	@Override
	public List<Course> searchAll(PageBean bean) {
		/*RowBounds rows = new RowBounds(bean.getStart()-1, bean.getInterval());*/
		return session.selectList("course.searchAll", bean);
	}

	@Override
	public int getCount(PageBean bean) {
		return session.selectOne("course.getCount", bean);
	}

	@Override
	public void add(Course course) {
		session.insert("course.insert", course);
	}

	@Override
	public void update(Course course) {
		session.update("course.update", course);
	}

	@Override
	public void remove(int coursecode) {
		session.delete("course.delete", coursecode);
	}
	
	public List<CourseScore> searchScoreInfo(String id) {
		return session.selectList("course.searchScoreInfo", id);
	}
	
	//추가
	public void searchByCreatecode(int createcode) {
		session.selectOne("course.searchByCreatecode", createcode);
	}

	@Override
	/*
	 * 강사 아이디로 강의중인 클라스 추출
	 * */
	public List<String> searchMyClass(String cid) {
		return session.selectList("course.searchMyClass", cid);
	}

	@Override
	/*
	 * 수강중인 학생 이름 추출
	 * */
	public List<String> searchMyStudent(String ctitle) {
		return session.selectList("course.searchMyStudent", ctitle);
	}

	@Override
	public void insertAbsence(String aname) {
		session.insert("absence.insertAbsence", aname);	
	}

	@Override
	public void insertLateness(String aname) {
		session.insert("absence.insertLateness", aname);	
	}

	@Override
	public List<String> searchAname(String date) {
		return session.selectList("absence.searchAname", date);	
	}
}
