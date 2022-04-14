package kr.green.adidas.vo;

import java.text.SimpleDateFormat;
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
	
	public String getOr_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String str = format.format(or_date);
		return str;
	}
}
