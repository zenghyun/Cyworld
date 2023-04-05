<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ signVo.name }님의 프로필</title>
<link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/animate.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/yourProfile.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container">
		<section class="left-section">
			<div class="left-dashed-line">
				<div class="left-gray-background">
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
						<!-- 좌측 프로필 사진 및 프로필 소개글 수정 -->
						<form method="POST" enctype="multipart/form-data">
							<!-- 해당 미니홈피 유저의 idx -->
							<input name="idx" type="hidden" value="${ signVo.idx }">
							<!-- 기존 프로필 사진 -->
							<div class="left-image"><img class="leftImg" src="/cyworld_oracle/resources/mainphoto/${ signVo.mainPhoto }" alt=""></div>
													<input name="mainPhoto" type="hidden" value="${ signVo.mainPhoto }">
							<!-- 프로필 사진 수정 -->
							<input id="btn-cover" class="selectFile" name="mainPhotoFile" type="file">
							<!-- 기존 프로필 소개글 및 수정 -->
							<textarea name="mainText" class="left-textarea scrollBar"  onkeyup="check_length(this);" placeholder="최대 작성글자는 30자 이내입니다.">${ signVo.mainText }</textarea>
							<input id="btn-cover" class="saveLeftMain" type="button" value="좌측 프로필 수정" onclick="modify_main(this.form)">
						</form>
						<!-- 히스토리 -->
						<div class="history"><img src="resources/images/arrow.png" alt=""><h3>History</h3></div>
						<!-- 파도타기 -->
						<select class="myFriend" onchange="if(this.value) location.href=(this.value);">
							<option value="">::: 파도타기 :::</option>
							<c:forEach var="ilchonList" items="${ ilchonList }">
								<!-- 프로필에서 파도타기는 해당 미니홈피 유저의 프로필로 이동하는것이 아닌 메인으로 이동한다 -->
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
					<!-- 기존 메인 타이틀 및 수정 -->
					<p class="title"><input  id="mainTitle" type="text" value="${ signVo.mainTitle }" onkeyup="check_length(this);" placeholder="최대 작성글자는 30자 이내입니다."></p>
					<aside id="right-aside" class="scrollBar">
						<div class="miniRoomBox"><p>Mini Room</p>
							<div class="miniRoom"><img class="miniRoomImg" src="resources/images/MainroomGif.gif" alt="">
								<div class="hover">
									<div class="show">
										<img src="resources/images/sorryForShow.gif" alt="">
										<p class="sorryText">아직 개발중에 있습니다. <span>※개발진 일동</span></p>
									</div>
								</div>
								<div class="Crayon"><img src="resources/images/Crayon.png" alt=""></div>
							</div>
							<div class="zzang1"><img src="resources/images/zzang.gif" alt=""></div>
							<div class="zzang2"><img src="resources/images/zzang2.gif" alt=""></div>
							<div class="zzang3"><img src="resources/images/zzang3.gif" alt=""></div>
							<div class="Crayonz"><img class="friends" src="resources/images/Crayonz.gif" alt=""></div>
							<div class="CrayonDog"><img src="resources/images/CrayonDog.gif" alt=""></div>	                            
						</div>
						<!-- 미니미 수정 -->
						<form>
							<input class="check_btn" id="btn-cover" type="button" value="미니미수정" onclick="toggle();"></input>
							<div id="minimi_correction" class="scrollBar">
								<div class="minimi-list">
									<div class="minimi-area">
										<input id="btn-cover" class="minimi-select"type="submit" value="수정">
										<input class="minimi-choice" type="radio">
										<img src="resources/images/Crayon2 .png" alt="">
									</div>
								</div>
							</div>
						</form>
						
						<div class="hover1">
							<div class="show1">
								<img src="resources/images/sorryForShow.gif" alt="">
								<p class="sorryText1">아직 개발중에 있습니다. <span>※개발진 일동</span></p>
							</div>
						</div>
						<!-- 개인정보 수정 -->
						<form>
							<div class="modify-user-profile">
								<h2>::개인정보 수정::</h2>
								<p id="my-minimi">My minimi</p>
								<!-- 미니미 수정 -->
								<input class="minimi-main" type="button" src="/cyworld_oracle/resources/minimi/${ signVo.minimi }" onclick="minimiPopUp();">
								<!-- 해당 미니홈피 유저의 idx -->
								<input name="idx" type="hidden" value="${ signVo.idx }">
								<!-- 해당 미니홈피 유저의 플랫폼 -->
								<input name="platform" type="hidden" value="${ signVo.platform }">
								<!-- 싸이월드 가입자한테만 보이는 추가 항목들 -->
								<c:if test="${ signVo.platform eq 'cyworld' }">
									<p>ID : <input type="text" value="${ signVo.userID }" readonly></p>
									<p>현재 PW : <input name="info" type="text" value="${ signVo.info }" readonly></p>
									<p>새로운 PW : <input id="pw" name="info" type="password" oninput="pwCheck();"></p>
									<div class="pwText" id="pT1"></div>
									<p>PW 확인 : <input id="pw2" type="password" oninput="pw2Check();"></p>
									<div class="pwText pT2"></div>
								</c:if>
								<!-- 소셜 가입자한테만 보이는 추가 항목들 -->
								<c:if test="${ signVo.platform ne 'cyworld' }">
									<p>ID : <input type="text" value="소셜 로그인 이용중" readonly></p>
									<p>PW : <input name="info" type="text" value="소셜 로그인 이용중" readonly></p>
								</c:if>
								<!-- 공통으로 보이는 항목들 -->
								<p>이름 : <input type="text" value="${ signVo.name }" readonly></p>
								<p>주민번호 : <input type="text" value="${ signVo.identityNum }" readonly></p>
								<!-- 남자일 경우 -->
								<c:if test="${ signVo.gender eq 'M' || signVo.gender eq 'male' }">
									<p>성별:&nbsp; <input class="myRadio" type="radio" name="gender" value="${ signVo.gender }" checked readonly>&nbsp;남</p>
								</c:if>
								<!-- 여자일 경우 -->
								<c:if test="${ signVo.gender eq 'W' || signVo.gender eq 'female' }">
									<p>성별:&nbsp; <input  class="myRadio" type="radio" name="gender" value="${ signVo.gender }" checked readonly>&nbsp;여</p>
								</c:if>
								<p>이메일 : <input type="text" value="${ signVo.email }" readonly></p>
								<p>전화번호 : <input type="tel" value="${ signVo.phoneNumber }" readonly></p>
								<input class="final-button" id="btn-cover" type="button" value="수정" onclick="modifyUserData(this.form);">
							</div>
						</form> 
					</aside>
				</div>
			</div>
			
			<!-- 오른쪽 탭 -->
			<div class="tabs">
				<form>
					<div class="tab-btns">
						<!-- 해당 미니홈피 유저의 idx -->
						<input id="idx" name="idx" type="hidden" value="${ signVo.idx }" readonly>
						<!-- 로그인한 유저의 idx -->
						<input id="sessionIdx" name="sessionIdx" type="hidden" value="${ sessionIdx }" readonly>
						<!-- 홈 탭 -->
						<label for="tab1" id="btn1">홈</label>
						<input id="tab1" type="button" value="홈" style="display: none;" onclick="location.href='main.do?idx=${ signVo.idx }'">
						<!-- 프로필 탭 -->
						<label for="tab2" id="btn2">프로필</label>
						<input id="tab2" type="button" value="프로필" style="display: none;" onclick="profile(this.form);">
						<!-- 다이어리 탭 -->
						<label for="tab3" id="btn3">다이어리</label>
						<input id="tab3" type="button" value="다이어리" style="display: none;" onclick="location.href='diary.do?idx=${ signVo.idx }'">
						<!-- 사진첩 탭 -->
						<label for="tab4" id="btn4">사진첩</label>
						<input id="tab4" type="button" value="사진첩" style="display: none;" onclick="location.href='gallery.do?idx=${ signVo.idx }'">
						<!-- 방명록 탭 -->
						<label for="tab5" id="btn5">방명록</label>
						<input id="tab5" type="button" value="방명록" style="display: none;" onclick="location.href='guestbook.do?idx=${ signVo.idx }'">
					</div>
				</form>
			</div>
		</section>
	</div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
	<!-- Ajax 사용을 위한 js를 로드 -->
<script src="/cyworld_oracle/resources/js/httpRequest.js"></script>
<script src="/cyworld_oracle/src/main/webapp/resources/js/category/profile.js"></script>
</body>
</html>