package kh.spring.follay.work.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.follay.work.domain.Work;

@Repository
public class WorkDao {
	
	@Autowired
	private SqlSession sqlsession;

	// 게시글 
	public Work selectWork(String work_no) {
		Work work = sqlsession.selectOne("Work.selectWork", work_no);
		return work;
	}
	
	// 페이징 처리
	public List<Work> selectWorkList(int currentPage, int pageSize) {
		return sqlsession.selectList("Work.selectWorkList", null, new RowBounds((currentPage-1)*pageSize , pageSize));
	}

	public int selectTotalCnt() {
		return sqlsession.selectOne("Work.selectTotalCnt");
	}

}
