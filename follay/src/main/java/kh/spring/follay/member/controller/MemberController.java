package kh.spring.follay.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.follay.member.model.domain.Member;
import kh.spring.follay.member.model.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView pageinsertMember(ModelAndView mv) {
		mv.setViewName("member/insert");
		return mv;
		
	}
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insertMember(ModelAndView mv
			, Member member
			) {
		int result = service.insertMember(member);
		mv.setViewName("redirect:/");
		return mv;
		
	}
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView selectAllMember(ModelAndView mv) {
		List<Member> memberlist = service.selectAllMember();
		mv.addObject("memberlist", memberlist);
		mv.setViewName("member/list");
		return mv;
		
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deleteMember(ModelAndView mv
			, @RequestParam("id") String member_id
			) {
		int result = service.deleteMember(member_id);
		mv.setViewName("redirect:/member/list");
		return mv;
		
	}
		
}
