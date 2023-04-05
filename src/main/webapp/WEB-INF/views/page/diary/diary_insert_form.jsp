<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>다이어리 작성</title>
    <link
      rel="stylesheet"
      href="/cyworld_oracle/resources/css/diary_insert.css"
    />
    <link rel="stylesheet" href="/cyworld_oracle/resources/css/reset.css" />
    <link rel="stylesheet" href="/cyworld_oracle/resources/css/animate.css" />
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
              <form>
                <input name="diaryIdx" type="hidden" value="${ param.idx }" />
                <table>
                  <caption>
                    새 글 쓰기
                  </caption>

                  <tr>
                    <th>내용</th>
                    <td>
                      <textarea
                        rows="5"
                        cols="50"
                        name="diaryContent"
                      ></textarea>
                    </td>
                  </tr>

                  <tr>
                    <td>
                      <input
                        id="btn-cover"
                        class="write"
                        type="button"
                        value="글쓰기"
                        onclick="send(this.form);"
                      />
                      <input
                        id="btn-cover"
                        class="cancel"
                        type="button"
                        value="취소"
                        onclick="location.href='diary.do?idx=${param.idx}'"
                      />
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
    <!-- Ajax 사용을 위한 js를 로드 -->
    <script src="/cyworld_oracle/resources/js/httpRequest.js"></script>
    <script src="/cyworld_oracle/src/main/webapp/resources/js/diary/diary_insert_form.js"></script>
  </body>
</html>
