<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!----======== CSS ======== -->

    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <title>QUẢN LÝ</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<style>
    /* ===== Google Font Import - Poppins ===== */
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600&display=swap');

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    .loader {
        width: 48px;
        height: 48px;
        border-radius: 50%;
        display: inline-block;
        border-top: 4px solid #413aa7;
        border-right: 4px solid transparent;
        box-sizing: border-box;
        animation: rotation 0.5s linear infinite;
        justify-content: center;
        text-align: center;
    }
    .loader::after {
        content: '';
        box-sizing: border-box;
        position: absolute;
        left: 0;
        top: 0;
        width: 48px;
        height: 48px;
        border-radius: 50%;
        border-left: 4px solid #FF3D00;
        border-bottom: 4px solid transparent;
        animation: rotation 0.25s linear infinite reverse;
    }
    @keyframes rotation {
        0% {
            transform: rotate(0deg);
        }
        100% {
            transform: rotate(360deg);
        }
    }

    :root {
        /* ===== Colors ===== */
        --primary-color: #0E4BF1;
        --panel-color: #FFF;
        --text-color: #000;
        --black-light-color: #707070;
        --border-color: #e6e5e5;
        --toggle-color: #DDD;
        --box1-color: #4DA3FF;
        --box2-color: #FFE6AC;
        --box3-color: #E7D1FC;
        --title-icon-color: #fff;

        /* ====== Transition ====== */
        --tran-05: all 0.5s ease;
        --tran-03: all 0.3s ease;
        --tran-03: all 0.2s ease;
    }

    body {
        min-height: 100vh;
        background-color: var(--panel-color);
    }

    body.dark {
        --primary-color: #3A3B3C;
        --panel-color: #242526;
        --text-color: #CCC;
        --black-light-color: #CCC;
        --border-color: #4D4C4C;
        --toggle-color: #FFF;
        --box1-color: #3A3B3C;
        --box2-color: #3A3B3C;
        --box3-color: #3A3B3C;
        --title-icon-color: #CCC;
    }

    /* === Custom Scroll Bar CSS === */
    ::-webkit-scrollbar {
        width: 8px;
    }

    ::-webkit-scrollbar-track {
        background: #f1f1f1;
    }

    ::-webkit-scrollbar-thumb {
        background: var(--primary-color);
        border-radius: 12px;
        transition: all 0.3s ease;
    }

    ::-webkit-scrollbar-thumb:hover {
        background: #0b3cc1;
    }

    body.dark::-webkit-scrollbar-thumb:hover,
    body.dark .activity-data::-webkit-scrollbar-thumb:hover {
        background: #3A3B3C;
    }

    nav {
        position: fixed;
        top: 0;
        left: 0;
        height: 100%;
        width: 250px;
        padding: 10px 14px;
        background-color: var(--panel-color);
        border-right: 1px solid var(--border-color);
        transition: var(--tran-05);
    }

    nav.close {
        width: 73px;
    }

    nav .logo-name {
        display: flex;
        align-items: center;
    }

    nav .logo-image {
        display: flex;
        justify-content: center;
        min-width: 45px;
    }

    nav .logo-image img {
        width: 40px;
        object-fit: cover;
        border-radius: 50%;
    }

    nav .logo-name .logo_name {
        font-size: 22px;
        font-weight: 600;
        color: var(--text-color);
        margin-left: 14px;
        transition: var(--tran-05);
    }

    nav.close .logo_name {
        opacity: 0;
        pointer-events: none;
    }

    nav .menu-items {
        margin-top: 40px;
        height: calc(100% - 90px);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .menu-items li {
        list-style: none;
    }

    .menu-items li a {
        display: flex;
        align-items: center;
        height: 50px;
        text-decoration: none;
        position: relative;
    }

    .nav-links li a:hover:before {
        content: "";
        position: absolute;
        left: -7px;
        height: 5px;
        width: 5px;
        border-radius: 50%;
        background-color: var(--primary-color);
    }

    body.dark li a:hover:before {
        background-color: var(--text-color);
    }

    .menu-items li a i {
        font-size: 24px;
        min-width: 45px;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--black-light-color);
    }

    .menu-items li a .link-name {
        font-size: 18px;
        font-weight: 400;
        color: var(--black-light-color);
        transition: var(--tran-05);
    }

    nav.close li a .link-name {
        opacity: 0;
        pointer-events: none;
    }

    .nav-links li a:hover i,
    .nav-links li a:hover .link-name {
        color: var(--primary-color);
    }

    body.dark .nav-links li a:hover i,
    body.dark .nav-links li a:hover .link-name {
        color: var(--text-color);
    }

    .menu-items .logout-mode {
        padding-top: 10px;
        border-top: 1px solid var(--border-color);
    }

    .menu-items .mode {
        display: flex;
        align-items: center;
        white-space: nowrap;
    }

    .menu-items .mode-toggle {
        position: absolute;
        right: 14px;
        height: 50px;
        min-width: 45px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
    }

    .mode-toggle .switch {
        position: relative;
        display: inline-block;
        height: 22px;
        width: 40px;
        border-radius: 25px;
        background-color: var(--toggle-color);
    }

    .switch:before {
        content: "";
        position: absolute;
        left: 5px;
        top: 50%;
        transform: translateY(-50%);
        height: 15px;
        width: 15px;
        background-color: var(--panel-color);
        border-radius: 50%;
        transition: var(--tran-03);
    }

    body.dark .switch:before {
        left: 20px;
    }

    .dashboard {
        position: relative;
        left: 250px;
        background-color: var(--panel-color);
        min-height: 100vh;
        width: calc(100% - 250px);
        padding: 10px 14px;
        transition: var(--tran-05);
    }

    nav.close ~ .dashboard {
        left: 73px;
        width: calc(100% - 73px);
    }

    .dashboard .top {
        position: fixed;
        top: 0;
        left: 250px;
        display: flex;
        width: calc(100% - 250px);
        justify-content: space-between;
        align-items: center;
        padding: 10px 14px;
        background-color: var(--panel-color);
        transition: var(--tran-05);
        z-index: 10;
    }

    nav.close ~ .dashboard .top {
        left: 73px;
        width: calc(100% - 73px);
    }

    .dashboard .top .sidebar-toggle {
        font-size: 26px;
        color: var(--text-color);
        cursor: pointer;
    }

    .dashboard .top .search-box {
        position: relative;
        height: 45px;
        max-width: 600px;
        width: 100%;
        margin: 0 30px;
    }

    .top .search-box input {
        position: absolute;
        border: 1px solid var(--border-color);
        background-color: var(--panel-color);
        padding: 0 25px 0 50px;
        border-radius: 5px;
        height: 100%;
        width: 100%;
        color: var(--text-color);
        font-size: 15px;
        font-weight: 400;
        outline: none;
    }

    .top .search-box i {
        position: absolute;
        left: 15px;
        font-size: 22px;
        z-index: 10;
        top: 50%;
        transform: translateY(-50%);
        color: var(--black-light-color);
    }

    .top img {
        width: 40px;
        border-radius: 50%;
    }

    .dashboard .dash-content {
        padding-top: 50px;
    }

    .dash-content .title {
        display: flex;
        align-items: center;
        margin: 60px 0 30px 0;
    }

    .dash-content .title i {
        position: relative;
        height: 35px;
        width: 35px;
        background-color: var(--primary-color);
        border-radius: 6px;
        color: var(--title-icon-color);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 24px;
    }

    .dash-content .title .text {
        font-size: 24px;
        font-weight: 500;
        color: var(--text-color);
        margin-left: 10px;
    }

    .dash-content .boxes {
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
    }

    .dash-content .boxes .box {
        display: flex;
        flex-direction: column;
        align-items: center;
        border-radius: 12px;
        width: calc(100% / 3 - 15px);
        padding: 15px 20px;
        background-color: var(--box1-color);
        transition: var(--tran-05);
    }

    .boxes .box i {
        font-size: 35px;
        color: var(--text-color);
    }

    .boxes .box .text {
        white-space: nowrap;
        font-size: 18px;
        font-weight: 500;
        color: var(--text-color);
    }

    .boxes .box .number {
        font-size: 40px;
        font-weight: 500;
        color: var(--text-color);
    }

    .boxes .box.box2 {
        background-color: var(--box2-color);
    }

    .boxes .box.box3 {
        background-color: var(--box3-color);
    }

    .dash-content .activity .activity-data {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
    }

    .activity .activity-data {
        display: flex;
    }

    .activity-data .data {
        display: flex;
        flex-direction: column;
        margin: 0 15px;
    }

    .activity-data .data-title {
        font-size: 20px;
        font-weight: 500;
        color: var(--text-color);
    }

    .activity-data .data .data-list {
        font-size: 18px;
        font-weight: 400;
        margin-top: 20px;
        white-space: nowrap;
        color: var(--text-color);
    }

    @media (max-width: 1000px) {
        nav {
            width: 73px;
        }

        nav.close {
            width: 250px;
        }

        nav .logo_name {
            opacity: 0;
            pointer-events: none;
        }

        nav.close .logo_name {
            opacity: 1;
            pointer-events: auto;
        }

        nav li a .link-name {
            opacity: 0;
            pointer-events: none;
        }

        nav.close li a .link-name {
            opacity: 1;
            pointer-events: auto;
        }

        nav ~ .dashboard {
            left: 73px;
            width: calc(100% - 73px);
        }

        nav.close ~ .dashboard {
            left: 250px;
            width: calc(100% - 250px);
        }

        nav ~ .dashboard .top {
            left: 73px;
            width: calc(100% - 73px);
        }

        nav.close ~ .dashboard .top {
            left: 250px;
            width: calc(100% - 250px);
        }

        .activity .activity-data {
            overflow-X: scroll;
        }
    }

    @media (max-width: 780px) {
        .dash-content .boxes .box {
            width: calc(100% / 2 - 15px);
            margin-top: 15px;
        }
    }

    @media (max-width: 560px) {
        .dash-content .boxes .box {
            width: 100%;
        }
    }

    @media (max-width: 400px) {
        nav {
            width: 0px;
        }

        nav.close {
            width: 73px;
        }

        nav .logo_name {
            opacity: 0;
            pointer-events: none;
        }

        nav.close .logo_name {
            opacity: 0;
            pointer-events: none;
        }

        nav li a .link-name {
            opacity: 0;
            pointer-events: none;
        }

        nav.close li a .link-name {
            opacity: 0;
            pointer-events: none;
        }

        nav ~ .dashboard {
            left: 0;
            width: 100%;
        }

        nav.close ~ .dashboard {
            left: 73px;
            width: calc(100% - 73px);
        }

        nav ~ .dashboard .top {
            left: 0;
            width: 100%;
        }

        nav.close ~ .dashboard .top {
            left: 0;
            width: 100%;
        }

        /* Thêm CSS để ẩn submenu ban đầu */
        .sub-menu {
            display: none;
        }

        /* Sử dụng hover để hiển thị submenu khi di chuột vào menu chính */
        .nav-links li:hover .sub-menu {
            display: block;
        }



    }
