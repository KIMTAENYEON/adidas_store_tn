package kr.green.adidas.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int re_num;
	private String re_title;
	private String re_content;
	private int re_star;
	private Date re_date;
	private int re_state;
	private int re_gd_num;
	private String re_me_email;
	private int re_up;
	private int re_down;
}
