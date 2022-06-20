package kh.spring.follay.show.domain;

import org.springframework.stereotype.Component;

import lombok.Data;


@Data
@Component
public class Show {
//SHOW_ID	VARCHAR2(100)	NOT NULL,
//SHOW_NAME	VARCHAR2(100)	NOT NULL,
//SHOW_CATEGORY	VARCHAR2(30)	NOT NULL,
//SHOW_CONTENT	VARCHAR2(3999)	NOT NULL,
//MEMBER_ID	VARCHAR2(30)	NOT NULL
	
	private String show_id;
	private String show_name;
	private String show_category;
	private String show_content;
	
	private String member_id;

	@Override
	public String toString() {
		return "Show [show_id=" + show_id + ", show_name=" + show_name + ", show_category=" + show_category
				+ ", show_content=" + show_content + ", member_id=" + member_id + "]";
	}

}
