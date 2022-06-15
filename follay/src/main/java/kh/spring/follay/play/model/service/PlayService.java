package kh.spring.follay.play.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.follay.play.domain.Play;
import kh.spring.follay.play.model.dao.PlayDao;

@Service
public class PlayService {

	@Autowired
	private PlayDao dao;
	
	@Override
	public int insertPlay(Play play) {
		if(play.getRefnum() > 0) {
			dao.updateBoardReplySeq(play);
			return dao.insertPlayReply(play);
		}else {
			return dao.insertPlay(play);
		}
	}
	@Override
	public int updatePlay(Play play) {
		return dao.updatePlay(play);
	}
	
	@Override
	public int deleteBoard(String play_no) {
		return dao.deleteBoard(play_no);
	}
	@Override
	public Play selectPlay(String play_no) {
		return dao.selectPlay(play_no);
	}
	@Override
	public List<Play> selectPlayListAll() {
		return dao.selectPlayListAll();
	}
	
}
