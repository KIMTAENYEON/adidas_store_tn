package kr.green.adidas.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	private int or_num;
	private Date or_date;
	private String or_name;
	private String or_address;
	private String or_phone;
	private String or_address_detail;
	private String or_postnum;
	private String or_me_email;
}
