<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<title>Document</title>
</head>
<body>
	<div class="header">
		<div class="header-container">
			<div class="logo-box">
				<a href="<%=request.getContextPath()%>/" class="logo"></a>
			</div>
			<ul class="main-menu">
				<li class="main-menu-gender">
					<a href="<%=request.getContextPath()%>/goods/list?se_gender=Man" class="man">MAN</a>
				</li>
				<li class="main-menu-gender">
					<a href="<%=request.getContextPath()%>/goods/list?se_gender=Women" class="women">WOMEN</a>
				</li>
				<li class="main-menu-gender">
					<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids" class="kids">KIDS</a>
				</li>
			</ul>
			<div class="right-menu">
				<div class="login-user-box">
					<c:if test="${user == null}">
						<a href="<%=request.getContextPath()%>/member/login" class="login">로그인</a>
					</c:if>
					<c:if test="${user != null}">
						<a href="<%=request.getContextPath()%>/member/mypage" class="user">${user.me_name}님</a>
					</c:if>
				</div>
				<c:if test="${user.me_authority == '관리자'}">
					<div class="admin-page-box">
						<a href="<%=request.getContextPath()%>/admin" class="login">관리자페이지</a>
					</div>
				</c:if>
				<div class="search-box">
					<form action="<%=request.getContextPath()%>/goods/list" class="search-input-container">
						<div class="search-input-box">
							<input type="text" class="search-input" placeholder="검색" name="search" value="${pm.criteria.search}">
						</div>
						<button class="btn btn-search" type="submit"><i class="icon-search"></i></button>
					</form>
				</div>
				<div class="mypage-box">
					<a href="<%=request.getContextPath()%>/member/mypage" class="mypage"><i class="icon-mypage"></i></a>
				</div>
				<div class="choice-box">
					<a href="" class="choice"><i class="icon-choice"></i></a>
				</div>
				<div class="basket-box">
					<a href="" class="basket"><i class="icon-basket"></i></a>
				</div>
			</div>
			<!-- 메인메뉴 호버 -->
			<div class="category-container">
				<!-- 남성호버 -->
				<div class="category-container-MAN">
					<div class="category-box">
						<div class="cate-box">
							<div class="cate-head">
								<a href="">남성</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="">신상품</a>
								</li>
								<li class="cate-sub-item">
									<a href="">인기상품</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="">신발</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="">오리지널스</a>
								</li>
								<li class="cate-sub-item">
									<a href="">러닝</a>
								</li>
								<li class="cate-sub-item">
									<a href="">축구</a>
								</li>
								<li class="cate-sub-item">
									<a href="">골프</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="">의류</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="">자켓</a>
								</li>
								<li class="cate-sub-item">
									<a href="">축구저지</a>
								</li>
								<li class="cate-sub-item">
									<a href="">후디</a>
								</li>
								<li class="cate-sub-item">
									<a href="">티셔츠</a>
								</li>
								<li class="cate-sub-item">
									<a href="">트랙수트/트랙탑</a>
								</li>
								<li class="cate-sub-item">
									<a href="">팬츠</a>
								</li>
								<li class="cate-sub-item">
									<a href="">반바지</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="">용품</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="">양말</a>
								</li>
								<li class="cate-sub-item">
									<a href="">모자</a>
								</li>
								<li class="cate-sub-item">
									<a href="">가방</a>
								</li>
								<li class="cate-sub-item">
									<a href="">장갑</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 여성호버 -->
				<div class="category-container-WOMEN">
					<div class="category-box">
						<div class="cate-box">
							<div class="cate-head">
								<a href="">여성</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="">신상품</a>
								</li>
								<li class="cate-sub-item">
									<a href="">인기상품</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="">신발</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="">오리지널스</a>
								</li>
								<li class="cate-sub-item">
									<a href="">러닝</a>
								</li>
								<li class="cate-sub-item">
									<a href="">축구</a>
								</li>
								<li class="cate-sub-item">
									<a href="">골프</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="">의류</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="">자켓</a>
								</li>
								<li class="cate-sub-item">
									<a href="">축구저지</a>
								</li>
								<li class="cate-sub-item">
									<a href="">후디</a>
								</li>
								<li class="cate-sub-item">
									<a href="">티셔츠</a>
								</li>
								<li class="cate-sub-item">
									<a href="">트랙수트/트랙탑</a>
								</li>
								<li class="cate-sub-item">
									<a href="">팬츠</a>
								</li>
								<li class="cate-sub-item">
									<a href="">반바지</a>
								</li>
								<li class="cate-sub-item">
									<a href="">타이즈</a>
								</li>
								<li class="cate-sub-item">
									<a href="">스커트</a>
								</li>
								<li class="cate-sub-item">
									<a href="">원피스</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="">용품</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="">양말</a>
								</li>
								<li class="cate-sub-item">
									<a href="">모자</a>
								</li>
								<li class="cate-sub-item">
									<a href="">가방</a>
								</li>
								<li class="cate-sub-item">
									<a href="">장갑</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 키즈호버 -->
				<div class="category-container-KIDS">
					<div class="category-box">
						<div class="cate-box">
							<div class="cate-head">
								<a href="">키즈</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="">신상품</a>
								</li>
								<li class="cate-sub-item">
									<a href="">인기상품</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="">청소년</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="">신발</a>
								</li>
								<li class="cate-sub-item">
									<a href="">의류</a>
								</li>
								<li class="cate-sub-item">
									<a href="">용품</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="">어린이</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="">신발</a>
								</li>
								<li class="cate-sub-item">
									<a href="">의류</a>
								</li>
								<li class="cate-sub-item">
									<a href="">용품</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="">유아</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="">신발</a>
								</li>
								<li class="cate-sub-item">
									<a href="">의류</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 메인메뉴 호버
		$('.main-menu-gender').hover(function() {
			var target = $(this).children().text();
			$('.category-container-'+target).show();
		}, function() {
			var target = $(this).children().text();
			$('.category-container-'+target).hide();
		});
		// 메인메뉴 호버해서 나타난 카테고리창 호버
		$('.category-container').children().hover(function() {
			$(this).show();
		}, function() {
			$(this).hide();
		});
	</script>
</body>
</html>