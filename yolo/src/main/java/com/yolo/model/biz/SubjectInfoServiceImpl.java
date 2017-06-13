package com.yolo.model.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yolo.model.dao.MemberDaoImpl;
import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.SubjectInfo;
import com.yolo.model.domain.SubjectMlist;
import com.yolo.model.domain.UpdateException;
import com.yolo.model.domain.PageBean;
import com.yolo.util.DBUtil;

@Service("subjectInfoService")
public class SubjectInfoServiceImpl implements SubjectInfoService {
	@Autowired
	@Qualifier("subjectInfoDao")
	private SubjectInfoDao dao;
	
	

	public List<SubjectInfo> searchSubject(String id) {
		try {
			return dao.searchSubject(id);
		} catch(Exception  s){
			s.printStackTrace();
			throw new UpdateException("DB 서버 오류");
		}
	}



	@Override
	public List<SubjectMlist> searchMlist(int createcode) {
		try {
			return dao.searchMlist(createcode);
		} catch(Exception  s){
			s.printStackTrace();
			throw new UpdateException("DB 서버 오류");
		}
	}
	
	
}