</style>

<body>

<nav>

    <div class="logo-name">
        <div class="logo-image">
         </div>
        <span class="logo_name">Sixdo Shop</span>
    </div>
    <div class="menu-items">
        <ul class="nav-links">

            <% if (session.getAttribute("quanLy") != null) { %>
            <%-- Hiển thị phần thống kê nếu có session "quanLy" --%>
            <li><a href="/thong-ke">
                <i class="uil uil-estate"></i>
                <span class="link-name">THỐNG KÊ</span>
            </a></li>
            <% } else { %>
            <% } %>

            <li><a href="/ban-tai-quay">
                <i class="bi bi-cart-plus"></i>
                <span class="link-name">BÁN TẠI QUẦY</span>
            </a></li>

            <li>
                <a href="#" id="manageBtn">
                    <i class="uil uil-files-landscapes"></i>
                    <span class="link-name" onclick="toggleSubMenu()">QUẢN LÝ</span>
                </a>
                <!-- Thêm class "sub-menu" vào thẻ ul chứa submenu -->
                <ul class="sub-menu" id="subMenu" style="display: none ;
                transition: opacity 0.8s ease">

                    <% if (session.getAttribute("quanLy") != null) { %>
                    <li><a href="/san-pham" id="btnSanPham">
                        <i class="uil uil-box"></i>
                        <span class="link-name">Sản phẩm</span>
                    </a></li>
                    <li><a href="/hoa-don/lich-su" id="btnHoaDon">
                        <i class="uil uil-file-alt"></i>
                        <span class="link-name">Lịch Sử Hoá đơn</span>
                    </a></li>
                    <% } else { %>

                    <li><a href="/hoa-don/nv-lich-su" id="btnHoaDon">
                        <i class="uil uil-file-alt"></i>
                        <span class="link-name">Lịch Sử Hoá đơn</span>
                    </a></li>
                    <% } %>

                    <% if (session.getAttribute("quanLy") != null) { %>
                    <li><a href="/khach_hang?trangThai=1" id="btnKhachHang">
                        <i class="bi bi-people-fill"></i>
                        <span class="link-name">Khách Hàng</span>
                    </a></li>

                    <li><a href="/nhan-vien?trangThai=1" id="btnNhanVien">
                        <i class="bi bi-person-fill-gear"></i>
                        <span class="link-name">Nhân Viên</span>
                    </a></li>
                    <li><a href="/ma-giam-gia?trangThai=true" id="btnMaGiamGia">
                        <i class="bi bi-tag"></i>
                        <span class="link-name">Mã Giảm Giá</span>
                    </a></li>

                    <% } else { %>
                    <% } %>
                </ul>

            </li>
            <% if (session.getAttribute("quanLy") != null) { %>

            <li>
                <a href="#" >
                    <i class="bi bi-collection"></i>
                    <span class="link-name" onclick="toggleSubMenuKhac()">Khác</span>
                </a>

                <ul class="sub-menu" id="subMenu3" style="display: none ;
            transition: opacity 0.8s ease">
                    <li><a href="/thuonghieu?trangThai=true" id="btnMaGiamGia">
                        <i class="bi bi-r-circle-fill"></i>
                        <span class="link-name">Thương Hiệu</span>
                    </a></li>
                    <li><a href="/thoi_gian_bao_hanh?trangThai=true" id="btnMaGiamGia">
                        <i class="bi bi-alarm-fill"></i>
                        <span class="link-name">Bảo Hành</span>
                    </a></li>
                    <li><a href="/doi-tuong-su-dung?trangThai=true" id="btnMaGiamGia">
                        <i class="bi bi-person-vcard-fill"></i>
                        <span class="link-name">Đối Tượng</span>
                    </a></li>
                    <li><a href="/danh-muc?trangThai=true" id="btnMaGiamGia">
                        <i class="bi bi-bookmark-check-fill"></i>
                        <span class="link-name">Danh Mục</span>
                    </a></li>
                    <li><a href="/mau-sac" id="btnMaGiamGia">
                        <i class="bi bi-palette-fill"></i>
                        <span class="link-name">Màu Sắc</span>
                    </a></li>

                </ul>

            </li>

            <li>
                <a href="#" id="">
                    <i class="bi bi-gear"></i>
                    <span class="link-name" onclick="toggleSubMenuu()">HỆ THỐNG</span>
                </a>
                <!-- Thêm class "sub-menu" vào thẻ ul chứa submenu -->
                <ul class="sub-menu" id="subMenu2" style="display: none ;
            transition: opacity 0.8s ease">

                    <li><a href="/sixdo-shop/cua-hang/manager" id="btnCuaHang">
                        <i class="bi bi-shop"></i>
                        <span class="link-name">Thông Tin Cửa Hàng</span>
                    </a></li>
                    <li><a href="/sixdo-shop/slide-show/manager" id="btnSlideShow">
                        <i class="bi bi-card-image"></i>
                        <span class="link-name">Slide Show</span>
                    </a></li>

                </ul>

            </li>


            <%} %>
        </ul>

        <ul class="logout-mode">
            <li id="logoutLink"><a href="#">
                <i class="uil uil-signout"></i>
                <span class="link-name">Đăng xuất</span>
            </a></li>
            <li class="mode">
                <a href="#">
                    <i class="uil uil-moon"></i>
                    <span class="link-name">Dark Mode</span>
                </a>
                <div class="mode-toggle">
                    <span class="switch"></span>
                </div>
            </li>
        </ul>
    </div>
