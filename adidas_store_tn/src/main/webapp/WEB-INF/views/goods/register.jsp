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
</head>
<body>
	<div class="body margin-top">
		<form action="<%=request.getContextPath()%>/goods/register" method="post" enctype="multipart/form-data">
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
							<input type="radio" name="gd_gender" value="unisex">Unisex 
							<input type="radio" name="gd_gender" value="Man">Man
							<input type="radio" name="gd_gender" value="Woman">Woman
							<input type="radio" name="gd_gender" value="Kids">Kids
						</div>
						<div class="goods-register-category-box">
							<h3>카테고리 선택</h3>
							<select class="goods-register-category">
								<option>신발</option>
								<option>의류</option>
								<option>용품</option>
							</select>
							<select class="goods-register-sub-category">
							
							</select>
						</div>
						<div class="goods-register-price-box">
							<div class="goods-register-price">
								<h3>가격</h3>
								<input type="text" name="gd_price">
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
						<input type="text" name="gd_code">
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
						<input type="text" name="gd_made_date">
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
	  $("#gd_img").change(function(){
	  	if(this.files && this.files[0]) {
	    	var reader = new FileReader;
	    	reader.onload = function(data) {
	    		$(".select_img img").attr("src", data.target.result);        
	    	}
	    	reader.readAsDataURL(this.files[0]);
	  	}
	  });
	  setcategory();
	  //카테고리 불러오기 함수
	  function setcategory(){
			var str = '';
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
	</script>
</body>
</html>