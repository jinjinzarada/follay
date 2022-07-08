package kh.spring.follay.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.follay.member.domain.Member;
import kh.spring.follay.member.model.service.MemberServiceImpl;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberServiceImpl service;

	@Inject
	private BCryptPasswordEncoder pwdEncoding;
	
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public ModelAndView pageInsert(ModelAndView mv) {
		mv.setViewName("member/insert");
		return mv;
		
	}
	@PostMapping("/insert")
	public ModelAndView insert(ModelAndView mv
			, Member member
			, RedirectAttributes rttr
			, HttpServletRequest req
			) {
		String t2 = req.getParameter("title");
		if(t2==null) {
			t2 = null;
		}
		int result = service.insertMember(member);
		if(result < 1) {
			rttr.addFlashAttribute("msg","가입에 실패했습니다. 다시 회원가입 시도해주세요.");
			mv.setViewName("redirect:/member/enroll");
			return mv;
		}
		mv.setViewName("redirect:/");
		return mv;
	}
	
	// 로그인
	@GetMapping("/login")
	public ModelAndView pageLogin(ModelAndView mv) {
		mv.setViewName("member/login");
		return mv;
	}
	@PostMapping("/login")
	public ModelAndView selectLogin(ModelAndView mv
			, Member member
			, RedirectAttributes rttr
			, HttpSession session
			) {
		Member result = service.selectLogin(member);
		
		if(result == null) {
			rttr.addFlashAttribute("msg","로그인에 실패했습니다. 아이디와 패스워드를 다시 확인해 주세요.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		
			session.setAttribute("loginSsInfo", result);
			rttr.addFlashAttribute("msg",result.getMember_id()+"님 환영합니다!");
			mv.setViewName("redirect:/");
			return mv;
			
	}
	
	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
    public ModelAndView pageLogout(ModelAndView mv
    		, HttpServletRequest req 
    		) {
		mv.setViewName("member/logout");
		HttpSession session = req.getSession();
		session.invalidate();
		return mv;
        
    }
	
//	@GetMapping("/logout")
//	public ModelAndView pageLogout(ModelAndView mv) {
//		mv.setViewName("member/logout");
//		return mv;
//	}
//	@PostMapping("/logout")
//	public ModelAndView selectLogout(ModelAndView mv
//			, Member member
//			, RedirectAttributes rttr
//			, HttpSession session
//			) {
//		Member result = service.selectLogout(member);
		
//		if(result == null) {
//			rttr.addFlashAttribute("msg","로그인에 실패했습니다. 아이디와 패스워드를 다시 확인해 주세요.");
//			mv.setViewName("redirect:/member/login");
//			return mv;
//		}
		
//			session.setAttribute("loginSsInfo", result);
//			rttr.addFlashAttribute("msg",result.getMember_id()+"님 환영합니다!");
//			mv.setViewName("redirect:/");
//			return mv;
//			
//	}
		
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
