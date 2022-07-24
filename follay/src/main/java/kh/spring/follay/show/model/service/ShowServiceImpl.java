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
	
	public int insertShow(Show show) {
		return dao.insertShow(show);
	}
	
	public List<Show> selectShowList(int currentPage, int pageSize) {
		return dao.selectShowList(currentPage, pageSize);
	}
}
