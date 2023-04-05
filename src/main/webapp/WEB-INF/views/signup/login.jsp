<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cyworld 로그인</title>
<link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/animate.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/login.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container ">
		<section class="section">
			<div class="dashed-line">
				<div class="gray-background">
					<div class="main">
					
						<img class="logo-main box animate__animated animate__rubberBand animate__" src="resources/images/logo_cyworld.png" alt="">
						<img class="login-minimi" alt="" src="resources/images/minimi_main.png">
						
						<div class="user-info">
						
							<!-- 로그인 -->
							<form id="ff">
								<!-- 로그인을 구별할 플랫폼 -->
								<input name="platform" type="hidden" value="cyworld">
								<p class="userID">ID :&nbsp;<input name="userID" type="text"></p>
								<p class="userPW">PW :&nbsp;<input name="info" type="password"> </p>
								<p class="login"><input id="btn-cover" type="button" value="로그인" onclick="loginCheck(this.form)"></p>
							</form>
							
							<!-- cyworld 회원가입 -->
							<form action="login_authentication.do" method="POST">
								<!-- 회원가입을 구별할 플랫폼 -->
								<input name="platform" type="hidden" value="cyworld">
								<p class="join"><input id="btn-cover" type="submit" value="회원가입"></p>
							</form>
							
							<!-- 네이버 로그인 버튼 -->
							<div  class="naver" id="naverIdLogin"></div>
							
							<!-- 카카오 로그인 버튼 -->
							<a class="kakao" href="javascript:kakaoLogin();"><img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height: 40px; width: auto"></a>
							
							<!-- 카카오 회원가입 -->
							<form id="kf" action="login_authentication.do" method="POST">
								<input name="platform" type="hidden" value="kakao">
								<input name="email" id="email" type="hidden">
								<input name="gender" id="gender" type="hidden">
							</form>
							
							<!-- ID 찾기 -->
							<input id="btn-cover" class="findID" type="button" value="아이디 찾기" onclick="find_id();">
							<!-- PW 찾기 -->
							<input id="btn-cover" class="findPW" type="button" value="비밀번호 찾기" onclick="find_pw();">
							<!-- 비회원 로그인 -->
							<input id="btn-cover" class="none-join" type="button" value="비회원으로 입장" onclick="nmain();">
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
	<!-- 비회원 접속 -->
	
	
	<!-- Ajax사용을 위한 js를 추가 -->
	<script src="/cyworld_oracle/resources/js/httpRequest.js"></script>
	<!-- 카카오 로그인 API -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<!-- 네이버 로그인 API -->
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<script src="/cyworld_oracle/src/main/webapp/resources/js/signup/login.js"></script>
</body>
</html>