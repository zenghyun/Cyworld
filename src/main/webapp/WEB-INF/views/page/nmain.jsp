<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 로그인</title>
<link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/animate.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/nonMain.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container">
		<section class="left-section">
			<div class="left-dashed-line">
				<div class="left-gray-background">
					<aside class="left-aside">
						<div class="manAni">
							<img src="resources/images/noneJoinMan.png" alt="">
						</div>
					</aside>
				</div>
			</div>
			
			<div class="leftMinimiPosition">
				<img class="noneMain1" src="resources/images/noneMain1.gif" alt="">
				<pre>
                                Copyright 2022.12.06 2조 All rights reserved
                                Developer : 이정현, 박성철, 황유진, 장유진, 장현중
                                Reference : Cyworld
				</pre>
				<img class="noneMain6" src="resources/images/noneMain6.gif" alt="">
				<img class="noneMain12" src="resources/images/noneMain12.gif" alt="">
				<img class="noneMain14" src="resources/images/noneMain14.gif" alt="">
				<img class="noneMain16" src="resources/images/noneMain16.gif" alt="">
				<img class="noneMain18" src="resources/images/noneMain18.gif" alt="">
				<img class="noneMain17" src="resources/images/noneMain17.gif" alt="">
			</div>
		</section>
		
		<section class="right-section">
			<div class="right-dashed-line">
				<div class="right-gray-background">
					<form name="sf" method="GET">
						<input id="btn-cover" class="search" type="button" value="회원 검색" onclick="searchPopUp();"></input>
					</form>
					<aside class="right-aside">
						<pre>
							<h2>Cyworld의 회원으로 이용해보세요!</h2>
							<span class="firstText"><span id="hoverText">다이어리</span>, <span id="hoverText">사진첩</span>, <span id="hoverText">방명록</span>, <span id="hoverText">일촌평 작성</span> 등의 서비스 이용이 가능합니다!</span>
							<span class="secondText">계정이 있다면? <input id="btn-cover" type="button" onclick="goLogin()" value="로그인"></span>
							<span class="thirdText">cyworld 이용이 처음이라면?<input id="btn-cover" type="button" onclick="memberJoin()" value="회원가입"></span>
						</pre>
						<div class="womanAni"><img src="resources/images/noneJoinWoman.png" alt=""></div>
					</aside>
				</div>
			</div>
		</section>
	</div>
	
	<div class="rightMinimiPosition">
		<img  class="noneMain9" src="resources/images/noneMain9.gif" alt="">
		<img  class="noneMain10" src="resources/images/noneMain10.gif" alt="">
		<img  class="noneMain5" src="resources/images/noneMain5.gif" alt="">
		<img  class="noneMain4" src="resources/images/noneMain4.gif" alt="">
		<img  class="noneMain2" src="resources/images/noneMain2.gif" alt="">
		<img  class="noneMain11" src="resources/images/noneMain11.gif" alt="">
		<img  class="noneMain7" src="resources/images/noneMain7.gif" alt="">
		<img  class="noneMain8" src="resources/images/noneMain8.gif" alt="">
	</div>
	
	<!-- 좌측, 우측 페이지 이어주는 스프링 디자인 -->
	<div class="item item1"></div>
	<div class="item item1"></div>
	<div class="item item2"></div>
	<div class="item item2"></div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
	<!-- 검색 팝업창 -->
	<script>
		// 검색 팝업창
		function searchPopUp() {
			//let popUrl = "main_search_popup.do";
			let popOption = "top=100, left=800, width=600, height=800, status=no, menubar=no, toolbar=no, resizable=no";
			window.open("", "search", popOption);
			document.sf.action = "main_search_popup.do";
			document.sf.target="search";
			document.sf.submit();
		}
	</script>
	
	<!-- 로그인 -->
	<script>
		// 로그인
		function goLogin() {
			location.href = "logout.do"
		}
	</script>
	
	<!-- 회원가입 -->
	<script>
		// 회원가입
		function memberJoin() {
			location.href = "login_authentication.do?platform=cyworld";
		}
	</script>
</body>
</html>