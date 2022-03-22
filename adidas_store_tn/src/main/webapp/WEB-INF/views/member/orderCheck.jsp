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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/orderCheck.css">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
	<div class="body margin-top"> 
		<div class="order-goods-container">
			<h3>주문 조회</h3>
			<span> * 주문취소는 배송상태가 '주문완료' 일 때 가능합니다.</span>
			<div class="order-goods-box">
				<c:forEach var="orderList" items="${list}">
				<c:forEach var="option" items="${option}">
				<c:if test="${option.op_num == orderList.ol_op_num}">
				<c:forEach var="goods" items="${goods}">
				<c:if test="${goods.gd_num == option.op_gd_num}">
					<div class="order-goods-item-box">
						<a href="<%=request.getContextPath()%>/goods/detail?gd_num=${goods.gd_num}" class="btn btn-goods-item">
							<span class="goods-item-img-box">
								<img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt="">
							</span>
							<span class="goods-item-text-box">
								<span class="goods-item-name">${goods.gd_name}</span>
								<span class="goods-item-size">사이즈 : ${option.op_size}</span>
								<span class="goods-item-amount">수량 : ${orderList.ol_amount}</span>
								<span class="goods-item-price">${orderList.ol_total_price}</span>
								<span class="goods-order-state-box">
									<input type="hidden" name="ol_num" value="${orderList.ol_num}">
									<input type="hidden" name="ol_op_num" value="${orderList.ol_op_num}">
									<input type="hidden" name="ol_or_num" value="${orderList.ol_or_num}">
									<input type="hidden" name="ol_amount" value="${orderList.ol_amount}">
									<input type="hidden" name="ol_uid" value="${orderList.ol_uid}">
									<input type="hidden" name="ol_total_price" value="${orderList.ol_total_price}">
									<span>${orderList.ol_state}</span>
									<c:if test="${orderList.ol_state == '주문완료'}">
										<button class="btn btn-order-cancle">주문취소</button>
									</c:if>
								</span>
							</span>
						</a>
					</div>
				</c:if>
				</c:forEach>
				</c:if>
				</c:forEach>	
				</c:forEach>
			</div>
			<!-- 페이지네이션 -->
			<div class="goods-list-pagination-container">
				<div class="goods-list-pagination-box">
					<div class="pagination-prev-box">
						<c:if test="${pm.prev}">
							<a href="<%=request.getContextPath()%>/member/orderCheck?page=${pm.criteria.page-1}" class="btn btn-pagination-prev">이전</a>
						</c:if>
					</div>
					<div class="pagination-page-box">
						<span>
							페이지: 
						</span>
						<div class="pagination-now-page-box">
							<button type="button" class="btn btn-now-page">
								<span>${pm.criteria.page}</span>
								<i class="icon-arrow-down"></i>
							</button>
							<!-- 현재페이지박스 클릭시 나타나는 페이지선택박스 -->
							<div class="page-select-box">
								<ul class="pagination-page-select">
									<c:forEach begin="1" end="${pm.endPage }" var="i">
										<c:if test="${i != pm.criteria.page}">
											<li class="page-item">
												<a href="<%=request.getContextPath()%>/member/orderCheck?page=${i}" class="page-link">${i}</a>
											</li>
										</c:if>
										<c:if test="${i == pm.criteria.page}">
											<li class="page-item selected">
												<a href="<%=request.getContextPath()%>/member/orderCheck?page=${i}" class="page-link">${i}</a>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
						</div>
						<span>/ ${pm.endPage}</span>
					</div>
					<div class="pagination-next-box">
						<c:if test="${pm.next }">
							<a href="<%=request.getContextPath()%>/member/orderCheck?page=${pm.criteria.page+1}" class="btn btn-pagination-next">다음</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('.btn').click(function(e){
			e.preventDefault();
		})
		//주문취소 버튼 클릭
		$('.btn-order-cancle').click(function(e){
			e.preventDefault();
			var ol_num = $(this).siblings('[name=ol_num]').val();
			var ol_op_num = $(this).siblings('[name=ol_op_num]').val();
			var ol_or_num = $(this).siblings('[name=ol_or_num]').val();
			var ol_amount = $(this).siblings('[name=ol_amount]').val();
			var ol_uid = $(this).siblings('[name=ol_uid]').val();
			var a = confirm("같이 주문한 모든제품을 취소하겠습니까?");
			if(a == false){
				return false;
			}
			var orderList = {
				ol_num : ol_num,
				ol_op_num : ol_op_num,
				ol_or_num : ol_or_num,
				ol_amount : ol_amount,
				ol_uid : ol_uid
			}
			cancelPay(orderList);
			$.ajax({
		        async:false,
		        type:'POST',
		        data:JSON.stringify(orderList),
		        url: '<%=request.getContextPath()%>/order/cancle',
		        contentType:"application/json; charset=UTF-8",
		        success : function(res){
		        	window.location.reload()
		        }
		    });
		})
		// 페이지네이션 이벤트
	  	$('.btn-now-page').click(function(){
			$('.goods-list-pagination-container .page-select-box').toggle();
		});
		$('.page-item').hover(function(){
			$(this).css('background-color', '#e9ecef');
		}, function(){
			if(!$(this).hasClass('selected')){
				$(this).css('background-color', '#fff');
			}
		});
		setComma();
		//콤마 찍기
		function setComma() {
			$('.goods-item-price').each(function() {
				var price = $(this).text();
				price = parseInt(price);
				var priceComma = price.toLocaleString('ko-KR');
				$(this).text(priceComma + '원');
			});
		}
		//환불
		function cancelPay(orderList) {
		    $.ajax({
			    url: '<%=request.getContextPath()%>/order/inicis/cancel',
			    type: "POST",
			    data: JSON.stringify(orderList),
			    contentType:"application/json; charset=UTF-8",
			    dataType: "json"
		    }).done(function(res) {
		    	if(res == 'OK'){
	        		alert('주문을 취소했습니다.');
	        	}
			}).fail(function(error) {
				alert('취소 실패');
			});
		  }
	</script>
</body>
</html>