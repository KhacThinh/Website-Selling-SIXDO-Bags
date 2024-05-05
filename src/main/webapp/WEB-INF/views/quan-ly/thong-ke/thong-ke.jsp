<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    /* =========== Google Fonts ============ */
    @import url("https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap");

    /* =============== Globals ============== */
    * {
        font-family: "Ubuntu", sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    :root {
        --blue: #2a2185;
        --white: #fff;
        --gray: #f5f5f5;
        --black1: #222;
        --black2: #999;
    }

    body {
        min-height: 100vh;
        overflow-x: hidden;
    }

    .container {
        position: relative;
        width: 100%;
    }

    /* =============== Navigation ================ */
    .navigation {
        position: fixed;
        width: 300px;
        height: 100%;
        background: var(--blue);
        border-left: 10px solid var(--blue);
        transition: 0.5s;
        overflow: hidden;
    }

    .navigation.active {
        width: 80px;
    }

    .navigation ul {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
    }

    .navigation ul li {
        position: relative;
        width: 100%;
        list-style: none;
        border-top-left-radius: 30px;
        border-bottom-left-radius: 30px;
    }

    .navigation ul li:hover,
    .navigation ul li.hovered {
        background-color: var(--white);
    }

    .navigation ul li:nth-child(1) {
        margin-bottom: 40px;
        pointer-events: none;
    }

    .navigation ul li a {
        position: relative;
        display: block;
        width: 100%;
        display: flex;
        text-decoration: none;
        color: var(--white);
    }

    .navigation ul li:hover a,
    .navigation ul li.hovered a {
        color: var(--blue);
    }

    .navigation ul li a .icon {
        position: relative;
        display: block;
        min-width: 60px;
        height: 60px;
        line-height: 75px;
        text-align: center;
    }

    .navigation ul li a .icon ion-icon {
        font-size: 1.75rem;
    }

    .navigation ul li a .title {
        position: relative;
        display: block;
        padding: 0 10px;
        height: 60px;
        line-height: 60px;
        text-align: start;
        white-space: nowrap;
    }

    /* --------- curve outside ---------- */
    .navigation ul li:hover a::before,
    .navigation ul li.hovered a::before {
        content: "";
        position: absolute;
        right: 0;
        top: -50px;
        width: 50px;
        height: 50px;
        background-color: transparent;
        border-radius: 50%;
        box-shadow: 35px 35px 0 10px var(--white);
        pointer-events: none;
    }

    .navigation ul li:hover a::after,
    .navigation ul li.hovered a::after {
        content: "";
        position: absolute;
        right: 0;
        bottom: -50px;
        width: 50px;
        height: 50px;
        background-color: transparent;
        border-radius: 50%;
        box-shadow: 35px -35px 0 10px var(--white);
        pointer-events: none;
    }

    /* ===================== Main ===================== */
    .main {
        position: absolute;
        width: calc(100% - 300px);
        left: 300px;
        min-height: 100vh;
        background: var(--white);
        transition: 0.5s;
    }

    .main.active {
        width: calc(100% - 80px);
        left: 80px;
    }

    .topbar {
        width: 100%;
        height: 60px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 10px;
    }

    .toggle {
        position: relative;
        width: 60px;
        height: 60px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 2.5rem;
        cursor: pointer;
    }

    .search {
        position: relative;
        width: 400px;
        margin: 0 10px;
    }

    .search label {
        position: relative;
        width: 100%;
    }

    .search label input {
        width: 100%;
        height: 40px;
        border-radius: 40px;
        padding: 5px 20px;
        padding-left: 35px;
        font-size: 18px;
        outline: none;
        border: 1px solid var(--black2);
    }

    .search label ion-icon {
        position: absolute;
        top: 0;
        left: 10px;
        font-size: 1.2rem;
    }

    .user {
        position: relative;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        overflow: hidden;
        cursor: pointer;
    }

    .user img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    /* ======================= Cards ====================== */
    .cardBox {
        position: relative;
        width: 100%;
        padding: 20px;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-gap: 30px;
    }

    .cardBox .card {
        position: relative;
        background: var(--white);
        padding: 30px;
        border-radius: 20px;
        display: flex;
        justify-content: space-between;
        cursor: pointer;
        box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
    }

    .cardBox .card .numbers {
        position: relative;
        font-weight: 500;
        font-size: 2.5rem;
        color: var(--blue);
    }

    .cardBox .card .cardName {
        color: var(--black2);
        font-size: 1.1rem;
        margin-top: 5px;
    }

    .cardBox .card .iconBx {
        font-size: 3.5rem;
        color: var(--black2);
    }

    .cardBox .card:hover {
        background: var(--blue);
    }

    .cardBox .card:hover .numbers,
    .cardBox .card:hover .cardName,
    .cardBox .card:hover .iconBx {
        color: var(--white);
    }

    /* ================== Charts JS ============== */
    .chartsBx {
        position: relative;
        width: 100%;
        padding: 20px;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        grid-gap: 30px;
    }

    .chartsBx .chart {
        position: relative;
        background: #fff;
        padding: 20px;
        width: 100%;
        max-width: 100%;
        box-sizing: border-box;
        box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
        border-radius: 20px;
        border: 1px solid var(--blue);
    }

    .chart-title {
        color: var(--blue);
        text-align: center;
        margin-bottom: 10px;
    }


    /* ================== Order Details List ============== */
    .details {
        position: relative;
        width: 100%;
        padding: 20px;
        display: grid;
        grid-template-columns: 2fr 1fr;
        grid-gap: 30px;
        /* margin-top: 10px; */
    }

    .details .recentOrders {
        position: relative;
        display: grid;
        min-height: 500px;
        background: var(--white);
        padding: 20px;
        box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
        border-radius: 20px;
    }

    .details .cardHeader {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
    }

    .cardHeader h2 {
        font-weight: 600;
        color: var(--blue);
    }

    .cardHeader .btn {
        position: relative;
        padding: 5px 10px;
        background: var(--blue);
        text-decoration: none;
        color: var(--white);
        border-radius: 6px;
    }

    .details table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    .details table thead td {
        font-weight: 600;
    }

    .details .recentOrders table tr {
        color: var(--black1);
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    }

    .details .recentOrders table tr:last-child {
        text-align: center;
        border-bottom: none;
    }

    .details .recentOrders table tbody tr:hover {
        background: var(--blue);
        color: var(--white);
    }

    .details .recentOrders table tr td {
        text-align: center;
        padding: 10px;
    }

    .details .recentOrders table tr td:last-child {
        text-align: center;
    }

    .details .recentOrders table tr td:nth-child(2) {
        text-align: left;
    }

    .details .recentOrders table tr td:nth-child(3) {
        text-align: center;
    }

    .status.delivered {
        padding: 2px 4px;
        background: #8de02c;
        color: var(--white);
        border-radius: 4px;
        font-size: 14px;
        font-weight: 500;
    }

    .status.pending {
        padding: 2px 4px;
        background: #e9b10a;
        color: var(--white);
        border-radius: 4px;
        font-size: 14px;
        font-weight: 500;
    }

    .status.return {
        padding: 2px 4px;
        background: #f00;
        color: var(--white);
        border-radius: 4px;
        font-size: 14px;
        font-weight: 500;
    }

    .status.inProgress {
        padding: 2px 4px;
        background: #1795ce;
        color: var(--white);
        border-radius: 4px;
        font-size: 14px;
        font-weight: 500;
    }

    .recentCustomers {
        position: relative;
        /*display: grid;*/
        min-height: 500px;
        padding: 20px;
        background: var(--white);
        box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
        border-radius: 20px;
    }

    .recentCustomers .imgBx {
        position: relative;
        width: 40px;
        height: 40px;
        border-radius: 50px;
        overflow: hidden;
    }

    .recentCustomers .imgBx img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .recentCustomers table tr td {
        padding: 12px 10px;
    }

    .recentCustomers table tr td h4 {
        font-size: 16px;
        font-weight: 500;
        line-height: 1.2rem;
    }

    .recentCustomers table tr td h4 span {
        font-size: 14px;
        color: var(--black2);
    }

    .recentCustomers table tr:hover {
        background: var(--blue);
        color: var(--white);
    }

    .recentCustomers table tr:hover td h4 span {
        color: var(--white);
    }


    /* ====================== Responsive Design ========================== */
    @media (max-width: 991px) {
        .chartsBx {
            grid-template-columns: 1fr;
            height: auto;
        }

        .navigation {
            left: -300px;
        }

        .navigation.active {
            width: 300px;
            left: 0;
        }

        .main {
            width: 100%;
            left: 0;
        }

        .main.active {
            left: 300px;
        }

        .cardBox {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    @media (max-width: 768px) {
        .details {
            grid-template-columns: 1fr;
        }

        .recentOrders {
            overflow-x: auto;
        }

        .status.inProgress {
            white-space: nowrap;
        }
    }

    @media (max-width: 480px) {
        .cardBox {
            grid-template-columns: repeat(1, 1fr);
        }

        .cardHeader h2 {
            font-size: 20px;
        }

        .user {
            min-width: 40px;
        }

        .navigation {
            width: 100%;
            left: -100%;
            z-index: 1000;
        }

        .navigation.active {
            width: 100%;
            left: 0;
        }

        .toggle {
            z-index: 10001;
        }

        .main.active .toggle {
            color: #fff;
            position: fixed;
            right: 0;
            left: initial;
        }
    }

    #sortBy {
        padding: 7px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #007bff;
        color: #f0f0f0;
    }

    #sortBy option {
        background-color: #ffffff;
        color: #333333;
    }

    #thongKeTable tbody td:first-child {
        font-weight: bold;
    }

    /* CSS cho dropdown select */
    .chart-title select {
        text-align: center;
        margin-bottom: 10px;
        color: var(--blue); /* Màu chữ */
        outline: none; /* Loại bỏ đường viền khi focus */
        border: transparent;
    }

    /* Hiệu ứng hover */
    .chart-title select:hover {
        background-color: #f0f0f0; /* Màu nền hover */
    }

    .row-divider td {
        border-bottom: 1px solid #ccc;
    }


    .dateSelector {
        margin-left: 20px;
        margin-right: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        background-color: #f0f0f0;
    }

    .datePicker,
    .weekPicker {
        display: flex;
        align-items: center;
    }

    .datePicker label,
    .weekPicker label {
        margin-right: 10px;
    }

    .datePicker input,
    .weekPicker input {
        padding: 5px;
    }

    .datePicker button,
    .weekPicker button {
        padding: 5px 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .datePicker button:hover,
    .weekPicker button:hover {
        background-color: #45a049;
    }

    .dateSelector {
        display: flex;
        justify-content: center; /* Căn giữa theo chiều ngang */
        margin-top: 20px; /* Khoảng cách từ đỉnh màn hình */
    }

    .datePicker,
    .weekPicker {
        margin: 0 200px; /* Khoảng cách giữa các phần tử */
    }


    /* Style cho dateSelector */
    .dateSelector {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }

    /* Style cho datePicker và weekPicker */
    .datePicker, .weekPicker {
        display: flex;
        align-items: center;
    }

    /* Style cho các label */
    .datePicker label, .weekPicker label {
        margin-right: 10px;
    }

    /* Style cho input */
    .datePicker input, .weekPicker input {
        margin-right: 10px;
        padding: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    /* Style cho button */
    .datePicker button, .weekPicker button {
        padding: 5px 10px;
        border-radius: 5px;
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
    }

    /* Hover style cho button */
    .datePicker button:hover, .weekPicker button:hover {
        background-color: #0056b3;
    }

    /* Style cho bảng dữ liệu */
    #dataTable {
        margin-top: 20px;
    }

    /* Style cho bảng */
    table {
        width: 100%;
        border-collapse: collapse;
    }

    /* Style cho tiêu đề của bảng */
    th {

        background-color: #ced4da;
        color: black;
        font-weight: bold;
        padding: 8px;
        text-align: left;
    }

    /* Style cho các hàng trong bảng */
    td, th {
        border: 1px solid #ddd;
        padding: 8px;
    }

    /* Hover style cho các hàng trong bảng */
    tr:hover {
        background-color: #f2f2f2;
    }

    #dataTable {
        margin-left: 20px;
        margin-right: 10px;
        max-height: 400px; /* Chiều cao tối đa của bảng */
        overflow-y: auto; /* Tạo thanh cuộn khi nội dung vượt quá chiều cao tối đa */
    }


    /* CSS cho bảng */
    .custom-table {
        width: 100%;
        border-collapse: collapse;
    }


    .custom-table th {
        background-color: #aaaaaa;
        text-align: left;
    }

    /* CSS cho hàng bảng */
    .custom-table-row:nth-child(even) {
        background-color: #f2f2f2;
    }

    .custom-table-row:hover {
        background-color: #ddd;
    }


    #dataTableContainer {
        position: relative;
    }

    #tableWrapper {
        overflow-x: hidden;
        overflow-y: auto;
        max-height: 300px;
    }

    #tongDoanhThu {
        position: sticky;
        top: 0;
        background-color: #fff;
        z-index: 2;
        margin-left: 20px;
        color: #007bff;
        font-size: 20px;
    }

    #dataTable thead th {
        position: sticky;
        top: 40px;
        background-color: #fff;
        z-index: 1;
    }


    .recentOrders {
        max-height: 300px; /* Đặt chiều cao tối đa */
        overflow-y: scroll; /* Hiển thị thanh cuộn dọc khi cần thiết */
        position: relative; /* Đặt vị trí tương đối cho phần tử cha */
    }

    .cardHeader {
        position: sticky; /* Đặt cố định */
        top: 0; /* Đặt vị trí của cardHeader ở trên cùng */
        background-color: #fff; /* Đặt màu nền */
        z-index: 2; /* Đảm bảo cardHeader hiển thị trên cùng */
    }

    #thongKeTable thead th {
        position: sticky; /* Đặt thẻ th cố định */
        top: 40px; /* Đặt vị trí của thẻ th ở trên cùng */
        background-color: #fff; /* Đặt màu nền của thẻ th */
        z-index: 1; /* Đặt thẻ th ở trên cùng */
    }

    #thongKeTable tbody th,
    #thongKeTable tbody td {
        padding: 8px; /* Thêm khoảng cách đệm cho thẻ th và td */
        border: 1px solid #ddd; /* Đặt viền cho thẻ th và td */
    }

    .cardHeader h2 {
        position: sticky;
        top: 0;
        background-color: #fff;
        z-index: 2;
        padding: 10px 0;
    }






