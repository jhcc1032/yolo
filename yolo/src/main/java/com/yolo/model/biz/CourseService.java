package com.yolo.model.biz;

import java.util.List;

import com.yolo.model.domain.Course;
import com.yolo.model.domain.PageBean;

public interface CourseService {
	public Course search(int coursecode);
	public List<Course> searchAll(PageBean bean);
	public void add(Course course);
	public void update(Course course);
	public void remove(int coursecode);
}