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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/buy.css">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<!-- 우편번호-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 유효성 검사 -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<style>
		.error{ color : red}
	</style>
</head>
<body>
<form action="<%=request.getContextPath()%>/order/buy" method="post" id="order">
	<div class="body margin-top">
		<!-- 배송지 설정 -->
		<div class="address-container">
			<h3>배송지 주소</h3>
			<div class="address-box">
				<input type="hidden" name="or_name">
				<input type="hidden" name="or_postnum">
				<input type="hidden" name="or_address">
				<input type="hidden" name="or_address_detail">
				<input type="hidden" name="or_phone">
				<!-- 회원 주소 박스 -->
				<div class="member-address-container selected">
					<div class="input-member">
						<input type="text" id="me_name" value="${user.me_name}" disabled>
					</div>
					<!-- 주소 -->
					<div class="input-member">
						<div class="form-inline">
							<input type="text" id="me_postnum" placeholder="우편번호" value="${user.me_postnum}" disabled>
						</div>
					</div>
					<div class="input-member">
						<input type="text" id="me_address" placeholder="주소" value="${user.me_address}" disabled>
					</div>
					<div class="input-member">
						<input type="text" id="me_address_detail" placeholder="상세주소" value="${user.me_address_detail}" disabled>
					</div>
					<div class="input-member">
						<input type="text" id="me_phone" value="${user.me_phone}" disabled>
					</div>
				</div>
				<!-- 새로운 주소 박스-->
				<div class="new-address-container">
					<div class="input-member">
						<input type="text" placeholder="이름" name="me_name" disabled>
					</div>
					<!-- 주소 -->
					<div class="input-member">
						<div class="form-inline">
							<input type="text" id="postcode" placeholder="우편번호" name="me_postnum" disabled>
							<input type="button" onclick="execDaumPostcode()" class="btn btn-postnum-find" value="우편번호 찾기"><br>		
						</div>
						<label id="postcode-error" class="error" for="postcode"></label>
					</div>
					<div class="input-member">
						<input type="text" id="address" placeholder="주소" name="me_address" disabled>
					</div>
					<div class="input-member">
						<input type="text" id="detailAddress" placeholder="상세주소" name="me_address_detail" disabled>
						<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
					</div>
					<div class="input-member">
						<input type="text" name="me_phone" placeholder="전화번호(-를 포함하여 입력하세요.)" id="phone" disabled>
					</div>
				</div>
			</div>
		</div>
		<!-- 주문제품정보 -->
		<div class="order-goods-container">
			<h3>주문 상세 사항</h3>
			<div class="order-goods-box">
				<!-- 장바구니에서 제품 구매로 올 때 -->
				<c:forEach var="myList" items="${myList}">
				<c:forEach var="option" items="${option}">
				<c:if test="${option.op_num == myList.my_op_num}">
				<c:forEach var="goods" items="${goods}">
				<c:if test="${goods.gd_num == option.op_gd_num}">
					<div class="order-goods-item-box">
						<a href="<%=request.getContextPath()%>/goods/detail/?gd_num=${goods.gd_num}" class="btn btn-goods-item">
							<span class="goods-item-img-box">
								<img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt="">
							</span>
							<span class="goods-item-text-box">
								<span class="goods-item-name">${goods.gd_name}</span>
								<span class="goods-item-size">사이즈 : ${option.op_size}</span>
								<span class="goods-item-amount">수량 : ${myList.my_amount}</span>
								<span class="goods-item-price">${goods.gd_price}</span>
								<input type="hidden" class="index" value="0">
								<input type="hidden" class="ol_op_num" name="ol_op_num" value="${option.op_num}">
								<input type="hidden" class="ol_amount" name="ol_amount" value="${myList.my_amount}">
								<input type="hidden" class="ol_total_price" name="ol_total_price" value="">
							</span>
							<input type="hidden" name="basket" value="1">
						</a>
					</div>
				</c:if>
				</c:forEach>
				</c:if>
				</c:forEach>
				</c:forEach>
				<!-- 제품상세에서 제품 구매로 올 때 -->
				<c:if test="${myList == null}">
					<div class="order-goods-item-box">
						<a href="<%=request.getContextPath()%>/goods/detail/?gd_num=${goods.gd_num}" class="btn btn-goods-item">
							<span class="goods-item-img-box">
								<img src="<%=request.getContextPath()%>/img/${goods.gd_img}" alt="">
							</span>
							<span class="goods-item-text-box">
								<span class="goods-item-name">${goods.gd_name}</span>
								<span class="goods-item-size">사이즈 : ${option.op_size}</span>
								<span class="goods-item-amount">수량 : ${ol_amount}</span>
								<span class="goods-item-price">${goods.gd_price}</span>
								<input type="hidden" class="ol_op_num" name="ol_op_num" value="${option.op_num}">
								<input type="hidden" class="ol_amount" name="ol_amount" value="${ol_amount}">
								<input type="hidden" class="ol_total_price" name="ol_total_price" value="">
							</span>
							<input type="hidden" name="basket" value="0">
						</a>
					</div>
				</c:if>
			</div>
		</div>
		<!-- 주문요약 -->
		<div class="order-container">
			<div class="order-box">
				<h3>총 금액</h3>
				<div class="order-total-price">
					
				</div>
				<input type="hidden" class="total-price">
			</div>
			<button class="btn btn-pay">
				<span>결제</span>
				<i class="icon-right"></i>
			</button>
		</div>
	</div>
