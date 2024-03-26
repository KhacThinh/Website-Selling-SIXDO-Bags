<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet"/>
    <title>Quản Lý</title>
    <link rel="stylesheet" href="style.css"/>

    <!-- css thong ke  -->
    <%--    <link rel="stylesheet" href="<c:url value="./css/sidebar.css" />" />--%>

    <style>
        <%@include file="./css/sidebar.css" %>
    </style>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
            integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body>
<!-- navbar -->
<nav class="navbar">
    <div class="logo_item">
        <i class="bx bx-menu" id="sidebarOpen"></i>
        <img src="images/logo.png" alt=""></i>SIXDO
    </div>

    <!-- <div class="search_bar">
        <input type="text" placeholder="Search" />
      </div> -->

    <div class="navbar_content">
        <i class="bi bi-grid"></i>
        <i class='bx bx-sun' id="darkLight"></i>
        <i class='bx bx-bell'></i>
        <img src="images/profile.jpg" alt="" class="profile"/>
    </div>
</nav>

<!-- sidebar -->
<nav class="sidebar">
    <div class="menu_content">
        <ul class="menu_items">
            <div class="menu_title menu_dahsboard"></div>
            <!-- duplicate or remove this li tag if you want to add or remove navlink with submenu -->
            <!-- start -->
            <li class="item">
                <div href="#" class="nav_link submenu_item">
            <span class="navlink_icon">
              <i class="bx bx-home-alt"></i>
            </span>
                    <span class="navlink">Quản Lý</span>
                    <i class="bx bx-chevron-right arrow-left"></i>
                </div>

                <ul class="menu_items submenu">
                    <a href="#" class="nav_link sublink">Sản Phẩm</a>
                    <a href="#" class="nav_link sublink">Nhân Viên</a>
                    <a href="#" class="nav_link sublink">Khách Hàng</a>
                    <a href="#" class="nav_link sublink">Chi Tiết Sản Phẩm</a>
                </ul>
            </li>
            <!-- end -->

            <!-- duplicate this li tag if you want to add or remove  navlink with submenu -->
            <!-- start -->
            <li class="item">
                <div href="#" class="nav_link submenu_item">
            <span class="navlink_icon">
              <i class="bx bx-grid-alt"></i>
            </span>
                    <span class="navlink">Overview</span>
                    <i class="bx bx-chevron-right arrow-left"></i>
                </div>

                <ul class="menu_items submenu">
                    <a href="#" class="nav_link sublink">Nav Sub Link</a>
                    <a href="#" class="nav_link sublink">Nav Sub Link</a>
                    <a href="#" class="nav_link sublink">Nav Sub Link</a>
                    <a href="#" class="nav_link sublink">Nav Sub Link</a>
                </ul>
            </li>
            <!-- end -->
        </ul>

        <ul class="menu_items">
            <div class="menu_title menu_editor"></div>
            <!-- duplicate these li tag if you want to add or remove navlink only -->
            <!-- Start -->
            <li class="item">
                <a class="nav_link" id="btnThongKe">
            <span class="navlink_icon">
              <i class="bx bxs-magic-wand"></i>
            </span>
                    <span class="navlink">Thống Kê</span>
                </a>
            </li>
            <!-- End -->

            <li class="item">
                <a id="btn-lich-su-hoa-don" class="nav_link">
            <span class="navlink_icon">
              <i class="bx bx-loader-circle"></i>
            </span>
                    <span class="navlink">Lịch sử hoá đơn</span>
                </a>
            </li>
            <li class="item">
                <a href="#" class="nav_link">
            <span class="navlink_icon">
              <i class="bx bx-filter"></i>
            </span>
                    <span class="navlink">Filter</span>
                </a>
            </li>
            <li class="item">
                <a href="#" class="nav_link">
            <span class="navlink_icon">
              <i class="bx bx-cloud-upload"></i>
            </span>
                    <span class="navlink">Upload new</span>
                </a>
            </li>
        </ul>
        <ul class="menu_items">
            <div class="menu_title menu_setting"></div>
            <li class="item">
                <a href="#" class="nav_link">
            <span class="navlink_icon">
              <i class="bx bx-flag"></i>
            </span>
                    <span class="navlink">Notice board</span>
                </a>
            </li>
            <li class="item">
                <a href="#" class="nav_link">
            <span class="navlink_icon">
              <i class="bx bx-medal"></i>
            </span>
                    <span class="navlink">Award</span>
                </a>
            </li>
            <li class="item">
                <a href="#" class="nav_link">
            <span class="navlink_icon">
              <i class="bx bx-cog"></i>
            </span>
                    <span class="navlink">Setting</span>
                </a>
            </li>
            <li class="item">
                <a href="#" class="nav_link">
            <span class="navlink_icon">
              <i class="bx bx-layer"></i>
            </span>
                    <span class="navlink">Features</span>
                </a>
            </li>
        </ul>

        <!-- Sidebar Open / Close -->
        <div class="bottom_content">
            <div class="bottom expand_sidebar_dangxuat">
                <span> Đăng Xuất</span>
                <i class='bx bx-log-in'></i>
            </div>
        </div>
    </div>
