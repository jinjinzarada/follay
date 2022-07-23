package kh.spring.follay.work.domain;


import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class WorkComment {

//	WC_NO	NUMBER	NOT NULL,
//	WC_CONTENT	VARCHAR2(3999)	NOT NULL,
//	WC_DATE	TIMESTAMP	NOT NULL,
//	WORK_NO	NUMBER	NOT NULL,
//	MEMBER_ID	VARCHAR2(30)	NOT NULL
	
	private int wc_no;
	private String wc_content;
	private String wc_date;
	private int work_no;
	private String member_id;
	
	@Override
	public String toString() {
		return "WorkComment [wc_no=" + wc_no + ", wc_content=" + wc_content + ", wc_date=" + wc_date + ", work_no="
				+ work_no + ", member_id=" + member_id + "]";
	}
	
	
}
