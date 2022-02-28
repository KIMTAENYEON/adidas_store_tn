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
		<input type="hidden" name="op_gd_num" value="${op_gd_num}">
		사이즈
		<input type="text" name="op_size" placeholder="5자 이내로 입력하세요.">
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