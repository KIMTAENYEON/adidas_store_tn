<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>제품리스트</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/list.css">
</head>
<body>
	<div class="body">
		<div class="goods-list">
			<div class="goods-list-select-option-container">
				<a href="<%=request.getContextPath()%>/goods/register" class="btn btn-goods-insert">
					<span>제품등록</span>
					<i class="icon-right"></i>
				</a>
				<!-- 검색결과 -->
				<div class="goods-list-select-search-box">
					<h1>
						<span>Men</span>
						<span class="and"> · </span>
						<span>Shoes</span>
					</h1>
				</div>
				<!-- 선택옵션창 -->
				<form action="">
					<div class="goods-list-select-option-box">
						<span class="goods-select-gender-box">
							<select class="goods-select-gender" name="gd_gender">
								<option value="0">성별</option>
								<option value="Unisex">Unisex</option>
								<option value="Man">Man</option>
								<option value="Woman">Woman</option>
								<option value="Kids">Kids</option>
							</select>
						</span>
						<span class="goods-select-category-box">
							<select class="goods-select-category" name="gd_ca_num">
								<option value="0">카테고리</option>
								<option value="1">신발</option>
								<option value="2">의류</option>
								<option value="3">용품</option>
							</select>
						</span>
						<span class="goods-select-subcategory-box">
							<select class="goods-select-subcategory" name="gd_sub_num">
								<option value="0">소분류</option>
								<option value="1">오리지널스</option>
								<option value="2">러닝</option>
								<option value="3">축구</option>
							</select>
						</span>
						<span class="goods-select-size-box">
							<select class="goods-select-size" name="op_size">
								<option value="0">사이즈</option>
								<option value="1">S</option>
								<option value="2">M</option>
								<option value="3">L</option>
							</select>
						</span>
						<label class="goods-select-new-box">
							<input type="checkbox" class="goods-select-new" name="new">신상품
						</label>
						<span class="goods-select-price-box">
							<input type="number" class="goods-select-min-price" placeholder="최소 가격"> ~
							<input type="number" class="goods-select-max-price" placeholder="최대 가격">
						</span>
						<span class="goods-select-lineup-box">
							<select class="goods-select-lineup" name="lineup">
								<option value="0">정렬기준</option>
								<option value="1">가격낮은순</option>
								<option value="2">가격높은순</option>
								<option value="3">최신순</option>
								<option value="4">인기상품</option>
							</select>
						</span>
						<button type="submit" class="btn btn-option-apply">
							적용
							<i class="icon-right"></i>
						</button>
						<button type="reset" class="btn btn-option-reset">
							초기화
							<i class="icon-right"></i>
						</button>
					</div>
				</form>
			</div>
			<!-- 제품리스트 -->
			<div class="goods-item-list-container">
				<div class="goods-item-box">
					<a href="" class="btn btn-goods-item">
						<span class="goods-item-img-box">
							<img src="<%=request.getContextPath()%>\/resources/imgUpload\/2022/02/22/f356c84d-7dec-4d0f-842f-61d318602f4f_GW2499.png" alt="">
							<button type="button" class="btn btn-item-choice"><i class="icon-item-choice"></i></button>
						</span>
						<span class="goods-item-text-box">
							<span class="goods-item-name">name</span>
							<span class="goods-item-price">10000원</span>
						</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>