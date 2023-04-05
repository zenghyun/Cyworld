<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미니미 설정</title>
<link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/popUp.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container" id="scrollBar">
		<h2 class="title">미니미 설정창</h2>
		
		<div class="myMinimiBox">
			<p class="subTitle">-나의 미니미-</p>
			<div class="myMinimi">
				<!-- 현제 사용중인 미니미 -->
				<img src="/cyworld_oracle/resources/minimi/${ minimi }" alt="">
				<!-- 현제 가지고있는 도토리 수  -->
				<span id="dotoryNum">${ dotory }</span>
			</div>
		</div>
		
		<div class="myMinimiListBox" id="scrollBar">
			<p class="subTitle">-보유 미니미-</p>
			<div class="myMinimiList">
				<!-- 보유 미니미 - 나의 미니미 변경 -->
				<form action="">
					<div class="tabs">
						<!-- 미니미 변경 완료 버튼 -->
						<input id="btn-cover" class="close "type="button" value="완료" onclick="opener.location.href='main.do?idx=${ param.idx }'; buyclose();">
						
						<input name="idx" type="hidden" value="${ param.idx }">
						<!-- 현제 보유중인 미니미 -->
						<input id="tab1" class="btn" name="minimi" type="checkbox"  value="Spongebob.gif" onclick="NoMultiChk1(this)"></input>
						<input id="tab2" class="btn" name="minimi" type="checkbox"  value="stitch.gif" onclick="NoMultiChk1(this)"></input>
						<input id="tab3" class="btn" name="minimi" type="checkbox"  value="Crayon3.gif" onclick="NoMultiChk1(this)"></input>
						<!-- 구매하면 등장할 미니미 -->
						<c:forEach var="buyMinimi" items="${ buyMinimi }">
							<c:if test="${ buyMinimi.buyMinimiName eq 'cat.gif' }">
								<input id="tab4" class="btn" name="minimi" type="checkbox" value="cat.gif" onclick="NoMultiChk1(this)"></input>
							</c:if>
							<c:if test="${ buyMinimi.buyMinimiName eq 'cat.gif' }">
								<input id="tab5" class="btn" name="minimi" type="checkbox" value="thePooh.gif" onclick="NoMultiChk1(this)"></input>
							</c:if>
							<c:if test="${ buyMinimi.buyMinimiName eq 'cat.gif' }">
								<input id="tab6" class="btn" name="minimi" type="checkbox" value="fat.gif" onclick="NoMultiChk1(this)"></input>
							</c:if>
						</c:forEach>
						
						<div class="tab-btns">
							<!-- 현제 보유중인 미니미 -->
							<label for="tab1" id="btn1" ><div class="list"><img name="Spongebob.gif" src="resources/images/Spongebob.gif" alt=""></div></label>
							<label for="tab2" id="btn2" ><div class="list"><img name="stitch.gif" src="resources/images/stitch.gif" alt=""></div></label>
							<label for="tab3" id="btn3" ><div class="list"><img name="Crayon3.gif" src="resources/images/Crayon3.gif" alt=""></div></label>
							<!-- 구매하면 등장할 미니미 -->
							<c:forEach var="buyMinimi" items="${ buyMinimi }">
								<c:if test="${ buyMinimi.buyMinimiName eq 'cat.gif' }">
									<label for="tab4" id="btn4" ><div class="list"><img name="cat.gif" src="resources/images/cat.gif" alt="" ></div></label>
								</c:if>
								<c:if test="${ buyMinimi.buyMinimiName eq 'thePooh.gif' }">
									<label for="tab5" id="btn5" ><div class="list"><img name="thePooh.gif" src="resources/images/thePooh.gif" alt=""></div></label>
								</c:if>
								<c:if test="${ buyMinimi.buyMinimiName eq 'fat.gif' }">
									<label for="tab6" id="btn6" ><div class="list"><img name="fat.gif" src="resources/images/fat.gif" alt=""></div></label>
								</c:if>
							</c:forEach>
						</div>
						<!-- 미니미 변경 버튼 -->
						<input id="btn-cover" class="change" type="button" value="변경" onclick="changeMinimi(this.form);">
					</div>
				</form>
			</div>
		</div>
		
		<div class="buyMinimi" id="scrollBar">
			<p class="subTitle" id="lastTitle">※ 구매 가능</p>
			<p class="subTitle" >-액션 미니미-</p>
			<!-- 액션 미니미 구매 - 구매하면 내가 구매한 미니미가 보유 미니미로 가고 리스트 갱신-->
			<form action="">
				<div class="tabs">
					<input name="idx" type="hidden" value="${ param.idx }">
					<input name="dotoryNum" type="hidden" value="${ dotory }">
					<!-- 유료 미니미 -->
					<input id="tab7" class="btn" name="buyMinimiName" type="checkbox" value="cat.gif" onclick="NoMultiChk2(this)"></input>
					<input name="price" type="number" class="price" id="price1" value="500" readonly></input><span id="font">개</span>
					<input id="tab8" class="btn" name="buyMinimiName" type="checkbox" value="thePooh.gif" onclick="NoMultiChk2(this)"></input>
					<input name="price" type="number" class="price" id="price2" value="1000" readonly></input><span id="font">개</span>
					<input id="tab9" class="btn" name="buyMinimiName" type="checkbox" value="fat.gif" onclick="NoMultiChk2(this)"></input>
					<input name="price" type="number" class="price" id="price3" value="2000" readonly></input><span id="font">개</span>
					
					<div class="tab-btns">
						<!-- 유료 미니미 -->
						<label for="tab7" id="btn7" ><div class="list"><img name="cat.gif" src="resources/images/cat.gif" alt="" ></div></label>
						<label for="tab8" id="btn8" ><div class="list"><img name="thePooh.gif" src="resources/images/thePooh.gif" alt=""></div></label>
						<label for="tab9" id="btn9" ><div class="list"><img name="fat.gif" src="resources/images/fat.gif" alt=""></div></label>
					</div>
					<!-- 미니미 구매 버튼 -->
					<input id="btn-cover" class="buy" type="button" value="구매" onclick="purchaseMinimi(this.form);">
				</div>
			</form>
		</div>
	</div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
	<!-- Ajax 사용을 위한 js를 로드 -->
	<script src="/cyworld_oracle/resources/js/httpRequest.js"></script>
	<script src="/cyworld_oracle/src/main/webapp/resources/js/category/minimiPopUp.js"></script>
</body>
</html>