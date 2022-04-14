<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>관리자페이지</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin.css">
</head>
<body>
	<div class="body margin-top">
		<div class="admin-page-container">
			<div class="admin-goods-move"> 
				<a href="<%=request.getContextPath()%>/goods/list" class="btn btn-admin-goods">
					<span>제품관리</span>
					<i class="icon-right"></i>
				</a>
			</div>
			<div class="admin-order-move"> 
				<a href="<%=request.getContextPath()%>/admin/orderAdmin" class="btn btn-admin-order">
					<span>주문관리</span>
					<i class="icon-right"></i>
				</a>
			</div>
		</div>
	</div>
</body>
</html>