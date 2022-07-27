package kh.spring.follay.show.domain;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;


@Data
@Component
public class Show {
//SHOW_NO	NUMBER	NOT NULL,
//SHOW_NAME	VARCHAR2(100)	NOT NULL,
//SHOW_CATEGORY	VARCHAR2(30)	NOT NULL,
//SHOW_CONTENT	VARCHAR2(3999)	NOT NULL,
//MEMBER_ID	VARCHAR2(30)	NOT NULL,
//SHOW_FILE VARCHAR2(300)
//SHOW_READCOUNT NUMBER	DEFAULT 0;
	
	private int show_no;
	private String show_name;
	private String show_category;
	private String show_content;
	private String member_id;
	private String show_file;
	private int show_readcount;
	
	private List<ShowComment> show_commentlist;

	@Override
	public String toString() {
		return "Show [show_no=" + show_no + ", show_name=" + show_name + ", show_category=" + show_category
				+ ", show_content=" + show_content + ", member_id=" + member_id + ", show_file=" + show_file
				+ ", show_readcount=" + show_readcount + ", show_commentlist=" + show_commentlist + "]";
	}
	

}
