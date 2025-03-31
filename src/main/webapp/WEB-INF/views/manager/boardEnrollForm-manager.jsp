<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글쓰기</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }

        main {
            display: flex;
            gap: 20px;
            padding: 20px;
        }

        /* 사이드바 */
        .sidebar {
            width: 250px;
            background-color: #343a40;
            color: white;
            height: 100vh;
            padding: 20px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            margin: 10px 0;
            display: block;
        }

        .sidebar a:hover {
            background-color: #495057;
            padding-left: 10px;
        }

        /* 콘텐츠 */
        .content {
            flex: 1;
            background-color: #ffffff;
            padding: 20px;
            margin-top:120px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .content h1 {
            margin-bottom: 30px;
            color: #343a40;
        }

        .input-row {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
            align-items: center;
        }

        .input-row label {
            font-size: 1.2rem;
            color: #495057;
            margin-bottom: 5px;
            width: 90%;
            text-align: left;
        }

        .input-row input, .input-row textarea {
            border: 1px solid #ccc;
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            width: 90%;
        }

        .input-row textarea {
            resize: none;
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            background-color: #343a40;
            color: white;
        }
        button[type="submit"]{
            margin-right: 20px;
        }
        button[type="reset"]{
            margin-right: 60px;
        }
    </style>
</head>
<body>

<!-- Header -->
<jsp:include page="../common/header-manager.jsp"/>

<!-- Main Content -->
<main>
    <!-- Sidebar -->
    <jsp:include page="../common/sidebar-manager.jsp"/>

    <!-- 글쓰기 폼 -->
    <div class="content">
        <h1 align="center">공지사항 글쓰기</h1>
        <form action="#" method="post">
            <div class="input-row">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>
            </div>
            <div class="input-row">
                <label for="content">내용</label>
                <textarea id="content" name="content" rows="10" placeholder="공지사항 내용을 입력하세요" required></textarea>
            </div>
            <div class="d-flex justify-content-end">
                <button type="submit" class="btn-custom">글쓰기</button>
                <button type="reset" class="btn-custom" style="background-color: #dc3545;">취소</button>
            </div>
        </form>
    </div>
</main>

<!-- Footer -->
<jsp:include page="../common/footer.jsp"/>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
