// 다이어리 글 작성

function send(f) {
  let diaryContent = f.diaryContent.value;

  //유효성 체크

  if (diaryContent == "") {
    alert("내용 입력은 필수입니다.");
    return;
  }

  f.action = "diary_insert.do";
  f.method = "GET";
  f.submit();
}
