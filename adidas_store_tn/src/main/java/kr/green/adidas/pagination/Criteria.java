package kr.green.adidas.pagination;

import lombok.Data;

@Data
public class Criteria {
	//현재 페이지
	private int page; 
	//한 페이지 당 컨텐츠 갯수
	private int perPageNum;
	private String search;
	//Criteria 디폴트 생성자 : 현재 페이지를 1페이지로, 한 페이지에 10개의 컨텐츠
	public Criteria() {
		this.page = 1;
		this.perPageNum = 20;
		this.search = "";
	}
	public Criteria(int page, int perPageNum) {
		this.page = page <= 0 ? 1 : page;
		this.perPageNum = perPageNum <= 0 ? 20 : perPageNum;
		this.search = "";
	}
	/* 쿼리문에서 limit에 사용되는 인덱스를 계산하는 getter */
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
	
}