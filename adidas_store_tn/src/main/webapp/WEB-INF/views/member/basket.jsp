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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/basket.css">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="body margin-top">
		<!-- 주문제품정보 -->
		<div class="basket-container">
			<h3>장바구니</h3>
			<div class="basket-goods-box">
				<c:forEach var="myList" items="${myList}">
				<c:forEach var="option" items="${option}">
				<c:if test="${option.op_num == myList.my_op_num}">
				<c:forEach var="goods" items="${goods}">
				<c:if test="${goods.gd_num == option.op_gd_num}">
					<div class="basket-goods-item-box">
						<a href="" class="btn btn-basket-item">
							<span class="goods-item-img-box">
								<img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt="">
							</span>
						</a>
						<span class="goods-item-text-box">
							<span class="goods-item-name">${goods.gd_name}</span>
							<span class="goods-item-size">사이즈 : ${option.op_size}</span>
							<input type="hidden" name="my_num" value="${myList.my_num }">
							<span class="goods-item-amount">수량 : <input type="number" class="goods-basket-amount" min="1" value="${myList.my_amount}"></span>
							<span class="goods-item-price">${goods.gd_price}</span>
						</span>
						<button class="btn btn-basket-cancle"><i class="icon-item-close"></i></button>
						<button class="btn btn-basket-choice"><i class="icon-item-choice"></i></button>
						<input type="hidden" name="gd_num" value="${goods.gd_num}">
					</div>
				</c:if>
				</c:forEach>
				</c:if>
				</c:forEach>
				</c:forEach>
			</div>
		</div>
		<!-- 주문요약 -->
		<div class="order-container">
			<div class="order-box">
				<h3>총 금액</h3>
				<div class="order-total-price">
				
				</div>
			</div>
			<button class="btn btn-buy">
				<span>구매</span>
				<i class="icon-right"></i>
			</button>
		</div>
	</div>
	<script>
		// 제품 취소 클릭
		$('.btn-basket-cancle').click(function(e){
			e.preventDefault();
			var my_num = $(this).siblings('.goods-item-text-box').find('[name=my_num]').val();
			$.ajax({
		        async:false,
		        type:'GET',
		        url: '<%=request.getContextPath()%>/basket/del?my_num='+my_num,
		        success : function(res){
		        	window.location.reload();
		        }
		    });
		})
		// 제품 찜 클릭
		$('.btn-basket-choice').click(function(e){
			e.preventDefault();
			if($(this).children().hasClass('icon-item-choice')){
				$(this).children().addClass('icon-item-choice-ing');
				$(this).children().removeClass('icon-item-choice');
				var ch_state = 1;
			}else{
				$(this).children().addClass('icon-item-choice');
				$(this).children().removeClass('icon-item-choice-ing');
				var ch_state = 0;
			}
			var ch_gd_num = $(this).siblings('[name=gd_num]').val();
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
		        	window.location.reload();
		        }
		    });
		})
		// 구매 버튼 클릭 
		$('.btn-buy').click(function(e){
			e.preventDefault();
			if($('.basket-goods-box').children().hasClass('basket-goods-item-box')){
				var url = '<%=request.getContextPath()%>/order/buy';
				window.location.replace(url);				
			}else{
				alert('제품이 없습니다.');
				return false;
			}
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
						$('.basket-goods-item-box [name=gd_num]').each(function() {
							if(choice.ch_state == 1){
								$('[value='+choice.ch_gd_num+']').siblings('.btn-basket-choice').children().addClass('icon-item-choice-ing').removeClass('icon-item-choice');								
							}
						});
		        	}
		        }
		    });
		}
		// 수량 변경 시
		$('.goods-basket-amount').change(function() {
			var my_amount = $(this).val();
			var my_num = $(this).parent().siblings('[name=my_num]').val();
			var myList = {
				my_num : my_num,
				my_amount : my_amount
			}
			$.ajax({
		        async:false,
		        type:'POST',
		        data:JSON.stringify(myList),
		        url: '<%=request.getContextPath()%>/basket/amount',
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(res){
		        	if(res == true){
		        		window.location.reload();
		        	}
		        }
		    });
		});
		setTotalPrice();
		//제품의 총 금액 계산하기 
		function setTotalPrice() {
			var totalPriceAll = 0;
			$('.basket-goods-item-box').each(function() {
				var price = $(this).find('.goods-item-price').text();
				var amount = $(this).find('.goods-basket-amount').val();
				var totalPrice = price * amount
				$(this).find('.goods-item-price').text(totalPrice + '원');
				totalPriceAll += totalPrice;
			});
			$('.order-total-price').text(totalPriceAll + '원');
		}
	</script>
</body>
</html>