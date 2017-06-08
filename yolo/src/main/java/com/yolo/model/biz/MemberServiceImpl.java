package com.yolo.model.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yolo.model.dao.MemberDaoImpl;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.UpdateException;
import com.yolo.model.domain.PageBean;
import com.yolo.util.DBUtil;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;
	
	public Member search(String id) {
		Member member = null;
		try {
			member = dao.search( id);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		} 
		if(member == null){
			throw new UpdateException("아이디에 해당하는 회원을 찾을 수 없습니다.");
		}else{
			return member;
		}
		
	}

	public List<Member> searchAll(PageBean bean) {
		List<Member> members= null;
		try {
			int count = dao.getCount(bean);
			return dao.searchAll(bean);
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}

	public boolean login(String id, String password) {
		System.out.println("id : " + id + "  password : " + password +"=====================@serviceimpl");
		Member member = null;
		try {
			member = dao.search( id);
			System.out.println(member);
		} catch(Exception  s){
			s.printStackTrace();
			throw new UpdateException("DB 서버 오류");
		}
		if(member == null){
			throw new UpdateException("해당하는 아이디는 존재하지 않습니다.");
		}
		if(password ==null || !password.equals(member.getPassword())){
			throw new UpdateException("비밀번호가 맞지 않습니다.");
		}
		if(member.getWithdraw().equals("Y")){
			throw new UpdateException("탈퇴한 회원 아이디입니다.");
		}
		return true;
	}

	public void withdraw(String id) {
		Member member = null;
		try {
			member = dao.search(id);
			if(member == null){
				throw new UpdateException("아이디에 해당하는 회원이 없어 탈퇴 처리할 수 없습니다.");
			}else{
				dao.update(id);
			}
		} catch(Exception  s){
			s.printStackTrace();
			throw new UpdateException("DB 서버 오류");
		}
	}


	public void update(Member member) {
		try {
			Member find= dao.search(member.getId());
			System.out.println(find);
			if(find == null){
				throw new UpdateException("아이디에 해당하는 회원이 없어 수정할 수 없습니다.");
			}else{
				dao.update(member);
				
			}
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류");
		}
	}
	
	public void add(Member member) {
		try {
			Member find= dao.search(member.getId());
			if(find != null){
				
				throw new UpdateException("이미 등록된 아이디 입니다.");
			}else{
				dao.add(member);
				System.out.println(member +" =====serviceimpl");
			}
		} catch(Exception  s){
			throw new UpdateException("DB 서버 오류 @ServiceImpl" + s.getMessage());
		} 
	}
	
}