</nav>
<div id="loading-spinner" class="spinner-container loader" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 100">
    <div class="spinner"></div>
</div>
<select>

</select>

<script>


    document.getElementById("logoutLink").addEventListener("click", function(event) {
        event.preventDefault();

        Swal.fire({
            title: "Bạn có muốn đăng xuất không ?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Đăng xuất",
            cancelButtonText: "Không",
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "/logout/quan-ly";
            }
        });

    });
    document.addEventListener("DOMContentLoaded", function() {
        // Hiển thị spinner
        document.getElementById("loading-spinner").style.display = "block";

        // Ẩn spinner sau 3 giây
        setTimeout(function() {
            document.getElementById("loading-spinner").style.display = "none";
        }, 150);
    });

    function toggleSubMenuu() {
        var subMenu = document.getElementById("subMenu2");
        subMenu.classList.toggle("active"); // Thêm hoặc loại bỏ lớp active

        if (subMenu.style.display === "none") {
            subMenu.style.display = "block";
        } else {
            subMenu.style.display = "none";
        }
    }
    function toggleSubMenuKhac() {
        var subMenu = document.getElementById("subMenu3");
        subMenu.classList.toggle("active"); // Thêm hoặc loại bỏ lớp active

        if (subMenu.style.display === "none") {
            subMenu.style.display = "block";
        } else {
            subMenu.style.display = "none";
        }
    }

    function toggleSubMenu() {
        var subMenu = document.getElementById("subMenu");
        subMenu.classList.toggle("active"); // Thêm hoặc loại bỏ lớp active

        if (subMenu.style.display === "none") {
            subMenu.style.display = "block";
        } else {
            subMenu.style.display = "none";
        }
    }
    const body = document.querySelector("body"),
        modeToggle = body.querySelector(".mode-toggle");
    sidebar = body.querySelector("nav");
    sidebarToggle = body.querySelector(".sidebar-toggle");
    let getMode = localStorage.getItem("mode");
    if (getMode && getMode === "dark") {
        body.classList.toggle("dark");
    }
    let getStatus = localStorage.getItem("status");
    if (getStatus && getStatus === "close") {
        sidebar.classList.toggle("close");
    }
    modeToggle.addEventListener("click", () => {
        body.classList.toggle("dark");
        if (body.classList.contains("dark")) {
            localStorage.setItem("mode", "dark");
        } else {
            localStorage.setItem("mode", "light");
        }
    });
    sidebarToggle.addEventListener("click", () => {
        sidebar.classList.toggle("close");
        if (sidebar.classList.contains("close")) {
            localStorage.setItem("status", "close");
        } else {
            localStorage.setItem("status", "open");
        }
    })
</script>
</body>

</html>