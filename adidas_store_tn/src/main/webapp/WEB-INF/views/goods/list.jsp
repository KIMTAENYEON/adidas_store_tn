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
	<div class="body margin-top">
		<div class="goods-list">
			<div class="goods-list-select-option-container">
				<a href="" class="btn btn-goods-insert">
					<span>제품등록</span>
					<i class="icon-right"></i>
				</a>
				<div class="goods-list-select-search-box">
					<h1>"검색결과"</h1>
				</div>
				<div class="goods-list-select-option-box">

				</div>
			</div>
			<div class="godds-item-list-container">

			</div>
		</div>
	</div>
</body>
</html>