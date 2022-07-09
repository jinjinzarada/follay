package kh.spring.follay.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.follay.member.domain.Member;
import kh.spring.follay.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl {
	@Autowired
	private MemberDao dao;
	
	//회원가입
	public int insertMember(Member member) {
		return dao.insertMember(member);
		
	}
	
	//로그인
	public Member selectLogin(Member member) {
		return dao.selectLogin(member);
	}
	
	//로그아웃
	public Member selectLogout(Member member) {
		return dao.selectLogout(member);
	}
	
	//아이디찾기
	public List<Member> findId(String memberemail){
		return dao.findId(memberemail);
		
	}
	
	public int findIdCheck(String memberemail) {
		return dao.findIdCheck(memberemail);
	}
	
	//회원목록
	public List<Member> selectAllMember() {
		return dao.selectAllMember();
		
	}
	//회원삭제
	public int deleteMember(String member_id) {
		return dao.deleteMember(member_id);
	}

	

}
