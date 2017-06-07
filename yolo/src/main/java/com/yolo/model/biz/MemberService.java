package com.yolo.model.biz;

import java.util.List;

import com.yolo.model.domain.Member;
import com.yolo.model.domain.PageBean;

public interface MemberService {

	public Member search(String id);
	public List<Member> searchAll(PageBean bean);
	public boolean login(String id, String password);
	public void withdraw(String id);
	public void update(Member member);
	public void add(Member member);

}