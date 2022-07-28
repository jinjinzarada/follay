package kh.spring.follay.work.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.follay.work.domain.Work;
import kh.spring.follay.work.model.dao.WorkDao;


@Service
public class WorkServiceImpl implements WorkService{

	@Autowired
	private WorkDao dao;
	
	// 게시글 
	public Work selectWork(String work_no) {
		return dao.selectWork(work_no);
	}
	
	// 페이징 처리
	public List<Work> selectWorkList(int currentPage, int pageSize) {
		return dao.selectWorkList(currentPage, pageSize);
	}

	public int selectTotalCnt() {
		return dao.selectTotalCnt();
	}
	
	// 글쓰기
	public int insertWork(Work work) {
		return dao.insertWork(work);
	}
}
