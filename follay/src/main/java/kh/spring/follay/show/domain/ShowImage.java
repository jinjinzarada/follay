package kh.spring.follay.show.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ShowImage {
//	SI_NO	NUMBER	NOT NULL,
//	SI_FILE	VARCHAR2(300)	NOT NULL,
//	SHOW_ID	VARCHAR2(100)	NOT NULL
	private int si_no;
	private String si_file;
	private String show_id;
	
	@Override
	public String toString() {
		return "ShowImage [si_no=" + si_no + ", si_file=" + si_file + ", show_id=" + show_id + "]";
	}
	
}
