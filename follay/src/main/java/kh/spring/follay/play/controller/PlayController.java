package kh.spring.follay.play.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.follay.common.FileUpload;
import kh.spring.follay.member.domain.Member;
import kh.spring.follay.play.domain.Play;
import kh.spring.follay.play.model.service.PlayServiceImpl;


@Controller
@RequestMapping("/play")
public class PlayController {
	private static final Logger logger = LoggerFactory.getLogger(PlayController.class);

	@Autowired
	private PlayServiceImpl service;
	
	@Autowired
	private FileUpload commonFile;
	
	@GetMapping("/write")
	public ModelAndView pageInsert(ModelAndView mv
			, @RequestParam(name="refnum", defaultValue = "0") String refnumStr
			) {
		int refnum =0;
		try {
			refnum = Integer.parseInt(refnumStr);
		}catch (Exception e) {
		}
		System.out.println("[[보여주소]]"+refnum);
		
		mv.addObject("refnum", refnum);
		mv.setViewName("play/insert");
		return mv;
	}
	@PostMapping("/write")
	public ModelAndView insert(ModelAndView mv
			, Play play
			, HttpSession session
			, @RequestParam(name="uploadfile", required = false) MultipartFile uploadfile
			, HttpServletRequest req
			) {
		
		Member member = (Member) session.getAttribute("loginSsInfo");
		if (member == null) {
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		play.setMember_id(member.getMember_id());
		
		if(uploadfile !=null) {
			String rename_filename = commonFile.saveFile(uploadfile, req);
			if(rename_filename !=null) {
				play.setPlay_original_filename(uploadfile.getOriginalFilename());
				play.setPlay_rename_filename(rename_filename);
				
			}
		}
		int result = service.insertPlay(play);
		mv.setViewName("redirect:/play/list");
		return mv;
		
	}
	@GetMapping("/list")
	public ModelAndView selectList(ModelAndView mv) {
		
		mv.addObject("playlist", service.selectPlayListAll());
		mv.setViewName("play/list");
		return mv;
	}
	@GetMapping("/read")
	public ModelAndView selectPlay(ModelAndView mv
			, @RequestParam(name="play_no", required = false) String play_no
			, RedirectAttributes rttr
			) {
		if(play_no == null) {
			rttr.addFlashAttribute("msg", "읽을 글번호가 없습니다. 읽을 글을 다시 선택해 주세요");
			mv.setViewName("redirect:/play/list");
		}
		mv.addObject("play", service.selectPlay(play_no));
		mv.setViewName("play/read");
		return mv;
	
	}
	
	@PostMapping("/update")
	public ModelAndView pageupdatePlay(ModelAndView mv
			, @RequestParam("play_no") String play_no
			
			) {
		mv.addObject("play", service.selectPlay(play_no));
		mv.setViewName("play/update");
		return mv;
		
	}
	@PostMapping("/updateDo")
	public ModelAndView updatePlay(ModelAndView mv
			, Play play
			, @RequestParam(name="uploadfile", required = false) MultipartFile uploadfile
			, HttpServletRequest req
			
			) {
		
		String before_rename_filename = play.getPlay_rename_filename();
		String before_original_filename = play.getPlay_original_filename();
		
		if(uploadfile != null) {
			String rename_filename = commonFile.saveFile(uploadfile, req);
			if(rename_filename !=null) {
				play.setPlay_original_filename(uploadfile.getOriginalFilename());
				play.setPlay_rename_filename(rename_filename);
				
				if(before_rename_filename !=null && !before_rename_filename.equals("")) {
					commonFile.removeFile(before_rename_filename, req);
				}
			}
		}else if(before_original_filename == null || before_original_filename.equals("")) {
			play.setPlay_original_filename(null);
			play.setPlay_rename_filename(null);
			if(before_rename_filename !=null && !before_rename_filename.equals("")) {
				commonFile.removeFile(before_original_filename, req);
			}
		}
		int result =service.updatePlay(play);
		mv.setViewName("redirect:/play/list");
		return mv;
	}
	@PostMapping(value="/delete", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deletPlay(
			@RequestParam(name="play_no",required = false) String play_no
			) {
		int result = service.deletePlay(play_no);
		String msg="";
		if(result > 0) {
			msg="게시글"+play_no+"번 삭제되었습니다. ";
		}else {
			msg="게시글이 삭제되지 못했습니다. 다시 확인하고 삭제해 주세요.";
		}
		return msg;
		
	}
	
}
