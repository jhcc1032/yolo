package com.yolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.yolo.model.biz.ClassInfoDao;
import com.yolo.model.biz.MemberDao;
import com.yolo.model.biz.OpenClassInfoDao;
import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.OpenClassInfo;
import com.yolo.model.domain.PageBean;

@Repository("openClassInfoDao")
public class OpenClassInfoDaoImpl implements OpenClassInfoDao{
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public OpenClassInfo search(int createcode) {
		return session.selectOne("openclassinfo.search", createcode);
	}

	@Override
	public List<OpenClassInfo> searchAll(PageBean bean) {
		// RowBounds rows = new RowBounds(bean.getStart()-1, bean.getInterval());
		return session.selectList("openclassinfo.searchAll");
	}

	@Override
	public int getCount(PageBean bean) {
		return session.selectOne("openclassinfo.getCount", bean);
	}

	@Override
	public void add(OpenClassInfo openclassinfo) {
		session.insert("openclassinfo.insert", openclassinfo);
	}

	@Override
	public void update(OpenClassInfo openclassinfo) {
		session.update("openclassinfo.update", openclassinfo);
	}

	@Override
	public void remove(int createcode) {
		session.delete("openclassinfo.delete", createcode);
	}
	
	//추가
	public OpenClassInfo searchByCcode(int ccode) {
		return session.selectOne("openclassinfo.searchbyccode", ccode);
	}

	@Override
	public List<ClassInfo> subject(String cid) {
		return session.selectList("openclassinfo.subject", cid);
	}

	
}
