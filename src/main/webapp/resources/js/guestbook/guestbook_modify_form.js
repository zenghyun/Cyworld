// 방명록 수정
function send(f) {
  var url = "guestbook_modify.do";
  var param =
    "guestIdx=" +
    f.guestIdx.value +
    "&guestbookContentRef=" +
    f.guestbookContentRef.value +
    "&guestbookContent=" +
    encodeURIComponent(f.guestbookContent.value) +
    "&guestbookContentName=" +
    encodeURIComponent(f.guestbookContentName.value) +
    "&guestbookSecretCheck=" +
    f.guestbookSecretCheck.value +
    "&guestbookSession=" +
    f.guestbookSession.value +
    "&guestbookMinimi=" +
    f.guestbookMinimi.value;
  sendRequest(url, param, sendCallback, "GET");
}

// 방명록 수정 콜백메소드
function sendCallback() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    var data = xhr.responseText;

    var json = new Function("return" + data)();

    if (json.result == "no") {
      alert("수정실패");
      return;
    }

    alert("수정성공");
    location.href = "guestbook.do?idx=${vo.guestIdx}";
  }
}
