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
//			, HttpSession session
			) {
		String t2 = req.getParameter("title");
		if(t2==null) {
			t2 = null;
		}
		int result = service.insertMember(member);
		
		if(result < 1) {
			rttr.addFlashAttribute("msg","가입에 실패했습니다. 다시 회원가입 시도해주세요.");
			mv.setViewName("redirect:/member/insert");
			return mv;
		}
		rttr.addFlashAttribute("msg", "가입을 축하드립니다. 로그인 해주세요.");
		mv.setViewName("redirect:/member/login");
		return mv;
	}
//			session.setAttribute("t2", result);
//			rttr.addFlashAttribute("msg","님 환영합니다!");
//			mv.setViewName("redirect:/");
//			return mv;
//	}
	
	// 로그인
//	@RequestMapping("/login")
//	public ModelAndView pageLogin(ModelAndView mv) {
//		mv.setViewName("member/login");
//		return mv;
//        
//    }
	
//	@RequestMapping(value = "login", method = RequestMethod.GET)    
//	public ModelAndView pageLogin(ModelAndView mv) {        
//		mv.setViewName("member/login");       
//		return mv;    
//	}
	
//	@RequestMapping(value = "member/login", method = RequestMethod.GET)
	@GetMapping("/login")
	public ModelAndView pageLogin(ModelAndView mv) {
		mv.setViewName("member/login");
		return mv;
	}
//	@RequestMapping("/login")
	@PostMapping("/login")
	public ModelAndView selectLogin(ModelAndView mv
			, Member member
			, RedirectAttributes rttr
			, HttpSession session
			) {
		Member result = service.selectLogin(member);
		
		// 로그인 실패
		if(result == null) {
			rttr.addFlashAttribute("msg","로그인에 실패했습니다. 아이디와 패스워드를 다시 확인해 주세요.");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		
		// 로그인 성공
			session.setAttribute("loginSsInfo", result);
			rttr.addFlashAttribute("msg",result.getMember_id()+"님 환영합니다!");
			mv.setViewName("redirect:/");
			return mv;
	}
	
	// 로그아웃
	@RequestMapping("/logout")
    public ModelAndView pageLogout(HttpSession session) {
//		MemberServiceImpl.selectLogout(session);
		// 세션 닫기
		session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/login");
		mv.addObject("msg", "logout");
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
	
	//아이디찾기
	@RequestMapping(value="/findIn" , method = RequestMethod.GET)
	public ModelAndView findId(Member member
			, ModelAndView mv
			, RedirectAttributes rttr
			, HttpSession session
			, String memberemail
			) {
		List<Member> result = service.findId(memberemail);
		logger.info("memberEmail"+member.getMember_email());
		
		if(result == null) {
			rttr.addFlashAttribute("msg","이메일을 확인해주세요");
			mv.setViewName("redirect:/member/findId");
			return mv;
		}
		session.setAttribute("member",result);
		mv.setViewName("redirect:/member/findId");
		return mv;
		
	}
	
	//회원목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView selectAllMember(ModelAndView mv) {
		List<Member> memberlist = service.selectAllMember();
		mv.addObject("memberlist", memberlist);
		mv.setViewName("member/list");
		return mv;
		
	}
	
	//회원삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deleteMember(ModelAndView mv
			, @RequestParam("id") String member_id
			) {
		int result = service.deleteMember(member_id);
		mv.setViewName("redirect:/member/list");
		return mv;
		
	}
		
}
