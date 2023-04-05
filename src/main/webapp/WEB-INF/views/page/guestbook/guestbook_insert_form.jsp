<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 작성</title>
<link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css">
<link rel="stylesheet" href="/cyworld_oracle/resources/css/guestbook_insert.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container ">
		<section class="section">
			<div class="dashed-line">
				<div class="gray-background">
					<div class="main">
						<form>
							<input name="idx" type="hidden" value="${ param.idx }">
							<table >
								<caption>::: 방명록 작성 :::</caption>
								
								<tr>
									<th>미니미</th>
									<td>
										<img class="myImg" src="/cyworld_oracle/resources/minimi/${ minimi }"/>
										<input name="guestbookMinimi" type="hidden"  value="${ minimi }">
									</td>
								</tr>
								
								<tr>
									<th>내용</th>
									<td><textarea rows="5" cols="50" name="guestbookContent"></textarea></td>
								</tr>
								
								<tr>
									<th>작성자</th>
									<td><input  type="text" name="guestbookContentName" value="${ guestbookContentName }" readonly></td>
								</tr>
								
								<tr>
									<td class="lastTd"colspan="2" >
										<input id="btn-cover" class="write" type="button" value="글쓰기" onclick="send(this.form);">
										<input class="cancel" id="btn-cover" type="button" value="취소" onclick="location.href='guestbook.do?idx=${param.idx}'">
										<!-- 비밀글 설정 여부 -->
										<select class="textChoice" id="guestsecret" name="guestbookSecretCheck" onchange="selectbox">
											<!-- 공개글 -->
											<option  value="0">전체 공개</option>
											<!-- 비밀글 -->
											<option value="1">비공개</option> 
										</select>
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
		// 방명록 작성
		function send(f) {
			f.action = "guestbook_insert.do";
			f.method = "GET";
			f.submit();
		}
	</script>
</body>
</html>