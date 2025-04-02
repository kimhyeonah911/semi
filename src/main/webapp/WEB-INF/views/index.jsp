    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="UTF-8">
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
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

            /* 오른쪽 영역 (로그인 폼) */
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
                margin-bottom: 30px;
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
                font-size: 18px;
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

            /* 로그인 버튼 */
            .login-btn {
                background: #FFE3D0;
                color: #5A5A5A;
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
                width:60%;
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
        </style>
    </head>
    <body>
    <c:if test="${ not empty sessionScope.alertMsg }">
        <script>
            alert("${ sessionScope.alertMsg }");
            <% session.removeAttribute("alertMsg"); %>
        </script>
    </c:if>
    <div class="container">
        <!-- 왼쪽 (배경 이미지) -->
        <div class="left"></div>

        <!-- 오른쪽 (로그인 폼) -->
        <div class="right">
            <button onclick="location.href='/list.bo'">내부 테스트</button>
            <img class="logo" src="/resources/logo.png" alt="Logo" onclick="">
            <form action="login.me" method="post">
                <div class="input-box">
                    <input type="text" name="memId" placeholder="ID" required>
                </div>

                <div class="input-box">
                    <input type="password" name="memPwd" placeholder="PASSWORD" required>
                </div>

                <button type="submit" class="btn login-btn">LOGIN</button>
            </form>

                <button class="btn signup-btn"><a href="/enrollForm.me">회원가입</a></button>

            <div class="contact-info">CONTACT US 010-0000-1111</div>
        </div>
    </div>

    </body>
    </html>
