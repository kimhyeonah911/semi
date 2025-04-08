<%@ page import="com.kh.semi.domain.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  Member m = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>마이페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <style>
    * { font-family: "Noto Sans KR", sans-serif; }
    body { background-color: #f9fafc; color: #333; }
    .main-container { margin-left: 280px; padding: 2rem; margin-top: 150px; }
    .card { border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); border: none; }
    .profile-card { background: linear-gradient(135deg, #446ee6, #698bed); color: white; text-align: center; padding: 40px 20px; }
    .profile-card i { font-size: 90px; margin-bottom: 15px; }
    .form-control { border-radius: 10px; height: 45px; }
    .btn-primary { border-radius: 10px; font-weight: bold; background-color: #698bed; border-color: #4e73df; }
    .btn-primary:hover { background-color: #6686e8; border-color: #224abe; }
    .modal-content { border-radius: 15px; }
    .btn-close { background-color: transparent !important; }
    #edit-phone-btn { border-style: double; background: #dee2f1; margin-top: -2px; height: 49px}
    #edit-phone-btn:hover { background: #b8c4f8; }
    .mb-3{padding: 8px;}
    .form-label{padding-left: 5px}
  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container-fluid">
  <jsp:include page="../common/sidebar.jsp"/>

  <div class="main-container">
    <h2 class="mb-4">마이페이지</h2>

    <div class="row">
      <div class="col-md-4">
        <div class="card profile-card">
          <i class="fas fa-user-circle"></i>
          <h4><%= m.getMemName() %></h4>
          <p><%= m.getStoreName()%> | <%= m.getPosition() %></p>
          <p><i class="fas fa-map-marker-alt"></i><%= m.getStoreAddress()%></p>
        </div>
      </div>

      <div class="col-md-8">
        <div class="card info-section">
          <form>
            <div class="row">
              <div class="col-md-6">
                <div class="mb-3">
                  <label class="form-label">이름</label>
                  <input type="text" class="form-control" value="<%= m.getMemName() %>" readonly>
                </div>
                <div class="mb-3">
                  <label class="form-label">아이디</label>
                  <input type="text" class="form-control" value="<%= m.getMemId() %>" readonly>
                </div>
                <div class="mb-3 phone-container">
                  <label class="form-label">전화번호</label>
                  <div class="input-group">
                    <input type="text" id="phone" class="form-control" value="<%= m.getPhone() %>">
                    <button type="button" id="edit-phone-btn" onclick="changePhone('<%= m.getMemId() %>')">📞</button>
                  </div>
                </div>
                <p id="success-message" class="text-success mt-2"></p>
              </div>

              <div class="col-md-6">
                <div class="mb-3">
                  <label class="form-label">입사일</label>
                  <input type="text" class="form-control" value="<%= m.getCreateDate() %>" readonly>
                </div>
                <div class="mb-3">
                  <label class="form-label">근속일수</label>
                  <input type="text" id="work-days" class="form-control" value="<%= m.getWorkDate() %>일" readonly>
                </div>
              </div>
            </div>

            <button type="button" class="btn btn-primary w-100 mt-3" data-bs-toggle="modal" data-bs-target="#passwordModal">비밀번호 변경</button>
          </form>
        </div>
      </div>
    </div>

    <!-- Password Change Modal -->
    <div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="passwordModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">비밀번호 변경</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="password-change-form" data-mem-id = "<%= m.getMemId()%>">
              <div class="mb-3">
                <label class="form-label">현재 비밀번호</label>
                <input type="password" id="current-password" class="form-control">
              </div>
              <div class="mb-3">
                <label class="form-label">새 비밀번호</label>
                <input type="password" id="new-password" class="form-control">
              </div>
              <div class="mb-3">
                <label class="form-label">새 비밀번호 확인</label>
                <input type="password" id="confirm-password" class="form-control">
                <div id="password-mismatch" class="text-danger mt-1" style="display: none;">
                  비밀번호가 일치하지 않습니다.
                </div>
              </div>
              <button type="submit" class="btn btn-primary w-100">변경하기</button>
            </form>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>

<script>
  const currentPasswordInput = document.getElementById('current-password');
  const form = document.getElementById('password-change-form');
  const newPasswordInput = document.getElementById('new-password');
  const confirmPasswordInput = document.getElementById('confirm-password');
  const mismatchMessage = document.getElementById('password-mismatch');

  form.addEventListener('submit', function (e) {
    e.preventDefault();

    const memId = form.dataset.memId;
    const currentPassword = currentPasswordInput.value;
    const newPassword = newPasswordInput.value;
    const confirmPassword = confirmPasswordInput.value;

    console.log("로그인한 사용자 ID:", memId);
    console.log("현재 비밀번호:", currentPassword);
    console.log("새 비밀번호:", newPassword);
    console.log("새 비밀번호 확인:", confirmPassword);

    if (newPassword !== confirmPassword) {
      mismatchMessage.style.display = 'block';
      return;
    }

    mismatchMessage.style.display = 'none';

    if (currentPassword === newPassword) {
      alert("새 비밀번호는 현재 비밀번호와 다르게 설정해야 합니다.");
      return;
    }

    $.ajax({
      url: '/updatePwd',
      type: 'POST',
      data: { newPwd: newPassword, memPwd: currentPassword, memId: memId},
      success: function(res) {
        document.querySelector("#passwordModal .btn-close").click();
        alert(res === "success" ? '비밀번호 변경 완료' : "비밀번호 변경 실패");
      },
      error: function(error) {
        alert('ajax 에러 : ' + error);
      }
    });

  });

  // 다시 입력시 같은지 검사하는거
  confirmPasswordInput.addEventListener('input', function () {
    if (newPasswordInput.value === confirmPasswordInput.value) {
      mismatchMessage.style.display = 'none';
    }
  });


  function changePhone(memId) {
    const phone = document.querySelector("#phone").value;
    console.log(phone, memId);
    $.ajax({
      url: '/updatePhone',
      type: 'POST',
      data: {
        memId: memId,
        phone: phone
      },
      success: function() {
        alert('전화번호 변경이 완료되었습니다');
        location.reload();
      },
      error: function(error) {
        alert('전화번호 변경이 실패하였습니다' + error);
      }
    });
  }
</script>

</body>
</html>
