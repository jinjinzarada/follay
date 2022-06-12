package kh.spring.follay.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.follay.member.model.dao.MemberDao;
import kh.spring.follay.member.model.domain.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	public int insertMember(Member member) {
		return dao.insertMember(member);
		
	}
}