</style>
<!-- Bootstrap Icons CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>

<div class="main">
    <!-- ======================= Cards ================== -->
    <div class="cardBox">


        <div class="card">
            <div id="so-luong-san-pham">
                <%--               số lượng sản phẩm --%>
            </div>

            <div class="iconBx">
                <ion-icon name="bag-handle-outline"></ion-icon>
            </div>
        </div>

        <div class="card">
            <div id="tong-doanh-thu">
                <%--                doanh thu--%>
            </div>

            <div class="iconBx">
                <ion-icon name="cash-outline"></ion-icon>
            </div>
        </div>

        <div class="card">
            <div id="so-tien-lai">
                <%--                số tiền lãi --%>
            </div>

            <div class="iconBx">
                <ion-icon name="cash-outline"></ion-icon>
            </div>
        </div>
    </div>

    <!-- ================ Add Charts JS ================= -->
    <div class="chartsBx">
        <div class="chart" id="chart-1-container">
            <h3 class="chart-title">Top 5 sản phẩm bán chạy</h3>
            <canvas id="chart-1"></canvas>
        </div>
        <div class="chart" id="chart-2-container">
            <h3 class="chart-title">Doanh thu theo tháng của năm
                <select id="selectYear">
                    <option value="2024" selected>2024</option> <!-- Năm hiện tại là mặc định -->
                </select>
            </h3>
            <canvas id="chart-2"></canvas>
        </div>

    </div>

    <%--    Thống Kê doanh thu theo ngày and tuần--%>
    <div class="chart" id="chart-1-container">
        <h3 class="chart-title">Doanh Thu Theo Ngày Và Tuần</h3>
    </div>
    <div class="dateSelector">
        <div class="datePicker">
            <label for="selectedDate">Chọn ngày:</label>
            <input type="date" id="selectedDate" name="selectedDate">
            <button id="selectDateButton">Chọn</button>
        </div>
        <div class="weekPicker">
            <label for="selectedWeek">Chọn tuần:</label>
            <input type="week" id="selectedWeek" name="selectedWeek">
            <button id="selectWeekButton">Chọn</button>
        </div>
    </div>

    <div id="dataTableContainer">
        <div id="tableWrapper" style="overflow-x: hidden; overflow-y: auto; max-height: 300px;">
            <table id="dataTable">
                <p id="tongDoanhThu" style="color: #007bff;margin-left: 20px;font-size:20px">Doanh Thu: 0đ</p>
                <!-- Dữ liệu sẽ được thêm vào đây -->
            </table>
        </div>
    </div>


    <!-- ================ Order Details List ================= -->
    <div class="details">
        <div class="recentOrders">
            <div class="cardHeader">
                <h2>Thống kê sản phẩm</h2>
                <select id="sortBy">
                    <option value="soLuong">Theo số lượng</option>
                    <option value="doanhThu">Theo doanh thu</option>
                </select>
            </div>

            <table id="thongKeTable">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên</th>
                    <th>Màu sắc</th>
                    <th>Số lượng đã bán</th>
                    <th>Giá bán</th>
                    <th>Doanh thu sản phẩm</th>
                </tr>
                </thead>
                <tbody>
                <!-- Các hàng dữ liệu sẽ được thêm vào đây -->
                </tbody>
            </table>
        </div>


        <!-- ================= New Customers ================ -->
        <div class="recentCustomers">
            <div class="cardHeader">
                <h2>Top Khách Hàng Mua Sắm Nhiều</h2>
            </div>

            <table id="customerTableKhachHhang">

                <tr>
                    <td> Hạng 1</td>

                    <td>
                        <h4>tran dinh hieu
                            <br/>
                            <span>0123456789</span>
                        </h4>
                    </td>
                    <td>200.000.000Đ</td>
                </tr>

            </table>
        </div>
    </div>
