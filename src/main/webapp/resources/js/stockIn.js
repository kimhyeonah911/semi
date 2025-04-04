window.onload = function () {
    const today = new Date();
    const formatted = today.toISOString().slice(0, 10); // YYYY-MM-DD 형식으로 자르기

    document.getElementById("date1").value = formatted;
    document.getElementById("date2").value = formatted;
}

//검색 조건으로 입고 리스트 가져오기
function searchStock() {
    let stockStatus = $("#stockIn-search-bar").val();
    let startDate = $("#date1").val();
    let endDate = $("#date2").val();

    $.ajax({
        url: "/api/searchStock",
        type: "GET",
        data: {
            stockStatus: stockStatus,
            startDate: startDate,
            endDate: endDate
        },
        dataType: "json",
        success: function (response) {
            console.log(response);
            updateStockTable(response);
        },
        error: function () {
            console.error("ajax 통신 오류");
        }
    });
}

//조회한 정보들로 테이블 그리기
function updateStockTable(data) {
    let tableBody = $("#stock-table tbody");
    tableBody.empty(); // 기존 tbody 비우기

    if (data.length === 0) {
        tableBody.append("<tr><td colspan='8'>검색 결과가 없습니다.</td></tr>");
        return;
    }

    data.forEach(stock => {
        let statusBtn = "";
        editBtn = `<button type="button" class="btn btn-outline-success btn-sm" onclick="showUpdateModal()">수정</button>`;
        removeBtn = `<button type="button" class="btn btn-outline-danger btn-sm">취소</button>`
        switch (stock.stockStatus) {
            case "STOCK_IN_REGISTERED":
                statusBtn = `<button type="button" class="btn btn-secondary btn-sm" disabled>입고 등록</button>`;
                break;
            case "STOCK_IN_PROGRESS":
                statusBtn = `<button type="button" class="btn btn-warning btn-sm" disabled>입고중</button>`;
                break;
            case "STOCK_IN_COMPLETED":
                statusBtn = `<button type="button" class="btn btn-success btn-sm" disabled>입고 완료</button>`;
                break;
        }

        const stockTr = document.createElement("tr");
        stockTr.setAttribute("data-storage-no", stock.stockNo);

        // 각 칸 만들어서 추가
        const tdNo = document.createElement("td");
        tdNo.innerText = stock.stockNo;
        stockTr.appendChild(tdNo);

        const tdStatus = document.createElement("td");
        tdStatus.innerHTML = statusBtn; // HTML로 버튼 삽입
        stockTr.appendChild(tdStatus);

        const tdDate = document.createElement("td");
        tdDate.innerText = stock.stockDate;
        stockTr.appendChild(tdDate);

        const tdExp = document.createElement("td");
        tdExp.innerText = stock.expDate;
        stockTr.appendChild(tdExp);

        const tdMoney = document.createElement("td");
        tdMoney.innerText = "아직 모룸";
        stockTr.appendChild(tdMoney);

        const tdEmp = document.createElement("td");
        tdEmp.innerText = stock.stockEmp;
        stockTr.appendChild(tdEmp);

        const tdUpdate = document.createElement("td");
        tdUpdate.innerHTML = editBtn;
        stockTr.appendChild(tdUpdate);

        const tdCancel = document.createElement("td");
        tdCancel.innerHTML = removeBtn;
        stockTr.appendChild(tdCancel);

        tableBody.append(stockTr);
    });
}


function updateProductInfo() {
    const tableBody = document.querySelector("#stockIn-table tbody");
    const allProductInfo = document.getElementById("allProductInfo");

    let totalItems = 0;   // 총 품목 수
    let totalQuantity = 0; // 총 수량
    let totalPrice = 0;    // 총 금액 (부가세 제외)
    let totalTax = 0;      // 부가세

    tableBody.querySelectorAll("tr").forEach(row => {
        const quantityInput = row.querySelector(".product-quantity");
        const unitPrice = parseFloat(row.querySelector(".unit-price").innerText) || 0;
        const taxation = row.querySelector(".taxation").value; // "0" (과세) or "1" (비과세)

        let quantity = parseInt(quantityInput.value) || 0;
        totalQuantity += quantity;
        totalItems++;

        let itemTotalPrice = quantity * unitPrice;
        totalPrice += itemTotalPrice;

        if (taxation === "0") {
            totalTax += itemTotalPrice * 0.1; // 과세일 경우 10% 부가세 추가
        }
    });

    let totalAmount = totalPrice + totalTax; // 총 금액 = 상품 금액 + 부가세

    allProductInfo.innerText = totalItems + "품목 총 수량 " + totalQuantity + " 합계금액 " + totalPrice + "원 + 부가세 " + totalTax + "원 = 총 " + totalAmount;
}

