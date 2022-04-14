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
					<a href="<%=request.getContextPath()%>/member/choice" class="choice"><i class="icon-choice"></i></a>
				</div>
				<div class="basket-box">
					<a href="<%=request.getContextPath()%>/member/basket" class="basket"><i class="icon-basket"></i></a>
				</div>
			</div>
			<!-- 메인메뉴 호버 -->
			<div class="category-container">
				<!-- 남성호버 -->
				<div class="category-container-MAN">
					<div class="category-box">
						<div class="cate-box">
							<div class="cate-head">
								<a href="<%=request.getContextPath()%>/goods/list?se_gender=Man">남성</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Man&se_new=on">신상품</a>
								</li>
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Man&se_lineup=4">인기상품</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="<%=request.getContextPath()%>/goods/list?se_gender=Man&se_ca_num=1">신발</a>
							</div>
							<ul class="cate-sub Man-shoes">
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="<%=request.getContextPath()%>/goods/list?se_gender=Man&se_ca_num=2">의류</a>
							</div>
							<ul class="cate-sub Man-clothing">
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="<%=request.getContextPath()%>/goods/list?se_gender=Man&se_ca_num=3">용품</a>
							</div>
							<ul class="cate-sub Man-accessories">
							</ul>
						</div>
					</div>
				</div>
				<!-- 여성호버 -->
				<div class="category-container-WOMEN">
					<div class="category-box">
						<div class="cate-box">
							<div class="cate-head">
								<a href="<%=request.getContextPath()%>/goods/list?se_gender=Women">여성</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Women&se_new=on">신상품</a>
								</li>
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Women&se_lineup=4">인기상품</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="<%=request.getContextPath()%>/goods/list?se_gender=Women&se_ca_num=1">신발</a>
							</div>
							<ul class="cate-sub Women-shoes">
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="<%=request.getContextPath()%>/goods/list?se_gender=Women&se_ca_num=2">의류</a>
							</div>
							<ul class="cate-sub Women-clothing">
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="<%=request.getContextPath()%>/goods/list?se_gender=Women&se_ca_num=3">용품</a>
							</div>
							<ul class="cate-sub Women-accessories">
							</ul>
						</div>
					</div>
				</div>
				<!-- 키즈호버 -->
				<div class="category-container-KIDS">
					<div class="category-box">
						<div class="cate-box">
							<div class="cate-head">
								<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids">키즈</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_new=on">신상품</a>
								</li>
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_lineup=4">인기상품</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_ca_num=4">청소년</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_ca_num=4&se_sub_num=19">신발</a>
								</li>
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_ca_num=4&se_sub_num=20">의류</a>
								</li>
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_ca_num=4&se_sub_num=21">용품</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_ca_num=5">어린이</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_ca_num=5&se_sub_num=22">신발</a>
								</li>
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_ca_num=5&se_sub_num=23">의류</a>
								</li>
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_ca_num=5&se_sub_num=24">용품</a>
								</li>
							</ul>
						</div>
						<div class="cate-box">
							<div class="cate-head">
								<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_ca_num=6">유아</a>
							</div>
							<ul class="cate-sub">
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_ca_num=6&se_sub_num=25">신발</a>
								</li>
								<li class="cate-sub-item">
									<a href="<%=request.getContextPath()%>/goods/list?se_gender=Kids&se_ca_num=6&se_sub_num=26">의류</a>
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
			$('.category-container').show();
			var target = $(this).children().text();
			$('.category-container-'+target).show();
		}, function() {
			var target = $(this).children().text();
			$('.category-container-'+target).hide();
			$('.category-container').hide();
		});
		// 메인메뉴 호버해서 나타난 카테고리창 호버
		$('.category-container').children().hover(function() {
			$('.category-container').show();
			$(this).show();
		}, function() {
			$(this).hide();
			$('.category-container').hide();
		});
		// 서브카테고리 목록 가져오기
		getSubCategory()
		function getSubCategory(){
			var man_shoes = '';
			var man_clothing = '';
			var man_accessories = '';
			var women_shoes = '';
			var women_clothing = '';
			var women_accessories = '';
			$.ajax({
		        async:false,
		        type:'GET',
		        url: '<%=request.getContextPath()%>/subcategory/all',
		        dataType:"json",
		        success : function(res){
		        	var list = res.list
		        	for(sub of list){
						if(sub.sub_ca_num == 1){
							man_shoes += '<li class="cate-sub-item">';
							man_shoes += '<a href="<%=request.getContextPath()%>/goods/list?se_gender=Man&se_ca_num=1&se_sub_num='+sub.sub_num+'">'+sub.sub_name+'</a>';
							man_shoes += '</li>';
							women_shoes += '<li class="cate-sub-item">';
							women_shoes += '<a href="<%=request.getContextPath()%>/goods/list?se_gender=Women&se_ca_num=1&se_sub_num='+sub.sub_num+'">'+sub.sub_name+'</a>';
							women_shoes += '</li>';
						}
						if(sub.sub_ca_num == 2){
							if(sub.sub_num <= 11){
								man_clothing += '<li class="cate-sub-item">';
								man_clothing += '<a href="<%=request.getContextPath()%>/goods/list?se_gender=Man&se_ca_num=2&se_sub_num='+sub.sub_num+'">'+sub.sub_name+'</a>';
								man_clothing += '</li>';
							}
							if(sub.sub_num != 6){
								women_clothing += '<li class="cate-sub-item">';
								women_clothing += '<a href="<%=request.getContextPath()%>/goods/list?se_gender=Women&se_ca_num=2&se_sub_num='+sub.sub_num+'">'+sub.sub_name+'</a>';
								women_clothing += '</li>';
							}
						}
						if(sub.sub_ca_num == 3){
							man_accessories += '<li class="cate-sub-item">';
							man_accessories += '<a href="<%=request.getContextPath()%>/goods/list?se_gender=Man&se_ca_num=3&se_sub_num='+sub.sub_num+'">'+sub.sub_name+'</a>';
							man_accessories += '</li>';
							women_accessories += '<li class="cate-sub-item">';
							women_accessories += '<a href="<%=request.getContextPath()%>/goods/list?se_gender=Women&se_ca_num=3&se_sub_num='+sub.sub_num+'">'+sub.sub_name+'</a>';
							women_accessories += '</li>';
						}
		        	}
		        	$('.Man-shoes').html(man_shoes);
		        	$('.Women-shoes').html(women_shoes);
		        	$('.Man-clothing').html(man_clothing);
		        	$('.Women-clothing').html(women_clothing);
		        	$('.Man-accessories').html(man_accessories);
		        	$('.Women-accessories').html(women_accessories);
		        }
		    });
		}
	</script>
</body>
</html>