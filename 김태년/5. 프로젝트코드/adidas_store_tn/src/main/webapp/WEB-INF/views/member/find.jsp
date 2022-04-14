<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>비밀번호 찾기</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/find.css">
	<!-- 유효성 검사 -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
	<style>
		.error{ color : red}
	</style>
</head>
<body>
	<div class="body">
		<div class="find-pw-container margin-top">
			<div class="find-pw-box">
				<h3>비밀번호 찾기</h3>
				<form action="<%=request.getContextPath()%>/member/find" method="post" id="find">
					<label id="me_email-error" class="error" for="me_email"></label>
					<div class="input-email">
						<input type="email" placeholder="이메일" name="me_email">
					</div>
					<button class="btn btn-find-pw">
						<span>새 비밀번호 발급</span>
						<i class="icon-right"></i>
					</button>
				</form>
			</div>
		</div>
	</div>
	<script>
	//비밀번호 찾기 전송시
	$('#find').submit(function() {
		// 이메일확인
		var me_email = $('[name=me_email]').val();
		var member = {
				me_email : me_email
			}
		var dbMember = "no";
		$.ajax({
	        async:false,
	        type:'POST',
	        data:JSON.stringify(member),
	        url: '<%=request.getContextPath()%>/member/check',
	        contentType:"application/json; charset=UTF-8",
	        success : function(res){
	        	if(res == "true"){
	        		alert('새 비밀번호가 발급되었습니다. \n이메일을 확인하세요.');
	        		dbMember = "ok";
				}else{
					alert('가입되지 않은 이메일입니다.');
					dbMember = "no"
				}
	        }
	    });
		if(dbMember == "no"){
			return false;
		}else if(dbMember == "ok"){
			return true;
		}
	});
	$(function() {
    	// 유효성 검사
        $("#find").validate({
            rules: {
                me_email: {
                	required : true,
                	regex: /^[a-zA-Z0-9]+@[a-z]+(.[a-z]+){1,}$/,
                }
            },
            //규칙체크 실패시 출력될 메시지
            messages : {
                me_email: {
                	required : "필수로입력하세요",
                	regex: "이메일 형태가 아닙니다."
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