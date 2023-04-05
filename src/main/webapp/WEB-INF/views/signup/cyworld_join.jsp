<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Cyworld 회원가입</title>
    <link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css" />
    <link rel="stylesheet" href="/cyworld_oracle/resources/css/animate.css" />
    <link rel="stylesheet" href="/cyworld_oracle/resources/css/cyjoin.css" />
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
            <div class="main" id="scrollBar">
              <img
                class="logo-main box animate__animated animate__rubberBand animate__"
                src="resources/images/logo_cyworld.png"
                alt=""
              />

              <form>
                <!-- 플랫폼을 받아와 숨겨놓는다 -->
                <input name="platform" type="hidden" value="${ vo.platform }" />
                <p class="userID">
                  ID <br />
                  <input id="userID" name="userID" type="text" />
                </p>
                <input id="doubleId" type="hidden" />
                <input
                  class="checkButton"
                  id="btn-cover"
                  type="button"
                  value="중복 확인"
                  onclick="doubleCheck();"
                />
                <p class="userPW">
                  PW <br />
                  <input
                    id="pw"
                    name="info"
                    type="password"
                    oninput="pwCheck();"
                  />
                </p>
                <div class="pwText" id="pT1"></div>
                <p class="userPW2">
                  PW 확인 <br />
                  <input id="pw2" type="password" oninput="pw2Check();" />
                </p>
                <div class="pwText pT2"></div>
                <p class="name">
                  이름 <br />
                  <input name="name" type="text" />
                </p>
                <p class="rNumber">
                  주민번호 <br />
                  <input
                    name="identityNum"
                    id="identityNum"
                    type="text"
                    placeholder="주민번호 13자리를 입력해주세요"
                    maxlength="14"
                  />
                </p>
                <p class="gender">
                  성별 <br />
                  <input name="gender" type="radio" value="male" />&nbsp; 남자
                  <input name="gender" type="radio" value="female" />&nbsp; 여자
                </p>
                <p class="email">
                  이메일 <br />
                  <input id="email" name="email" type="text" />
                </p>
                <input
                  class="sendANum1"
                  id="btn-cover"
                  type="button"
                  value="인증번호 전송"
                  onclick="emailCheckSend();"
                />
                <p class="ANum">
                  인증번호 <br />
                  <input id="i_email" type="text" />
                </p>
                <input id="h_email" type="hidden" />
                <input
                  class="sendANum2"
                  ID="btn-cover"
                  type="button"
                  value="인증번호 확인"
                  onclick="emailCheck();"
                />
                <p class="phone">
                  휴대전화 <br />
                  <input
                    id="phoneNumber"
                    name="phoneNumber"
                    type="text"
                    placeholder="휴대전화 번호를 입력해주세요"
                    maxlength="13"
                  />
                </p>
                <p class="address">
                  주소 <br />
                  <input class="address_kakao" name="address" type="text" />
                </p>
                <input
                  class="address2 address_kakao"
                  id="btn-cover"
                  type="button"
                  value="주소찾기"
                />
                <br />
                <p class="rAddress">
                  상세 주소 <br />
                  <input
                    class="address_kakao"
                    name="addressDetail"
                    type="text"
                  />
                </p>
                <input
                  class="mJoin"
                  id="btn-cover"
                  type="button"
                  value="가입"
                  onclick="cyworldJoin(this.form);"
                />
                <input
                  id="btn-cover"
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
    <!-- 다음 주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/cyworld_oracle/src/main/webapp/resources/js/signup/cyworld_join.js"></script>
  </body>
</html>
