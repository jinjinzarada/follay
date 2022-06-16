package kh.spring.follay.play.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.follay.play.domain.Play;

@Repository
public class PlayDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	// 원글
	public int insertPlay(Play play) {
			return sqlsession.insert("Play.insertPlay",play);
	}
	// 답글 seq 업데이트
	public int updatePlayReplySeq(Play play) {
			return sqlsession.update("Play.updatePlayReplySeq",play);
	}
	// 답글
	public int insertPlayReply(Play play) {
		return sqlsession.insert("Play.insertPlayReply2",play);
	}
		
	
	public List<Play> selectPlayListAll(){
		return sqlsession.selectList("Play.selectPlayListAll");
	}
	
	public Play selectPlay(String play_no){
		return sqlsession.selectOne("Play.selectPlay", play_no);
	}
		
	public int updatePlay(Play play) {
		return sqlsession.update("Play.updatePlay",play);
	}
	
	public int deletePlay(String play_no) {
		return sqlsession.delete("Play.deletePlay",play_no);
	}

}