// ✅ 수량 입력 변경 시 자동 업데이트
document.addEventListener("input", function (event) {
    if (event.target.classList.contains("product-quantity")) {
        updateProductInfo();
    }
});

// ✅ 삭제 버튼 클릭 시 행 삭제 & 업데이트
document.addEventListener("click", function (event) {
    if (event.target.classList.contains("delete-row")) {
        event.target.closest("tr").remove();
        updateProductInfo();
    }
});

// ✅ 과세 여부 변경 시 업데이트
document.addEventListener("change", function (event) {
    if (event.target.classList.contains("taxation")) {
        updateProductInfo();
    }
});

// 입고서 등록 모달
function showModal() {
    var modalElement = document.getElementById('modal1');

    if (!modalElement) {
        console.error("모달 요소를 찾을 수 없습니다!");
        return;
    }

    var modal = new bootstrap.Modal(modalElement);
    modal.show();
}

//물품 추가 모달
function showModal2() {
    var modalElement = document.getElementById('modal2');

    if (!modalElement) {
        console.error("모달 요소를 찾을 수 없습니다!");
        return;
    }

    $.ajax({
        url: "/api/getProductList",
        type: "GET",
        dataType: "json",
        success: function (response) {
            var modal = new bootstrap.Modal(modalElement);
            modal.show();
            createProductTable(response);
        },
        error: function () {
            console.error("제품 리스트 로딩 실패");
        }
    });
}

//제품 정보들로 테이블 구성
function createProductTable(data) {
    let tableBody = $("#product-table tbody");
    tableBody.empty(); // 기존 tbody 비우기

    if (data.length === 0) {
        tableBody.append("<tr><td colspan='8'>제품이 없습니다.</td></tr>");
        return;
    }

    data.forEach(product => {
        let checkBox = `<input type="checkbox" class="row-checkbox">`;

        // 이미지가 비어있으면 기본 이미지로 대체
        let imageUrl = product.imageUrl && product.imageUrl.trim() !== "" ? product.imageUrl : "/resources/default.png";
        let imgSrc = '<img src="' + imageUrl + '" style="width: 50px; height: 50px;" alt="제품사진">';

        // 제품 정보 텍스트
        let productInfo =
            "<div class=\"product-info\">" +
            "<p style=\"font-size: 14px;\">" + product.productNo + "</p>" +
            "<p style=\"font-weight:600; font-size: 14px;\">" + product.productName + "</p>" +
            "<p style=\"font-size: 12px;\">" + product.categoryName + " " + product.color + " " + product.productSize + "</p>" +
            "</div>";

        const productTr = document.createElement("tr");
        productTr.setAttribute("data-product-no", product.productNo);

        const tdCheck = document.createElement("td");
        tdCheck.innerHTML = checkBox;
        productTr.appendChild(tdCheck);

        const tdProduct = document.createElement("td");
        tdProduct.classList.add("list-table-item");
        tdProduct.innerHTML = imgSrc + productInfo;
        productTr.appendChild(tdProduct);

        const tdInPrice = document.createElement("td");
        tdInPrice.innerText = product.stockInPrice;
        productTr.appendChild(tdInPrice);

        const tdOutPrice = document.createElement("td");
        tdOutPrice.innerText = product.stockOutPrice;
        productTr.appendChild(tdOutPrice);

        tableBody.append(productTr);
    });

}


// 입고서 수정 모달
function showUpdateModal() {
    var modalElement = document.getElementById('modal3');

    if (!modalElement) {
        console.error("모달 요소를 찾을 수 없습니다!");
        return;
    }

    var modal = new bootstrap.Modal(modalElement);
    modal.show();
}

let selectedRows = []; // 선택된 행 데이터를 저장하는 배열

