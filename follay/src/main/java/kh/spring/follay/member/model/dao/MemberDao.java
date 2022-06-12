package kh.spring.follay.member.model.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.follay.member.model.domain.Member;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//회원가입
	public int insertMember(Member member) {
		return sqlSession.insert("Member.insertMember",member);
		
	}
	//회원목록
	public List<Member> selectAllMember() {
		return sqlSession.selectList("Member.selectAllMember");
		
	}
	//회원삭제
	public int deleteMember(String member_id) {
		return sqlSession.delete("Member.deleteMember", member_id);
		
	}

}
