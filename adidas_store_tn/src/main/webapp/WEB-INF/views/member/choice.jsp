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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/choice.css">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="body margin-top">
		<div class="mypage-choice">
			<div class="choice-container">
				<h3>나의 관심목록</h3>
				<div class="choice-box">
					<c:forEach var="goods" items="${goods}">
						<div class="choice-img-box">
							<a href="<%=request.getContextPath()%>/goods/detail?gd_num=${goods.gd_num}" class="btn btn-img-choice">
								<span class="img-box">
									<input type="hidden" name="gd_num" value="${goods.gd_num}">
									<img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt="">
									<span class="price-box">${goods.gd_price}원</span>
									<button type="button" class="btn btn-item-choice"><i class="icon-item-choice"></i></button>
								</span>
								<span class="name-box">${goods.gd_name}</span>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- 우측 메뉴 -->
			<div class="mypage-right-container">
				<div class="mypage-right-box">
					<a href="<%=request.getContextPath()%>/member/logout" class="btn btn-logout">
						<span>로그아웃</span>
						<i class="icon-right"></i>
					</a>
					<a href="<%=request.getContextPath()%>/member/privacy" class="btn btn-privacy">
						<span>개인정보</span>
						<i class="icon-right"></i>
					</a>
					<a href="<%=request.getContextPath()%>/member/orderCheck" class="btn btn-order">
						<span>주문조회</span>
						<i class="icon-right"></i>
					</a>
					<a href="<%=request.getContextPath()%>/member/choice" class="btn btn-choice">
						<span>찜목록</span>
						<i class="icon-right"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
	<script>
		//찜하기 버튼 클릭
		$('.btn-item-choice').click(function(e){
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
						$('.choice-box [name=gd_num]').each(function() {
							if(choice.ch_state == 1){
								$('[value='+choice.ch_gd_num+']').siblings('.btn-item-choice').children().addClass('icon-item-choice-ing').removeClass('icon-item-choice');								
							}
						});
		        	}
		        }
		    });
		}
	</script>
</body>
</html>