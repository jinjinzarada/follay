package kh.spring.follay.play.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.follay.play.domain.Play;
import kh.spring.follay.play.model.dao.PlayDao;

@Service
public class PlayServiceImpl implements PlayService{

	@Autowired
	private PlayDao dao;
	
	// 글쓰기
	public int insertPlay(Play play) {
		if(play.getRefnum() > 0) {
			dao.updatePlayReplySeq(play);
			return dao.insertPlayReply(play);
		}else {
			return dao.insertPlay(play);
		}
	}
	
	// 게시글 수정
	public int updatePlay(Play play) {
		return dao.updatePlay(play);
	}
	
	// 게시글 삭제
	public int deletePlay(int play_no) {
		return dao.deletePlay(play_no);
	}
	
	public Play selectPlay(String play_no) {
		return dao.selectPlay(play_no);
	}
	
	// 게시글 목록
	public List<Play> selectPlayListAll() {
		return dao.selectPlayListAll();
	}
	
	//페이징 처리
	public int selectTotalCnt() {
		return dao.selectTotalCnt();
	}
	
	//페이징 처리
	public List<Play> selectPlayList(int currentPage, int pageSize){
		return dao.selectPlayList(currentPage, pageSize);
	}

	// 댓글
	public Play selectPlayAndPlayComment(int play_no){
		return dao.selectPlayAndPlayComment(play_no);
	}



}	
