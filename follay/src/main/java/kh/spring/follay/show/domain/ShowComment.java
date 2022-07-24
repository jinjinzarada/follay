package kh.spring.follay.show.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ShowComment {
//	SC_NO	NUMBER	NOT NULL,
//	SC_CONTENT	VARCHAR2(3999)	NOT NULL,
//	SC_DATE	TIMESTAMP	NOT NULL,
//	MEMBER_ID	VARCHAR2(30)	NOT NULL,
//	SHOW_NO	NUMBER	NOT NULL
	
	private int sc_no;
	private String sc_content;
	private Timestamp sc_date;
	private int show_no;
	private String member_id;
	
	@Override
	public String toString() {
		return "ShowComment [sc_no=" + sc_no + ", sc_content=" + sc_content + ", sc_date=" + sc_date + ", show_no="
				+ show_no + ", member_id=" + member_id + "]";
	}
	
}
