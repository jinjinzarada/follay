package kh.spring.follay.show.model.dao;


import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.follay.show.domain.Show;

@Repository
public class ShowDao {
	
	@Autowired
	private SqlSession sqlsession;

	public int selectTotalCnt() {
		return sqlsession.selectOne("Show.selectTotalCnt");
	}

	public int insertShow(Show show) {
		return sqlsession.insert("Show.insertShow", show);
	}

	public List<Show> selectShowList(int currentPage, int pageSize) {
		return sqlsession.selectList("Show.selectShowList", null, new RowBounds((currentPage-1)*pageSize , pageSize));
	}

	public Show selectShow(String show_no) {
		Show show = sqlsession.selectOne("Show.selectShow", show_no);
		return show;
	}

	public int updateShowCount(String string, int show_readcount) {
		return sqlsession.update("Show.updateShowCount", show_readcount);
	}
}
