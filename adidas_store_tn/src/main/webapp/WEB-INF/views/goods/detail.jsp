<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/detail.css">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="body margin-top">
	<c:if test="${goods.gd_del == 'Y'}">
		<h3 class="delete-h3">삭제된 제품 입니다.</h3>
	</c:if>
	<c:if test="${goods.gd_del == 'N'}">
		<div class="goods-detail">
			<div class="goods-detail-container">
				<!-- 이미지 박스 -->
				<div class="goods-detail-img-container">
					<div class="goods-detail-img-box">
						<img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt="">
					</div>
				</div>
				<form action="<%=request.getContextPath()%>/order/buy">
					<!-- 제품정보 박스 -->
					<div class="goods-detail-information-container">
						<div class="goods-detail-name-box">
							<span class="goods-detail-name">${goods.gd_name}</span>
						</div>
						<div class="goods-detail-price-box">
							<span class="goods-detail-price">${goods.gd_price}</span>
						</div>
						<!-- 사이즈 선택 -->
						<div class="goods-detail-size-container">
							<div class="size-title">구입 가능한 사이즈</div>
							<div class="goods-size-box">
								<c:if test="${goods.gd_ca_num == 1}">
									<button type="button" class="btn btn-size-select" disabled>230</button>
									<button type="button" class="btn btn-size-select" disabled>235</button>
									<button type="button" class="btn btn-size-select" disabled>240</button>
									<button type="button" class="btn btn-size-select" disabled>245</button>
									<button type="button" class="btn btn-size-select" disabled>250</button>
									<button type="button" class="btn btn-size-select" disabled>255</button>
									<button type="button" class="btn btn-size-select" disabled>260</button>
									<button type="button" class="btn btn-size-select" disabled>265</button>
									<button type="button" class="btn btn-size-select" disabled>270</button>
									<button type="button" class="btn btn-size-select" disabled>275</button>
									<button type="button" class="btn btn-size-select" disabled>280</button>
								</c:if>
								<c:if test="${goods.gd_ca_num == 2 || goods.gd_sub_num == 20 || goods.gd_sub_num == 23 || goods.gd_sub_num == 26}">
									<button type="button" class="btn btn-size-select" disabled>XS</button>
									<button type="button" class="btn btn-size-select" disabled>S</button>
									<button type="button" class="btn btn-size-select" disabled>M</button>
									<button type="button" class="btn btn-size-select" disabled>L</button>
									<button type="button" class="btn btn-size-select" disabled>XL</button>
								</c:if>
								<c:if test="${goods.gd_ca_num == 3 || goods.gd_sub_num == 21 || goods.gd_sub_num == 24}">
									<button type="button" class="btn btn-size-select" disabled>FREE</button>
								</c:if>
								<c:if test="${goods.gd_sub_num == 19}">
									<button type="button" class="btn btn-size-select" disabled>220</button>
									<button type="button" class="btn btn-size-select" disabled>225</button>
									<button type="button" class="btn btn-size-select" disabled>230</button>
									<button type="button" class="btn btn-size-select" disabled>235</button>
									<button type="button" class="btn btn-size-select" disabled>240</button>
								</c:if>
								<c:if test="${goods.gd_sub_num == 22}">
									<button type="button" class="btn btn-size-select" disabled>170</button>
									<button type="button" class="btn btn-size-select" disabled>180</button>
									<button type="button" class="btn btn-size-select" disabled>190</button>
									<button type="button" class="btn btn-size-select" disabled>200</button>
									<button type="button" class="btn btn-size-select" disabled>210</button>
								</c:if>
								<c:if test="${goods.gd_sub_num == 25}">
									<button type="button" class="btn btn-size-select" disabled>120</button>
									<button type="button" class="btn btn-size-select" disabled>130</button>
									<button type="button" class="btn btn-size-select" disabled>140</button>
									<button type="button" class="btn btn-size-select" disabled>150</button>
									<button type="button" class="btn btn-size-select" disabled>160</button>
								</c:if>
								<input type="hidden" name="op_size">
								<input type="hidden" name="ol_op_num">
								<input type="hidden" name="basket" value="no">
							</div>
						</div>
						<!-- 수량 선택 -->
						<div class="goods-detail-amount-box">
							<h4>수량</h4>
							<input type="number" class="goods-detail-amount" min="1" value="1" name="ol_amount">
						</div>
						<!-- 제품 선택 박스(장바구니, 찜, 구매) -->
						<div class="goods-detail-select-container">
							<div class="goods-detail-select-box">
								<button type="button" class="btn btn-select-bascket">
									<span>장바구니 담기</span>
									<i class="icon-right"></i>
								</button>
								<button type="button" class="btn btn-select-choice">
									<i class="icon-choice"></i>
								</button>
								<button class="btn btn-select-buy">
									<span>구매</span>
									<i class="icon-right"></i>
								</button>
							</div>
						</div>
						<c:if test="${user.me_authority == '관리자'}">
							<!-- 수정, 삭제 버튼 -->
							<div class="goods-detail-modify-delete-container">
								<div class="goods-detail-modify-delete">
									<a href="<%=request.getContextPath()%>/goods/modify?gd_num=${goods.gd_num}" class="btn btn-goods-modify">
										<span>수정</span>
										<i class="icon-right"></i>
									</a>
									<a href="<%=request.getContextPath()%>/goods/delete?gd_num=${goods.gd_num}" onclick="return confirm('삭제하시겠습니까?')" class="btn btn-goods-delete">
										<span>삭제</span>
										<i class="icon-right"></i>
									</a>
								</div>
							</div>
						</c:if>
					</div>
				</form>
			</div>
			<!-- 제품 설명 박스 -->
			<div class="goods-detail-content-container">
				<!-- 설명 상단 -->
				<div class="goods-detail-content-top">
					<div class="goods-content-title-box">
						<div class="goods-content-title">
							${goods.gd_title}
						</div>
						<div class="goods-content-content">
							${goods.gd_content}
						</div>
					</div>
					<div class="goods-content-img-box">
						<div class="goods-content-img">
							<img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt="">
						</div>
					</div>
				</div>
				<!-- 설명 하단 -->
				<div class="goods-detail-content-bottom">
					<div class="goods-detail-code-box">
						<div class="goods-detail-content-name">
							제품코드
						</div>
						<div class="goods-detail-content-val">
							${goods.gd_code}
						</div>
					</div>
					<div class="goods-detail-material-box">
						<div class="goods-detail-content-name">
							소재
						</div>
						<div class="goods-detail-content-val">
							${goods.gd_material}
						</div>
					</div>
					<div class="goods-detail-color-box">
						<div class="goods-detail-content-name">
							컬러
						</div>
						<div class="goods-detail-content-val">
							${goods.gd_color}
						</div>
					</div>
					<div class="goods-detail-country-box">
						<div class="goods-detail-content-name">
							원산지
						</div>
						<div class="goods-detail-content-val">
							${goods.gd_country}
						</div>
					</div>
					<div class="goods-detail-made-date-box">
						<div class="goods-detail-content-name">
							제조년월
						</div>
						<div class="goods-detail-content-val">
							${goods.gd_made_date}
						</div>
					</div>
					<div class="goods-detail-made-company-box">
						<div class="goods-detail-content-name">
							제조자
						</div>
						<div class="goods-detail-content-val">
							${goods.gd_made_company}
						</div>
					</div>
					<div class="goods-detail-importer-box">
						<div class="goods-detail-content-name">
							수입자
						</div>
						<div class="goods-detail-content-val">
							${goods.gd_importer}
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 제품 리뷰 -->
		<div class="goods-review">
			<div class="goods-review-container">
				<div class="goods-review-head-box">
					<h3>평점 및 리뷰</h3>
					<select name="review-lineup" class="review-lineup">
						<option value="0">정렬기준</option>
						<option value="1">최신순</option>
						<option value="2">추천순</option>
						<option value="3">비추천순</option>
						<option value="4">별점높은순</option>
						<option value="5">별점낮은순</option>
					</select>
				</div>
				<div class="goods-review-list-container">
					<c:if test="${review == null || review == '[]'}">
						<h3>리뷰가 없습니다.</h3>
					</c:if>
					<!-- 리뷰목록 -->
					<div class="goods-review-list-box">
					<c:forEach var="review" items="${review}">
						<div class="goods-review-box">
							<div class="goods-review-title">${review.re_title}</div>
							<div class="goods-review-star-box">
								<input type="hidden" name="re_star" value="${review.re_star}">
								<div class="goods-review-star">
									<i class="icon-star"></i>
								</div>
								<div class="goods-review-star">
									<i class="icon-star"></i>
								</div>
								<div class="goods-review-star">
									<i class="icon-star"></i>
								</div>
								<div class="goods-review-star">
									<i class="icon-star"></i>
								</div>
								<div class="goods-review-star">
									<i class="icon-star"></i>
								</div>
							</div>
							<div class="goods-review-content">${review.re_content}</div>
							<div class="goods-review-updown">
								<input type="hidden" name="re_num" value="${review.re_num}">
								<c:forEach var="likes" items="${likes}">
								<c:if test="${likes.li_re_num == review.re_num}">
									<input type="hidden" name="li_state" value="${likes.li_state}">
								</c:if>
								</c:forEach>
								<button class="btn btn-review-up"><i class="icon-up"></i></button>
								<span>0</span>
								<button class="btn btn-review-down"><i class="icon-down"></i></button>
								<span>0</span>
							</div>
						</div>
					</c:forEach>
					</div>
					<!-- 리뷰쓰기, 내 리뷰 -->
					<div class="goods-review-user-box">
						<!-- 리뷰 쓰기 -->
						<div class="goods-review-write-box">
							<h3>리뷰 작성</h3>
							<div class="goods-review-write">
								<input type="text" class="review-title" placeholder="제목">
								<div class="review-write-star-box">
									<span>별점선택 : </span>
									<input type="hidden" name="re_star_input">
									<button class="btn btn-star"><i class="icon-star"></i></button>
									<button class="btn btn-star"><i class="icon-star"></i><i class="icon-star"></i></button>
									<button class="btn btn-star"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></button>
									<button class="btn btn-star"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></button>
									<button class="btn btn-star"><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></button>
								</div>
								<textarea class="review-content" rows="5" placeholder="내용"></textarea>
								<button class="btn btn-review-reg">등록</button>
							</div>
						</div>
						<!-- 내 리뷰 -->
						<c:if test="${myReview != null}">
							<div class="goods-review-myreview-box">
								<h3>내가 쓴 리뷰</h3>
								<div class="goods-review-box">
									<div class="goods-review-title">${myReview.re_title}</div>
									<div class="goods-review-star-box">
										<input type="hidden" name="re_star" value="${myReview.re_star}">
										<div class="goods-review-star">
											<i class="icon-star"></i>
										</div>
										<div class="goods-review-star">
											<i class="icon-star"></i>
										</div>
										<div class="goods-review-star">
											<i class="icon-star"></i>
										</div>
										<div class="goods-review-star">
											<i class="icon-star"></i>
										</div>
										<div class="goods-review-star">
											<i class="icon-star"></i>
										</div>
									</div>
									<div class="goods-review-content">${myReview.re_content}</div>
									<div class="goods-review-updown">
										<input type="hidden" name="re_num" value="${myReview.re_num}">
										<c:forEach var="likes" items="${likes}">
										<c:if test="${likes.li_re_num == myReview.re_num}">
											<input type="hidden" name="li_state" value="${likes.li_state}">
										</c:if>
										</c:forEach>
										<button class="btn btn-review-up"><i class="icon-up"></i></button>
										<span>0</span>
										<button class="btn btn-review-down"><i class="icon-down"></i></button>
										<span>0</span>
									</div>
									<div class="goods-review-button">
										<button class="btn btn-review-mod">수정</button>
										<button class="btn btn-review-del">삭제</button>
									</div>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<!-- 최근에 본 제품 -->
		<div class="recently-product">
			<div class="recently-product-container">
				<div class="recently-product-text-box">
					<div class="recently-product-text">
						<h3>최근에 본 제품</h3>
					</div>
				</div>
				<div class="recently-product-list-box">
					<div class="recently-product-list-container">
						<!-- 최근에 본 제품리스트 -->
						<div class="recently-product-list">
							<!-- 최근에 본 아이템 -->
							
						</div>
						<div class="recently-product-btn-box">
							<button type="button" class="btn btn-prev"><i class="icon-left"></i></button>
							<button type="button" class="btn btn-next"><i class="icon-right"></i></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	</div>
	<script>
		//사이즈 선택 시 색상 변경
		$('.btn-size-select').click(function() {
			$('.btn-size-select').each(function() {
				if($(this).hasClass('selected')){
					$(this).removeClass('selected');
				}
			});
			$(this).addClass('selected');
			var size = $(this).text();
			$('[name=op_size]').val(size);
		});
		//해당 사이즈 재고가 있는 지 표시
		getOption();
		function getOption() {
			$.ajax({
		        async:false,
		        type:'GET',
		        url: '<%=request.getContextPath()%>/option?gd_num='+${goods.gd_num},
		        dataType:"json",
		        success : function(res){
	        		var list = res.list
	        		for(option of list){
	        			$('.btn-size-select').each(function() {
							if($(this).text() == option.op_size){
								$(this).addClass('amount');
								$(this).prop('disabled', '');
								if(option.op_amount == 0){
									$(this).removeClass('amount');
									$(this).prop('disabled', 'disabled');
								}
							}
						});
		        	}
		        }
		    });
		}
		// 구매 버튼 클릭시 옵션번호 가져오기
		$('.btn-select-buy').click(function() {
			var user = "${user.me_email}";
			if(user == null || user == ""){
				alert('로그인 후 가능합니다.')
				return false;
			}
			var size = $('[name=op_size]').val();
			if(size == '' || size == null){
				alert('사이즈를 선택하세요.');
				return false;
			}
			var option = {
				op_gd_num : ${goods.gd_num},
				op_size : $('[name=op_size]').val()
			}
			$.ajax({
		        async:false,
		        type:'POST',
		        data:JSON.stringify(option),
		        url: '<%=request.getContextPath()%>/option/select',
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(res){
					$('[name=ol_op_num]').val(res);
		        }
		    });
		});
		// 찜하기 클릭
		$('.btn-select-choice').click(function(e){
			e.preventDefault();
			var user = "${user.me_email}";
			if(user == null || user == ""){
				return;
			}
			if($(this).children().hasClass('icon-choice')){
				$(this).children().addClass('icon-choice-ing');
				$(this).children().removeClass('icon-choice');
				var ch_state = 1;
			}else{
				$(this).children().addClass('icon-choice');
				$(this).children().removeClass('icon-choice-ing');
				var ch_state = 0;
			}
			var ch_gd_num = '${goods.gd_num}';
			var ch_me_email = '${user.me_email}';
			var choice = {
				ch_state : ch_state,
				ch_gd_num : ch_gd_num,
				ch_me_email : ch_me_email
			}
			$.ajax({
		        async:false,
		        type:'POST',
		        data:JSON.stringify(choice),
		        url: '<%=request.getContextPath()%>/choice/insert',
		        contentType:"application/json; charset=UTF-8",
		        success : function(res){
		        	
		        }
		    });
		})
		getChoiceState();
		//로그인한 유저의 찜상태 가져오기
		function getChoiceState() {
			var user = "${user.me_email}";
			if(user == null || user == ""){
				return;
			}
			$.ajax({
		        async:false,
		        type:'POST',
		        url:'<%=request.getContextPath()%>/choice/state',
		        dataType:"json",
		        success : function(res){
		        	var list = res.list
		        	if(list != null){
			        	for(choice of list){
			        		if(choice.ch_gd_num == '${goods.gd_num}'){
			        			if(choice.ch_state == 1){
									$('.btn-select-choice').children().addClass('icon-choice-ing').removeClass('icon-choice');								
								}
			        		}
			        	}
		        	}
		        }
		    });
		}
		//장바구니 담기 클릭
		$('.btn-select-bascket').click(function(e) {
			e.preventDefault();
			var user = "${user.me_email}";
			if(user == null || user == ""){
				alert('로그인 후 가능합니다.')
				return;
			}
			var op_gd_num = '${goods.gd_num}';
			var op_size = $('[name=op_size]').val();
			var op_amount = $('.goods-detail-amount').val();
			var option = {
				op_gd_num : op_gd_num,
				op_size : op_size,
				op_amount : op_amount
			}
			$.ajax({
		        async:false,
		        type:'POST',
		        data:JSON.stringify(option),
		        url: '<%=request.getContextPath()%>/basket/put',
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(res){
		        	if(res == true){
		        		alert('장바구니에 담았습니다.')
		        	}else{
		        		alert('사이즈와 수량을 다시 확인하세요.')
		        	}
		        }
		    });
		});
		getOrderCheck();
		//해당제품의 회원 주문상태 가져오기
		function getOrderCheck() {
			var me_email = '${user.me_email}';
			var gd_num = ${goods.gd_num};
			var myReview = '${myReview}';
			$.ajax({
		        async:false,
		        type:'GET',
		        url: '<%=request.getContextPath()%>/goods/order/check?me_email='+me_email+'&gd_num='+gd_num,
		        success : function(res){
		        	if(res == false){
		        		$('.goods-review-write-box').css('display', 'none');
		        	}else{
		        		if(myReview == null || myReview.trim().length == 0){
			        		$('.goods-review-write-box').show();
			        	}
		        	}
		        }
		    });
		}
		setStar();
		//해당리뷰의 별점 찍기
		function setStar() {
			$('[name=re_star]').each(function() {
				var star = $(this).val() - 1;
				$(this).siblings('.goods-review-star').eq(star).nextAll().children().addClass('empty');
			});
		}
		//추천, 비추천 클릭
		$('.btn-review-up').click(function() {
			var li_state = $(this).siblings('[name=li_state]').val();
			var li_me_email = '${user.me_email}';
			var li_re_num = $(this).siblings('[name=re_num]').val();
			if(li_state == 1){
				$(this).siblings('[name=li_state]').val(0);
				li_state = 0;
			}else{
				$(this).siblings('[name=li_state]').val(1);
				li_state = 1;
			}
			if(li_me_email == null || li_me_email.trim().length == 0){
				alert('로그인 후 가능합니다.');
				return false;
			}
			var likes = {
				li_state : li_state,
				li_me_email : li_me_email,
				li_re_num : li_re_num
			}
			$.ajax({
		        async:false,
		        type:'POST',
		        data:JSON.stringify(likes),
		        url: '<%=request.getContextPath()%>/likes',
		        contentType:"application/json; charset=UTF-8",
		        success : function(res){
		        	if(res == 1){
		        		alert('해당 리뷰를 추천했습니다.')
		        	}else{
		        		alert('해당 리뷰를 추천을 취소했습니다.')
		        	}
		        	window.location.reload();
		        }
		    });
		});
		$('.btn-review-down').click(function() {
			var li_state = $(this).siblings('[name=li_state]').val();
			var li_me_email = '${user.me_email}';
			var li_re_num = $(this).siblings('[name=re_num]').val();
			if(li_state == -1){
				$(this).siblings('[name=li_state]').val(0);
				li_state = 0;
			}else{
				$(this).siblings('[name=li_state]').val(-1);
				li_state = -1;
			}
			if(li_me_email == null || li_me_email.trim().length == 0){
				alert('로그인 후 가능합니다.');
				return false;
			}
			var likes = {
				li_state : li_state,
				li_me_email : li_me_email,
				li_re_num : li_re_num
			}
			$.ajax({
		        async:false,
		        type:'POST',
		        data:JSON.stringify(likes),
		        url: '<%=request.getContextPath()%>/likes',
		        contentType:"application/json; charset=UTF-8",
		        success : function(res){
		        	if(res == -1){
		        		alert('해당 리뷰를 비추천했습니다.')
		        	}else{
		        		alert('해당 리뷰를 비추천을 취소했습니다.')
		        	}
		        	window.location.reload();
		        }
		    });
		});
		setLikesState();
		//추천상태 불러오기
		function setLikesState() {
			$('[name=li_state]').each(function() {
				var li_state = $(this).val();
				if(li_state == 1){
					$(this).siblings('.btn-review-up').children().addClass('selected');
					$(this).siblings('.btn-review-down').children().removeClass('selected');
				}else if(li_state == -1){
					$(this).siblings('.btn-review-up').children().removeClass('selected');
					$(this).siblings('.btn-review-down').children().addClass('selected');
				}else{
					$(this).siblings('.btn-review-up').children().removeClass('selected');
					$(this).siblings('.btn-review-down').children().removeClass('selected');
				}
			});
		}
		setLikesCount();
		//추천, 비추천 수 가져오기
		function setLikesCount() {
			$('[name=re_num]').each(function() {
				var re_num = $(this).val();
				var up = 0;
				var down = 0;
				$.ajax({
			        async:false,
			        type:'GET',
			        url: '<%=request.getContextPath()%>/likes/up?re_num='+re_num,
			        success : function(res){
			        	up = res;
			        }
			    });
				$.ajax({
			        async:false,
			        type:'GET',
			        url: '<%=request.getContextPath()%>/likes/down?re_num='+re_num,
			        success : function(res){
			        	down = res;
			        }
			    });
				$(this).siblings('.btn-review-up').next().text(up);
				$(this).siblings('.btn-review-down').next().text(down);
			});
		}
		//리뷰쓰기 별점 선택
		$('.btn-star').click(function() {
			$(this).siblings('.btn-star').removeClass('selected');
			$(this).addClass('selected');
			var star = $(this).prevAll('.btn-star').length + 1;
			$(this).siblings('[name=re_star_input]').val(star);
		});
		//리뷰쓰기 등록버튼
		$('.btn-review-reg').click(function() {
			var re_star = $('[name=re_star_input]').val();
			var re_title = $('.review-title').val();
			var re_content = $('.review-content').val();
			var re_gd_num = ${goods.gd_num};
			var re_me_email = '${user.me_email}';
			if(re_star <= 0 || re_star == null){
				alert('별점을 선택하세요.')
				return false;
			}
			if(re_title == null || re_title.trim().length == 0){
				alert('제목을 입력하세요.')
				return false;
			}
			if(re_content == null || re_content.trim().length == 0){
				alert('내용을 입력하세요.')
				return false;
			}
			if(re_me_email == null || re_me_email.trim().length == 0){
				alert('로그인 후 입력 가능합니다.');
				return false;
			}
			var review = {
				re_star : re_star,
				re_title : re_title,
				re_content : re_content,
				re_gd_num : re_gd_num,
				re_me_email : re_me_email
			}
			$.ajax({
		        async:false,
		        type:'POST',
		        data:JSON.stringify(review),
		        url: '<%=request.getContextPath()%>/review/reg',
		        contentType:"application/json; charset=UTF-8",
		        success : function(res){
		        	if(res == true){
		        		alert('리뷰를 등록했습니다.');
		        		window.location.reload();
		        	}
		        }
		    });
		});
		//리뷰 수정 버튼
		$('.btn-review-mod').click(function() {
			var re_title = $('.goods-review-myreview-box').find('.goods-review-title').text();
			var re_content = $('.goods-review-myreview-box').find('.goods-review-content').text();
			var re_star =  $('.goods-review-myreview-box').find('[name=re_star]').val();
			$('.goods-review-myreview-box').hide();
			$('.goods-review-write-box').show();
			$('.goods-review-write-box').find('.review-title').val(re_title);
			$('.goods-review-write-box').find('.review-content').val(re_content);
			$('.goods-review-write-box').find('[name=re_star_input]').val(re_star);
			$('.btn-star').eq(re_star - 1).click();
		});
		//리뷰 삭제 버튼
		$('.btn-review-del').click(function() {
			var re_num = $('.goods-review-myreview-box').find('[name=re_num]').val();
			$.ajax({
		        async:false,
		        type:'GET',
		        url: '<%=request.getContextPath()%>/review/del?re_num='+re_num,
		        success : function(res){
		        	if(res == true){
		        		alert('리뷰를 삭제했습니다.');
		        		window.location.reload();
		        	}
		        }
		    });
		});
		//리뷰 정렬 선택
		$('.review-lineup').change(function() {
			var gd_num = ${goods.gd_num};
			var lineup = $(this).val();
			var url = '<%=request.getContextPath()%>/goods/detail?gd_num='+gd_num+'&lineup='+lineup;
			window.location.replace(url);
		});
		//선택한 리뷰 정렬 가져오기
		setLineup();
		function setLineup() {
			$('.review-lineup').find('[value='+${lineup}+']').prop('selected', 'selected');	
			if(${lineup != 0}){
				var position = $('.goods-review').position();
				$(window).scrollTop(position.top);
			}
		}
		//최근에 본 제품 쿠키저장
		addProduct();
		function addProduct() {
			var product = ${goods.gd_num};
			var token = ',';
			var val = getCookie('product');
			if(val != null){
				var arr = val.split(token);
				//쿠키에 이미 있는경우 맨 뒤로 보냄
				if(arr.indexOf("" + product) >= 0){
					var index = arr.indexOf("" + product);
					var nowGoods = arr.splice(index, 1);
					arr.push(nowGoods);
					val = arr.toString();
					setCookie('product' , val, 7);
					return;
				}
				val += token;
				val += product;
				arr = val.split(token);
				//쿠키에 10개이상의 제품이 있는 경우
				if(arr.length > 10){
					var lengthCount = arr.length - 10;
					arr.splice(0, lengthCount);
					val = arr.toString();
				}
			}else{
				val = product;
			}
			setCookie('product' , val, 7);
		}
		//쿠키에 저장
		function setCookie(name, value, expireTime){
			var date = new Date();
			date.setTime(date.getTime() + expireTime*24*60*60*1000);
			document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
		}
		//쿠키 가져오기
		function getCookie(name) {
		  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		  return value? value[2] : null;
		}
		//최근에 본 제품 리스트 가져오기
		getProduct();
		function getProduct() {
			var val = getCookie('product');
			var token = ',';
			if(val == null){
				$('.recently-product').hide();
			}else{
				var arr = val.split(token);
				$.ajax({
			        async:false,
			        type:'GET',
			        url: '<%=request.getContextPath()%>/product?gd_num='+arr,
			        dataType:"json",
			        success : function(res){
			        	var list = res.list
			        	if(list != null){
			        		var str = '';
			        		for(product of list){
			        			str = createProduct(product);
			        			$('.recently-product-list').prepend(str);
			        		}
			        	}
			        }
			    });
			}
		}
		// 최근에 본 제품 리스트 html코드 만들기
		function createProduct(product) {
			var str = 		'<div class="recently-product-item-box">';
				str +=			'<a href="<%=request.getContextPath()%>/goods/detail?gd_num=' + product.gd_num + '" class="recently-product-item">';
				str +=				'<span class="goods-item-img-box">';
				str +=					'<img src="<%=request.getContextPath()%>/img/' + product.gd_img +'" alt="">';
				str +=				'</span>';
				str +=				'<span class="goods-item-text-box">';
				str +=					'<span class="goods-item-name">'+ product.gd_name +'</span>';
				str +=					'<span class="goods-item-price">'+ product.gd_price +'</span>';
				str +=				'</span>';
				str +=			'</a>';
				str +=		'</div>';
			return str;
		}
		// 최근에 본 제품 다음버튼클릭
		$('.recently-product .btn-next').click(function(){
			var productNext = $('.recently-product-list .end').nextAll().length
			var productNextMargin = (productNext * 20)
			if(productNext >= 5){
				$('.recently-product-list').animate({marginLeft : '-=100%'});
				$('.recently-product-list .end').nextAll().eq(4).addClass('end');
				$('.recently-product-list .end').first().removeClass('end');
				$('.recently-product-list .start').nextAll().eq(4).addClass('start');
				$('.recently-product-list .start').first().removeClass('start');
				$('.recently-product .btn-prev').show();
			}
			if(productNext >= 1 && productNext < 5){
				$('.recently-product-list').animate({marginLeft : '-='+productNextMargin+'%'});
				$('.recently-product-list .end').nextAll().eq(productNext -1).addClass('end');
				$('.recently-product-list .end').first().removeClass('end');
				$('.recently-product-list .start').nextAll().eq(productNext -1).addClass('start');
				$('.recently-product-list .start').first().removeClass('start');
				$('.recently-product .btn-prev').show();
			}
			var productNext = $('.recently-product-list .end').nextAll().length
			if(productNext == 0){
				$('.recently-product .btn-next').hide();
			}
		});
		// 최근에 본 제품 이전버튼클릭
		$('.recently-product .btn-prev').click(function(){
			var productPrev = $('.recently-product-list .start').prevAll().length
			var productPrevMargin = (productPrev * 20)
			if(productPrev >= 5){
				$('.recently-product-list').animate({marginLeft : '+=100%'});
				$('.recently-product-list .end').prevAll().eq(4).addClass('end');
				$('.recently-product-list .end').last().removeClass('end');
				$('.recently-product-list .start').prevAll().eq(4).addClass('start');
				$('.recently-product-list .start').last().removeClass('start');
				$('.recently-product .btn-next').show();
			}
			if(productPrev >= 1 && productPrev < 5){
				$('.recently-product-list').animate({marginLeft : '+='+productPrevMargin+'%'});
				$('.recently-product-list .end').prevAll().eq(productPrev -1).addClass('end');
				$('.recently-product-list .end').last().removeClass('end');
				$('.recently-product-list .start').prevAll().eq(productPrev -1).addClass('start');
				$('.recently-product-list .start').last().removeClass('start');
				$('.recently-product .btn-next').show();
			}
			var productPrev = $('.recently-product-list .start').prevAll().length
			if(productPrev == 0){
				$('.recently-product .btn-prev').hide();
			}
		});
		//최근에 본 제품 시작지점, 끝지점 설정
		setStartEnd();
		function setStartEnd(){
			$('.recently-product-list').children().eq(0).addClass('start');
			$('.recently-product-list').children().eq(4).addClass('end');
			if($('.recently-product-list').children().length <= 5){
				$('.recently-product .btn-next').hide();
			}
		}
		setComma();
		//콤마 찍기
		function setComma() {
			$('.goods-detail-price').each(function() {
				var price = $(this).text();
				price = parseInt(price);
				var priceComma = price.toLocaleString('ko-KR');
				$(this).text(priceComma + '원');
			});
			$('.goods-item-price').each(function() {
				var price = $(this).text();
				price = parseInt(price);
				var priceComma = price.toLocaleString('ko-KR');
				$(this).text(priceComma + '원');
			});
		}
	</script>
</body>
</html>