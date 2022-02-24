<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>제품등록</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/register.css">
	<!-- 유효성검사 -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
	<style>
		.error{ color : red}
	</style>
</head>
<body>
	<div class="body margin-top">
		<form action="<%=request.getContextPath()%>/goods/register" method="post" enctype="multipart/form-data" id="register">
			<div class="goods-register">
				<div class="goods-register-container after">
					<!-- 제품이미지 -->
					<div class="goods-register-img">
						<h3>이미지 선택</h3>
						<input type="file" id="gd_img" name="file" />
						<div class="select_img"><img src=""/></div>
					</div>
					<!-- 제품정보 -->
					<div class="goods-register-information"> 
						<div class="goods-register-name-box">
							<h3>이름</h3>
							<input type="text" name="gd_name"> 
						</div>
						<div class="goods-register-gender-box">
							<h3>성별</h3>
							<input type="radio" name="gd_gender" value="Unisex">Unisex 
							<input type="radio" name="gd_gender" value="Man">Man
							<input type="radio" name="gd_gender" value="Women">Women
							<input type="radio" name="gd_gender" value="Kids">Kids
							<br>
							<label id="gd_gender-error" class="error" for="gd_gender"></label>
						</div>
						<div class="goods-register-category-box">
							<h3>카테고리 선택</h3>
							<select class="goods-register-category" name="gd_ca_num">
								
							</select>
							<select class="goods-register-sub-category" name="gd_sub_num">
							
							</select>
						</div>
						<div class="goods-register-price-box">
							<div class="goods-register-price">
								<h3>가격</h3>
								<input type="text" name="gd_price" placeholder="1000원 이상 입력하세요.">
							</div>
						</div>
					</div>
				</div>
				<!-- 제품상세정보 -->
				<div class="goods-register-detail">
					<div class="goods-register-title-box">
						<h3>타이틀</h3>
						<input type="text" name="gd_title">
					</div>
					<div class="goods-register-content-box">
						<h3>내용</h3>
						<textarea name="gd_content" rows="10"></textarea>
					</div>
					<div class="goods-register-code-box">
						<h3>제품코드</h3>
						<input type="text" name="gd_code" placeholder="영어와 숫자만 사용가능하며 6자로 구성해주세요.">
					</div>
					<div class="goods-register-material-box">
						<h3>소재</h3>
						<input type="text" name="gd_material">
					</div>
					<div class="goods-register-color-box">
						<h3>컬러</h3>
						<input type="text" name="gd_color">
					</div>
					<div class="goods-register-country-box">
						<h3>원산지</h3>
						<input type="text" name="gd_country">
					</div>
					<div class="goods-register-madeDate-box">
						<h3>제조년월</h3>
						<input type="text" name="gd_made_date" placeholder="년월일로 6자로 구성해주세요. 예) 220201">
					</div>
					<div class="goods-register-madeCompany-box">
						<h3>제조사</h3>
						<input type="text" name="gd_made_company">
					</div>
				</div>
				<button type="submit" class="btn btn-goods-register">
					<span>등록</span>
					<i class="icon-right"></i>
				</button>
			</div>
		</form>
	</div>
	<script>
		//등록전송시
		$("#register").submit(function() {
			var img = $('[name=file]').val();
			if(img == null || img == ""){
				alert('이미지를 선택해주세요.')
				return false;
			}
		});
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
		        	$('.goods-register-category').html(str);
		        }
		    });
		}
	  	//카테고리 변경시
	  	$('.goods-register-category').change(function(){
			var ca_num = $(this).val();
			setSubCategory(ca_num);
		});
	  	//서브카테고리 불러오기 함수
	  	function setSubCategory(ca_num){
			var str = '';
			if(ca_num <= 0){
				$('.goods-register-sub-category').html(str);
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
		        	$('.goods-register-sub-category').html(str);
		        }
		    });
		}
		$(function() {
			// 유효성 검사
		    $("#register").validate({
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