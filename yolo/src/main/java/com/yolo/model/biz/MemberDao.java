package com.yolo.model.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.yolo.model.domain.Member;
import com.yolo.model.domain.PageBean;

public interface MemberDao {
	public Member search(String id)  ;
	public List<Member> searchAll(PageBean bean) ;
	public int getCount(PageBean bean);
	public void add(Member member);
	/** withdraw를 Y로 update해야 한다.*/
	public void update(String id)  ;
	public void update(Member member) ;
	
	// 강사이름으로 ID 찾기
	public String searchIdByName(String name);
}