</div>
<!-- ======= Charts JS ====== -->
<!-- <script src="chartsJS.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<%-- jquery--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<script>
    $(document).ready(function() {
        $("#selectWeekButton").click(function() {
            // Sử dụng JavaScript hoặc jQuery để gửi yêu cầu AJAX
            var selectedWeek = $('#selectedWeek').val(); // Chuỗi "2024-W17"
            var weekNumber = selectedWeek.split('-W')[1]; // Tách chuỗi và lấy chỉ số tuần
            var selectedYear = new Date().getFullYear(); // Lấy năm hiện tại


            var data =[ "Tuần "+weekNumber," "+selectedYear];

            $.ajax({
                type: 'Get',
                url: '/thong-ke/thong-ke-doanh-thu-theo-tuan',
                data: {
                    tuan: weekNumber,
                    nam: selectedYear
                },
                success: function(response) {
                    console.log(response);
                    var dataTable = document.getElementById("dataTable");
                    dataTable.innerHTML = ""; // Xóa dữ liệu cũ (nếu có)
                    document.getElementById("selectedDate").value = "";

                    displayTongDoanhThu(response,data);
                },
                error: function(xhr, status, error) {
                    // Xử lý lỗi nếu có
                }
            });

        });
    });

</script>


<script>
    document.getElementById("selectDateButton").addEventListener("click", function () {
        var selectedDate = document.getElementById("selectedDate").value;
        if (!selectedDate) {
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();
            selectedDate = yyyy + '-' + mm + '-' + dd;
        }


// Gửi yêu cầu AJAX
        $.ajax({
            url: "/thong-ke/thong-ke-theo-ngay",
            type: "GET",
            data: {
                selectedDate: selectedDate
            },
            success: function (responseData) {
                console.log(responseData);
                displayData(responseData);
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
            }
        });


        $.ajax({
            url: "/thong-ke/thong-ke-doanh-thu-theo-ngay",
            type: "GET",
            data: {
                selectedDate: selectedDate
            },
            success: function (responseData) {
                console.log(responseData);

                document.getElementById("selectedWeek").value = "";

                displayTongDoanhThu(responseData,selectedDate);
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
            }
        });


    });


    function displayTongDoanhThu(data,time) {
        var tongDoanhThuElement = document.getElementById("tongDoanhThu");
        var tongDoanhThu = parseFloat(data.tongDoanhThu);

        if (isNaN(tongDoanhThu)) {
            tongDoanhThuElement.textContent = "Doanh Thu: 0đ";
        } else {
            tongDoanhThuElement.textContent = "Doanh Thu ("+ time +"): "  + tongDoanhThu.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            });
        }
    }



    // Hàm hiển thị dữ liệu lên bảng
    function displayData(data) {
        var dataTable = document.getElementById("dataTable");
        dataTable.innerHTML = ""; // Xóa dữ liệu cũ (nếu có)

        // Kiểm tra nếu không có dữ liệu
        if (data.length === 0) {
            var noDataMessageRow = dataTable.insertRow(0);
            var cell = noDataMessageRow.insertCell(0);
            cell.colSpan = 6; // Kết hợp tất cả các cột

            cell.textContent = "Không có đơn hàng nào...";

            return;
        }

        // Tạo bảng và các hàng
        var table = document.createElement("table");
        table.classList.add("custom-table"); // Thêm lớp cho bảng

        var headerRow = table.insertRow(0);
        var headerCell1 = headerRow.insertCell(0);
        var headerCell2 = headerRow.insertCell(1);
        var headerCell3 = headerRow.insertCell(2);
        var headerCell4 = headerRow.insertCell(3);
        var headerCell5 = headerRow.insertCell(4);
        var headerCell6 = headerRow.insertCell(5);

        // Thiết lập tiêu đề của các cột
        headerCell1.innerHTML = "<b>Ngày</b>";
        headerCell2.innerHTML = "<b>Tên Sản Phẩm</b>";
        headerCell3.innerHTML = "<b>Màu Sắc</b>";
        headerCell4.innerHTML = "<b>Số Lượng Bán</b>";
        headerCell5.innerHTML = "<b>Số Tiền Bán</b>";
        headerCell6.innerHTML = "<b>Hình Thức Bán</b>";

        // Thêm dữ liệu vào từng hàng
        for (var i = 0; i < data.length; i++) {
            var row = table.insertRow(i + 1);
            row.classList.add("custom-table-row"); // Thêm lớp cho hàng

            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            var cell6 = row.insertCell(5);

            cell1.innerHTML = data[i].ngay;
            cell2.innerHTML = data[i].tenSanPham;
            cell3.innerHTML = data[i].mauSac;
            cell4.innerHTML = data[i].soLuongDaBanTrenTungSanPham;
            cell6.innerHTML = data[i].loaiBanHang;

            // Định dạng số tiền bán
            var formattedDoanhThu = parseFloat(data[i].doanhThuTrenTungSanPham).toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            });
            cell5.innerHTML = formattedDoanhThu;
        }

        // Thêm bảng vào div dataTable
        dataTable.appendChild(table);
    }

