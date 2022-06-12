package kh.spring.follay.member.model.domain;

import org.springframework.stereotype.Component;

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

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

}
