package kh.spring.follay.show.model.service;

import java.util.List;

import kh.spring.follay.show.domain.Show;

public interface ShowService {

	public int selectTotalCnt();
	/**
	 * 
	 * @param show
	 * @return
	 */
	public int insertShow(Show show);
	/**
	 * 
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<Show> selectShowList(int currentPage, int pageSize);
	/**
	 * 
	 * @param show_no
	 * @return
	 */
	public Show selectShow(String show_no);
	/**
	 * 
	 * @param show_readcount
	 * @return
	 */
	public int updateShowCount(int show_readcount);

}
