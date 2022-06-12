package kh.spring.follay.member.model.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.follay.member.model.domain.Member;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertMember(Member member) {
		return sqlSession.insert("Member.insertMember",member);
		
	}

}
