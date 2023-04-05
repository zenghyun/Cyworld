<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진첩 수정</title>
<link rel="stylesheet" href="/cyworld_oracle/resources/css/gallery_modify.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container ">
		<section class="section">
			<div class="dashed-line">
				<div class="gray-background">
					<div class="main">
						<form method="POST" enctype="multipart/form-data">
							<input name="galleryIdx" type="hidden" value="${ vo.galleryIdx }">
							<input name="galleryContentRef" type="hidden" value="${ vo.galleryContentRef }">
							<input name="galleryFileExtension" type="hidden" value="${ vo.galleryFileExtension }">
							<table>
								<caption>사진첩 수정</caption>
								
								<tr>
									<th>제목</th>
									<td><input name="galleryTitle" value="${ vo.galleryTitle }"></td>
								</tr>
								
								<tr>
									<th>내용</th>
									<td><pre><textarea rows="5" cols="50" name="galleryContent">${vo.galleryContent}</textarea></pre></td>
								</tr>
								
								<tr>
									<th>파일</th>
									<td>
										<!-- 첨부된 이미지가 있는 경우에만 image 및 video태그를 보여주자! -->
										<c:if test="${ vo.galleryFileName ne 'no_file' }">
											<!-- 확장자가 image일 경우 -->
											<c:if test="${ vo.galleryFileExtension eq 'image' }">
												<img src="/cyworld_oracle/resources/upload/${ vo.galleryFileName }" width="100"/>
											</c:if>
											<!-- 확장자가 video일 경우 -->
											<c:if test="${ vo.galleryFileExtension eq 'video' }">
												<!-- video태그 autoplay : 자동 재생 / controls loop : 반복 재생 / muted : 음소거 -->
												<video autoplay controls loop muted src="/cyworld_oracle/resources/upload/${ vo.galleryFileName }" width="100"/>
											</c:if>
										</c:if>
										<input name="galleryFileName" value="${ vo.galleryFileName }" readonly>
									</td>
								</tr>
								
								<tr>
									<th>파일첨부</th>
									<td><input type="file" name="galleryFile"></td>
								</tr>
								
								<tr>
									<td colspan="2" >
										<input id="btn-cover" class="modify" type="button" value="수정" onclick="modify(this.form);">
										<input id="btn-cover" class="cancel" type="button" value="취소" onclick="location.href='gallery.do?idx=${vo.galleryIdx}'">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->	
	<script>
		// 게시글 수정
		function modify(f) {
			f.action = "gallery_modify.do";
			f.submit();
		}
	</script>
</body>
</html>