package kh.spring.follay.play.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.follay.common.FileUpload;
import kh.spring.follay.member.domain.Member;
import kh.spring.follay.play.domain.Play;
import kh.spring.follay.play.domain.PlayComment;
import kh.spring.follay.play.model.service.PlayService;
import kh.spring.follay.play.model.service.PlayServiceImpl;


@Controller
@RequestMapping("/play")
public class PlayController {
	private static final Logger logger = LoggerFactory.getLogger(PlayController.class);

//	@Inject
//	private PlayComment playcomment;
	
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
//			, RedirectAttributes rttr
			, @RequestParam(name="uploadfile", required = false) MultipartFile uploadfile
			, HttpServletRequest req
			) {
		
		Member member = (Member) session.getAttribute("loginSsInfo");
		if (member == null) {
//			rttr.addFlashAttribute("msg", "로그인 후 글작성 해주세요.");
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
//			mv.addObject("List<PlayComment>", service.selectPlayCommentList(play_no)); 
//			mv.setViewName("play/writecomment");
//			mv.addObject("playcomment",playcomment);
//			return mv;
		}
		int result = service.insertPlay(play);
		mv.setViewName("redirect:/play/list");
		return mv;
		
		}
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(name="page", defaultValue = "1") int currentPage
			, ModelAndView mv
			, @RequestParam(name = "test1", defaultValue = "1") int test1
			, @RequestParam(name = "test2", defaultValue = "2") int test2
			, @RequestParam(name = "test5", defaultValue = "5") int test5
			, HttpServletRequest req) {
		System.out.println(req.getParameter("test5"));
		
		final int pageSize = 10;
		final int pageBlock = 3;
		int totalCnt = service.selectTotalCnt();
		
		//paging 처리 
		int pageCnt = (totalCnt / pageSize) + (totalCnt % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		List<Play> playlist = service.selectPlayList(currentPage, pageSize);
		mv.addObject("playlist", playlist);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("play/list");
		return mv;
	}

//	@GetMapping("/read")
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public ModelAndView selectPlay(ModelAndView mv
			, PlayComment playcomment
			, @RequestParam(name="play_no", required = false) String play_no
			, RedirectAttributes rttr
			) {
		if(play_no == null) {
			rttr.addFlashAttribute("msg", "읽을 글번호가 없습니다. 읽을 글을 다시 선택해 주세요");
			mv.setViewName("redirect:/play/list");
		}
		
//		mv.addObject("play", service.selectPlay(play_no));  // 게시글만 읽기
		mv.addObject("play", service.selectPlayAndPlayComment(play_no)); // 게시글+댓글 읽기
		mv.setViewName("play/read");
		mv.addObject("playcomment",playcomment);
		return mv;
	}
	
	@PostMapping("/read")
	public ModelAndView updatePlayCount(ModelAndView mv
			, @RequestParam(name="member_id",required = false) int play_readcount
			) {
		mv.addObject("play", service.updatePlayCount(play_readcount));
		return mv;
		
//		if(member_id == null || !(member_id.equals(member_id))) {
//			dao.updatePlayCount(play_no);
//			play = play.selectPlay(play_no);
//		}
	}
	
//	@GetMapping("/playcomment")
//	public ModelAndView selectPlayAndPlayComment(ModelAndView mv
//			, Play play
//			, @RequestParam(name="play_no", required = false) int play_no
//			) {
//		mv.addObject("play", service.selectPlayAndPlayComment(play_no));
//		mv.setViewName("play/playcomment");
//		return mv;
//	}
//	
//	@PostMapping("/playcomment")
//	public ModelAndView insert(ModelAndView mv
//			, Play play
//			, HttpSession session
//			, @RequestParam(name="play_no", required = false) int play_no
//			, HttpServletRequest req
//			) {
//		
//		Member member = (Member) session.getAttribute("loginSsInfo");
//		if (member == null) {
//			mv.setViewName("redirect:/member/login");
//			return mv;
//		}
//		return mv;
//}
	
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
			@RequestParam(name="play_no",required = false) int play_no
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
