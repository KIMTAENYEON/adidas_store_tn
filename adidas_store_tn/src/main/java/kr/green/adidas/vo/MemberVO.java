package kr.green.adidas.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String me_email;
	private String me_pw;
	private String me_name;
	private String me_address;
	private String me_phone;
	private String me_authority;
	private String me_postnum;
	private String me_address_detail;
	private String me_auto_login;
	private String me_session_id;
	private Date me_session_limit;
}
