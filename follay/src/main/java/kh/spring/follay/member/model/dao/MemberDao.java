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
	
	//ȸ������
	public int insertMember(Member member) {
		return sqlSession.insert("Member.insertMember",member);
		
	}
	//ȸ�����
	public List<Member> selectAllMember() {
		return sqlSession.selectList("Member.selectAllMember");
		
	}
	//ȸ������
	public int deleteMember(String member_id) {
		return sqlSession.delete("Member.deleteMember", member_id);
		
	}

}
