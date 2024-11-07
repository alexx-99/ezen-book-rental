package org.bookrental.user.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_nickname;
	private String user_gender;
	private String user_mail;
	private String user_phone;
	private String user_zipcode;
	private String user_address;
	private int user_type;
	private int user_pms;
	private Date user_reg_date;
	private Date user_up_date;
	// 자바에서 Date형이 처리가 빠름, jstl이 자동으로 형변환을 한다. 


}
