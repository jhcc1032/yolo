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
import com.yolo.model.domain.OpenClassInfo;
import com.yolo.model.domain.UpdateException;
import com.yolo.model.domain.PageBean;
import com.yolo.util.DBUtil;

@Service("openClassInfoService")
public class OpenClassInfoServiceImpl implements OpenClassInfoService {
	
	@Autowired
	@Qualifier("openClassInfoDao")
	private OpenClassInfoDao dao;
	
	public OpenClassInfo search(int ccode) {
		OpenClassInfo classinfo = null;
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

	public List<OpenClassInfo> searchAll(PageBean bean) {
		try {
			int count = dao.getCount(bean);	
			return dao.searchAll(bean);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}
	
	public void update(OpenClassInfo openclassinfo) {
		try {
			System.out.println("classUpdate3=====" + openclassinfo);
			OpenClassInfo find= dao.search(openclassinfo.getCreatecode());
			System.out.println("classUpdate4=====" + openclassinfo);
			if(find == null){
				throw new UpdateException("코드에 해당하는 과목이 없어 수정할 수 없습니다.");
			}else{
				dao.update(openclassinfo);
			}
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}
	
	public void add(OpenClassInfo openclassinfo) {
		try {
			System.out.println("service ========" + openclassinfo);
			OpenClassInfo find= dao.search(openclassinfo.getCreatecode());
			System.out.println("service1 ========" + find);
			System.out.println(find);
			if(find != null){
				throw new UpdateException("이미 등록된 과목코드 입니다.");
			}else{
				dao.add(openclassinfo);
			}
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
}
