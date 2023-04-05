<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css" />
    <link rel="stylesheet" href="/cyworld_oracle/resources/css/animate.css" />
    <link rel="stylesheet" href="/cyworld_oracle/resources/css/findId.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="container">
      <section class="section">
        <div class="dashed-line">
          <div class="gray-background">
            <div class="main">
              <img
                class="logo-main box animate__animated animate__rubberBand animate__"
                src="resources/images/logo_cyworld.png"
                alt=""
              />

              <form>
                <div class="myname">
                  이름 <br />
                  <input class="nameText" name="name" type="text" />
                </div>
                <div id="phone">
                  휴대전화 <br />
                  <input
                    class="phoneText"
                    id="phoneNumber"
                    name="phoneNumber"
                    type="text"
                    placeholder="휴대폰 번호를 입력해주세요"
                    maxlength="13"
                  />
                </div>
                <input
                  id="btn-cover"
                  type="button"
                  value="아이디 찾기"
                  onclick="findID(this.form)"
                />
                <input
                  id="btn_cover"
                  class="cancel"
                  type="button"
                  value="취소"
                  onclick="location.href='logout.do'"
                />
              </form>
            </div>
          </div>
        </div>
      </section>
    </div>
    <!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
    <!-- Ajax 사용을 위한 js를 로드 -->
    <script src="/cyworld_oracle/resources/js/httpRequest.js"></script>
	<script src="/cyworld_oracle/src/main/webapp/resources/js/signup/find_id.js"></script>
  </body>
</html>
