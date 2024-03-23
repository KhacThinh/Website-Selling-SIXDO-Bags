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
        background-color: var(--blue);
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


</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<div class="main">
    <!-- ======================= Cards ================== -->
    <div class="cardBox">
        <div class="card">
            <div>
                <div class="numbers">1,504</div>
                <div class="cardName">Lượt xem hàng ngày</div>
            </div>

            <div class="iconBx">
                <ion-icon name="eye-outline"></ion-icon>
            </div>
        </div>

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
                </tbody>
            </table>
        </div>

        <!-- ================= New Customers ================ -->
        <div class="recentCustomers">
            <div class="cardHeader">
                <h2>Khách hàng gần đây</h2>
            </div>

            <table>
                <tr>
                    <td width="60px">
                        <div class="imgBx">
                            <img src="assets/imgs/customer02.jpg" alt=""/>
                        </div>
                    </td>
                    <td>
                        <h4>
                            Khắc Thịnh <br/>
                            <span>Việt Nam</span>
                        </h4>
                    </td>
                </tr>

                <tr>
                    <td width="60px">
                        <div class="imgBx">
                            <img src="assets/imgs/customer01.jpg" alt=""/>
                        </div>
                    </td>
                    <td>
                        <h4>
                            Amit <br/>
                            <span>India</span>
                        </h4>
                    </td>
                </tr>

                <tr>
                    <td width="60px">
                        <div class="imgBx">
                            <img src="assets/imgs/customer02.jpg" alt=""/>
                        </div>
                    </td>
                    <td>
                        <h4>
                            David <br/>
                            <span>Italy</span>
                        </h4>
                    </td>
                </tr>

                <tr>
                    <td width="60px">
                        <div class="imgBx">
                            <img src="assets/imgs/customer01.jpg" alt=""/>
                        </div>
                    </td>
                    <td>
                        <h4>
                            Amit <br/>
                            <span>India</span>
                        </h4>
                    </td>
                </tr>

                <tr>
                    <td width="60px">
                        <div class="imgBx">
                            <img src="assets/imgs/customer02.jpg" alt=""/>
                        </div>
                    </td>
                    <td>
                        <h4>
                            David <br/>
                            <span>Italy</span>
                        </h4>
                    </td>
                </tr>

                <tr>
                    <td width="60px">
                        <div class="imgBx">
                            <img src="assets/imgs/customer01.jpg" alt=""/>
                        </div>
                    </td>
                    <td>
                        <h4>
                            Amit <br/>
                            <span>India</span>
                        </h4>
                    </td>
                </tr>

                <tr>
                    <td width="60px">
                        <div class="imgBx">
                            <img src="assets/imgs/customer01.jpg" alt=""/>
                        </div>
                    </td>
                    <td>
                        <h4>
                            David <br/>
                            <span>Italy</span>
                        </h4>
                    </td>
                </tr>

                <tr>
                    <td width="60px">
                        <div class="imgBx">
                            <img src="assets/imgs/customer02.jpg" alt=""/>
                        </div>
                    </td>
                    <td>
                        <h4>
                            Amit <br/>
                            <span>India</span>
                        </h4>
                    </td>
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

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>


<script>

    $(document).ready(function() {
        // Ngăn chặn hành vi mặc định của select khi chọn năm mới
        $('#selectYear').change(function(event) {
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
                    doanhThuTheoThang.push(thongKeResponse.doanhThuTrenTungSanPham);
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
    $(document).ready(function() {
        function getListCtspDesc(sortBy) {
            fetch('/thong-ke/list-ctsp-desc?sortBy=' + sortBy)
                .then(response => response.json())
                .then(data => displayThongKeData(data))
                .catch(error => console.error('Error fetching data:', error));
        }

        getListCtspDesc('soLuong');

        $('#sortBy').change(function() {
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
        data.forEach(function(item) {
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
            soLuongDaBanCell.textContent =item.soLuongDaBanTrenTungSanPham;
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
        return number.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
    }
</script>




<!-- ====== ionicons ======= -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>