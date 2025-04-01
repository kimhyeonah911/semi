<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
  <link rel="stylesheet" href="css/style.css">
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
      margin-bottom: 20px;
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
      margin-bottom: 15px;
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
      display: block;
      text-align: center;
    }

    input[name="userId"] {
      background-image: url('/resources/id.png');
      background-repeat: no-repeat;
      background-position: 5px center;
      padding-left: 40px;
      background-size: 20px 20px;
    }

    input[name="password"] {
      background-image: url('/resources/password.png');
      background-repeat: no-repeat;
      background-position: 5px center;
      padding-left: 40px;
      background-size: 17px 20px;
    }

    input[name="email"] {
      background-image: url('/resources/email.png');
      background-repeat: no-repeat;
      background-position: 3px center;
      padding-left: 40px;
      background-size: 23px 25px;
    }

    input[name="phone"] {
      background-image: url('/resources/phone.png');
      background-repeat: no-repeat;
      background-position: 3px center;
      padding-left: 40px;
      background-size: 23px 25px;
    }

    input[name="name"] {
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
    <button onclick="location.href='/list.bo'">공지사항 리스트</button>
    <img class="logo" src="/resources/logo.png" alt="Logo">
    <form action="insert.me" method="post">
      <div class="input-box">
        <input type="text" name="userId" placeholder="ID" required>
      </div>

      <div class="input-box">
        <input type="password" name="password" placeholder="PASSWORD" required>
      </div>
      <div class="input-box">
        <input type="password" name="password" placeholder="CONFIRM PASSWORD" required>
      </div>

      <div class="input-box">
        <input type="email" name="email" placeholder="Email" required>
      </div>

      <div class="input-box">
        <input type="text" name="name" placeholder="Name" required>
      </div>

      <div class="input-box">
        <input type="text" name="phone" placeholder="Phone" required>
      </div>

      <button type="submit" class="btn signup-btn" onclick="location.href='/insert.co'">회원가입</button>
      <button type="reset" class="btn signup-btn" onclick="location.href='/'">돌아가기</button>
    </form>

    <div class="contact-info">CONTACT US 010-0000-1111</div>
  </div>
</div>

</body>
</html>
