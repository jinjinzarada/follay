package kh.spring.follay.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
}
