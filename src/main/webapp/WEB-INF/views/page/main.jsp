<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ signVo.name }님의 미니홈피</title>
<link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/animate.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>
	<!-- 타 유저의 미니홈피에서 내 미니홈피로 바로 갈수 있는 버튼 -->
	<c:if test="${ signVo.idx ne sessionUser.idx && sessionUser.idx > 0 }">
		<input id="btn_cover" class="returnMyHome" type="button" value="내 미니홈피로 가기" onclick="location.href='main.do?idx=${sessionUser.idx}'">
	</c:if>
	<!-- 로그인한 유저의 플랫폼에 따른 로그아웃 버튼 생성 -->
	<!-- 플랫폼이 싸이월드일 경우 -->
	<c:if test="${ sessionUser.platform eq 'cyworld' }">
		<input id="btn_cover" class="cy_logout" type="button" value="로그아웃" onclick="location.href='logout.do'">
	</c:if>
	<!-- 플랫폼이 네이버일 경우 -->
	<c:if test="${ sessionUser.platform eq 'naver' }">
		<input id="btn_cover" class="na_logout" type="button" value="네이버 로그아웃" onclick="naverLogout();">
	</c:if>
	<!-- 플랫폼이 카카오일 경우 -->
	<c:if test="${ sessionUser.platform eq 'kakao' }">
		<input id="btn_cover" class="ka_logout" type="button" value="카카오 로그아웃" onclick="kakaoLogout();">
	</c:if>
	<!-- 비회원일 경우 -->
	<c:if test="${ sessionUser eq null }">
		<input id="btn_cover" class="ka_logout" type="button" value="로그인" onclick="location.href='logout.do'">
	</c:if>
	
	<div class="container">
		<section class="left-section">
			<div class="left-dashed-line">
				<div class="left-gray-background">
					<!-- 로그안힌 유저의 미니홈피일 경우 일촌 수 -->
					<c:if test="${ signVo.idx eq sessionUser.idx }">
						<div id="ilchonNum">나의 일촌: ${ signVo.ilchon }</div>
					</c:if>
					<!-- 타 유저의 미니홈피일 경우 일촌 수 -->
					<c:if test="${ signVo.idx ne sessionUser.idx }">
						<div id="ilchonNum">${signVo.name}님의 일촌: ${ signVo.ilchon }</div>
					</c:if>
					<!-- 타 유저의 미니홈피일 경우 일촌 신청 버튼 생성 -->
					<c:if test="${ signVo.idx ne sessionUser.idx }">
						<!-- 일촌 신청 상태를 나타내는 숫자 -->
						<input id="ilchonUp" type="hidden" value="${ ilchon.ilchonUp }">
						<!-- 일촌 신청 하지 않은 경우 -->
						<c:if test="${ ilchon eq null }">
							<input id="btn_cover" class="wantIlchon" type="button" value="일촌 신청" onclick="ilchon();">
						</c:if>
						<!-- 일방적으로 일촌 신청한 경우 -->
						<c:if test="${ ilchon.ilchonUp eq 1 }">
							<input id="btn_cover" class="wantIlchon" type="button" value="일촌 신청중" onclick="ilchon();">
						</c:if>
						<!-- 쌍방으로 일촌 신청한 경우 -->
						<c:if test="${ ilchon.ilchonUp eq 2 }">
							<input id="btn_cover" class="wantIlchon" type="button" value="일촌 해제" onclick="ilchon();">
						</c:if>
						<!-- 일촌 신청 버튼에 대한 설명 알람 -->
						<div class="IlchonAssist"> <p> <span>※  일촌 신청</span> <img class="IlchonAssistImg" src="resources/images/noneMain14.gif" alt="">  <br> 일촌 신청을 하고, <br> 상대방도 나에게 일촌 신청을 하면 일촌이 돼요!</p></div>
					</c:if>
					<!-- 조회수 -->
					<p class="todayBanner"><span>Today</span> <span class="todayHere">${ signVo.today }</span><span>&nbsp;｜ Total</span> ${ signVo.total }</p>
					
					<aside class="left-aside">
						<!-- 좌측, 우측 페이지 이어주는 스프링 디자인 -->
						<div class="item item1"></div>
						<div class="item item1"></div>
						<div class="item item2"></div>
						<div class="item item2"></div>
						<!-- 투데이 -->
						<div class="todayIcon">
							<span class="todayIconText">Today is..</span><img class="box animate__animated animate__headShake animate__infinite " src="resources/images/emoticon1.png" alt="">
						</div>
						<!-- 프로필 사진 -->
						<div class="left-image"><img class="leftImg" src="/cyworld_oracle/resources/mainphoto/${ signVo.mainPhoto }" alt=""></div>
						<!-- 프로필 소개글 -->
						<textarea class="left-textarea" id="scrollBar" readonly>${ signVo.mainText }</textarea>
						<!-- 히스토리 -->
						<div class="history"><img src="resources/images/arrow.png" alt=""><h3>History</h3></div>
						<!-- 파도타기 -->
						<select class="myFriend" onchange="if(this.value) location.href=(this.value);">
							<option value="">::: 파도타기 :::</option>
							<c:forEach var="ilchonList" items="${ ilchonList }">
								<option value="main.do?idx=${ ilchonList.ilchonIdx }">ㆍ ${ ilchonList.ilchonName }</option>
							</c:forEach>
						</select>
					</aside>
				</div>
			</div>
		</section>
		
		<section class="right-section">
			<div class="right-dashed-line">
				<div class="right-gray-background">
					<!-- 메인 타이틀 - 클릭시 새로고침 역할 -->
					<p class="title"><a href="main.do?idx=${ signVo.idx }">${ signVo.mainTitle }</a></p>
					<!-- 검색 -->
					<form name="sf" method="GET">
						<input id="btn_cover" class="search" type="button" value="회원 검색" onclick="searchPopUp();"></input>
					</form>
					<!-- bgm - 페이지 오른쪽 상단에 재생 플레이어와 노래 제목 표시 -->
					<img class="musicLogo" src="resources/images/noneMain15.gif" alt="">
					<a class="mp3_title" href="#" ><div class="circle-container">
						<div class="circle circle1"> ♫ 오르트 구름 - 윤하</div>
					</div></a>
					<audio class="mp3" controls>
						<source src="/cyworld_oracle/resources/sound/main.mp3" type="audio/mp3">
					</audio>
					
					<aside class="right-aside" id="scrollBar">
						<!-- 도토리 - 타 유저한테는 안보이게 숨김 -->
						<c:if test="${ signVo.idx eq sessionUser.idx }">
							<div class="dotory">도토리 보유량 : ${signVo.dotoryNum}개 <input id="btn_cover" class="dotoryBtn" type="button" value="도토리구매" onclick="DotoryPopUp()"></div> 
						</c:if>
						<!-- 미니룸 -->
						<div class="miniRoomBox"><p>Mini Room</p>
							<div class="miniRoom"><img src="resources/images/MainroomGif.gif" alt=""></div>
							<div class=" Crayon box animate__animated animate__bounce animate__infinite"><img src="resources/images/Crayon.png" alt=""></div>
							<div class="zzang1"><img src="resources/images/zzang.gif" alt=""></div>
							<div class="zzang2"><img src="resources/images/zzang2.gif" alt=""></div>
							<div class="zzang3"><img src="resources/images/zzang3.gif" alt=""></div>
							<div class="Crayonz"><img class="friends" src="resources/images/Crayonz.gif" alt=""></div>
							<div class="CrayonDog"><img src="resources/images/CrayonDog.gif" alt=""></div>
						</div>
						<!-- 액션 미니미 광고 배너 - 타 유저한테는 안보이게 숨김 -->
						<c:if test="${ signVo.idx eq sessionUser.idx }">
							<div class="right-banner" id="banner">
								<p class="title">액션 미니미 <br>출시!</p>
								<p class="blink blink1">NEW</p><div class="img"><img src="resources/images/cat.gif" alt="" onclick="minimiPopUp();"></div>
								<p class="blink blink2">NEW</p><div class="img"><img src="resources/images/thePooh.gif" alt="" onclick="minimiPopUp();"></div>
								<p class="blink blink3">NEW</p><div class="img"><img src="resources/images/fat.gif" alt="" onclick="minimiPopUp();"></div>
								<input type="button" class="bannerCancel" id="btn_cover" onclick="displayNone(this)" value="끄기">
							</div>
						</c:if>
						
						<form>
							<div class="Ilchonpyeong">
								<!-- 일촌평 작성 -->
								<span>일촌평</span> <input type="text" name="ilchonpyeongText"  onkeyup="check_length(this);" placeholder="일촌과 나누고 싶은 이야기를 남겨보세요 (최대 45글자)"></input>
								<input id="btn_cover" class="Ic-registration" type="button" value="확인" onclick="registration(this.form);"></input>
								
							</div>
						</form>
						<!-- 작성된 일촌평 리스트 -->
						<c:forEach var="vo" items="${ list }">
							<div class="Ilchon" >ㆍ ${ vo.ilchonpyeongText } ${ vo.ilchonSession }</div>
						</c:forEach>
						
					</aside>
				</div>
			</div>
			
			<!-- 오른쪽 탭 -->
			<div class="tabs">
				<form>
					<div class="tab-btns">
						<!-- 해당 미니홈피 유저의 idx -->
						<input id="idx" name="idx" type="hidden" value="${ signVo.idx }">
						<!-- 로그인한 유저의 idx -->
						<input id="sessionIdx" type="hidden" value="${ sessionUser.idx }">
						<!-- 홈 탭 -->
						<label for="tab1" id="btn1">홈</label>
						<input id="tab1" type="button" value="홈" style="display: none;" onclick="location.href='main.do?idx=${ signVo.idx }'">
						<!-- 프로필 탭 -->
						<label for="tab2" id="btn2">프로필</label>
						<input id="tab2" type="button" value="프로필" style="display: none;" onclick="profile(this.form);">
						<!-- 다이어리 탭 -->
						<label for="tab3" id="btn3">다이어리</label>
						<input id="tab3" type="button" value="다이어리" style="display: none;" onclick="diary(this.form);">
						<!-- 사진첩 탭 -->
						<label for="tab4" id="btn4">사진첩</label>
						<input id="tab4" type="button" value="사진첩" style="display: none;" onclick="gallery(this.form);">
						<!-- 방명록 탭 -->
						<label for="tab5" id="btn5">방명록</label>
						<input id="tab5" type="button" value="방명록" style="display: none;" onclick="guestbook(this.form);">
					</div>
				</form>
			</div>
		</section>
	</div>
	
	<!-- 눈내리는곳 -->
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
	<div class="snowflake"></div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
<!-- Ajax 사용을 위한 js를 로드 -->
<script src="/cyworld_oracle/resources/js/httpRequest.js"></script>
<!-- 네이버 로그인 API -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<!-- 카카오 로그인 API -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/project/cyworld_oracle/src/main/webapp/resources/js/category/main.js"></script>
</body>
</html>