package kr.green.adidas.vo;

import lombok.Data;

@Data
public class OrderListVO {
	private int ol_num;
	private int ol_op_num;
	private int ol_or_num;
	private int ol_total_price;
	private int ol_amount;
	private String ol_state;
	private String ol_uid;
	private String ol_pay;
}
