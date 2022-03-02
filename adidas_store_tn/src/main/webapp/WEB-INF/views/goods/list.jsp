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
	<!-- 유효성 검사 -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
</head>
<body>
	<div class="body">
		<div class="goods-list">
			<div class="goods-list-select-option-container">
				<c:if test="${user.me_authority == '관리자'}">
					<a href="<%=request.getContextPath()%>/goods/register" class="btn btn-goods-insert">
						<span>제품등록</span>
						<i class="icon-right"></i>
					</a>
				</c:if>
				<!-- 검색결과 -->
				<div class="goods-list-select-search-box">
					<h1>
						<c:if test="${pm.criteria.search != null && pm.criteria.search != ''}">
							<span>${pm.criteria.search}</span>
						</c:if>
						<c:if test="${select.se_gender != null && select.se_gender != '성별'}">
							<span>${select.se_gender}</span>
							<c:if test="${select.se_ca_num != null && select.se_ca_num != 0}">
								<span class="and"> · </span>
							</c:if>
						</c:if>
						<c:if test="${select.se_ca_num != null && select.se_ca_num != 0}">
							<c:if test="${select.se_ca_num == 1}"><span>Shoes</span></c:if>
							<c:if test="${select.se_ca_num == 2}"><span>Clothing</span></c:if>
							<c:if test="${select.se_ca_num == 3}"><span>Accessories</span></c:if>
							<c:if test="${select.se_ca_num == 4}"><span>8-16 Years</span></c:if>
							<c:if test="${select.se_ca_num == 5}"><span>4-8 Years</span></c:if>
							<c:if test="${select.se_ca_num == 6}"><span>1-4 Years</span></c:if>
							<c:if test="${select.se_sub_num != null && select.se_sub_num != 0}">
								<span class="and"> · </span>
								<c:if test="${select.se_sub_num == 1}"><span>Originals</span></c:if>
								<c:if test="${select.se_sub_num == 2}"><span>Running</span></c:if>
								<c:if test="${select.se_sub_num == 3}"><span>Football</span></c:if>
								<c:if test="${select.se_sub_num == 4}"><span>Golf</span></c:if>
								<c:if test="${select.se_sub_num == 5}"><span>Jackets</span></c:if>
								<c:if test="${select.se_sub_num == 6}"><span>Jerseys</span></c:if>
								<c:if test="${select.se_sub_num == 7}"><span>Hoodies</span></c:if>
								<c:if test="${select.se_sub_num == 8}"><span>T-Shirts</span></c:if>
								<c:if test="${select.se_sub_num == 9}"><span>Tracksuits</span></c:if>
								<c:if test="${select.se_sub_num == 10}"><span>Pants</span></c:if>
								<c:if test="${select.se_sub_num == 11}"><span>Shorts</span></c:if>
								<c:if test="${select.se_sub_num == 12}"><span>Tights</span></c:if>
								<c:if test="${select.se_sub_num == 13}"><span>Skirts</span></c:if>
								<c:if test="${select.se_sub_num == 14}"><span>Dresses</span></c:if>
								<c:if test="${select.se_sub_num == 15}"><span>Socks</span></c:if>
								<c:if test="${select.se_sub_num == 16}"><span>Headwear</span></c:if>
								<c:if test="${select.se_sub_num == 17}"><span>Bags</span></c:if>
								<c:if test="${select.se_sub_num == 18}"><span>Gloves</span></c:if>
								<c:if test="${select.se_sub_num == 19 || select.se_sub_num == 22 || select.se_sub_num == 25}"><span>Shoes</span></c:if>
								<c:if test="${select.se_sub_num == 20 || select.se_sub_num == 23 || select.se_sub_num == 26}"><span>Clothing</span></c:if>
								<c:if test="${select.se_sub_num == 21 || select.se_sub_num == 24}"><span>Accessories</span></c:if>
							</c:if>
						</c:if>
						<c:if test="${pm.criteria.search == null || pm.criteria.search == ''}">
							<c:if test="${select.se_gender == null || select.se_gender == '성별'}">
								<c:if test="${select.se_ca_num == null || select.se_ca_num == 0}">
									<span>모든제품</span>
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${select.se_new != null && select.se_new != ''}">
							<span>(신상품)</span>
						</c:if>
					</h1>
				</div>
				<!-- 선택옵션창 -->
				<form action="<%=request.getContextPath()%>/goods/list" id="select-option">
					<div class="goods-list-select-option-box">
						<span class="goods-select-gender-box">
							<select class="goods-select-gender" name="se_gender">
								<option value="성별">성별</option>
								<option value="Unisex">Unisex</option>
								<option value="Man">Man</option>
								<option value="Women">Women</option>
								<option value="Kids">Kids</option>
							</select>
						</span>
						<span class="goods-select-category-box">
							<select class="goods-select-category" name="se_ca_num">
							</select>
						</span>
						<span class="goods-select-subcategory-box">
							<select class="goods-select-subcategory" name="se_sub_num">
								<option value="0">소분류</option>
							</select>
						</span>
						<label class="goods-select-new-box">
							<input type="checkbox" class="goods-select-new" name="se_new">신상품
						</label>
						<span class="goods-select-price-box">
							<input type="text" class="goods-select-min-price" placeholder="최소 가격" name="se_min_price"> ~
							<input type="text" class="goods-select-max-price" placeholder="최대 가격" name="se_max_price">
						</span>
						<span class="goods-select-lineup-box">
							<select class="goods-select-lineup" name="se_lineup">
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
						<a href="<%=request.getContextPath()%>/goods/detail?gd_num=${goods.gd_num}" class="btn btn-goods-item">
							<span class="goods-item-img-box">
								<img src="<%=request.getContextPath()%>${goods.gd_img}" alt="">
								<button type="button" class="btn btn-item-choice"><i class="icon-item-choice"></i></button>
							</span>
							<span class="goods-item-text-box">
								<span class="goods-item-name">${goods.gd_name}</span>
								<span class="goods-item-price">${goods.gd_price}원</span>
								<c:if test="${user.me_authority == '관리자'}">
									<c:forEach var="option" items="${option}">
										<c:if test="${goods.gd_num == option.op_gd_num }">
											<span class="goods-item-amount">남은수량 (${option.op_amount})</span>
										</c:if>
									</c:forEach>
									<button type="button" onclick="window.open('<%=request.getContextPath()%>/goods/add?op_gd_num=${goods.gd_num}','','width=500px, height=200px, top=300px, left=300px')" class="btn btn-item-add">재고추가</button>
								</c:if>
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
							<a href="<%=request.getContextPath()%>/goods/list?page=${pm.criteria.page-1}&search=${pm.criteria.search}&se_gender=${select.se_gender}&se_ca_num=${select.se_ca_num}&se_sub_num=${select.se_sub_num}&se_new=${select.se_new}&se_min_price=${select.se_min_price}&se_max_price=${select.se_max_price}&se_lineup=${select.se_lineup}" class="btn btn-pagination-prev">이전</a>
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
												<a href="<%=request.getContextPath()%>/goods/list?page=${i}&search=${pm.criteria.search}&se_gender=${select.se_gender}&se_ca_num=${select.se_ca_num}&se_sub_num=${select.se_sub_num}&se_new=${select.se_new}&se_min_price=${select.se_min_price}&se_max_price=${select.se_max_price}&se_lineup=${select.se_lineup}" class="page-link">${i}</a>
											</li>
										</c:if>
										<c:if test="${i == pm.criteria.page}">
											<li class="page-item selected">
												<a href="<%=request.getContextPath()%>/goods/list?page=${i}&search=${pm.criteria.search}&se_gender=${select.se_gender}&se_ca_num=${select.se_ca_num}&se_sub_num=${select.se_sub_num}&se_new=${select.se_new}&se_min_price=${select.se_min_price}&se_max_price=${select.se_max_price}&se_lineup=${select.se_lineup}" class="page-link">${i}</a>
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
							<a href="<%=request.getContextPath()%>/goods/list?page=${pm.criteria.page+1}&search=${pm.criteria.search}&se_gender=${select.se_gender}&se_ca_num=${select.se_ca_num}&se_sub_num=${select.se_sub_num}&se_new=${select.se_new}&se_min_price=${select.se_min_price}&se_max_price=${select.se_max_price}&se_lineup=${select.se_lineup}" class="btn btn-pagination-next">다음</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		//옵션 적용시 최소가격, 최대가격 입력안할시 0으로 처리;
		$('.btn-option-apply').click(function() {
			if($('[name=se_min_price]').val() == null || $('[name=se_min_price]').val() == "")
				$('[name=se_min_price]').val(0)
			if($('[name=se_max_price]').val() == null || $('[name=se_max_price]').val() == "")
				$('[name=se_max_price]').val(0)
		});
		setCategory();
	  	//카테고리 목록 불러오기 함수
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
	  	//서브카테고리 목록 불러오기 함수
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