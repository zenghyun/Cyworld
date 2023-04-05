<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NAVER 회원가입</title>
<link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/animate.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/naverJoin.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container">
		<section class="section">
			<div class="dashed-line">
				<div class="gray-background">
					<div class="main">
					
						<img class="logo-main box animate__animated animate__rubberBand animate__" src="resources/images/logo_cyworld.png" alt="">
						
						<form>
							<input name="platform" type="hidden" value="${ vo.platform }">
							<input name="name" type="hidden" value="${ vo.name }">
							<input name="gender" type="hidden" value="${ vo.gender }">
							<input name="email" type="hidden" value="${ vo.email }">
							<p class="iNum">주민번호 <br> <input name="identityNum" id="identityNum" type="text" placeholder="주민번호 13자리를 입력해주세요" maxlength="14"></p>
							<p class="phone">휴대전화 <br> <input id="phoneNumber" name="phoneNumber" type="text" placeholder="휴대전화 번호를 입력해주세요" maxlength="13"></p>
							<p class="address">주소 <br> <input class="address_kakao" name="address" type="text">
								<div class="findAddress"><input id="btn-cover" class="address_kakao" type="button" value="주소찾기"></div></p>
							<p class="rAddress">상세 주소 <br> <input class="address_kakao" name="addressDetail" type="text"></p>
							<input id="btn-cover" class="join" type="button" value="가입" onclick="join(this.form)">
							<input id="btn-cover" class="cancel" type="button" value="취소" onclick="naverLogout();">
						</form>
						
					</div>
				</div>
			</div>
		</section>
	</div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
	<!-- Ajax사용을 위한 js를 추가 -->
	<script src="/cyworld_oracle/resources/js/httpRequest.js"></script>
	<!-- 다음 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/cyworld_oracle/src/main/webapp/resources/js/signup/naver_join.js"></script>
</body>
</html>