</form>
	<script>
		setTotalPrice();
		//제품의 총 금액 계산하기 
		function setTotalPrice() {
			var totalPriceAll = 0;
			$('.order-goods-item-box').each(function() {
				var price = $(this).find('.goods-item-price').text();
				var amount = $(this).find('.ol_amount').val();
				var totalPrice = price * amount;
				var totalPriceComma = totalPrice.toLocaleString('ko-KR');
				$(this).find('.goods-item-price').text(totalPriceComma + '원');
				$(this).find('.ol_total_price').val(totalPrice);
				totalPriceAll += totalPrice;
			});
			$('.total-price').val(totalPriceAll);
			var totalPriceAllComma = totalPriceAll.toLocaleString('ko-KR');
			$('.order-total-price').text(totalPriceAllComma + '원');
		}
		// 우편번호 찾기 찾기 화면을 넣을 element
	    var element_wrap = document.getElementById('wrap');
	    function foldDaumPostcode() {
				// iframe을 넣은 element를 안보이게 한다.
				element_wrap.style.display = 'none';
	    }
	    function execDaumPostcode() {
				// 현재 scroll 위치를 저장해놓는다.
				var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
				new daum.Postcode({
					oncomplete: function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수
						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}
						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if(data.userSelectedType === 'R'){
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if(data.buildingName !== '' && data.apartment === 'Y'){
								extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if(extraAddr !== ''){
								extraAddr = ' (' + extraAddr + ')';
							}		
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("detailAddress").focus();
						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						element_wrap.style.display = 'none';
						// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
						document.body.scrollTop = currentScroll;
					},
					// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
					onresize : function(size) {
							element_wrap.style.height = size.height+'px';
					},
					width : '100%',
					height : '100%'
				}).embed(element_wrap);
				// iframe을 넣은 element를 보이게 한다.
				element_wrap.style.display = 'block';
	    }
		$(function() {
	    	// 유효성 검사
	        $("#order").validate({
	            rules: {
	                me_name: {
	                    required : true
	                },
	                me_phone: {
	                    required : true,
	                    regex: /^\d{3}(-\d{4}){2}$/
	                },
	                me_postnum:{
	                	required: true,
	                	regex: /^\d+$/,
	                	minlength : 5,
	                	maxlength : 10
	                },
	               	me_address:{
	               		required: true
	               	}
	            },
	            //규칙체크 실패시 출력될 메시지
	            messages : {
	                me_name: {
	                    required : "필수로입력하세요."
	                },
	                me_phone: {
	                    required : "필수로입력하세요.",
	                    regex: "-를 포함하여 입력하세요."
	                },
	                me_postnum:{
	                	required: "우편번호를 입력하세요.",
	                	regex: "잘못 입력되었습니다.",
	                	minlength : "최소 {5}글자이상이어야 합니다.",
	                	maxlength : "최대 {10}글자이하이어야 합니다."
	                },
	               	me_address:{
	               		required: "주소를 입력하세요."
	               	}
	            },submitHandler: function(form) {
	            	requestPay();
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
		// 배송지 변경
		$('.address-box>div').click(function(){
			$('.address-box>div').removeClass('selected');
			$(this).addClass('selected');
			if($('.member-address-container').hasClass('selected')){
				$('.new-address-container input').prop('disabled', 'disabled');
			}else{
				$('.new-address-container input').prop('disabled', '');
			}
		});
		// 결제 전송 시
		$('#order').submit(function() {
			if($('.member-address-container').hasClass('selected')){
				var name = $('.member-address-container #me_name').val();
				var postnum = $('.member-address-container #me_postnum').val();
				var address = $('.member-address-container #me_address').val();
				var addressDetail = $('.member-address-container #me_address_detail').val();
				var phone = $('.member-address-container #me_phone').val();
			}else{
				var name = $('.new-address-container [name=me_name]').val();
				var postnum = $('.new-address-container [name=me_postnum]').val();
				var address = $('.new-address-container [name=me_address]').val();
				var addressDetail = $('.new-address-container [name=me_address_detail]').val();
				var phone = $('.new-address-container [name=me_phone]').val();
			}
			$('.address-box [name=or_name]').val(name);
			$('.address-box [name=or_postnum]').val(postnum);
			$('.address-box [name=or_address]').val(address);
			$('.address-box [name=or_address_detail]').val(addressDetail);
			$('.address-box [name=or_phone]').val(phone);
			var or_name = $('.address-box [name=or_name]').val();
			var or_postnum = $('.address-box [name=or_postnum]').val();
			var or_address = $('.address-box [name=or_address]').val();
			var or_address_detail = $('.address-box [name=or_address_detail]').val();
			var or_phone = $('.address-box [name=or_phone]').val();
		});
		var IMP = window.IMP; // 생략 가능
	    IMP.init("imp76369410"); // 예: imp00000000
	    //결제진행
	    function requestPay() {
		  // IMP.request_pay(param, callback) 결제창 호출
		  IMP.request_pay({ // param
		      pg: "html5_inicis",
		      pay_method: "card",
		      merchant_uid: 'merchant_' + new Date().getTime(),
		      name: "아디다스 온라인 스토어",
		      amount: $('.total-price').val(),
		      buyer_email: "${user.me_email}",
		      buyer_name: $('.address-box [name=or_name]').val(),
		      buyer_tel: $('.address-box [name=or_phone]').val(),
		      buyer_addr: $('.address-box [name=or_address]').val(),
		      buyer_postcode: $('.address-box [name=or_postnum]').val()
		  }, function (rsp) { // callback
			  if (rsp.success) {
				  var or_name = $('.address-box [name=or_name]').val();
				  var or_postnum = $('.address-box [name=or_postnum]').val();
				  var or_address = $('.address-box [name=or_address]').val();
				  var or_address_detail = $('.address-box [name=or_address_detail]').val();
				  var or_phone = $('.address-box [name=or_phone]').val();
				  var order = {
					or_name : or_name,
					or_postnum : or_postnum,
					or_address : or_address,
					or_address_detail : or_address_detail,
					or_phone : or_phone
				  }
				  var ol_or_num = 0;
				  $.ajax({
				        async:false,
				        type:'POST',
				        data:JSON.stringify(order),
				        url: '<%=request.getContextPath()%>/order/pay/order',
				        contentType:"application/json; charset=UTF-8",
				        success : function(res){
				        	ol_or_num = res;
				        }
				  });
				  for(var i = 0; i < $('.order-goods-item-box').length; i++){
					  var ol_op_num = $('.order-goods-item-box').eq(i).find('[name=ol_op_num]').val();
					  var ol_total_price = $('.order-goods-item-box').eq(i).find('[name=ol_total_price]').val();
					  var ol_amount = $('.order-goods-item-box').eq(i).find('[name=ol_amount]').val();
					  var orderList = {
						ol_op_num : ol_op_num,
						ol_total_price : ol_total_price,
						ol_amount : ol_amount,
						ol_or_num: ol_or_num,
						ol_uid : rsp.imp_uid
					  }
					  var basket = $('[name=basket]').val();
					  $.ajax({
					        async:false,
					        type:'POST',
					        data:JSON.stringify(orderList),
					        url: '<%=request.getContextPath()%>/order/pay/orderList?basket='+basket,
					        contentType:"application/json; charset=UTF-8",
					        success : function(res){
					        	
					        }
					  });
				  }
				  var url = '<%=request.getContextPath()%>/member/orderCheck';
		    	  window.location.replace(url);
		      } else {
		    	  alert('결제에 실패했습니다.');
		    	  window.location.reload();
		      }
		  });
		}
	</script>
</body>
</html>