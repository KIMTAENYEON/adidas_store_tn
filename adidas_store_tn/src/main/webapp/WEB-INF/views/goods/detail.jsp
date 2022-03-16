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
							<span class="goods-detail-price">${goods.gd_price}원</span>
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
			$.ajax({
		        async:false,
		        type:'POST',
		        url:'<%=request.getContextPath()%>/choice/state',
		        dataType:"json",
		        success : function(res){
		        	var list = res.list
		        	for(choice of list){
		        		if(choice.ch_gd_num == '${goods.gd_num}'){
		        			if(choice.ch_state == 1){
								$('.btn-select-choice').children().addClass('icon-choice-ing').removeClass('icon-choice');								
							}
		        		}
		        	}
		        }
		    });
		}
		//장바구니 담기 클릭
		$('.btn-select-bascket').click(function(e) {
			e.preventDefault();
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
	</script>
</body>
</html>