</script>


<script>
    function loadDataKh() {
        $.ajax({
            url: "/thong-ke/top-khach-hang-mua-sam", // Đường dẫn đến phương thức trong Controller
            type: "GET",
            success: function (data) {
                console.log(data);
                // Xóa nội dung hiện tại của bảng
                $("#customerTableKhachHhang").empty();

                // Thêm dữ liệu vào bảng
                for (var i = 0; i < data.length; i++) {
                    var row = $("<tr>");

                    // Thêm ô đầu tiên
                    var firstCell = $("<td style='font-size: small' >").text("Hạng " + (i + 1));
                    row.append(firstCell);

                    // Thêm ô thứ hai
                    var secondCell = $("<td >");
                    var h4 = $("<h4 style='font-size: small'>").text(data[i].tenKh);
                    var br = $("<br>");
                    var span = $("<span style='font-size: small'>").text(data[i].sdtKh);
                    h4.append(br);
                    h4.append(span);
                    secondCell.append(h4);
                    row.append(secondCell);

                    // Thêm ô thứ ba
                    var formattedTienMuaSam = numberWithCommas(data[i].tienMuaSam); // Hàm để định dạng số có dấu chấm
                    var thirdCell = $("<td style='font-size: small'>").text(formattedTienMuaSam + "Đ");
                    row.append(thirdCell);

                    // Thêm hàng vào bảng
                    if (i < data.length - 1) {
                        row.addClass("row-divider");
                    }
                    $("#customerTableKhachHhang").append(row);
                }

// Hàm để định dạng số có dấu chấm
                function numberWithCommas(x) {
                    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
                }

            },
            error: function (xhr, status, error) {
                console.error("Error loading data:", error);
            }
        });
    }

    $(document).ready(function () {
        loadDataKh();
    });


