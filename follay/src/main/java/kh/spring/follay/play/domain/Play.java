package kh.spring.follay.play.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Play {
//	PLAY_NO	NUMBER	NOT NULL,
//	PLAY_TITLE	VARCHAR2(100)	NOT NULL,
//	PLAY_CONTENT	VARCHAR2(3999)	NOT NULL,
//	PLAY_ORIGINAL_FILENAME	VARCHAR2(100)	NULL,
//	PLAY_RENAME_FILENAME	VARCHAR2(100)	NULL,
//	PLAY_DATE	TIMESTAMP	DEFAULT SYSTIMESTAMP,
//	PLAY_LEVEL	NUMBER	DEFAULT 0,
//	PLAY_REF	NUMBER	NOT NULL,
//	PLAY_REPLAY_REF	NUMBER	NULL,
//	PLAY_REPLY_SEQ	NUMBER	DEFAULT 0,
//	PLAY_READCOUNT	NUMBER	DEFAULT 0,
//	MEMBER_ID	VARCHAR2(30)	NOT NULL
	
	private int play_no;
	private String play_title;
	private String play_content;
	private String play_original_filename;
	private String play_rename_filename;
	private Timestamp play_date;
	private int play_ref;
	private int play_replay_ref;
	private int play_reply_seq;
	private int play_readcount;
	
	private String member_id;

	@Override
	public String toString() {
		return "Play [play_no=" + play_no + ", play_title=" + play_title + ", play_content=" + play_content
				+ ", play_original_filename=" + play_original_filename + ", play_rename_filename="
				+ play_rename_filename + ", play_date=" + play_date + ", play_ref=" + play_ref + ", play_replay_ref="
				+ play_replay_ref + ", play_reply_seq=" + play_reply_seq + ", play_readcount=" + play_readcount
				+ ", member_id=" + member_id + "]";
	}
}
