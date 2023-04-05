// bgm 재생

//Audio 사용을 위한 객체 생성
let audio = new Audio();
//오디오가 참조하는 노래 주소 지정
audio.src = "/cyworld/resources/sound/main.mp3";
myAudio.loop = true; //노래가 끝나도 loop가 가능하게 설정
audio.play();
audio.volume = 3;

// 다이어리 글 삭제
function del(f) {
  if (!confirm("정말 삭제하시겠습니까?")) {
    return;
  }

  var url = "diary_delete.do";
  var param =
    "diaryIdx=" +
    f.diaryIdx.value +
    "&diaryContentRef=" +
    f.diaryContentRef.value;
  sendRequest(url, param, resultFn, "GET");
}
// 다이어리 글 삭제 콜백메소드
function resultFn() {
  if (xhr.readyState == 4 && xhr.status == 200) {
    var data = xhr.responseText;

    if (data == "no") {
      alert("삭제 실패");
      return;
    }

    alert("삭제성공");
    location.href = "diary.do?idx=${param.idx}";
  }
}

// 다이어리 글 수정
function modify(f) {
  f.action = "diary_modify_form.do";
  f.method = "GET";
  f.submit();
}

//오른쪽 탭 기능

// 프로필 탭
function profile(f) {
  let sessionIdx = document.getElementById("sessionIdx").value;
  let idx = document.getElementById("idx").value;

  // 타 유저 접근 불가
  if (sessionIdx != idx) {
    alert("프로필은 본인만 들어갈 수 있습니다");
    return;
  }

  f.action = "profile.do";
  f.method = "POST";
  f.submit();
}
