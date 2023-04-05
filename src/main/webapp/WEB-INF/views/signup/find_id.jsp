<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/animate.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/findId.css">
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
							<div class="myname">이름 <br> <input class="nameText" name="name" type="text"></div>
							<div id="phone">휴대전화 <br> <input class="phoneText" id="phoneNumber" name="phoneNumber" type="text" placeholder="휴대폰 번호를 입력해주세요" maxlength="13"></div>
							<input id="btn-cover" type="button" value="아이디 찾기" onclick="findID(this.form)">
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
		// ID 찾기
		function findID(f) {
			let name = f.name.value;
			let phoneNumber = f.phoneNumber.value;
			
			// 유효성 검사
			
			if ( name == '' ) {
				alert("이름을 입력하세요");
				return;
			}
			if ( phoneNumber == '' ) {
				alert("휴대전화 번호를 입력하세요");
				return;
			}
			
			let url = "findIdCheck.do";
			let param = "name=" + name +
						"&phoneNumber=" + phoneNumber;
			sendRequest(url, param, resultId, "POST");
		}
		// ID 찾기 콜백메소드
		function resultId() {
			if ( xhr.readyState == 4 && xhr.status == 200 ) {
				let data = xhr.responseText;
				
				if ( data == "no" ) {
					alert("아이디를 찾지 못하였습니다");
					return;
				}
				
				alert("아이디는 '" + data + "' 입니다");
				location.href = "login.do";
			}
		}
	</script>
	
	<script>
		// 휴대폰용 자동 하이픈
		function phoneAutoHyphen(str){
			str = str.replace(/[^0-9]/g, ''); // 입력값에 숫자만 적용
			let tmp = '';
			if ( str.length < 4 ) { // 입력값이 4자리보다 작을시
				return str;
			} else if ( str.length < 7 ) { // 입력값이 7자리보다 작을시
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3);
				return tmp;
			} else if ( str.length < 11 ) { // 입력값이 11자리보다 작을시
				tmp += str.substr(0, 3); // 000
				tmp += '-'; // 000-
				tmp += str.substr(3, 3); // 000-000
				tmp += '-'; // 000-000-
				tmp += str.substr(6); // 000-000-0000
				return tmp;
			} else { // 입력값이 11자리일시
				tmp += str.substr(0, 3); // 000
				tmp += '-'; // 000-
				tmp += str.substr(3, 4); // 000-0000
				tmp += '-'; // 000-0000-
				tmp += str.substr(7); // 000-0000-0000
				return tmp;
			}
			return str;
		}
		// 휴대폰 입력값 가져오기
		const phoneNumber = document.getElementById("phoneNumber");
		phoneNumber.onkeyup = function(event) { // 값을 입력시 발동
			event = event || window.event;
			let val = this.value.trim(); // 입력값 가져오기
			this.value = phoneAutoHyphen(val); // 입력값에 자동 하이픈 메소드 적용
		}
	</script>
</body>
</html>