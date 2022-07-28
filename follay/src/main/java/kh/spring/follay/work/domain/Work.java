package kh.spring.follay.work.domain;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Work {
	
//	WORK_NO	NUMBER	NOT NULL,
//	WORK_NAME	VARCHAR2(50)	NOT NULL,
//	WORK_CATEGORY	VARCHAR2(30)	NOT NULL,
//	WORK_CONTENT	VARCHAR2(3999)	NOT NULL,
//  WORK_FILE VARCHAR2(300)
	
	private int work_no;
	private String work_name;
	private String work_category;
	private String work_content;
	private String work_file;
	
	private List<WorkComment> work_commentlist;

	@Override
	public String toString() {
		return "Work [work_no=" + work_no + ", work_name=" + work_name + ", work_category=" + work_category
				+ ", work_content=" + work_content + ", work_file=" + work_file + ", work_commentlist="
				+ work_commentlist + "]";
	}

}
