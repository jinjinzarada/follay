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
	public int deletePlay(String play_no) {
		return dao.deletePlay(play_no);
	}
	
	public Play selectPlay(String play_no) {
		return dao.selectPlay(play_no);
	}
	
	// 게시글 목록
	public List<Play> selectPlayListAll() {
		return dao.selectPlayListAll();
	}
	
	public int deletePlay(List<String> play_no) {
		return 0;
	}
	
}
