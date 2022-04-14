<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이 페이지</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage.css">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="body">
		<div class="mypage-container">
			<!-- 나의 장바구니 -->
			<div class="mypage-basket-container margin-top">
				<h3>나의 장바구니</h3>
				<c:if test="${goods.size() == 0 }">
					<h2>장바구니가 비었습니다.</h2>
				</c:if>
				<div class="mypage-basket-box">
					<div class="mypage-basket-img-container">
						<div class="mypage-basket-img-box">
							<c:forEach var="goods" items="${goods}">
								<div class="mypage-basket-img">
									<span class="goods-item-img-box">
										<img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt="">
									</span>
								</div>
							</c:forEach>
						</div>
						<div class="mypage-basket-img-btn-box">
							<button type="button" class="btn btn-prev"><i class="icon-left"></i></button>
							<button type="button" class="btn btn-next"><i class="icon-right"></i></button>
						</div>
					</div>
					<c:if test="${goods.size() != 0 }">
					<div class="mypage-basket-btn-box">
						<a href="<%=request.getContextPath()%>/member/basket" class="btn btn-mypage">
							<span>나의 장바구니 보기</span>
							<i class="icon-right"></i>
						</a>
					</div>
					</c:if>
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
		// 마이페이지 다음버튼클릭
		$('.mypage-basket-img-btn-box .btn-next').click(function(){
			var basketNext = $('.mypage-basket-img-box .end').nextAll().length
			var basketNextMargin = (basketNext * 25)
			if(basketNext >= 4){
				$('.mypage-basket-img-box').animate({marginLeft : '-=100%'});
				$('.mypage-basket-img-box .end').nextAll().eq(3).addClass('end');
				$('.mypage-basket-img-box .end').first().removeClass('end');
				$('.mypage-basket-img-box .start').nextAll().eq(3).addClass('start');
				$('.mypage-basket-img-box .start').first().removeClass('start');
				$('.mypage-basket-img-btn-box .btn-prev').show();
			}
			if(basketNext >= 1 && basketNext < 4){
				$('.mypage-basket-img-box').animate({marginLeft : '-='+basketNextMargin+'%'});
				$('.mypage-basket-img-box .end').nextAll().eq(basketNext -1).addClass('end');
				$('.mypage-basket-img-box .end').first().removeClass('end');
				$('.mypage-basket-img-box .start').nextAll().eq(basketNext -1).addClass('start');
				$('.mypage-basket-img-box .start').first().removeClass('start');
				$('.mypage-basket-img-btn-box .btn-prev').show();
			}
			var basketNext = $('.mypage-basket-img-box .end').nextAll().length
			if(basketNext == 0){
				$('.mypage-basket-img-btn-box .btn-next').hide();
			}
		});
		// 마이페이지 이전버튼클릭
		$('.mypage-basket-img-btn-box .btn-prev').click(function(){
			var basketPrev = $('.mypage-basket-img-box .start').prevAll().length
			var basketPrevMargin = (basketPrev * 25)
			if(basketPrev >= 4){
				$('.mypage-basket-img-box').animate({marginLeft : '+=100%'});
				$('.mypage-basket-img-box .end').prevAll().eq(3).addClass('end');
				$('.mypage-basket-img-box .end').last().removeClass('end');
				$('.mypage-basket-img-box .start').prevAll().eq(3).addClass('start');
				$('.mypage-basket-img-box .start').last().removeClass('start');
				$('.mypage-basket-img-btn-box .btn-next').show();
			}
			if(basketPrev >= 1 && basketPrev < 4){
				$('.mypage-basket-img-box').animate({marginLeft : '+='+basketPrevMargin+'%'});
				$('.mypage-basket-img-box .end').prevAll().eq(basketPrev -1).addClass('end');
				$('.mypage-basket-img-box .end').last().removeClass('end');
				$('.mypage-basket-img-box .start').prevAll().eq(basketPrev -1).addClass('start');
				$('.mypage-basket-img-box .start').last().removeClass('start');
				$('.mypage-basket-img-btn-box .btn-next').show();
			}
			var basketPrev = $('.mypage-basket-img-box .start').prevAll().length
			if(basketPrev == 0){
				$('.mypage-basket-img-btn-box .btn-prev').hide();
			}
		});
		setStartEnd();
		function setStartEnd(){
			$('.mypage-basket-img-box').children().eq(0).addClass('start');
			$('.mypage-basket-img-box').children().eq(3).addClass('end');
			if($('.mypage-basket-img-box').children().length <= 4){
				$('.mypage-basket-img-btn-box .btn-next').hide();
			}
		}
	</script>
</body>
</html>