</nav>
<section class="content" id="mainContent">
    <content class="noi-dung-chinh" id="noi-dung-chinh">
        <div id="thong-ke-sidebar" style="display: none;">
            <jsp:include page="../thong-ke/thong-ke.jsp"/>
        </div>
    </content>
</section>

<!-- JavaScript -->
<script>
    <%@include file="javascript/sidebar.js"%>
</script>


<!-- chuyen-trang  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    $(document).ready(function () {
        // Lắng nghe sự kiện click của tất cả các phần tử có lớp submenu_item
        $(".submenu_item").click(function (e) {
            e.preventDefault(); // Ngăn chặn hành động mặc định của liên kết

            // Kiểm tra xem submenu của phần tử này đã được hiển thị hay chưa
            var submenu = $(this).next('.submenu');
            if (submenu.is(":visible")) {
                // Nếu submenu đang hiển thị, ẩn nó đi
                submenu.slideUp();
            } else {
                // Nếu submenu chưa hiển thị, ẩn tất cả các submenu khác trước đó
                $('.submenu').slideUp();
                // Hiển thị submenu của phần tử này
                submenu.slideDown();
            }
        });
    });


    // $(document).ready(function () {
    //     $("#btnThongKe").click(function (e) {
    //         e.preventDefault(); // Prevent default link behavior
    //         $("#noi-dung-chinh").load("../sidebar-manager/hello.html");
    //     });
    // });


    $(document).ready(function () {
        $("#btnThongKe").click(function (e) {
            e.preventDefault(); // Prevent default link behavior
            $("#thong-ke-sidebar").show();
        });
    });



    $(document).ready(function () {
        var selectedButton = null;

        $(".nav_link").click(function (e) {
            e.preventDefault(); // Ngăn chặn hành động mặc định của liên kết

            // Kiểm tra nếu nút hiện tại không phải nút được chọn trước đó
            if (selectedButton !== this) {
                // Xóa lớp selected khỏi tất cả các nút nav_link
                $(".nav_link").removeClass('selected');

                // Thêm lớp selected cho nút được click
                $(this).addClass('selected');

                // Lưu nút được click vào biến selectedButton
                selectedButton = this;
            }
        });

        // Lắng nghe sự kiện hover của tất cả các nút có lớp nav_link
        $(".nav_link").mouseenter(function () {
            // Nếu không có nút được chọn, thì không làm gì cả
            if (selectedButton === null) return;

            // Nếu nút hiện tại không phải là nút được chọn, xoá lớp selected
            if (selectedButton !== this) {
                $(this).removeClass('selected');
            }
        });
    });


</script>
<!-- end  -->

<!-- thong-ke -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- end -->
</body>

</html>