// 도토리 구매
function buy(f) {
  let dotoryNum = f.dotoryNum;

  // 선택한 도토리 구매
  if (dotoryNum[0].checked == true) {
    f.action = "dotoryBuy.do";
    f.method = "GET";
    f.submit();
  } else if (dotoryNum[1].checked == true) {
    f.action = "dotoryBuy.do";
    f.method = "GET";
    f.submit();
  } else if (dotoryNum[2].checked == true) {
    f.action = "dotoryBuy.do";
    f.method = "GET";
    f.submit();
  } else if (dotoryNum[3].checked == true) {
    f.action = "dotoryBuy.do";
    f.method = "GET";
    f.submit();
  }
  alert("구매완료");
}

// 팝업창 닫기
function buyclose() {
  return window.close();
}

// checkbox 중복 체크 방지

function NoMultiChk(chk) {
  let obj = document.getElementsByName("dotoryNum");
  for (let i = 0; i < obj.length; i++) {
    if (obj[i] != chk) {
      obj[i].checked = false;
    }
  }
}

// setInterval
const list = document.querySelectorAll(".tab-btns>label");

list.forEach(function (label, index) {
  label.addEventListener("onclick", labelHandler);
});

let currentList;

function labelHandler(event) {
  if (currentList) {
    currentList.classList.remove("active");
  }

  let target = event.target;
  target.classList.add("active");
  currentList = target;
}

let count = 0;

function labelHandler(event) {
  if (currentList) {
    currentList.classList.remove("active");
  }

  let target = list[count];
  target.classList.add("active");
  currentList = target;
  count++;

  if (count >= list.length) {
    count = 0;
  }
}

labelHandler();
setInterval(labelHandler, 3000);
