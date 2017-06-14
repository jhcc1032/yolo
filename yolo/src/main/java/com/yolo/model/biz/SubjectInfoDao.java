package com.yolo.model.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.Course;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.PageBean;
import com.yolo.model.domain.SubRank;
import com.yolo.model.domain.SubjectInfo;
import com.yolo.model.domain.SubjectMlist;

public interface SubjectInfoDao {
	
	public List<SubjectInfo> searchSubject(String id) ;
	public List<SubjectMlist> searchMlist(int createcode) ;
	public void updateScore(Course course);
	public List<SubRank> rank(int createcode);
	public List<SubjectInfo> subjectList();

}
