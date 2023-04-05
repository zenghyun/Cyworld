// 다이어리 글 수정
function send(f) {
  var url = "diary_modify.do";
  var param =
    "diaryContentRef=" +
    f.diaryContentRef.value +
    "&diaryContent=" +
    encodeURIComponent(f.diaryContent.value);
  sendRequest(url, param, sendCallback, "GET");
}

// 다이어리 글 수정 콜백메소드
function sendCallback() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    var data = xhr.responseText;

    var json = new Function("return" + data)();

    if (json.result == "no") {
      alert("수정실패");
      return;
    }

    alert("수정성공");
    location.href = "diary.do?idx=${param.diaryIdx}";
  }
}
