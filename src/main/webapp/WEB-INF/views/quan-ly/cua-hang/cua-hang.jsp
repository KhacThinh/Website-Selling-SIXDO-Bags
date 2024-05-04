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

    /* Hiệu ứng hover */
    .chart-title select:hover {
        background-color: #f0f0f0; /* Màu nền hover */
    }

    .required {
        color: red;
        margin-left: 5px;
    }

    body {
        background: rgb(99, 39, 120);
    }

    .form-control:focus {
        box-shadow: none;
        border-color: #ba68c8;
    }

    .profile-button {
        background: rgb(99, 39, 120);
        box-shadow: none;
        border: none;
    }

    .profile-button:hover {
        background: #682773;
    }

    .profile-button:focus {
        background: #682773;
        box-shadow: none;
    }

    .profile-button:active {
        background: #682773;
        box-shadow: none;
    }

    .back:hover {
        color: #682773;
        cursor: pointer;
    }

    .labels {
        font-size: 14px;
    }

    .labels-gioi-tinh {
        font-size: 14px;
        margin-top: 8px;
    }

    .add-experience:hover {
        background: #ba68c8;
        color: #fff;
        cursor: pointer;
        border: solid 1px #ba68c8;
    }

    .modal-profile-customer {
        margin-top: 60px;
    }

</style>
<!-- Bootstrap Icons CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>

<div class="main">
    <div class="container">
        <!-- Form -->
        <div class="title text-center pt-5">
            <h2 class="position-relative d-inline-block"></h2>
        </div>
    </div>

    <div class="container rounded bg-white">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center">
                    <img class="rounded-circle mt-5" width="150px" id="js-logo-pl"
                         src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"/>
                    <span class="font-weight-bold mt-3" id="ten-cua-hang-pl"></span>
                </div>
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3" id="information-profile-show">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h3 class="text-right">THÔNG TIN CỬA HÀNG</h3>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Tên đầy đủ cửa hàng <span style="color: red">*</span></label>
                            <input type="text" class="form-control" placeholder="họ và tên"
                                   id="js-profile-ten"/>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <label class="labels">Tên cửa hàng <span style="color: red">*</span></label>
                            <input type="text" class="form-control" id="js-ten-ch"
                                   placeholder="state"/>
                        </div>
                        <div class="col-md-6">
                            <label class="labels">Số điện thoại <span style="color: red">*</span></label>
                            <input type="text" class="form-control" placeholder="số điện thoại"
                                   id="js-sdt-ch"/>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Email <span style="color: red">*</span></label>
                            <input type="email" class="form-control" id="js-email-ch" placeholder="abc@gmail.com"/>
                        </div>
                        <div class="col-md-12">
                            <label class="labels-gioi-tinh">Ảnh Logo</label>
                            <input type="file" class="form-control"
                                   id="js-hinhAnh-ch" multiple/>
                        </div>
                    </div>
                    <div class="mt-5 text-center">
                        <button class="btn btn-primary profile-button" type="button"
                                id="save-form-cua-hang">
                            Lưu thông tin cửa hàng
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center experience">
                        <span>Địa chỉ</span>
                    </div>
                    <br/>
                    <div class="change-password ds-none">
                        <div class="col-md-12">
                            <label class="labels">Địa chỉ <span style="color: red">*</span></label>
                            <textarea class="form-control" placeholder="ngõ a phường B quận C" id="js-dia-chi-ch"></textarea>

                        </div>
                        <br/>
                        <div class="col-md-12">
                            <label class="labels">Toạ độ X <span style="color: red">*</span></label>
                            <input type="text" class="form-control" placeholder="105.36575894"
                                   id="js-toa-do-x"/>
                        </div>
                        <br/>
                        <div class="col-md-12">
                            <label class="labels">Toạ độ Y <span style="color: red">*</span></label>
                            <input type="text" class="form-control" placeholder="204.394738374"
                                   id="js-toa-do-y"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    $(document).ready(function () {
        hienThiCuaHangShow();

        $("#save-form-cua-hang").on("click", function () {
            postDataToController();
        });
    })


    function hienThiCuaHangShow() {
        // Sử dụng jQuery để gọi endpoint và nhận dữ liệu SlideShow từ server
        $.get("/sixdo-shop/cua-hang/show", function (data) {
            var backgroundImageUrl = '${pageContext.request.contextPath}/../' + data.hinhAnhLogo + ';'
            $('#js-profile-ten').val(data.tenDayDuCuaHang);
            $('#js-ten-ch').val(data.tenCuaHang);
            $('#js-dia-chi-ch').val(data.diaChi);
            $('#js-sdt-ch').val(data.sdt);
            $('#js-email-ch').val(data.email);
            $('#js-toa-do-x').val(data.toaDoMapX);
            $('#js-toa-do-y').val(data.toaDoMapY);
            $("#js-logo-pl").attr("src", backgroundImageUrl);
            $('#ten-cua-hang-pl').text(data.tenCuaHang);
        });

    }

    function postDataToController() {
        var tenDayDuCuaHang = $('#js-profile-ten').val().trim();
        var tenCuaHang = $('#js-ten-ch').val().trim();
        var diaChi = $('#js-dia-chi-ch').val().trim();
        var hinhAnhLogo = $('#js-hinhAnh-ch')[0].files[0]; // Lấy file từ input type file
        var sdt = $('#js-sdt-ch').val().trim();
        var email = $('#js-email-ch').val().trim();
        var toaDoMapX = $('#js-toa-do-x').val().trim();
        var toaDoMapY = $('#js-toa-do-y').val().trim();

        if (!tenDayDuCuaHang || !tenCuaHang || !diaChi || !sdt || !email || !toaDoMapX || !toaDoMapY) {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Vui lòng điền đầy đủ thông tin.',
            });
            return;
        }

        // Kiểm tra validate số điện thoại
        var phonePattern = /^0[0-9]{9}$/;
        if (!phonePattern.test(sdt)) {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Số điện thoại không hợp lệ.',
            });
            return; // Không gửi yêu cầu nếu số điện thoại không đúng
        }


        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Địa chỉ email không hợp lệ.',
            });
            return;
        }

        var formData = new FormData();
        formData.append('tenDayDuCuaHang', tenDayDuCuaHang);
        formData.append('tenCuaHang', tenCuaHang);
        formData.append('diaChi', diaChi);
        formData.append('sdt', sdt);
        formData.append('email', email);
        formData.append('toaDoMapX', toaDoMapX);
        formData.append('toaDoMapY', toaDoMapY);
        if (hinhAnhLogo) {
            formData.append('hinhAnhLogo', hinhAnhLogo);
        }

        $.ajax({
            type: "POST",
            url: "/sixdo-shop/cua-hang/add",
            processData: false,
            contentType: false,
            data: formData,
            success: function (data) {
                Swal.fire({
                    icon: 'success',
                    title: 'Thành công',
                    text: 'Sửa Thành công',
                    showConfirmButton: false,
                    timer: 1500
                }).then(() => {
                    hienThiCuaHangShow();
                });
            },
            error: function () {
                Swal.fire({
                    icon: 'error',
                    title: 'Lỗi',
                    text: 'Đã có lỗi xảy ra',
                    showConfirmButton: false,
                    timer: 1500
                });
            }
        });
    }

</script>


<!-- ====== ionicons ======= -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>