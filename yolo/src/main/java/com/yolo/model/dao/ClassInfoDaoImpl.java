package com.yolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.yolo.model.biz.ClassInfoDao;
import com.yolo.model.biz.MemberDao;
import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.ClassTotalInfo;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.PageBean;

@Repository("classInfoDao")
public class ClassInfoDaoImpl implements ClassInfoDao{
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public ClassInfo search(int ccode) {
		return session.selectOne("classinfo.search", ccode);
	}

	@Override
	public List<ClassInfo> searchAll(PageBean bean) {
		// RowBounds rows = new RowBounds(bean.getStart()-1, bean.getInterval());
		return session.selectList("classinfo.searchAll");
	}

	@Override
	public int getCount(PageBean bean) {
		return session.selectOne("classinfo.getCount", bean);
	}

	@Override
	public void add(ClassInfo classinfo) {
		session.insert("classinfo.insert", classinfo);
	}

	@Override
	public void update(ClassInfo classinfo) {
		session.update("classinfo.update", classinfo);
	}

	@Override
	public void remove(int ccode) {
		session.delete("classinfo.delete", ccode);
	}
}
