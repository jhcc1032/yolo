package com.yolo.model.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yolo.model.dao.MemberDaoImpl;
import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.ClassTotalInfo;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.CreateClassInfo;
import com.yolo.model.domain.UpdateException;
import com.yolo.model.domain.PageBean;
import com.yolo.util.DBUtil;

@Service("createClassInfoService")
public class CreateClassInfoServiceImpl implements CreateClassInfoService {
	
	@Autowired
	@Qualifier("createClassInfoDao")
	private CreateClassInfoDao dao;
	
	public CreateClassInfo search(int createcode) {
		CreateClassInfo createclassinfo = null;
		try {
			createclassinfo = dao.search(createcode);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		} 
		if(createclassinfo == null){
			throw new UpdateException("코드에 해당하는 과목을 찾을 수 없습니다.");
		}else{
			return createclassinfo;
		}	
	}

	public List<CreateClassInfo> searchAll(PageBean bean) {
		try {
			int count = dao.getCount(bean);	
			return dao.searchAll(bean);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}
	
	
	@Override
	public List<ClassInfo> subject(String cid) {
		try {
			return dao.subject(cid);
		} catch (Exception s) {
			s.printStackTrace();
			throw new UpdateException("DB 서버 오류");
		}
		
	}

	public void update(CreateClassInfo createclassinfo) {
		try {
			CreateClassInfo find= dao.search(createclassinfo.getCreatecode());
			if(find == null){
				throw new UpdateException("코드에 해당하는 과목이 없어 수정할 수 없습니다.");
			}else{
				dao.update(createclassinfo);
			}
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}
	
	public void add(CreateClassInfo createclassinfo) {
		try {
			dao.add(createclassinfo);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류" + s.getMessage());
		} 
	}
	
	public void remove(int createcode) {
		try {
			dao.remove(createcode);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("과목 삭제 중 오류 발생");
		} 
	}
	
	//추가
	public CreateClassInfo searchByCcode(int ccode) {
		CreateClassInfo classinfo = null;
		try {
			classinfo = dao.searchByCcode(ccode);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		} 
		if(classinfo == null){
			return null;
			/*throw new UpdateException("ccode에 해당하는 개설과목을 찾을 수 없습니다.");*/			
		}else{
			return classinfo;
		}
		
	}

	@Override
	public ClassTotalInfo searchClassInfo(int createcode) {
		try {
			return dao.searchClassInfo(createcode);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}
	
	@Override
	public List<ClassTotalInfo> searchClassInfo(PageBean bean) {
		try {
			return dao.searchClassInfo(bean);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}
}
