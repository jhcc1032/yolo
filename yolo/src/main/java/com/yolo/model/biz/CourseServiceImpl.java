package com.yolo.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yolo.model.domain.Course;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.PageBean;
import com.yolo.model.domain.UpdateException;
@Service("courseService")
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	@Qualifier("courseDao")
	private CourseDao dao;
	
	@Override
	public Course search(int coursecode) {
		Course course = null;
		try {
			course = dao.search(coursecode);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		} 
		if(course == null){
			throw new UpdateException("강의코드에 해당하는 강의를 찾을 수 없습니다.");
		}else{
			return course;
		}
	}

	@Override
	public List<Course> searchAll(PageBean bean) {
		List<Course> courses= null;
		try {
			int count = dao.getCount(bean);
			return dao.searchAll(bean);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}

	@Override
	public void add(Course course) {
		try {
			Course find= dao.search(course.getCoursecode());
			if(find != null){
				
				throw new UpdateException("이미 등록된 강의 입니다.");
			}else{
				dao.add(course);
			}
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류 @ServiceImpl" + s.getMessage());
		} 
	}

	@Override
	public void update(Course course) {
		try {
			Course find= dao.search(course.getCoursecode());
			
			if(find == null){
				throw new UpdateException("강의코드에 해당하는 강의가 없어 수정할 수 없습니다.");
			}else{
				dao.update(course);				
			}
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}

	@Override
	public void remove(int coursecode) {
		Course course = null;
		try {
			course = dao.search(coursecode);
			if(course == null){
				throw new UpdateException("강의코드에 해당하는 강의가 없어 탈퇴 처리할 수 없습니다.");
			}else{
				dao.remove(coursecode);
			}
		} catch(Exception  s){
			s.printStackTrace();
			throw new UpdateException("DB 서버 오류");
		}

	}

}
