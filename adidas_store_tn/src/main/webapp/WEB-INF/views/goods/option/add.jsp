<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/add.css">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
</head>
<body>
	<div>
		<input type="hidden" name="op_gd_num" value="${goods.gd_num}">
		사이즈
		<select name="op_size">
			<c:if test="${goods.gd_ca_num == 1}">
				<option value="230">230</option>
				<option value="235">235</option>
				<option value="240">240</option>
				<option value="245">245</option>
				<option value="250">250</option>
				<option value="255">255</option>
				<option value="260">260</option>
				<option value="265">265</option>
				<option value="270">270</option>
				<option value="275">275</option>
				<option value="280">280</option>
			</c:if>
			<c:if test="${goods.gd_ca_num == 2 || goods.gd_sub_num == 20 || goods.gd_sub_num == 23 || goods.gd_sub_num == 26}">
				<option value="XS">XS</option>
				<option value="S">S</option>
				<option value="M">M</option>
				<option value="L">L</option>
				<option value="XL">XL</option>
			</c:if>
			<c:if test="${goods.gd_ca_num == 3 || goods.gd_sub_num == 21 || goods.gd_sub_num == 24}">
				<option value="FREE">FREE</option>
			</c:if>
			<c:if test="${goods.gd_sub_num == 19}">
				<option value="220">220</option>
				<option value="225">225</option>
				<option value="230">230</option>
				<option value="235">235</option>
				<option value="240">240</option>
			</c:if>
			<c:if test="${goods.gd_sub_num == 22}">
				<option value="170">170</option>
				<option value="180">180</option>
				<option value="190">190</option>
				<option value="200">200</option>
				<option value="210">210</option>
			</c:if>
			<c:if test="${goods.gd_sub_num == 25}">
				<option value="120">120</option>
				<option value="130">130</option>
				<option value="140">140</option>
				<option value="150">150</option>
				<option value="160">160</option>
			</c:if>
		</select>
		수량
		<input type="number" name="op_amount">
		<button type="button" class="btn btn-add">추가</button><button type="button" onclick="window.close()" class="btn btn-cancle">취소</button>
	</div>
	<script>
	$(function() {
		$('.btn-add').on('click', function(){
			var op_gd_num = $('[name=op_gd_num]').val();
			var op_size = $('[name=op_size]').val();
			var op_amount = $('[name=op_amount]').val();
			var option = {
				op_gd_num : op_gd_num,
				op_size : op_size,
				op_amount : op_amount
			}
			console.log(option);
			$.ajax({
		        async:false,
		        type:'POST',
		        data:JSON.stringify(option),
		        url: '<%=request.getContextPath()%>/add/option',
		        contentType:"application/json; charset=UTF-8",
		        success : function(res){
		        	if(res){
		        		opener.parent.location.reload();
		        		self.close();
		        	}else{
		        		alert('다시 입력하세요.');
		        	}
		        }
		    });
		});
	});
	</script>
</body>
</html>