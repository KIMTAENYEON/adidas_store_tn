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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/orderAdmin.css">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="body margin-top">
		<div class="orderAdmin-container">
			<h3>주문 관리</h3>
			<table class="orderAdmin-table-container">
				<thead>
					<tr>
						<th>제품이미지</th>
						<th>제품이름</th>
						<th>사이즈</th>
						<th>수량</th>
						<th>회원이메일</th>
						<th>회원이름</th>
						<th>배송지</th>
						<th>주문일</th>
						<th>
							<select name="state_linup">
								<option value="배송상태">배송상태</option>
								<option value="주문완료">주문완료</option>
								<option value="배송준비중">배송준비중</option>
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option>
							</select>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="orderList" items="${list}">
						<c:forEach var="option" items="${option}">
							<c:if test="${option.op_num == orderList.ol_op_num}">
								<c:forEach var="goods" items="${goods}">
									<c:if test="${goods.gd_num == option.op_gd_num}">
										<c:forEach var="order" items="${order}">
											<c:if test="${order.or_num == orderList.ol_or_num}">
												<tr>
													<th class="gd_img"><a href=""><img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt=""></a></th>
													<th class="gd_name">${goods.gd_name}</th>
													<th class="op_size">${option.op_size}</th>
													<th class="ol_amount">${orderList.ol_amount}</th>
													<th class="or_me_email">${order.or_me_email}</th>
													<th class="or_name">${order.or_name}</th>
													<th class="or_address">${order.or_address}<br>${order.or_address_detail}</th>
													<th class="or_date">${order.or_date_str}</th>
													<th class="ol_state">
														<input type="hidden" value="${orderList.ol_state}">
														<input type="hidden" name="ol_num" value="${orderList.ol_num}">
														<select name="ol_state">
															<option value="주문완료">주문완료</option>
															<option value="배송준비중">배송준비중</option>
															<option value="배송중">배송중</option>
															<option value="배송완료">배송완료</option>
														</select>
													</th>
												</tr>
											</c:if>
										</c:forEach>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>	
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script>
		//주문상태 불러오기
		setOlState();
		function setOlState() {
			$('.ol_state').each(function() {
				var ol_state = $(this).children('[type=hidden]').val();
				$(this).find('[value='+ol_state+']').prop('selected', 'selected')
			});
		}
		//배송상태 변경
		$('[name=ol_state]').change(function() {
			var ol_num = $(this).siblings('[name=ol_num]').val();
			var ol_state = $(this).val();
			var orderList = {
				ol_num : ol_num,
				ol_state : ol_state
			}
			$.ajax({
		        async:false,
		        type:'POST',
		        data:JSON.stringify(orderList),
		        url: '<%=request.getContextPath()%>/state/change',
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(res){
					alert('변경되었습니다.');
					window.location.reload();
		        }
		    });
		});
		//배송상태 정렬변경
		$('[name=state_linup]').change(function() {
			var ol_state = $(this).val();
			var url = '<%=request.getContextPath()%>/admin/orderAdmin?ol_state='+ol_state;
			window.location.replace(url);
		});
		//배송상태 정렬 불러오기
		setStateLineup('${state}');
		function setStateLineup(state) {
			if(state != null && state != ''){
				$('[name=state_linup]').find('[value='+state+']').prop('selected', 'selected');				
			}
		}
	</script>
</body>
</html>