</script>
<script>

    $(document).ready(function () {
        // Ngăn chặn hành vi mặc định của select khi chọn năm mới
        $('#selectYear').change(function (event) {
            event.preventDefault();
            var selectedYear = $(this).val(); // Lấy năm đã chọn
            // Thực hiện các hành động cần thiết khi chọn năm, ví dụ: render biểu đồ tương ứng với năm đã chọn
        });
    });


    $(document).ready(function () {
        // Gọi hàm loadData khi tài liệu đã sẵn sàng
        doanhThuTheoThang();
        topNamSanPhamBanChay();
        tongDoanhThu();
        soLuongSanPhamThongKe();
        soTienLai();
    });

    function soTienLai() {
        $.get('/thong-ke/tong-tien-lai', function (data) {
            const container = $('#so-tien-lai');
            container.empty();
            var productHTML = '<div class="numbers">' + data.toLocaleString() + '</div>';
            productHTML += '<div class="cardName">Tiền lãi</div>';
            container.append(productHTML);
        });
    }

    function soLuongSanPhamThongKe() {

        $.get('/thong-ke/so-luong-san-pham', function (data) {
            const container = $('#so-luong-san-pham');
            container.empty();
            var productHTML = '<div class="numbers">' + data.toLocaleString() + '</div>';
            productHTML += '<div class="cardName">Sản phẩm</div>';
            container.append(productHTML);
        });

    }

    function tongDoanhThu() {
        $.get('/thong-ke/tong-doanh-thu', function (data) {
            const container = $('#tong-doanh-thu');
            container.empty();
            var productHTML = '<div class="numbers">' + data.toLocaleString() + '</div>';
            productHTML += '<div class="cardName">Doanh thu</div>';
            container.append(productHTML);
        });
    }

    function topNamSanPhamBanChay() {
        $.get('/thong-ke/top-5-ban-chay', function (data) {
            var tenSanPhams = [];
            var doanhThu = [];
            var soLuong = [];
            for (var i = 0; i < data.length; i++) {
                tenSanPhams.push(data[i].tenSanPham);
                doanhThu.push(data[i].doanhThuTrenTungSanPham);
                soLuong.push(data[i].soLuongDaBanTrenTungSanPham);
            }

            // biểu đồ
            var ctx1 = document.getElementById('chart-1').getContext('2d');
            var chart1 = new Chart(ctx1, {
                type: 'bar',
                data: {
                    labels: tenSanPhams,
                    datasets: [{
                        label: 'Doanh thu',
                        data: doanhThu, // Dữ liệu doanh thu
                        backgroundColor: 'rgba(54, 162, 235, 0.6)',
                        yAxisID: 'y-doanhthu' // Đặt ID cho trục y của doanh thu
                    }, {
                        label: 'Số lượng',
                        data: soLuong, // Dữ liệu số lượng
                        backgroundColor: 'rgba(255, 206, 86, 0.6)',
                        yAxisID: 'y-soluong' // Đặt ID cho trục y của số lượng
                    }]
                },
                options: {
                    indexAxis: 'x',
                    parsing: {
                        yAxisKey: 'y',
                        xAxisKey: 'x'
                    },
                    scales: {
                        'y-doanhthu': { // Trục y cho doanh thu
                            position: 'left',
                            title: {
                                display: true,
                                text: 'Doanh thu (Triệu đồng)'
                            }
                        },
                        'y-soluong': { // Trục y cho số lượng
                            position: 'right',
                            title: {
                                display: true,
                                text: 'Số lượng'
                            }
                        }
                    }
                }
            });
        });
    }


    function doanhThuTheoThang() {
        $.get('/thong-ke/theo-nam?year=2024', function (data) {
            var labels = [];
            var doanhThuTheoThang = [];

            // Lặp qua các cặp key-value trong Map
            for (var key in data) {
                if (data.hasOwnProperty(key)) {
                    var thongKeResponse = data[key];
                    // Thêm tháng vào mảng nhãn
                    labels.push(key);
                    // Thêm doanh thu vào mảng doanhThuTheoThang
                    doanhThuTheoThang.push(thongKeResponse.tongDoanhThu);
                }
            }

            var ctx2 = document.getElementById('chart-2').getContext('2d');
            var chart2 = new Chart(ctx2, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Doanh thu',
                        data: doanhThuTheoThang,
                        borderColor: 'rgba(255, 99, 132, 0.6)',
                        fill: false
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Triệu đồng'
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Tháng'
                            }
                        }
                    }
                }
            });

        });
    }
