package kh.spring.follay.play.model.service;

import java.util.List;

import kh.spring.follay.play.domain.Play;

public interface PlayService {

	/**
	 * @param play 게시글로 추가할 내용
	 * @return 추가된 글 갯수
	 * @author Jinny
	 */
	public int insertPlay(Play play);
	/**
	 * @param play 수정할 글번호
	 * @return 수정괸 글의 갯수
	 */
	public int updatePlay(Play play);
	/**
	 * @param play_no 삭제할 글번호 하나
	 * @return 삭제된 글의 갯수
	 */
//	public int deletePlay(String play_no);
	
	/**
	 * @param play_no 삭제할 글번호 리스트
	 * @return 삭제된 글의 갯수
	 * 
	 */
//	public int deletePlay(List<String> play_no);
	
	public Play selectPlay(String play_no);
	public List<Play> selectPlayListAll();
	public int selectTotalCnt();
	public List<Play> selectPlayList(int currentPage, int pageSize);
	
	/**
	 * @param pageNum 읽을 페이지
	 * @param limit 읽을 게시글 수
	 * @param searchWord 검색할 단어
	 * @return 추가된 글개수
	 */
}
