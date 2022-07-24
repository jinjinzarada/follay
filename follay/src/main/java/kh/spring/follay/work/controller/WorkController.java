package kh.spring.follay.work.controller;

import java.util.List;

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
import kh.spring.follay.work.domain.Work;
import kh.spring.follay.work.model.service.WorkService;

@Controller
@RequestMapping("/work")
public class WorkController {
	private static final Logger logger = LoggerFactory.getLogger(WorkController.class);

	@Autowired
	private WorkService service;
	
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
		mv.setViewName("work/insert");
		return mv;
	}
	@PostMapping("/write")
	public ModelAndView insert(ModelAndView mv
			, Work work
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
//		work.setMember_id(member.getMember_id());
//		
//		if(uploadfile !=null) {
//			String rename_filename = commonFile.saveFile(uploadfile, req);
//			if(rename_filename !=null) {
//				work.setPlay_original_filename(uploadfile.getOriginalFilename());
//				work.setPlay_rename_filename(rename_filename);
//				
//			}
//			mv.addObject("List<PlayComment>", service.selectPlayCommentList(play_no)); 
//			mv.setViewName("play/writecomment");
//			mv.addObject("playcomment",playcomment);
//			return mv;
//		}
		int result = service.insertWork(work);
		mv.setViewName("redirect:/work/list");
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
		
		List<Work> worklist = service.selectWorkList(currentPage, pageSize);
		mv.addObject("worklist", worklist);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("work/list");
		return mv;
	}
}
