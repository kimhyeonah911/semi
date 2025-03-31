<%--창고관리(위치관리)페이지--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<head>
    <title>Title</title>
    <style>
        main{
            margin-left: 250px;  /* ms-sm-auto */
            /*margin-right: auto;*/
            width: 86%;  /* col-lg-10 (10/12 * 100%) */
            padding-left: 24px;  /* px-md-4 */
            /*padding-right: 24px;*/
            margin-top: 130px;
        }

        .pagination{
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }
        select{
            border-radius: 8px;
        }
        #search-bar{
            display: flex;
            justify-content: space-between;
        }
        #search-bar-1{
            display:flex;
            align-items: center;
            margin-bottom: 0;
        }
        #search-bar>img{
            width: 100px;
        }

        #storage-search-bar{
            width: 120px;
            height: 35px;
            font-size: 22px;
            margin-right: 20px;
        }

        #submit-btn{
            width: 80px;
            height: 35px;
            font-size: 22px;
            border-radius: 8px;
            margin:0;
            padding: 0;
            cursor: pointer;
        }

        .table-container{
            width: 100%;
            height: calc(100% - 65px);
        }
        .table-container>table{
            width: 100%;
            font-size: 20px;
            color: black;
            text-align: center;
        }
        .table-container>table>thead{
            height: 40px;
        }

        #storage-submit-btn{
            cursor:pointer;
        }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
            margin-bottom: 10px;
        }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
            margin-bottom: 10px;
        }

        .pagination a {
            text-decoration: none;
            color: #000000;
            padding: 10px 15px;
            margin: 0 5px;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .pagination a:hover {
            background-color: #717171;
        }

        .pagination .active {
            background-color: #000000;
            color: white;
            border: 1px solid #000000;
        }

        .pagination .disabled {
            color: #ccc;
            cursor: not-allowed;
        }



        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            width: 500px;
            height: 450px;
            padding: 20px;
            top: 100px;
            left: 115px;
            bottom: 25px;
            border-radius: 10px;
            position: relative;
            text-align: left;
        }


        hr{
            border : 1px solid black;
        }

        #modal-btn-div > img{
            cursor:pointer;
        }

        #cancel-btn{
            margin-right : 10px;
        }

        .input-space-1{
            height: 500px;
            max-height: 570px;
            overflow-y: auto;
        }

        .input-space-1> input{
            width: 474px;
            height: 50px;
        }




    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />


<%--<div class="container">--%>

    <jsp:include page="../common/sidebar.jsp"/>

<%--    <div class="storage-management">--%>

<main>
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">위치관리</h1>
        </div>


        <form action="">
            <div id="search-bar">
                <div id="search-bar-1">
                    <select id="storage-search-bar">
                        <option>전체창고</option>
                        <option>A창고</option>
                        <option>B창고</option>
                        <option>C창고</option>
                    </select>
                    <button type="submit" id="submit-btn">조회</button>
                </div>
                <img src="/assets/icons/위치등록btn.png" id="storage-submit-btn" onclick="showModal()">
            </div>
        </form>


        <div class="table-container">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>창고번호</th>
                    <th>창고명</th>
                    <th>현재 보관 수량</th>
                    <th>보관 가능 수량</th>
                    <th>삭제</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>A창고</td>
                    <td>1350</td>
                    <td>1500</td>
                    <td><img src="/assets/icons/trash.png"></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>B창고</td>
                    <td>157</td>
                    <td>200</td>
                    <td><img src="/assets/icons/trash.png"></td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>C창고</td>
                    <td>78</td>
                    <td>100</td>
                    <td><img src="/assets/icons/trash.png"></td>
                </tr>
                </tbody>
            </table>
            <div class="pagination">
                <a href="#" class="disabled">이전</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">다음</a>
            </div>
        </div>
</main>
<%--    </div>--%>
<%--</div>--%>



<!-- 🔹 모달창 HTML -->
<!-- 모달 창 -->
<div class="modal fade" id="noticeModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">창고등록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- 모달 본문 -->
            <div class="modal-body">
                <div>
                    <p>창고번호</p>
                    <input type="text" placeholder="자동생성" readonly>
                </div>
                <div>
                    <p>창고명</p>
                    <input type="text">
                </div>
                <div>
                    <p>보관 가능 수량</p>
                    <input type="text" placeholder="숫자만 입력해주세요">
                </div>
            </div>

            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">확인</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


<script>
    function showModal() {

        var modalElement = document.getElementById('noticeModal');

        if (!modalElement) {
            console.error("모달 요소를 찾을 수 없습니다!");
            return;
        }

        var modal = new bootstrap.Modal(modalElement);
        modal.show();
    }
</script>




</body>
</html>
