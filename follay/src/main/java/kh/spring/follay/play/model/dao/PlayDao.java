package kh.spring.follay.play.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.follay.play.domain.Play;
import kh.spring.follay.play.domain.PlayComment;

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

	// 게시글 읽기 
	public Play selectPlay(String play_no){
		Play play = sqlsession.selectOne("Play.selectPlay", play_no);
		return play;}
		
	public int updatePlay(Play play) {
		return sqlsession.update("Play.updatePlay",play);
	}
	
	public int deletePlay(int play_no) {
		return sqlsession.delete("Play.deletePlay",play_no);
	}
	
	// 페이징 처리
	public int selectTotalCnt() {
		return sqlsession.selectOne("Play.selectTotalCnt");
	}
	
	// 페이징 처리
	public List<Play> selectPlayList(int currentPage, int pageSize) {
		return sqlsession.selectList("Play.selectPlayList", null, new RowBounds((currentPage-1)*pageSize , pageSize));
	}

	// 게시글 읽기 + 댓글
	public Play selectPlayAndPlayComment(String play_no) {
		Play play = sqlsession.selectOne("Play.selectPlay", play_no);
		play.setPlay_commentlist(sqlsession.selectList("Play.selectPlayCommentList", play_no));
		return play;
	}
	
	// 댓글만 읽기
	public List<PlayComment> selectPlayCommentList(int play_no) {
		return sqlsession.selectList("Play.selectPlayCommentList", play_no);
	}

}
