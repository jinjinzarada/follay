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
	
	// �Խñ� 
	public Work selectWork(String work_no) {
		return dao.selectWork(work_no);
	}
	
	// ����¡ ó��
	public List<Work> selectWorkList(int currentPage, int pageSize) {
		return dao.selectWorkList(currentPage, pageSize);
	}

	public int selectTotalCnt() {
		return dao.selectTotalCnt();
	}
	
}
