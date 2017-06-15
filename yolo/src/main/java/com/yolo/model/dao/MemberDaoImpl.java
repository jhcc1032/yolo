package com.yolo.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.yolo.model.biz.MemberDao;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.PageBean;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public Member search(String id) {
		return session.selectOne("member.search", id);
	}
	
	@Override
	public String searchIdByName(String name) {
		return session.selectOne("member.searchIdByName", name);
	}

	@Override
	public List<Member> searchAll(PageBean bean) {
		RowBounds rows = new RowBounds(bean.getStart()-1, bean.getInterval());
		return session.selectList("member.searchAll", bean);
	}

	@Override
	public int getCount(PageBean bean) {
		return session.selectOne("member.getCount", bean);
	}

	@Override
	public void add(Member member) {
		session.insert("member.insert", member);
		System.out.println(member +" =========daoimpl");
	}

	@Override
	public void update(String id) {
		session.update("member.delete", id);
		
	}

	@Override
	public void update(Member member) {
		session.update("member.update", member);
	}

}
