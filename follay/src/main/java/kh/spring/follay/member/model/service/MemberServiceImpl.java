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
	
	public Member selectLogin(Member member) {
		return dao.selectLogin(member);
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
