<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up Page</title>
  <style>
    /* 전체 페이지 스타일 */
    body {
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background: white;
    }

    /* 전체 컨테이너 */
    .container {
      width: 100%;
      height: 100%;
      display: flex;
    }

    /* 왼쪽 영역 (배경 이미지) */
    .left {
      width: 65%;
      height: 100%;
      background: url('/resources/background.png') no-repeat center center;
      background-size: cover;
      filter: brightness(1.5);
    }

    /* 오른쪽 영역 (회원가입 폼) */
    .right {
      width: 35%;
      height: 100%;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      background: white;
    }

    /* 로고 */
    .logo {
      width: 200px;
      margin-bottom: 10px;
    }

    /* 입력 필드 공통 스타일 */
    .input-box {
      width: 80%;
      height: 50px;
      border-radius: 10px;
      border: 1px solid rgba(181, 0, 0, 0.3);
      display: flex;
      align-items: center;
      padding-left: 15px;
      font-size: 18px;
      color: #BABABA;
      margin-top: 10px;
      margin-bottom: 5px;
      margin-left: 20px;
      margin-right: 20px;
    }

    .divP{
      font-size: 10px;
      display: none;
      text-align: left;
      width: 80%;
      margin-left: 20px;
    }

    .input-box input {
      width: 100%;
      border: none;
      outline: none;
      font-size: 15px;
      padding-left: 10px;
    }

    /* 버튼 스타일 */
    .btn {
      width: 200px;
      height: 50px;
      border-radius: 10px;
      font-size: 18px;
      font-weight: bold;
      text-align: center;
      cursor: pointer;
      border: none;
      margin-top: 10px;
    }

    /* 회원가입 버튼 */
    .signup-btn {
      background: #FFE3D0;
      color: #5A5A5A;
    }

    .signup-btn a{
      text-decoration: none;
      color: #5A5A5A;
    }

    /* 하단 연락처 */
    .contact-info {
      margin-top: 20px;
      font-size: 14px;
      color: #858585;
    }

    form{
      width: 60%;
      display: flex;
      text-align: center;
      flex-direction: column;
      align-items: center;
    }

    input[name="memId"] {
      background-image: url('/resources/id.png');
      background-repeat: no-repeat;
      background-position: 5px center;
      padding-left: 40px;
      background-size: 20px 20px;
    }

    input[name="memPwd"], input[name="checkPwd"] {
      background-image: url('/resources/password.png');
      background-repeat: no-repeat;
      background-position: 5px center;
      padding-left: 40px;
      background-size: 17px 20px;
    }

    input[name="phone"] {
      background-image: url('/resources/phone.png');
      background-repeat: no-repeat;
      background-position: 3px center;
      padding-left: 40px;
      background-size: 23px 25px;
    }

    input[name="memName"] {
      background-image: url('/resources/name.png');
      background-repeat: no-repeat;
      background-position: 3px center;
      padding-left: 40px;
      background-size: 23px 25px;
    }
  </style>