document.addEventListener("click", function (event) {
    const row = event.target.closest("tr");

    if (row) {
        const targetCheckbox = row.querySelector(".row-checkbox");

        // 체크박스가 아닌 곳 클릭 시 체크박스 토글
        if (event.target.type !== "checkbox") {
            targetCheckbox.checked = !targetCheckbox.checked;
        }

        const productInfoDiv = row.querySelector(".product-info");

        // 각 정보 추출
        const productNo = productInfoDiv.querySelector("p:nth-child(1)")?.innerText.trim();
        const productName = productInfoDiv.querySelector("p:nth-child(2)")?.innerText.trim();
        const etcInfo = productInfoDiv.querySelector("p:nth-child(3)")?.innerText.trim();
        const [categoryName, color, productSize] = etcInfo.split(" ");

        const stockInPrice = row.querySelector("td:nth-child(3)")?.innerText.trim();
        const stockOutPrice = row.querySelector("td:nth-child(4)")?.innerText.trim();
        const imageUrl = row.querySelector("img")?.getAttribute("src");

        const rowData = {
            productNo,
            productName,
            categoryName,
            color,
            productSize,
            stockInPrice,
            stockOutPrice,
            imageUrl
        };

        if (targetCheckbox.checked) {
            // 중복 추가 방지
            if (!selectedRows.some(item => item.productNo === rowData.productNo)) {
                selectedRows.push(rowData);
            }
        } else {
            // 체크 해제 시 해당 항목 제거
            selectedRows = selectedRows.filter(item => item.productNo !== rowData.productNo);
        }

        console.log("선택된 행 데이터:", selectedRows);
    }
});

// 선택 버튼 클릭 시 데이터 전달
document.getElementById("product-selection-btn").addEventListener("click", function () {
    if (selectedRows.length === 0) {
        console.warn("선택된 제품이 없습니다.");
        return;
    }
    console.log("최종 선택된 데이터:", selectedRows);
    createStockInTable(selectedRows);

    // 이미 열려 있는 모달 인스턴스를 찾아서 닫기
    var modalElement = document.getElementById('modal2');
    var modalInstance = bootstrap.Modal.getInstance(modalElement);

    if (modalInstance) {
        modalInstance.hide(); // 기존 인스턴스가 있다면 닫기
    } else {
        console.error("모달 인스턴스를 찾을 수 없습니다.");
    }
});

//입고서 테이블 구성
function createStockInTable(data) {
    let tableBody = $("#stockIn-table tbody");
    tableBody.empty(); // 기존 tbody 비우기

    if (data.length === 0) {
        tableBody.append("<tr><td colspan='8'>제품이 없습니다.</td></tr>");
        return;
    }

    data.forEach(product => {
        // 이미지가 비어있으면 기본 이미지로 대체
        let imageUrl = product.imageUrl && product.imageUrl.trim() !== "" ? product.imageUrl : "/resources/default.png";
        let imgSrc = '<img src="' + imageUrl + '" style="width: 50px; height: 50px;" alt="제품사진">';
        let inputAmount = `<input type="number" min="1" value="1" style="width:50px;">`;
        let selectTax = `<select id="update-taxation">
                                    <option value="0">과세</option>
                                    <option value="1">비과세</option>
                                	</select>`;
        let cancelBtn = `<button type="button" class="btn btn-outline-danger btn-sm">삭제</button>`;

        // 제품 정보 텍스트
        let productInfo =
            "<div class=\"product-info\">" +
            "<p style=\"font-size: 14px;\">" + product.productNo + "</p>" +
            "<p style=\"font-weight:600; font-size: 14px;\">" + product.productName + "</p>" +
            "<p style=\"font-size: 12px;\">" + product.categoryName + " " + product.color + " " + product.productSize + "</p>" +
            "</div>";

        const productTr = document.createElement("tr");
        productTr.setAttribute("data-product-no", product.productNo);

        const tdProduct = document.createElement("td");
        tdProduct.classList.add("list-table-item");
        tdProduct.innerHTML = imgSrc + productInfo;
        productTr.appendChild(tdProduct);

        const tdNone = document.createElement("td");
        productTr.appendChild(tdNone);

        const tdInput = document.createElement("td");
        tdInput.innerHTML = inputAmount;
        productTr.appendChild(tdInput);

        const tdInPrice = document.createElement("td");
        tdInPrice.innerText = product.stockInPrice;
        productTr.appendChild(tdInPrice);

        const tdselect = document.createElement("td");
        tdselect.innerHTML = selectTax;
        productTr.appendChild(tdselect);

        const tdBtn = document.createElement("td");
        tdBtn.innerHTML = cancelBtn;
        productTr.appendChild(tdBtn);

        tableBody.append(productTr);
    });

}