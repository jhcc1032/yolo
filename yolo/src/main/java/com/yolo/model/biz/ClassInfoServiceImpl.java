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
import com.yolo.model.domain.UpdateException;
import com.yolo.model.domain.PageBean;
import com.yolo.util.DBUtil;

@Service("classInfoService")
public class ClassInfoServiceImpl implements ClassInfoService {
	@Autowired
	@Qualifier("classInfoDao")
	private ClassInfoDao dao;
	
	public ClassInfo search(int ccode) {
		ClassInfo classinfo = null;
		try {
			classinfo = dao.search(ccode);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		} 
		if(classinfo == null){
			throw new UpdateException("코드에 해당하는 과목을 찾을 수 없습니다.");
		}else{
			return classinfo;
		}
		
	}

	public List<ClassInfo> searchAll(PageBean bean) {
		try {
			int count = dao.getCount(bean);
			return dao.searchAll(bean);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}
	
	public void update(ClassInfo classinfo) {
		try {
			System.out.println("classUpdate3=====" + classinfo);
			ClassInfo find= dao.search(classinfo.getCcode());
			System.out.println("classUpdate4=====" + classinfo);
			if(find == null){
				throw new UpdateException("코드에 해당하는 과목이 없어 수정할 수 없습니다.");
			}else{
				dao.update(classinfo);
			}
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}
	
	public void add(ClassInfo classinfo) {
		try {
			System.out.println("service ========" + classinfo);
			dao.add(classinfo);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류" + s.getMessage());
		} 
	}
	
	public void remove(int ccode) {
		try {
			dao.remove(ccode);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("과목 삭제 중 오류 발생");
		} 
	}
}
