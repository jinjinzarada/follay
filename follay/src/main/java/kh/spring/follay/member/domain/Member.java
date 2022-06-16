package kh.spring.follay.member.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Member {
//	MEMBER_ID VARCHAR2(30)	NOT NULL,
//	MEMBER_PASSWORD	VARCHAR2(30)	NOT NULL,
//	MEMBER_EMAIL VARCHAR2(50)	NOT NULL,
//	MEMBER_PHONE VARCHAR2(50)	NOT NULL,
//	MEMBER_BIRTH DATE	NOT NULL
	private String member_id;
	private String member_password;
	private String member_email;
	private String member_phone;
	private String member_birth;
	
	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_password=" + member_password + ", member_email="
				+ member_email + ", member_phone=" + member_phone + ", member_birth=" + member_birth + "]";
	}

}
