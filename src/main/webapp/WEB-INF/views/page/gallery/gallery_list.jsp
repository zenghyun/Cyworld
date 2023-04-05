<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ signVo.name }님의 사진첩</title>
<link rel="stylesheet" href="/cyworld_oracle/resources/css/gallery.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/animate.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body >
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
						<!-- 카테고리 - 미개발 -->
						<details>
							<summary>2022</summary>
							<ul>
								<li><a href="#">----- 일상</a></li>
								<li><a href="#">----- 여행</a></li>
								<li><a href="#">----- 기록</a></li>
							</ul>
						</details>
						<details>
							<summary class="summary">2021</summary>
							<ul>
								<li><a href="#">----- 일상</a></li>
								<li><a href="#">----- 여행</a></li>
								<li><a href="#">----- 기록</a></li>
							</ul>
						</details>
						<div class="hover">
							<div class="show">
								<img src="resources/images/sorryForShow.gif" alt="">
								<p class="sorryText">
									카테고리 기능은 개발중에 있습니다. <br> <span>※개발진 일동</span>
								</p>
							</div>
						</div>
					</aside>
				</div>
			</div>
		</section>
		
		<section class="right-section">
			<div class="right-dashed-line">
				<div class="right-gray-background">
					<!-- 메인 타이틀 - 클릭시 새로고침 역할 -->
					<p class="title"><a href="main.do?idx=${ signVo.idx }">${ signVo.mainTitle }</a></p>
					<!-- bgm - 페이지 오른쪽 상단에 재생 플레이어와 노래 제목 표시 -->
					<img class="musicLogo" src="resources/images/noneMain15.gif" alt="">
					<a class="mp3_title" href="#" ><div class="circle-container">
						<div class="circle circle1"> ♫ 오르트 구름 - 윤하 </div>
					</div></a>
					<audio class="mp3" controls>
						<source src="/cyworld_oracle/resources/sound/main.mp3" type="audio/mp3">
					</audio>
					
					<aside class="right-aside" id="scrollBar">
						<div class="fake"></div>
						<div class="galleryContainer">
							<div id="writing">
								<h1>사진첩 목록</h1>
								<!-- 로그인한 유저가 사진첩 주인일 경우에만 보인다 -->
								<c:if test="${ sessionIdx eq signVo.idx }">
									<input id="btn-cover" type="button" value="글쓰기" onclick="location.href='gallery_insert_form.do?idx=${signVo.idx}'">
								</c:if>
							</div>
							<!-- varStatus - forEach를 돌리면서 추가로 숫자를 순서대로 지정할 수 있게 만들어준다 -->
							<c:forEach var="vo" items="${ galleryList }" varStatus="cnt">
								<div class="gallery_box">
									<form>
										<!-- 게시글 정보 구역 -->
										<input type="hidden" name="galleryIdx" value="${ vo.galleryIdx }">
										<div class="galleryTitle"><span>게시글 제목:</span> ${ vo.galleryTitle }</div>
										<div class="galleryDate">
											<span class="contentNum"> &nbsp;&nbsp;게시글 번호: </span><input class="cNum" type="text" name="galleryContentRef" value="${ vo.galleryContentRef}">
											<span class="date">작성일자 : ${ vo.galleryRegdate } </span>
										</div>
										<!-- 게시글 사진 및 비디오 구역 -->
										<div class="type_galleryFile">
											<!-- 첨부된 이미지가 있는 경우에만 image 및 video태그를 보여주자! -->
											<c:if test="${ vo.galleryFileName ne 'no_file' }">
												<!-- 확장자가 image일 경우 -->
												<c:if test="${ vo.galleryFileExtension eq 'image' }">
													<div class="ImgPosition"><img class="myImg" src="/cyworld_oracle/resources/upload/${ vo.galleryFileName }"/></div>
												</c:if>
												<!-- 확장자가 video일 경우 -->
												<c:if test="${ vo.galleryFileExtension eq 'video' }">
													<div class="VideoPosition">
														<!-- video태그 autoplay : 자동 재생 / controls loop : 반복 재생 / muted : 음소거 -->
														<video class="myVideo" autoplay controls loop muted src="/cyworld_oracle/resources/upload/${ vo.galleryFileName }"/>
													</div>
												</c:if>
											</c:if>
										</div>
										<!-- 게시글 내용 구역 -->
										<div class="type_gallerycontent">
											<pre><textarea class="galleryContent" id="scrollBar1" readonly>${ vo.galleryContent }</textarea></pre> 
											<div class="myButton">
												<!-- 좋아요 구역 -->
												<p class="like">
													<!-- ${cnt.index} - forEach에서 생성한 숫자를 id에 추가로 순서대로 지정한다  -->
													<span id="galleryLikeNum${ cnt.index }">${ vo.galleryLikeNum }</span>
													<input  id="heart" type="button" onclick="like(this.form)" >
												</p>
												<!-- 로그인한 유저가 사진첩 주인일 경우에만 보인다. -->
												<c:if test="${ sessionIdx eq vo.galleryIdx }">
													<p class="changeBtn">
														<input id="btn-cover" type="button" value="수정" onclick="modify(this.form);">
														<input id="btn-cover" class="del"  type="button" value="삭제" onclick="del(this.form);">
													</p>
												</c:if>
											</div>
										</div>
									</form>
								</div>
								
								<!-- 댓글 구역 -->
								<div class="commentArea">
									<form>
										<div id="GalleryReply">
											<!-- 사진첩 주인 idx -->
											<input type="hidden" name="galleryCommentIdx" value="${ vo.galleryIdx }">
											<!-- 사진첩 댓글 번호 -->
											<input type="hidden" name="galleryCommentRef" value="${ vo.galleryContentRef }">
											<!-- 작성자 이름 -->
											<div class="commentWriter"><label>&nbsp;&nbsp;작성자 : </label><input type="text" name="galleryCommentName" value="${ sessionName }" readonly>
												<!-- 댓글 작성 -->
												<label>&nbsp;&nbsp;댓글 : </label><input type="text" name="galleryCommentContent">
												<!-- 댓글 작성 버튼 -->
												<input id="btn_cover" class="GC-reply" type="button" value="댓글등록" onclick="reply(this.form);">
											</div>
										</div>
									</form>
									<!-- 게시글마다 댓글 보이는 구역 -->
									<c:forEach var="cvo" items="${ commentList }">
										<form>
											<!-- 댓글 idx와 사진첩 idx가 같고, 댓글 번호와 게시글 번호가 같을 경우  -->
											<c:if test="${ cvo.galleryCommentIdx eq vo.galleryIdx && cvo.galleryCommentRef eq vo.galleryContentRef }">
												<div class="Gallerycomment">
													<!-- 사진첩 주인 idx -->
													<input type="hidden" name="galleryCommentIdx" value="${ cvo.galleryCommentIdx }">
													<!-- 사진첩 댓글 번호 -->
													<input type="hidden" name="galleryCommentRef" value="${ cvo.galleryCommentRef }">
													<!-- 사진첩 게시글 번호 -->
													<input type="hidden" name="galleryNum" value="${ cvo.galleryNum }">
													<!-- 댓글 상단 정보 구역 -->
													<div class="textPosition"> 작성자 : ${ cvo.galleryCommentName } / 작성일자 : ${ cvo.galleryCommentRegdate }</div>
													<!-- 댓글 하단 내용 구역 -->
													<c:if test="${cvo.galleryCommentDeleteCheck eq 0}">
														<div class="textPosition"><pre>댓글 : ${ cvo.galleryCommentContent }</pre></div>
													</c:if>
													<!-- 댓글을 삭제했을 경우 -->
													<c:if test="${cvo.galleryCommentDeleteCheck eq -1}">
														<div class="flip-box">
															<div class="flip">
																<div class="frontdelComment"><img src="resources/images/cry.png" alt="">&nbsp;&nbsp; 댓글을 볼 수 없어요 ㅠ</div>
																<div class="backdelComment" id="backColor">삭제된 댓글입니다.</div>
															</div>
														</div>
													</c:if>
													<!-- 댓글을 삭제하지 않았을 경우 -->
													<c:if test="${ cvo.galleryCommentDeleteCheck eq 0 }">
														<!-- 로그인한 유저가 작성자 이거나 사진첩 주인일 경우에만 보인다 -->
														<c:if test="${ sessionIdx eq cvo.galleryCommentSession || sessionIdx eq cvo.galleryCommentIdx }">
															<input  id="btn_cover"type="button" value="댓글삭제" onclick="gcdel(this.form);">
														</c:if>
													</c:if>
												</div>
											</c:if>
										</form>
									</c:forEach>
								</div>
							</c:forEach>
						</div>
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
	<script src="/cyworld_oracle/src/main/webapp/resources/js/gallery/gallery_list.js"></script>
	
</body>
</html>