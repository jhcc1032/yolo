package com.yolo.model.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.yolo.model.domain.Course;
import com.yolo.model.domain.PageBean;

public interface CourseDao {
	public Course search(int coursecode);
	public List<Course> searchAll(PageBean bean) ;
	public int getCount(PageBean bean);
	public void add(Course course);
	public void update(Course course) ;
	public void remove(int coursecode)  ;
}
