package kh.spring.follay.member.model.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.follay.member.domain.Member;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//회원가입
	public int insertMember(Member member) {
		return sqlSession.insert("Member.insertMember",member);
		
	}
	
	//로그인
	public Member selectLogin(Member member) {
		return sqlSession.selectOne("Member.selectLogin", member);
	}
	
	//로그아웃
	public Member selectLogout(Member member) {
		return sqlSession.selectOne("Member.selectLogout", member);
	}
	
	//아이디찾기
	public List<Member> findId(String memberemail){
		return sqlSession.selectList("Member.findId", memberemail);
		
	}
	
	public int findIdCheck(String memberemail) {
		return sqlSession.selectOne("Member.findIdCheck", memberemail);
	}
	
	//회원목록
	public List<Member> selectAllMember() {
		return sqlSession.selectList("Member.selectAllMember");
		
	}
	//회원삭제
	public int deleteMember(String member_id) {
		return sqlSession.delete("Member.deleteMember", member_id);
		
	}

	//마이페이지
	public Member selectMypage(Member member) {
		return sqlSession.selectOne("Member.selectMypage", member);
	}
	

}