</script>


<script>
    $(document).ready(function () {
        function getListCtspDesc(sortBy) {
            fetch('/thong-ke/list-ctsp-desc?sortBy=' + sortBy)
                .then(response => response.json())
                .then(data => displayThongKeData(data))
                .catch(error => console.error('Error fetching data:', error));
        }

        getListCtspDesc('soLuong');

        $('#sortBy').change(function () {
            var sortBy = $(this).val();
            getListCtspDesc(sortBy);
            console.log(sortBy);
        });
    });


    function displayThongKeData(data, sortBy) {
        console.log(data);
        var tbody = document.getElementById('thongKeTable').getElementsByTagName('tbody')[0];
        tbody.innerHTML = '';
        var stt = 1;
        data.forEach(function (item) {
            var row = tbody.insertRow();

            var sttCell = row.insertCell(0);
            sttCell.textContent = stt;

            var tenCell = row.insertCell(1);
            var mauSacCell = row.insertCell(2);
            var soLuongDaBanCell = row.insertCell(3);
            var giaBanCell = row.insertCell(4);
            var doanhThuCell = row.insertCell(5);

            tenCell.textContent = truncateText(item.tenSanPham, 30);
            mauSacCell.textContent = item.mauSac;
            giaBanCell.textContent = item.giaBan.toLocaleString();
            soLuongDaBanCell.textContent = item.soLuongDaBanTrenTungSanPham;
            doanhThuCell.textContent = item.doanhThuTrenTungSanPham.toLocaleString();
            stt++;
        });

        if (sortBy === 'soLuong') {
            $('#sortBy').val('soLuong');
        }
    }

    function truncateText(text, maxLength) {
        if (text.length > maxLength) {
            return text.substring(0, maxLength - 3) + '...'; // Cắt bớt nếu vượt quá maxLength và thêm dấu chấm ba
        } else {
            return text;
        }
    }

    function formatNumber(number) {
        return number.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
    }
</script>


<!-- ====== ionicons ======= -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>