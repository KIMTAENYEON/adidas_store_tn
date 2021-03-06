<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login.css">
</head>
<body>
		<div class="body login-container">
			<div class="login-box">
				<h3 class="margin-top">로그인</h3>
				<form action="<%=request.getContextPath()%>/member/login" method="post">
					<a href="<%=request.getContextPath()%>/member/find" class="pw-forget">비밀번호를 잊으셨나요?</a>
					<div class="email-input-container">
						<div class="email-input-box">
							<input type="email" placeholder="이메일" name="me_email">
						</div>
					</div>
					<div class="pw-input-container">
						<div class="pw-input-box">
							<input type="password" placeholder="패스워드" name="me_pw">
						</div>
					</div>
					<div class="auto-login-container">
						<label class="auto-login-box">
							<input type="checkbox" name="me_auto_login" value="ok">
							<span class="auto-login-text">로그인 상태를 유지할래요.</span>
						</label>
					</div>
					<div class="btn-container">
						<button class="btn btn-login" type="submit">
							<span>로그인</span>
							<i class="icon-right"></i>
						</button>
						<a href="<%=request.getContextPath()%>/member/signup" class="btn btn-signup">
							<span>회원가입</span>
							<i class="icon-right"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
</body>
</html>