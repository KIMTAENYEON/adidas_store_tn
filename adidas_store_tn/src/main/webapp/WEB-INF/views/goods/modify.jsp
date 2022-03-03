<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/modify.css">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<!-- 유효성검사 -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
	<style>
		.error{ color : red}
	</style>
</head>
<body>
	<div class="body margin-top">
		<form action="<%=request.getContextPath()%>/goods/modify" method="post" enctype="multipart/form-data" id="modify">
			<div class="goods-modify">
				<div class="goods-modify-container after">
					<input type="hidden" name="gd_num" value="${goods.gd_num}">
					<!-- 제품이미지 -->
					<div class="goods-modify-img">
						<h3>이미지 선택</h3>
						<input type="file" id="gd_img" name="file" />
						<div class="select_img"><img src="<%=request.getContextPath()%>${goods.gd_img}"/></div>
					</div>
					<!-- 제품정보 -->
					<div class="goods-modify-information"> 
						<div class="goods-modify-name-box">
							<h3>이름</h3>
							<input type="text" name="gd_name" value="${goods.gd_name}"> 
						</div>
						<div class="goods-modify-gender-box">
							<h3>성별</h3>
							<input type="radio" name="gd_gender" value="Unisex">Unisex 
							<input type="radio" name="gd_gender" value="Man">Man
							<input type="radio" name="gd_gender" value="Women">Women
							<input type="radio" name="gd_gender" value="Kids">Kids
							<br>
							<label id="gd_gender-error" class="error" for="gd_gender"></label>
						</div>
						<div class="goods-modify-category-box">
							<h3>카테고리 선택</h3>
							<select class="goods-modify-category" name="gd_ca_num">
							
							</select>
							<select class="goods-modify-sub-category" name="gd_sub_num">
							
							</select>
						</div>
						<div class="goods-modify-price-box">
							<div class="goods-modify-price">
								<h3>가격</h3>
								<input type="text" name="gd_price" placeholder="1000원 이상 입력하세요." value="${goods.gd_price}">
							</div>
						</div>
					</div>
				</div>
				<!-- 제품상세정보 -->
				<div class="goods-modify-detail">
					<div class="goods-modify-title-box">
						<h3>타이틀</h3>
						<input type="text" name="gd_title" value="${goods.gd_title}">
					</div>
					<div class="goods-modify-content-box">
						<h3>내용</h3>
						<textarea name="gd_content" rows="10">${goods.gd_content}</textarea>
					</div>
					<div class="goods-modify-code-box">
						<h3>제품코드</h3>
						<input type="text" name="gd_code" placeholder="영어와 숫자만 사용가능하며 6자로 구성해주세요." value="${goods.gd_code}">
					</div>
					<div class="goods-modify-material-box">
						<h3>소재</h3>
						<input type="text" name="gd_material" value="${goods.gd_material}">
					</div>
					<div class="goods-modify-color-box">
						<h3>컬러</h3>
						<input type="text" name="gd_color" value="${goods.gd_color}">
					</div>
					<div class="goods-modify-country-box">
						<h3>원산지</h3>
						<input type="text" name="gd_country" value="${goods.gd_country}">
					</div>
					<div class="goods-modify-madeDate-box">
						<h3>제조년월</h3>
						<input type="text" name="gd_made_date" value="${goods.gd_made_date}">
					</div>
					<div class="goods-modify-madeCompany-box">
						<h3>제조사</h3>
						<input type="text" name="gd_made_company" value="${goods.gd_made_company}">
					</div>
				</div>
				<button class="btn btn-goods-modify">
					<span>수정</span>
					<i class="icon-right"></i>
				</button>
				<a href="<%=request.getContextPath()%>/goods/detail?gd_num=${goods.gd_num}" class="btn btn-goods-modify-cancle">
					<span>취소</span>
					<i class="icon-right"></i>
				</a>
			</div>
		</form>
	</div>
	<script>
		//이미지 미리보기
		$("#gd_img").change(function(){
			if(this.files && this.files[0]) {
		  	var reader = new FileReader;
		  	reader.onload = function(data) {
		  		$(".select_img img").attr("src", data.target.result);        
		  	}
		  	reader.readAsDataURL(this.files[0]);
			}
		});
		setCategory();
		setSubCategory(${goods.gd_ca_num});
		getSubCategory();
		//제품에 맞는 서브 카테고리 불러오기
		function getSubCategory() {
			$('.goods-modify-sub-category').find('[value='+${goods.gd_sub_num}+']').prop('selected', 'selected')
		}
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
		        	$('.goods-modify-category').html(str);
		        	$('.goods-modify-category').find('[value='+${goods.gd_ca_num}+']').prop('selected', 'selected')
		        }
		    });
		}
	  	//카테고리 변경시
	  	$('.goods-modify-category').change(function(){
			var ca_num = $(this).val();
			setSubCategory(ca_num);
		});
	  	//서브카테고리 불러오기 함수
	  	function setSubCategory(ca_num){
			var str = '';
			if(ca_num <= 0){
				$('.goods-modify-sub-category').html(str);
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
		        	$('.goods-modify-sub-category').html(str);
		        }
		    });
		}
	  	setGender();
		//제품에 맞는 기존성별 불러오기
		function setGender() {
			var gender = '${goods.gd_gender}';
			$('[value='+gender+']').prop('checked', true);
		}
	  	$(function() {
			// 유효성 검사
		    $("#modify").validate({
		    	rules: {
		             gd_name: {
		                 required : true
		             },
		             gd_gender:{
		             	required: true
		             },
		            	gd_ca_num:{
		            		required: true
		            	},
		             gd_sub_num: {
		             	required : true
		             },
		             gd_price: {
		                 required : true,
		                 regex: /^[1-9]\d{3,}$/
		             },
		             gd_title: {
		             	required : true
		             },
		             gd_content: {
		             	required : true
		             },
		             gd_code: {
		             	required : true,
		             	regex: /^[a-zA-Z0-9]{6}$/
		             },
		             gd_material: {
		             	required : true
		             },
		             gd_color: {
		             	required : true
		             },
		             gd_country: {
		             	required : true
		             },
		             gd_made_date: {
		             	required : true,
		             	regex: /^\d{6}$/
		             },
		             gd_made_company: {
		             	required : true
		             }
		         },
				//규칙체크 실패시 출력될 메시지
				messages : {
				    gd_name: {
				    	required : "필수로입력하세요."
				    },
				    gd_gender:{
				    	required : "필수로입력하세요."
				    },
				   	gd_ca_num:{
				   		required : "필수로입력하세요."
				   	},
				    gd_sub_num: {
				    	required : "필수로입력하세요."
				    },
				    gd_price: {
				   	 	required : "필수로입력하세요.",
				        regex: "숫자만 입력 가능하고, 1000원 이상 입력해주세요. (0부터 시작할 수 없습니다.)"
				    },
				    gd_title: {
				    	required : "필수로입력하세요."
				    },
				    gd_content: {
				    	required : "필수로입력하세요."
				    },
				    gd_code: {
				    	required : "필수로입력하세요.",
				    	regex: "영어와 숫자만 입력 가능하고, 6자로 구성해주세요."
				    },
				    gd_material: {
				    	required : "필수로입력하세요."
				    },
				    gd_color: {
				    	required : "필수로입력하세요."
				    },
				    gd_country: {
				    	required : "필수로입력하세요."
				    },
				    gd_made_date: {
				    	required : "필수로입력하세요.",
				    	regex: "숫자만 입력 가능하고, 6자로 구성해주세요. 예) 220201"
				    },
				    gd_made_company: {
				    	required : "필수로입력하세요."
				    }
		       	}
		   	});
		  	$.validator.addMethod(
		 	 		"regex",
		 	    function(value, element, regexp) {
		 	        var re = new RegExp(regexp);
		 	        return this.optional(element) || re.test(value);
		 	    },
		 	    "Please check your input."
			);
		})
	</script>
</body>
</html>