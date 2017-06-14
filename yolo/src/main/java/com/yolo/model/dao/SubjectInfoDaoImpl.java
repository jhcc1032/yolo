package com.yolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.yolo.model.biz.ClassInfoDao;
import com.yolo.model.biz.MemberDao;
import com.yolo.model.biz.SubjectInfoDao;
import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.Course;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.PageBean;
import com.yolo.model.domain.SubRank;
import com.yolo.model.domain.SubjectInfo;
import com.yolo.model.domain.SubjectMlist;

@Repository("subjectInfoDao")
public class SubjectInfoDaoImpl implements SubjectInfoDao{
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public List<SubjectInfo> searchSubject(String id) {
		// RowBounds rows = new RowBounds(bean.getStart()-1, bean.getInterval());
		return session.selectList("subjectinfo.subjectlist", id);
	}


	@Override
	public List<SubjectMlist> searchMlist(int createcode) {
		// TODO Auto-generated method stub
		return session.selectList("subjectinfo.subject_mlist", createcode);
	}


	@Override
	public void updateScore(Course course) {
		session.update("subjectinfo.updateScore", course);
	}


	@Override
	public List<SubRank> rank(int createcode) {
		
		return session.selectList("subjectinfo.rank", createcode);
	}


	@Override
	public List<SubjectInfo> subjectList() {
		
		return session.selectList("subjectinfo.allSubject");
	}

	
}
