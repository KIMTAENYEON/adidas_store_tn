package kr.green.adidas.pagination;

import lombok.Data;

@Data
public class PageMaker {
	private int totalCount;	//총 게시글 갯수
	private boolean prev;		//이전 버튼 활성화 여부
	private boolean next;		//다음 버튼 활성화 여부
	private int endPage;		//마지막페이지
	private Criteria criteria;		//현재 선택된 페이지 정보 
	
	/* prev, next 값 계산 */
	public void calcData() {
		/* 총 콘텐츠 갯수를 이용하여 마지막 페이지 번호를 계산 */
		endPage = (int)(Math.ceil(totalCount/(double)criteria.getPerPageNum()));
		/* 현재 페이지가 1페이지이면 false*/
		prev = criteria.getPage() == 1 ? false : true;
		/* 현재 페이지가 마지막페이지이면 false */
		next = criteria.getPage() == endPage ? false:true;
	}
	public PageMaker(int totalCount, Criteria criteria) {
		this.totalCount = totalCount;
		this.criteria = criteria;
		calcData();
	}
}