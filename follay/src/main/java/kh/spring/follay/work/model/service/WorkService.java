package kh.spring.follay.work.model.service;

import java.util.List;

import kh.spring.follay.work.domain.Work;

public interface WorkService {

	
	public Work selectWork(String work_no);
	
	public List<Work> selectWorkList(int currentPage, int pageSize);
	/**
	 * @param pageNum 읽을 페이지
	 * @param limit 읽을 게시글 수
	 * @return 추가된 글개수
	 */
	public int selectTotalCnt();

}
