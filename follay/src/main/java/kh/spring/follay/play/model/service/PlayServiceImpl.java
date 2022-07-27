package kh.spring.follay.play.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.follay.play.domain.Play;
import kh.spring.follay.play.domain.PlayComment;
import kh.spring.follay.play.model.dao.PlayDao;

@Service
public class PlayServiceImpl implements PlayService{

	@Autowired
	private PlayDao dao;
	
	// 글쓰기
//	@Override
	public int insertPlay(Play play) {
		if(play.getRefnum() > 0) {
			dao.updatePlayReplySeq(play);
			return dao.insertPlayReply(play);
		}else {
			return dao.insertPlay(play);
		}
	}
	
	// 댓글 쓰기
	public int insertPlayComment(PlayComment playcomment) {
		return dao.insertPlayComment(playcomment);
	}
	
	// 게시글 수정
//	@Override
	public int updatePlay(Play play) {
		return dao.updatePlay(play);
	}
	
	// 게시글 삭제
//	@Override
	public int deletePlay(int play_no) {
		return dao.deletePlay(play_no);
	}
	
	// 게시글만 읽기
//	@Override
	public Play selectPlay(String play_no) {
		return dao.selectPlay(play_no);
	}
	
	// 게시글 목록
//	@Override
	public List<Play> selectPlayListAll() {
		return dao.selectPlayListAll();
	}
	
	//페이징 처리
//	@Override
	public int selectTotalCnt() {
		return dao.selectTotalCnt();
	}
	
	//페이징 처리
//	@Override
	public List<Play> selectPlayList(int currentPage, int pageSize){
		return dao.selectPlayList(currentPage, pageSize);
	}

	// 게시글 + 댓글 읽기
//	@Override
	public Play selectPlayAndPlayComment(String play_no){
		return dao.selectPlayAndPlayComment(play_no);
	}
	
	// 댓글만 읽기
//	@Override
	public List<PlayComment> selectPlayCommentList(int play_no) {
		return dao.selectPlayCommentList(play_no);
	}
	
//	@Override
	//조회수
	public int updatePlayCount(int play_readcount) {
		return dao.updatePlayCount(play_readcount);
	}

}	
