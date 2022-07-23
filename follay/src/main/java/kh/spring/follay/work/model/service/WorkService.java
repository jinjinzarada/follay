package kh.spring.follay.work.model.service;

import java.util.List;

import kh.spring.follay.work.domain.Work;

public interface WorkService {

	
	public Work selectWork(String work_no);
	
	public List<Work> selectWorkList(int currentPage, int pageSize);
	/**
	 * @param pageNum ���� ������
	 * @param limit ���� �Խñ� ��
	 * @return �߰��� �۰���
	 */
	public int selectTotalCnt();

}
