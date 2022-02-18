package kr.green.adidas.vo;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsVO {
	private int gd_num;
	private String gd_img;
	private String gd_name;
	private String gd_gender;
	private String gd_price;
	private Date gd_date;
	private String gd_title;
	private String gd_content;
	private String gd_con_img;
	private String gd_code;
	private String gd_material;
	private String gd_color;
	private String gd_country;
	private String gd_made_date;
	private String gd_made_company;
	private String gd_importer;
	private int gd_ca_num;
	private int gd_sub_num;
}
