package com.yolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.yolo.model.biz.ClassInfoDao;
import com.yolo.model.biz.MemberDao;
import com.yolo.model.biz.CreateClassInfoDao;
import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.ClassTotalInfo;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.CreateClassInfo;
import com.yolo.model.domain.PageBean;

@Repository("createClassInfoDao")
public class CreateClassInfoDaoImpl implements CreateClassInfoDao{
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public CreateClassInfo search(int createcode) {
		return session.selectOne("createclassinfo.search", createcode);
	}

	@Override
	public List<CreateClassInfo> searchAll(PageBean bean) {
		return session.selectList("createclassinfo.searchAll");
	}

	@Override
	public int getCount(PageBean bean) {
		return session.selectOne("createclassinfo.getCount", bean);
	}

	@Override
	public void add(CreateClassInfo createclassinfo) {
		session.insert("createclassinfo.insert", createclassinfo);
	}

	@Override
	public void update(CreateClassInfo createclassinfo) {
		session.update("createclassinfo.update", createclassinfo);
	}

	@Override
	public void remove(int createcode) {
		session.delete("createclassinfo.delete", createcode);
	}
	
	//추가
	public CreateClassInfo searchByCcode(int ccode) {
		return session.selectOne("createclassinfo.searchbyccode", ccode);
	}

	@Override
	public List<ClassInfo> subject(String cid) {
		return session.selectList("createclassinfo.subject", cid);
	}

	@Override
	public ClassTotalInfo searchClassInfo(int createcode) {
		return session.selectOne("createclassinfo.searchclass", createcode);
	}	
	
	@Override
	public List<ClassTotalInfo> searchClassInfo(PageBean bean) {
		return session.selectList("createclassinfo.searchclassAll", bean);
	}


}
