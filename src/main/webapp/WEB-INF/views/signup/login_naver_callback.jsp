<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head> </head>
  <body>
    <!-- 네이버 회원가입에 미리 작성될 정보들 -->
    <form id="ff" action="login_authentication.do" method="POST">
      <input name="platform" type="hidden" value="naver" />
      <input name="name" id="name" type="hidden" />
      <input name="gender" id="gender" type="hidden" />
      <input name="email" id="email" type="hidden" />
    </form>
	
    <!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
    <script
      type="text/javascript"
      src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
      charset="utf-8"
    ></script>
    <script src="/cyworld_oracle/src/main/webapp/resources/js/signup/login_naver_callback.js"></script>
  </body>
</html>
