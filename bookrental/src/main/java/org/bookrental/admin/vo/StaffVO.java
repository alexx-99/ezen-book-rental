package org.bookrental.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class StaffVO {
	private String staff_id;
	private String staff_pwd;
	private String staff_name;
	private String staff_gender;
	private String staff_part;
	private String staff_position;
	private int staff_pms;
	private String staff_mail;
	private String staff_phone;
	private int staff_type;
	private Date staff_reg_date;
	private Date staff_up_date;
	
}
