package kh.spring.follay.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.follay.member.model.dao.MemberDao;
import kh.spring.follay.member.model.domain.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	//ȸ������
	public int insertMember(Member member) {
		return dao.insertMember(member);
		
	}
	//ȸ�����
	public List<Member> selectAllMember() {
		return dao.selectAllMember();
		
	}
	//ȸ������
	public int deleteMember(String member_id) {
		return dao.deleteMember(member_id);
	}

}