</head>
<body>
<div class="container">
  <!-- 왼쪽 (배경 이미지) -->
  <div class="left"></div>

  <!-- 오른쪽 (회원가입 폼) -->
  <div class="right">
    <img class="logo" src="/resources/logo.png" alt="Logo">
    <form action="insert.me" method="post">
      <div class="input-box">
        <input type="text" name="memId" id="memId" placeholder="ID" onkeyup="idCheck(this)" required>
      </div>
      <div class="divP" id="idP">아이디 5자리 이상</div>

      <div class="input-box">
        <input type="password" name="memPwd" id="memPwd" placeholder="PASSWORD" onkeyup="pwdLength(this)" required>
      </div>
      <div class="divP" id="pwdP">비밀번호 8자리 이상</div>

      <div class="input-box">
        <input type="password" name="checkPwd" id="checkPwd" placeholder="CONFIRM PASSWORD" onkeyup="pwdCheck(this)" required>
      </div>
      <div class="divP" id="pwdCheckP">비밀번호가 일치하지 않습니다.</div>

      <div class="input-box">
        <input type="text" name="memName" id="memName" placeholder="Name" required>
      </div>

      <div class="input-box">
        <input type="text" name="phone" id="phone" placeholder="Phone - 빼고 입력하세요." required>
      </div>

      <button type="submit" class="btn signup-btn" id="submit-button" onclick="location.href='/insert.co'">회원가입</button>
      <button type="reset" class="btn signup-btn" onclick="location.href='/'">돌아가기</button>
    </form>

    <div class="contact-info">CONTACT US 010-0000-1111</div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  let eventFlag;

  window.onload = function() {
    document.querySelector("#submit-button").disabled = true;
  }

  function idCheck(idInput){
    const id = idInput.value;
    const idP = document.querySelector("#idP");

    clearTimeout(eventFlag);
    if(id.trim().length >= 5){
      idP.style.display = "none";
      eventFlag = setTimeout(function(){
        getIdCheck({checkId: id}, drawIdCheckText)
      },500)

    } else{
      idP.style.display = "flex";
      idP.style.color = "red";
    }
  }

  function getIdCheck(data, callback){
    $.ajax({
      url: "/api/member/id",
      data: data,
      success: function(res){
        callback(res);
      }, error: function(){
        console.log("아이디 중복체크 ajax 실패");
      }
    })
  }

  function drawIdCheckText(isCheck){
    const idP = document.querySelector("#idP");
    if(isCheck === "NNN"){
      idP.style.display = "flex";
      idP.style.color = "red";
      idP.textContent = "이미 사용중인 아이디입니다.";
    } else{
      idP.style.display = "flex";
      idP.style.color = "green";
      idP.textContent = "사용 가능한 아이디입니다.";
    }
  }

  function pwdLength(pwdInput) {
    const pwd = pwdInput.value.trim();
    const pwdP = document.querySelector("#pwdP");

    clearTimeout(eventFlag); //아직 실행되지 않은 setTimeout 취소
    eventFlag = setTimeout(function () {
      if (pwd.length < 8) {
        pwdP.style.display = "flex";
        pwdP.style.color = "red";
      } else {
        pwdP.style.display = "none";
      }
    }, 500);
  }

  function pwdCheck(pwdInput) {
    const checkPwd = pwdInput.value.trim();
    const pwd = document.querySelector("#memPwd").value.trim();
    const pwdCheckP = document.querySelector("#pwdCheckP");

    clearTimeout(eventFlag);
    if (pwd.length >= 8 && checkPwd.length >= 5) {
      eventFlag = setTimeout(function () {
        if (checkPwd === pwd) {
          pwdCheckP.style.display = "none";
        } else {
          pwdCheckP.style.display = "flex";
          pwdCheckP.style.color = "red";
          pwdCheckP.textContent = "비밀번호가 일치하지 않습니다.";
        }
      }, 500);

    }
  }

  function btnAble() {
    const id = document.querySelector("#memId").value.trim();
    const pwd = document.querySelector("#memPwd").value.trim();
    const checkPwd = document.querySelector("#checkPwd").value.trim();
    const name = document.querySelector("#memName").value.trim();
    const phone = document.querySelector("#phone").value.trim();
    const submitbtn = document.querySelector("#submit-button");

    const isIdValid = id.length >= 5;
    const isPwdValid = pwd.length >= 8;
    const isPwdMatch = pwd === checkPwd;
    const isPhoneValid = phone.length === 11;
    const isAllFilled = id && pwd && checkPwd && name && phone;

    submitbtn.disabled = !(isIdValid && isPwdValid && isPwdMatch && isPhoneValid && isAllFilled);
  }
  document.querySelectorAll("input").forEach(input => {
    input.addEventListener("input", btnAble);
  });
</script>


</body>
</html>