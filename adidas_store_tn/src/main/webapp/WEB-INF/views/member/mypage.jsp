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
</head>
<body>
	<div class="body">
		<div class="mypage-container">
			<!-- 나의 장바구니 -->
			<div class="mypage-basket-container margin-top">
				<h3 style=" margin-bottom: 15px; ">나의 장바구니</h3>
				<div class="mypage-basket-box">
					<div class="mypage-basket-img">

					</div>
					<div class="mypage-basket-btn-box">
						<button class="btn btn-mypage">
							<span>나의 장바구니 보기</span>
							<i class="icon-right"></i>
						</button>
					</div>
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
					<a class="btn btn-order">
						<span>주문조회</span>
						<i class="icon-right"></i>
					</a>
					<a class="btn btn-choice">
						<span>찜목록</span>
						<i class="icon-right"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>