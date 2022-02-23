<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	
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
							</select>
						</span>
						<span class="goods-select-subcategory-box">
							<select class="goods-select-subcategory" name="gd_sub_num">
								<option value="0">소분류</option>
							</select>
						</span>
						<span class="goods-select-size-box">
							<select class="goods-select-size" name="op_size">
								<option value="0">사이즈</option>
								<option value="">S</option>
								<option value="">M</option>
								<option value="">L</option>
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
				<c:forEach var="goods" items="${list}">
					<div class="goods-item-box">
						<a href="" class="btn btn-goods-item">
							<input type="hidden" name="gd_num" value="${goods.gd_num}">
							<span class="goods-item-img-box">
								<img src="<%=request.getContextPath()%>${goods.gd_img}" alt="">
								<button type="button" class="btn btn-item-choice"><i class="icon-item-choice"></i></button>
							</span>
							<span class="goods-item-text-box">
								<span class="goods-item-name">${goods.gd_name}</span>
								<span class="goods-item-price">${goods.gd_price}원</span>
							</span>
						</a>
					</div>
				</c:forEach>
			</div>
			<!-- 페이지네이션 -->
			<div class="goods-list-pagination-container">
				<div class="goods-list-pagination-box">
					<div class="pagination-prev-box">
						<c:if test="${pm.prev}">
							<a href="<%=request.getContextPath()%>/goods/list?page=${pm.criteria.page-1}" class="btn btn-pagination-prev">이전</a>
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
												<a href="<%=request.getContextPath()%>/goods/list?page=${i}" class="page-link">${i}</a>
											</li>
										</c:if>
										<c:if test="${i == pm.criteria.page}">
											<li class="page-item selected">
												<a href="<%=request.getContextPath()%>/goods/list?page=${i}" class="page-link">${i}</a>
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
							<a href="<%=request.getContextPath()%>/goods/list?page=${pm.criteria.page+1}" class="btn btn-pagination-next">다음</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		setCategory();
	  	//카테고리 불러오기 함수
	  	function setCategory(){
			var str = '<option value="0">카테고리</option>';
			$.ajax({
		        async:false,
		        type:'GET',
		        url: '<%=request.getContextPath()%>/category',
		        dataType:"json",
		        success : function(res){
	        		var list = res.list
		        	for(ca of list){
						str += '<option value="'+ca.ca_num+'">'+ca.ca_name+'</option>';
		        	}
		        	$('.goods-select-category').html(str);
		        }
		    });
		}
	  	//카테고리 변경시
	  	$('.goods-select-category').change(function(){
			var ca_num = $(this).val();
			setSubCategory(ca_num);
		});
	  	//서브카테고리 불러오기 함수
	  	function setSubCategory(ca_num){
			var str = '<option value="0">소분류</option>';
			if(ca_num <= 0){
				$('.goods-select-subcategory').html(str);
				return;
			}
			$.ajax({
		        async:false,
		        type:'GET',
		        url: '<%=request.getContextPath()%>/subcategory?sub_ca_num='+ca_num,
		        dataType:"json",
		        success : function(res){
	        		var list = res.list
		        	for(sub of list){
						str += '<option value="'+sub.sub_num+'">'+sub.sub_name+'</option>';
		        	}
		        	$('.goods-select-subcategory').html(str);
		        }
		    });
		}
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
	</script>
</body>
</html>