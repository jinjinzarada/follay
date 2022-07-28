package kh.spring.follay.show.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.follay.show.domain.Show;
import kh.spring.follay.show.model.dao.ShowDao;

@Service
public class ShowServiceImpl implements ShowService{

	@Autowired
	private ShowDao dao;
	
	public int selectTotalCnt() {
		return dao.selectTotalCnt();
	}
	
	// 글쓰기
	public int insertShow(Show show) {
		return dao.insertShow(show);
	}
	
	// 페이징 처리
	public List<Show> selectShowList(int currentPage, int pageSize) {
		return dao.selectShowList(currentPage, pageSize);
	}
	
	// 게시글 
	public Show selectShow(String show_no) {
		return dao.selectShow(show_no);
	}
	
	public int updateShowCount(int show_readcount) {
		return dao.updateShowCount("Show.updateShowCount", show_readcount);
	}
}
