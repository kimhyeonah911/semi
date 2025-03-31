<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>공지사항 보기</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container mt-5">
  <h2>공지사항 상세보기</h2>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>번호</th>
      <th>작성자</th>
      <th>제목</th>
      <th>작성일자</th>
      <th>보기</th>
    </tr>
    </thead>
    <tbody>
    <!-- 임시 데이터 -->
    <tr>
      <td>1</td>
      <td>지점장</td>
      <td>수정중입니다.</td>
      <td>2025-03-27</td>
      <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#noticeModal"
                  onclick="loadNoticeDetails(1, '지점장', '수정중입니다.', '수정중입니다.')">보기</button></td>
    </tr>
    </tbody>
  </table>

  <!-- 모달 -->
  <div class="modal fade" id="noticeModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <!-- 모달 헤더 -->
        <div class="modal-header">
          <h5 class="modal-title" id="modalTitle">공지사항 상세보기</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <!-- 모달 바디 -->
        <div class="modal-body">
          <form id="noticeForm">
            <div class="form-group">
              <label for="author">작성자:</label>
              <input type="text" id="author" name="author" class="form-control" readonly />
            </div>

            <div class="form-group">
              <label for="title">제목:</label>
              <input type="text" id="title" name="title" class="form-control" readonly />
            </div>

            <div class="form-group">
              <label for="content">내용:</label>
              <textarea id="content" name="content" class="form-control" rows="4" readonly></textarea>
            </div>
          </form>
        </div>

        <!-- 모달 푸터 -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>

</div>
</body>
</html>
