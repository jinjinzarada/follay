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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.follay.common.FileUpload;
import kh.spring.follay.member.domain.Member;
import kh.spring.follay.play.domain.Play;
import kh.spring.follay.play.model.service.PlayService;


@Controller
@RequestMapping("/play")
public class PlayController {
	private static final Logger logger = LoggerFactory.getLogger(PlayController.class);

	@Autowired
	private PlayService service;
	
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
		play.setMember_id(member.getId());
		
		if(uploadfile !=null) {
			String rename_filename = commonFile.saveFile(uploadfile, req);
			if(rename_filename !=null) {
				play.setPlay_original_filename(uploadfile.getOriginalFilename());
				play.setPlay_rename_filename(rename_filename);
				
			}
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
