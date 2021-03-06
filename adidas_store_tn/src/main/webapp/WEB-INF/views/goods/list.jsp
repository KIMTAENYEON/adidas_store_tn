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
							<span class="search-text">"${pm.criteria.search}"</span>
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
								<option value="4">인기순</option>
							</select>
						</span>
						<input type="hidden" class="search-input" placeholder="검색" name="search" value="${pm.criteria.search}">
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
								<input type="hidden" name="gd_num" value="${goods.gd_num}">
								<img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt="">
								<button type="button" class="btn btn-item-choice"><i class="icon-item-choice"></i></button>
							</span>
							<span class="goods-item-text-box">
								<span class="goods-item-name">${goods.gd_name}</span>
								<span class="goods-item-price">${goods.gd_price}</span>
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
			<!-- 최근에 본 제품 -->
			<div class="recently-product">
				<div class="recently-product-container">
					<div class="recently-product-text-box">
						<div class="recently-product-text">
							<h3>최근에 본 제품</h3>
						</div>
					</div>
					<div class="recently-product-list-box">
						<div class="recently-product-list-container">
							<!-- 최근에 본 제품리스트 -->
							<div class="recently-product-list">
								<!-- 최근에 본 아이템 -->
								
							</div>
							<div class="recently-product-btn-box">
								<button type="button" class="btn btn-prev"><i class="icon-left"></i></button>
								<button type="button" class="btn btn-next"><i class="icon-right"></i></button>
							</div>
						</div>
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
		setCategory('${select.se_gender}');
	  	//카테고리 목록 불러오기 함수
	  	function setCategory(gender){
			var str = '<option value="0">카테고리</option>';
			$.ajax({
		        async:false,
		        type:'GET',
		        url: '<%=request.getContextPath()%>/category?gender='+gender,
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
	  	//성별 변경시
	  	$('.goods-select-gender').change(function(){
			var gender = $(this).val();
			setCategory(gender);
		});
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
		getSelectOption();
		//선택된 옵션 불러오기
		function getSelectOption() {
			var gender = '${select.se_gender}';
			var se_new = '${select.se_new}';
			$('.goods-select-gender').find('[value='+gender+']').prop('selected', 'selected');
			setCategory(gender);
			$('.goods-select-category').find('[value='+${select.se_ca_num}+']').prop('selected', 'selected');
			setSubCategory(${select.se_ca_num});
			$('.goods-select-subcategory').find('[value='+${select.se_sub_num}+']').prop('selected', 'selected');	
			if(${select.se_min_price} > 0){
				$('[name=se_min_price]').val(${select.se_min_price});
			}
			if(${select.se_max_price} > 0){
				$('[name=se_max_price]').val(${select.se_max_price});
			}
			$('.goods-select-lineup').find('[value='+${select.se_lineup}+']').prop('selected', 'selected');	
			if(se_new == 'on'){
				$('[name=se_new]').prop('checked', true);
			}
		}
		//재고추가시 이벤트 막기
		$('.btn-item-add').click(function(e) {
			e.preventDefault();
		})
		//찜하기버튼 클릭
		$('.btn-item-choice').click(function(e){
			e.preventDefault();
			var user = "${user.me_email}";
			if(user == null || user == ""){
				return;
			}
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
		        	
		        }
		    });
		})
		getChoiceState();
		//로그인한 유저의 찜상태 가져오기
		function getChoiceState() {
			var user = "${user.me_email}";
			if(user == null || user == ""){
				return;
			}
			$.ajax({
		        async:false,
		        type:'POST',
		        url:'<%=request.getContextPath()%>/choice/state',
		        dataType:"json",
		        success : function(res){
		        	var list = res.list
		        	if(list != null){
			        	for(choice of list){
							$('.goods-item-box [name=gd_num]').each(function() {
								if(choice.ch_state == 1){
									$('[value='+choice.ch_gd_num+']').siblings('.btn-item-choice').children().addClass('icon-item-choice-ing').removeClass('icon-item-choice');								
								}
							});
			        	}
		        	}
		        }
		    });
		}
		//쿠키 가져오기
		function getCookie(name) {
		  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		  return value? value[2] : null;
		}
		//최근에 본 제품 리스트 가져오기
		getProduct();
		function getProduct() {
			var val = getCookie('product');
			var token = ',';
			if(val == null){
				$('.recently-product').hide();
			}else{
				var arr = val.split(token);
				$.ajax({
			        async:false,
			        type:'GET',
			        url: '<%=request.getContextPath()%>/product?gd_num='+arr,
			        dataType:"json",
			        success : function(res){
			        	var list = res.list
			        	if(list != null){
			        		var str = '';
			        		for(product of list){
			        			str = createProduct(product);
			        			$('.recently-product-list').prepend(str);
			        		}
			        	}
			        }
			    });
			}
		}
		// 최근에 본 제품 리스트 html코드 만들기
		function createProduct(product) {
			var str = 		'<div class="recently-product-item-box">';
				str +=			'<a href="<%=request.getContextPath()%>/goods/detail?gd_num=' + product.gd_num + '" class="recently-product-item">';
				str +=				'<span class="goods-item-img-box">';
				str +=					'<img src="<%=request.getContextPath()%>/img/' + product.gd_img +'" alt="">';
				str +=				'</span>';
				str +=				'<span class="goods-item-text-box">';
				str +=					'<span class="goods-item-name">'+ product.gd_name +'</span>';
				str +=					'<span class="goods-item-price">'+ product.gd_price +'</span>';
				str +=				'</span>';
				str +=			'</a>';
				str +=		'</div>';
			return str;
		}
		// 최근에 본 제품 다음버튼클릭
		$('.recently-product .btn-next').click(function(){
			console.log(1);
			var productNext = $('.recently-product-list .end').nextAll().length
			var productNextMargin = (productNext * 20)
			if(productNext >= 5){
				$('.recently-product-list').animate({marginLeft : '-=100%'});
				$('.recently-product-list .end').nextAll().eq(4).addClass('end');
				$('.recently-product-list .end').first().removeClass('end');
				$('.recently-product-list .start').nextAll().eq(4).addClass('start');
				$('.recently-product-list .start').first().removeClass('start');
				$('.recently-product .btn-prev').show();
			}
			if(productNext >= 1 && productNext < 5){
				$('.recently-product-list').animate({marginLeft : '-='+productNextMargin+'%'});
				$('.recently-product-list .end').nextAll().eq(productNext -1).addClass('end');
				$('.recently-product-list .end').first().removeClass('end');
				$('.recently-product-list .start').nextAll().eq(productNext -1).addClass('start');
				$('.recently-product-list .start').first().removeClass('start');
				$('.recently-product .btn-prev').show();
			}
			var productNext = $('.recently-product-list .end').nextAll().length
			if(productNext == 0){
				$('.recently-product .btn-next').hide();
			}
		});
		// 최근에 본 제품 이전버튼클릭
		$('.recently-product .btn-prev').click(function(){
			var productPrev = $('.recently-product-list .start').prevAll().length
			var productPrevMargin = (productPrev * 20)
			if(productPrev >= 5){
				$('.recently-product-list').animate({marginLeft : '+=100%'});
				$('.recently-product-list .end').prevAll().eq(4).addClass('end');
				$('.recently-product-list .end').last().removeClass('end');
				$('.recently-product-list .start').prevAll().eq(4).addClass('start');
				$('.recently-product-list .start').last().removeClass('start');
				$('.recently-product .btn-next').show();
			}
			if(productPrev >= 1 && productPrev < 5){
				$('.recently-product-list').animate({marginLeft : '+='+productPrevMargin+'%'});
				$('.recently-product-list .end').prevAll().eq(productPrev -1).addClass('end');
				$('.recently-product-list .end').last().removeClass('end');
				$('.recently-product-list .start').prevAll().eq(productPrev -1).addClass('start');
				$('.recently-product-list .start').last().removeClass('start');
				$('.recently-product .btn-next').show();
			}
			var productPrev = $('.recently-product-list .start').prevAll().length
			if(productPrev == 0){
				$('.recently-product .btn-prev').hide();
			}
		});
		//최근에 본 제품 시작지점, 끝지점 설정
		setStartEnd();
		function setStartEnd(){
			$('.recently-product-list').children().eq(0).addClass('start');
			$('.recently-product-list').children().eq(4).addClass('end');
			if($('.recently-product-list').children().length <= 5){
				$('.recently-product .btn-next').hide();
			}
		}
		setComma();
		//콤마 찍기
		function setComma() {
			$('.goods-item-price').each(function() {
				var price = $(this).text();
				price = parseInt(price);
				var priceComma = price.toLocaleString('ko-KR');
				$(this).text(priceComma + '원');
			});
		}
		//검색후 옵션선택시 
		setSearch();
		function setSearch() {
			if($('.search-text').nextAll().length > 0){
				$('.search-text').after('<span class="and"> · </span>');
			}
		}
	</script>
</body>
</html>