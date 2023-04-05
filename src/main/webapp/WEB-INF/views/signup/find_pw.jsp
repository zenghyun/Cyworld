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
	<script>
		// PW 찾기
		function findPW(f) {
			let name = f.name.value;
			let userID = f.userID.value;
			let email = f.email.value;
			
			// 유효성 검사
			
			if ( name == '' ) {
				alert("이름을 입력하세요");
				return;
			}
			if ( userID == '' ) {
				alert("아이디를 입력하세요");
				return;
			}
			if ( email == '' ) {
				alert("이메일을 입력하세요");
				return;
			}
			
			let url = "findPwCheck.do";
			let param = "name=" + name +
						"&userID=" + userID +
						"&email=" + encodeURIComponent(email);
			sendRequest(url, param, resultPw, "POST");
		}
		// PW 찾기 콜백메소드
		function resultPw() {
			if ( xhr.readyState == 4 && xhr.status == 200 ) {
				let data = xhr.responseText;
				
				if ( data == "no" ) {
					alert("해당 ID로 가입된 정보가 없습니다");
					return;
				}
				
				alert("메일로 임시비밀번호 발급이 완료되었습니다");
				location.href = "login.do";
			}
		}
	</script>
</body>
</html>