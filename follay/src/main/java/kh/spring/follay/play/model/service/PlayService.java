package kh.spring.follay.play.model.service;

import java.util.List;

import kh.spring.follay.play.domain.Play;
import kh.spring.follay.play.domain.PlayComment;

public interface PlayService {
	
	public List<PlayComment> selectPlayCommentList (int play_no) throws Exception;

	/**
	 * @param play 게시글로 추가할 내용
	 * @return 추가된 글 갯수
	 * @author Jinny
	 */
	public int insertPlay(Play play);
	/**
	 * 
	 * @param playcomment
	 * @return
	 */
	public int insertPlayComment(PlayComment playcomment);
	/**
	 * @param play 수정할 글번호
	 * @return 수정괸 글의 갯수
	 */
	public int updatePlay(Play play);
	/**
	 * @param play_no 삭제할 글번호 하나
	 * @return 삭제된 글의 갯수
	 */
	public int deletePlay(int play_no);
	
	/**
	 * @param <Sting>
	 * @param play_no 삭제할 글번호 리스트
	 * @return 삭제된 글의 갯수
	 * 
	 */
	
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
	public Play selectPlayAndPlayComment(String play_no);
	
	/**
	 *  @param 댓글
	 */
	
	public int updatePlayCount(int play_readcount);
	
	/**
	 * @param 조회수
	 */
}
