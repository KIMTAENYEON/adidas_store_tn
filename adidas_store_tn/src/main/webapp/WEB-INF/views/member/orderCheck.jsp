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
												<span class="goods-item-price">${orderList.ol_total_price}원</span>
												<span class="goods-order-state-box">
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
		</div>
	</div>
	<script>
		$('.goods-order-state-box').click(function(e){
			e.preventDefault();
		})
		$('.btn-order-cancle').click(function(e){
			e.preventDefault();
		})
	</script>
</body>
</html>