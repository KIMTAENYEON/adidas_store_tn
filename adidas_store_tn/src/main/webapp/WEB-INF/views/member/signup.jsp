<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/signup.css">
	<!-- 우편번호-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 유효성 검사 -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
	<style>
		.error{ color : red}
	</style>
</head>
<body>
	<div class="body signup-container">
		<form action="<%=request.getContextPath()%>/member/signup" class="signup margin-top" method="post" id="signup">
			<h3>회원가입</h3>
			<label id="me_name-error" class="error" for="me_name"></label>
			<div class="input-member">
				<input type="text" placeholder="이름" name="me_name" value="">
			</div>
			<label id="me_phone-error" class="error" for="me_phone"></label>
			<div class="input-member">
				<input type="text" placeholder="전화번호(-를 포함하여 입력하세요.)" name="me_phone" value="">
			</div>
			<!-- 주소 -->
			<label id="postcode-error" class="error" for="postcode"></label>
			<label id="address-error" class="error" for="address"></label>
			<div class="input-member">
				<div class="form-inline">
					<input type="text" id="postcode" placeholder="우편번호" name="me_postnum">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" ><br>		
				</div>
				<input type="text" id="address" placeholder="주소" name="me_address">
				<input type="text" id="detailAddress" placeholder="상세주소" name="me_address_detail">
				<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
				</div>
			</div>
			<label id="me_email-error" class="error" for="me_email"></label>
			<div class="input-member">
				<input type="email" placeholder="이메일" name="me_email" value="">
				<button type="button" class="btn btn-email-check">이메일 인증</button>
				<br>
				<input type="text" class="email-check-code" placeholder="인증코드">
			</div>

			<label id="me_pw-error" class="error" for="me_pw"></label>
			<div class="input-member">
				<input type="password" placeholder="패스워드" id="me_pw" name="me_pw" value="">
			</div>
			<div class="input-member">
				<input type="password" placeholder="패스워드확인" name="me_pw2" value="">
			</div>
			<div class="input-member">
				<div class="agree-content">
					약관내용
				</div>
				<label class="agree-box">
					<input type="checkbox" class="agree-checkbox" name="agree">동의합니다.
				</label>
			</div>
			<button class="btn btn-signup">
				<span>회원가입</span>
				<i class="icon-right"></i>
			</button>
		</form>
	</div>
	<script>
	//회원가입 전송
	$('#signup').submit(function() {
		var agree = $('input[name=agree]').is(':checked');
		if(!agree){
			alert('약관동의를 선택하세요. ')
			$('[name=agree]').focus();
			return false; 
		}
		// 인증코드 확인
		var em_email = $('[name=me_email]').val();
		var em_checknum = $('.email-check-code').val();
		var emailCheck = {
				em_email : em_email,
				em_checknum : em_checknum
			}
		var emailcode = "no";
		$.ajax({
	        async:false,
	        type:'POST',
	        data:JSON.stringify(emailCheck),
	        url: '<%=request.getContextPath()%>/checknum/check',
	        contentType:"application/json; charset=UTF-8",
	        success : function(res){
	        	if(res == "true"){
	        		alert('회원가입이 완료되었습니다.');
	        		emailcode = "ok";
				}else{
					alert('인증코드를 확인하세요.');
					emailcode = "no"
				}
	        }
	    });
		if(emailcode == "no"){
			return false;
		}else if(emailcode == "ok"){
			return true;
		}
	});
	//이메일 인증 버튼 클릭시
	$('.btn-email-check').click(function() {
		var em_email = $(this).siblings('[name=me_email]').val();
		var emailCheck = {
				em_email : em_email
			}
		$.ajax({
	        async:false,
	        type:'POST',
	        data:JSON.stringify(emailCheck),
	        url: '<%=request.getContextPath()%>/email/check',
	        contentType:"application/json; charset=UTF-8",
	        success : function(res){
	        	if(res == "true"){
					alert('입력한 메일에서 인증코드를 확인하세요.');
				}else if(res == "false"){
					alert('이미 가입된 이메일입니다.');
				}else if(res == 'error'){
					alert('메일 전송에 실패했습니다. 관리자에게 문의하세요.')
				}
	        }
	    });
	});
	
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
        $("#signup").validate({
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
               	},
                me_email: {
                	required : true,
                	regex: /^[a-zA-Z0-9]+@[a-z]+(.[a-z]+){1,}$/,
                },
                me_pw: {
                    required : true,
                    regex: /^[a-zA-Z0-9]*(\d[A-z]|[A-z]\d)[a-zA-Z0-9]*$/,
                    minlength : 8,
                    maxlength : 20
                },
                me_pw2: {
                    equalTo : me_pw
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
               	},
                me_email: {
                	required : "필수로입력하세요",
                	regex: "이메일 형태가 아닙니다."
                },
                me_pw: {
                    required : "필수로입력하세요.",
                    minlength : "최소 {8}글자이상이어야 합니다.",
                    maxlength : "최대 {20}글자이하이어야 합니다.",
                    regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
                },
                me_pw2: {
                    equalTo : "비밀번호가 일치하지 않습니다."
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