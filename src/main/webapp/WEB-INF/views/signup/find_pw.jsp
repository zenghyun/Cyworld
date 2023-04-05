<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/animate.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/findpw.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container ">
		<section class="section">
			<div class="dashed-line">
				<div class="gray-background">
					<div class="main">
					
						<img class="logo-main box animate__animated animate__rubberBand animate__" src="resources/images/logo_cyworld.png" alt="">
						
						<form>
							<p class="myName">이름 <br> <input name="name" type="text"></p>
							<p class="myId">ID <br> <input id="userID" name="userID" type="text"></p>
							<p class="myEmail">이메일 <br> <input name="email" type="text"></p>
							<input id="btn-cover" type="button" value="비밀번호 찾기" onclick="findPW(this.form)">
							<input  id="btn_cover" class="cancel" type="button" value="취소" onclick="location.href='logout.do'">
						</form>
						
					</div>
				</div>
			</div>
		</section>
	</div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
	<!-- Ajax 사용을 위한 js를 로드 -->
	<script src="/cyworld_oracle/resources/js/httpRequest.js"></script>
	<script src="/cyworld_oracle/src/main/webapp/resources/js/signup/find_pw.js"></script>
</body>
</html>