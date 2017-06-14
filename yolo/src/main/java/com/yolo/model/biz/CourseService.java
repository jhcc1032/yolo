package com.yolo.model.biz;

import java.util.List;

import com.yolo.model.domain.Course;
import com.yolo.model.domain.CourseScore;
import com.yolo.model.domain.PageBean;

public interface CourseService {
	public Course search(int coursecode);
	public List<Course> searchAll(PageBean bean);
	public void add(Course course);
	public void update(Course course);
	public void remove(int coursecode);
	public List<CourseScore> searchScoreInfo(String id);
	
	// 강의 중인 수업 추출
	public List<String> searchMyClass(String cid);
	// 수업을 듣고 있는 학생 추출
	public List<String> searchMyStudent(String ctitle);
	
	// 결석자 입력
	public void insertAbsence(String aname);
	// 지각자 입력
	public void insertLateness(String aname);
	// 입력된 날짜에 결석, 지각, 조퇴 한 사람 추출
	public List<String> searchAname(String date);
}