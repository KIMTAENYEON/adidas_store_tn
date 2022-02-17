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
					<a href="" class="men">MEN</a>
				</li>
				<li class="main-menu-gender">
					<a href="" class="women">WOMEN</a>
				</li>
				<li class="main-menu-gender">
					<a href="" class="kids">KIDS</a>
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
				<div class="search-box">
					<form action="" class="search-input-container">
						<div class="search-input-box">
							<input type="text" class="search-input" placeholder="검색">
						</div>
						<button class="btn btn-search"><i class="icon-search"></i></button>
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
		</div>
	</div>
</body>
</html>