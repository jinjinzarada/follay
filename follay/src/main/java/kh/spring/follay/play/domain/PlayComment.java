package kh.spring.follay.play.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class PlayComment {
//	PC_NO	NUMBER	NOT NULL,
//	PC_CONTENT	VARCHAR2(3999)	NOT NULL,
//	PC_DATE	TIMESTAMP	NOT NULL,
//	PLAY_NO	NUMBER	NOT NULL
//	MEMBER_ID	VARCHAR2(30)	NOT NULL,
	
	private int pc_no;
	private String pc_content;
	private Timestamp pc_date;
	private int play_no;
	private String member_id;
	
	@Override
	public String toString() {
		return "PlayComment [pc_no=" + pc_no + ", pc_content=" + pc_content + ", pc_date=" + pc_date + ", play_no="
				+ play_no + ", member_id=" + member_id + "]";
	}
	
}
