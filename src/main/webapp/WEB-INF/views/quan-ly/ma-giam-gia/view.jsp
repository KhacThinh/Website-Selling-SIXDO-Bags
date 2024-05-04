<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>QUẢN LÝ</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
            integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style type="text/css">
        #test {
            width: auto;
            height: 400px;
            overflow-x: hidden;
            overflow-y: auto;
            position: relative; /* Thiết lập vị trí tương đối */
        }

        #test thead {
            position: sticky;
            top: 0;
            background-color: #fff; /* Để thêm một nền trắng dưới thead */
            z-index: 1; /* Đặt z-index để thead hiển thị trên top */
        }

        #test tbody {
            padding-top: 40px; /* Chiều cao của thead */
        }

        .container {
            margin-top: 10px;
            margin-right: 50px;
            width: 1200px;
        }

        .product-info {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product-image {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .detail-product {
            background-color: #f8f9fa;
        }

        /*//*/
        .search-form .input-group-append .btn {
            border-radius: 20px;
            padding: 10px 20px; /* Điều chỉnh lề và padding của nút tìm kiếm */
        }

        .search-form .input-group,
        .search-form .input-group-append .btn,
        .search-form .input-group-prepend .input-group-text,
        .search-form .input-group input {
            height: 100%; /* Đảm bảo rằng tất cả các phần tử trong dòng có chiều cao bằng nhau */
        }

        .search-form .input-group-append .btn {
            border: none; /* Loại bỏ viền của nút */
            border-radius: 20px;
            padding: 10px 20px;
        }

        .search-form .input-group-append .btn {
            border: none; /* Loại bỏ viền của nút */
            border-radius: 20px;
            padding: 0; /* Xóa bỏ padding */
            margin: 0; /* Xóa bỏ margin */
            height: 100%; /* Đảm bảo chiều cao của nút bằng với ô nhập liệu */
        }

        .search-form .input-group-append .btn:active {
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5); /* Đổ bóng khi nút được click */
        }

        .search-form .input-group,
        .search-form .input-group-append {
            border: none; /* Loại bỏ viền */
        }

        #test th,
        #test td {
            font-size: smaller; /* Hoặc bạn có thể sử dụng kích thước chữ mong muốn */
        }

        /* CSS styles */
        #test th {
            border-bottom: 1px #007bff dashed; /* Màu và kiểu của đường vạch ngăn cách */
        }

        .input-group .form-control {
            height: 100%;
        }
        .status.dangxuly {
            text-align: center;
            padding: 2px 4px ;
            background: #0b3cc1;
            color: var(--white);
            border-radius: 4px;
            font-size: 12px;
        }
        .status.return {
            padding: 2px 4px;
            background: #f00;
            color: var(--white);
            border-radius: 4px;
            font-size: 12px;
        }
        .status.pending {
            padding: 2px 4px;
            background: #e9b10a;
            color: var(--white);
            border-radius: 4px;
            font-size: 12px;

        }


        .status.dangxuly {
            padding: 2px 4px;
            background: #0b3cc1;
            color: var(--white);
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
        }

        .status.hetMa {
            padding: 2px 4px;
            background: #98531b;
            color: var(--white);
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
        }

        .bold {
            font-weight: bold;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>
<div class="container">
    <div class="title text-center pt-5">
        <h2 class="position-relative d-inline-block">QUẢN LÝ MÃ GIẢM GIÁ</h2>
    </div>
    <div class="row">
        <button type="button" class="btn btn-outline-secondary mt-5 rounded-pill" data-bs-toggle="modal"
                data-bs-target="#modalAddMaGiamGia">
            <i class="bi bi-plus-square-fill"></i> <span>THÊM MÃ GIẢM GIÁ</span>
        </button>
        <jsp:include page="them-ma-giam-gia.jsp"/>
    </div>
</div>
<div class="container mt-4">
    <div class="row justify-content-between">
        <div class="col-md-4">
            <form action="/ma-giam-gia" class="search-form" method="get">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <select class="form-select" name="trangThai" id="trangThaiSelect">
                            <option value="">Tất Cả</option>
                            <option value="true">Hoạt động</option>
                            <option value="false">Không hoạt động</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-4">
            <form action="/ma-giam-gia" class="search-form" method="get">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="bi bi-search"></i></span>
                    </div>
                    <input type="text" name="name" value="${nameSearch}" class="form-control"
                           placeholder="Tìm kiếm theo mã hoặc tên...">
                    <%--                    <div class="input-group-append">--%>
                    <%--                        <button class="btn btn-outline-secondary" type="submit">Tìm kiếm</button>--%>
                    <%--                    </div>--%>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="container">
    <div id="test">
        <table class="table table-sm table-hover table-striped mb-5">
            <thead>
            <tr>
                <th scope="col">Stt</th>
                <th scope="col">Mã Giảm Giá</th>
                <th scope="col">Tên Mã Giảm Giá</th>
                <th scope="col">Giá Trị Giảm</th>
                <th scope="col">Ngày Bắt Đầu</th>
                <th scope="col">Ngày Kết Thúc</th>
                <th scope="col">Số Lượng</th>
                <th scope="col">Điều Kiện Giảm</th>
                <th scope="col">Mô Tả</th>
                <th scope="col" style="vertical-align: middle; text-align: center">Trạng Thái</th>
                <th scope="col">Khác</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="currentDate" value="<%= java.time.LocalDate.now() %>" />

            <c:forEach items="${listColors.content}" var="sp" varStatus="i">
                <c:set var="soLuongMGG" value="${sp.soLuong}" />
                <c:set var="ngayBatDau" value="${sp.ngayBatDau}" />
                <c:set var="ngayKetThuc" value="${sp.ngayKetThuc}" />
                <c:set var="trangThai" value="mặc định" />
                <c:set var="classCss" value="" />
                <c:choose>

                    <c:when test="${soLuongMGG <= 0}">
                        <c:set var="trangThai" value="Hết mã" />
                        <c:set var="classCss" value="status hetMa" />
                    </c:when>

                    <%-- Nếu ngày hiện tại nằm trong khoảng ngày bắt đầu và ngày kết thúc --%>
                    <c:when test="${currentDate >= ngayBatDau && currentDate <= ngayKetThuc }">
                        <c:set var="trangThai" value="Hoạt động" />
                        <c:set var="classCss" value="status dangxuly" />
                    </c:when>
                    <c:when test="${currentDate < ngayBatDau}">
                        <c:set var="trangThai" value="Chưa bắt đầu" />
                        <c:set var="classCss" value="status pending" />
                    </c:when>
                    <c:when test="${currentDate > ngayKetThuc}">
                        <c:set var="trangThai" value="Đã hết hạn" />
                        <c:set var="classCss" value="status return" />

                    </c:when>
                </c:choose>

                <tr id="record_${sp.id}">
                    <td class="bold">${i.index + 1}</td>
                    <td>${sp.maGiamGia}</td>
                    <td>${sp.tenMaGiamGia}</td>
                    <td>${sp.giaTriGiam}</td>
                    <td>${sp.ngayBatDau}</td>
                    <td>${sp.ngayKetThuc}</td>
                    <td>${sp.soLuong}</td>
                    <td>${sp.dieuKienGiam}</td>
                    <td>${sp.moTa}</td>
                    <td  style="vertical-align: middle; text-align: center"><span class="${classCss}">${trangThai}</span></td>
                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                            <li>
                            <c:choose>
                            <c:when test="${currentDate < ngayBatDau}">
                                <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                        onclick="getDataKhachHangByMgg(${sp.id})"
                                        data-bs-target="#modalUpdateMGG${sp.id}">
                                    <i class="bi bi-pencil"></i> Sửa
                                </button>
                            </c:when>
                            </c:choose>
                            </li>

                            </li>
                                <%--                            <a class="dropdown-item delete-color" href="/mau-sac/delete/${sp.id}" ><i class="bi bi-trash3"></i> Xóa</a>--%>
                            <a class="dropdown-item delete-color" href="#" onclick="xoaMaGiamGia(${sp.id})"><i
                                    class="bi bi-trash3"></i> Xóa</a>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>


                        <div class="modal fade" id="modalUpdateMGG${sp.id}" tabindex="-1"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Chương Trình
                                            Khuyến Mãi</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="maUpdate${sp.id}">Mã Giảm
                                                        Giá <span>*</span></label>
                                                    <input disabled value="${sp.maGiamGia}" name="maGiamGia"
                                                           id="maUpdate${sp.id}" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label for="giaTriGiamUpdate${sp.id}">Giá
                                                        Trị Giảm <span>*</span></label>
                                                    <input value="${sp.giaTriGiam}" name="giaTriGiam"
                                                           id="giaTriGiamUpdate${sp.id}" class="form-control">

                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="tenUpdate${sp.id}">Tên Mã
                                                        Giảm Giá <span>*</span></label>

                                                    <input value="${sp.tenMaGiamGia}" name="tenMaGiamGia"
                                                           id="tenUpdate${sp.id}" class="form-control">

                                                </div>

                                                <div class="form-group">
                                                    <label for="soLuongUpdate${sp.id}">Số
                                                        Lượng <span>*</span></label>

                                                    <input value="${sp.soLuong}" name="soLuong"
                                                           id="soLuongUpdate${sp.id}" class="form-control">

                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="ngayBatDauUpdate${sp.id}">Ngày
                                                        Bắt Đầu <span>*</span></label>
                                                    <input type="date" value="${sp.ngayBatDau}" name="ngayBatDau"
                                                           id="ngayBatDauUpdate${sp.id}" class="form-control">

                                                </div>

                                                <div class="form-group">
                                                    <label for="dieuKienGiamUpdate${sp.id}">Điều
                                                        Kiện Giảm <span>*</span></label>
                                                    <input value="${sp.dieuKienGiam}" name="dieuKienGiam"
                                                           id="dieuKienGiamUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="ngayKetThucUpdate${sp.id}">Ngày
                                                        Kết Thúc <span>*</span></label>
                                                    <input type="date" value="${sp.ngayKetThuc}" name="ngayKetThuc"
                                                           id="ngayKetThucUpdate${sp.id}" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label for="trangThaiUpdate${sp.id}">Trạng
                                                        Thái <span>*</span></label>
                                                    <select name="trangThai" id="trangThaiUpdate${sp.id}"
                                                            class="form-select">
                                                        <option value="true"${sp.trangThai == true ? 'selected' : ''}>
                                                            Hoạt động
                                                        </option>
                                                        <option value="false" ${sp.trangThai == false? 'selected' : ''}>
                                                            Không hoạt động
                                                        </option>
                                                    </select>

                                                </div>
                                            </div>

                                        </div>

                                        <h6 class=" mb-4" style="padding-top: 0px;margin-left: 20px; font-weight: bold">
                                            <i class="fas fa-tags"></i>Khách Hàng Áp Dụng (Bỏ trống để áp dụng cho tất
                                            cả) </h6>

                                        <div class="modal-body table-wrapper" style="margin-top: 0px;padding-top: 0px">
                                            <table class="table"
                                                   style="margin-top: 0px;padding-top: 0px; font-size: 18px">
                                                <thead>
                                                <tr>
                                                    <th scope="col">Mã Khách Hàng</th>
                                                    <th scope="col">Tên Khách Hàng</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">SĐT</th>

                                                    <th scope="col">Chọn</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="customer" items="${listsKhachHang}">
                                                    <tr>
                                                        <th scope="row">${customer.maKhachHang}</th>
                                                        <td>${customer.tenKhachHang}</td>
                                                        <td>${customer.email}</td>
                                                        <td>${customer.sdt}</td>

                                                        <td>
                                                            <input type="checkbox" class="form-check-input checkbox-for-${sp.id}" id="lll-${customer.id}-${sp.id}">

                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Thoát
                                            </button>
                                            <button type="submit" id="uploadButton" class="btn btn-primary"
                                                    onclick="updateMaGiamGia(${sp.id})">Lưu
                                            </button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div aria-label="Page navigation example">
            <ul class="pagination">
                <c:forEach begin="1" end="${listColors.totalPages}" varStatus="loop">
                    <li class="page-item">
                        <a class="page-link" href="/ma-giam-gia?page=${loop.begin+loop.count-2}">
                                ${loop.begin+loop.count-1}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

<script>
    var listlh = []; // Khởi tạo mảng JavaScript
    <c:forEach var="customer" items="${listsKhachHang}">
    listlh.push(${customer.id});
    </c:forEach>
    // document.addEventListener("DOMContentLoaded", function() {
    //     var checkbox = document.getElementById("lll");
    //     if (checkbox) {
    //         checkbox.checked = true;
    //     }
    // });



    function getDataKhachHangByMgg(idMgg) {
        $.ajax({
            url: '/ma-giam-gia/get-lishkh-by-mgg',
            type: 'POST',
            data: {
                id: idMgg,
            },
            success: function (response) {
                var customerIds = listlh;
                response.forEach(function (id) {
                    console.log("listnho " + id);
                    var checkbox = document.getElementById("lll-" + id+"-"+idMgg);
                    if (checkbox) {
                        checkbox.checked = true;
                    }
                });
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
                toastr.error("Có lỗi xảy ra");
            }
        });

    }

    function xoaMaGiamGia(id) {
        $.ajax({
            url: '/ma-giam-gia/delete/' + id,
            type: 'POST',
            success: function (response) {
                if (response === "ok") {
                    Swal.fire({
                        title: "Good job!",
                        text: "Xóa Thành Công!",
                        icon: "success"
                    }).then((result) => {
                        if (result.isConfirmed || result.isDismissed) {
                            window.location.reload(); // Load lại trang nếu thành công
                        }
                    });
                } else {
                    Swal.fire({
                        title: "Error!",
                        text: "Lỗi khi xóa khuyến mãi",
                        icon: "error"
                    });
                }
            },
            error: function (xhr, status, error) {
                console.error("Có lỗi xảy ra:", error);
                Swal.fire({
                    title: "Error!",
                    text: "Có lỗi xảy ra khi xóa khuyến mãi",
                    icon: "error"
                });
            }
        });
    }


    function createData() {
        var selectedCustomers = [];
        // Duyệt qua các input checkbox trong bảng
        $("input[type='checkbox'].add-checkbox-for").each(function () {

            // Kiểm tra xem checkbox có được chọn không
            if ($(this).is(":checked")) {
                // Lấy ID của khách hàng từ thuộc tính id của input
                var listId = $(this).attr("id").split("-")[1];
                // Thêm ID của khách hàng vào mảng selectedCustomers
                selectedCustomers.push(listId);

            }
        });
        var maGiamGiaDTO = {
            listId: selectedCustomers,
            maGiamGia: document.getElementById("maGiamGia").value,
            tenMaGiamGia: document.getElementById("tenMaGiamGia").value,
            giaTriGiam: document.getElementById("giaTriGiam").value,
            ngayBatDau: document.getElementById("ngayBatDau").value,
            ngayKetThuc: document.getElementById("ngayKetThuc").value,
            soLuong: document.getElementById("soLuong").value,
            dieuKienGiam: document.getElementById("dieuKienGiam").value,
            moTa: "OK",
            trangThai: 1


        };
        return maGiamGiaDTO;
    }


    function addMaGiamGia() {
        var maGiamGia = document.getElementById("maGiamGia").value;
        var tenMaGiamGia = document.getElementById("tenMaGiamGia").value.trim();
        var giaTriGiam = document.getElementById("giaTriGiam").value;
        var ngayBatDau = document.getElementById("ngayBatDau").value;
        var ngayKetThuc = document.getElementById("ngayKetThuc").value;
        var soLuong = document.getElementById("soLuong").value;
        var dieuKienGiam = document.getElementById("dieuKienGiam").value;
        var moTa = document.getElementById("moTa").value;
        var trangThai = 1;


        if (maGiamGia.trim() === ""
            || tenMaGiamGia.trim() === ""
            || dieuKienGiam.trim() === ""
            || giaTriGiam.trim() === ""
            || soLuong.trim() === ""
            || ngayBatDau.trim() === ""
            || ngayKetThuc.trim() === ""

        ) {
            toastr.error("Vui lòng điền đầy đủ thông tin");
            return false;
        }

        var startDate = new Date(ngayBatDau);
        var endDate = new Date(ngayKetThuc);
        if (startDate >= endDate) {
            toastr.error("Ngày bắt đầu phải trước ngày kết thúc.");
            return false;
        }

        if (parseInt(soLuong) <= 0 || isNaN(parseInt(soLuong))) {
            toastr.error("Số lượng phải lớn hơn 0 và là một số.");
            return false;
        }

        if (parseInt(giaTriGiam) <= 0 || isNaN(parseInt(giaTriGiam))) {
            toastr.error("Giá trị giảm phải lớn hơn 0 và là một số.");
            return false;
        }

        if (parseInt(dieuKienGiam) <= 0 || isNaN(parseInt(dieuKienGiam))) {
            toastr.error("Điều kiện giảm phải lớn hơn 0 và là một số.");
            return false;
        }

        var maGiamGiaDTO = createData();
        $.ajax({
            url: '/ma-giam-gia/add',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(maGiamGiaDTO),
            success: function (response) {


                if (response === "ok") {

                    Swal.fire({
                        title: "Good job!",
                        text: "Thêm Thành Công!",
                        icon: "success"
                    }).then((result) => {
                        if (result.isConfirmed || result.isDismissed) {
                            window.location.reload(); // Load lại trang nếu thành công
                        }
                    });
                } else if (response === "errorMa") {
                    toastr.error("Mã trùng");
                } else if (response === "errorTen") {
                    toastr.error("Trùng Tên");
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
                toastr.error("Có lỗi xảy ra");
            }
        });
    }




    function updateData(id) {
        var trangThai = document.getElementById("trangThaiUpdate" + id).value;

        var selectedCustomers = [];
        // Duyệt qua các input checkbox trong bảng
        $("input[type='checkbox'].checkbox-for-" + id).each(function () {

            // Kiểm tra xem checkbox có được chọn không
            if ($(this).is(":checked")) {
                // Lấy ID của khách hàng từ thuộc tính id của input
                var listId = $(this).attr("id").split("-")[1];
                selectedCustomers.push(listId);

            }
        });
        var maGiamGiaDTO = {
            listId: selectedCustomers,
            maGiamGia: document.getElementById("maUpdate" + id).value,
            tenMaGiamGia: document.getElementById("tenUpdate" + id).value,
            giaTriGiam: document.getElementById("giaTriGiamUpdate" + id).value,
            ngayBatDau: document.getElementById("ngayBatDauUpdate" + id).value,
            ngayKetThuc: document.getElementById("ngayKetThucUpdate" + id).value,
            soLuong: document.getElementById("soLuongUpdate" + id).value,
            dieuKienGiam: document.getElementById("dieuKienGiamUpdate" + id).value,
            moTa: "OK",
            trangThai: trangThai


        };
        return maGiamGiaDTO;
    }

    function updateMaGiamGia(id) {
        var maGiamGia = document.getElementById("maUpdate" + id).value;
        var tenMaGiamGia = document.getElementById("tenUpdate" + id).value;
        var giaTriGiam = document.getElementById("giaTriGiamUpdate" + id).value;
        var ngayBatDau = document.getElementById("ngayBatDauUpdate" + id).value;
        var ngayKetThuc = document.getElementById("ngayKetThucUpdate" + id).value;
        var soLuong = document.getElementById("soLuongUpdate" + id).value;
        var dieuKienGiam = document.getElementById("dieuKienGiamUpdate" + id).value;
        var moTa = "OK";



        if (maGiamGia.trim() === ""
            || tenMaGiamGia.trim() === ""
            || dieuKienGiam.trim() === ""
            || giaTriGiam.trim() === ""
            || soLuong.trim() === ""
            || ngayBatDau.trim() === ""
            || ngayKetThuc.trim() === ""


        ) {
            toastr.error("Vui lòng điền đầy đủ thông tin ");
            return false;
        }
        var startDate = new Date(ngayBatDau);
        var endDate = new Date(ngayKetThuc);
        if (startDate >= endDate) {
            toastr.error("Ngày bắt đầu phải trước ngày kết thúc.");
            return false;
        }
        if (parseInt(soLuong) <= 0 || isNaN(parseInt(soLuong))) {
            toastr.error("Số lượng phải lớn hơn 0 và là một số.");
            return false;
        }

        if (parseInt(giaTriGiam) <= 0 || isNaN(parseInt(giaTriGiam))) {
            toastr.error("Giá trị giảm phải lớn hơn 0 và là một số.");
            return false;
        }

        if (parseInt(dieuKienGiam) <= 0 || isNaN(parseInt(dieuKienGiam))) {
            toastr.error("Điều kiện giảm phải lớn hơn 0 và là một số.");
            return false;
        }
        var maGiamGiaDTO = updateData(id);

        $.ajax({
            url: '/ma-giam-gia/update',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(maGiamGiaDTO),
            success: function (response) {
                if (response === "ok") {
                    Swal.fire({
                        title: "Good job!",
                        text: "Sửa Thành Công!",
                        icon: "success"
                    }).then((result) => {
                        if (result.isConfirmed || result.isDismissed) {
                            window.location.reload(); // Load lại trang nếu thành công
                        }
                    });
                } else if (response === "errorMa") {
                    toastr.error("Mã trùng");
                } else if (response === "errorTen") {
                    toastr.error("Trùng Tên");
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
                toastr.error("Có lỗi xảy ra");
            }
        });

    }








    document.getElementById('trangThaiSelect').addEventListener('change', function () {
        var selectedValue = this.value;
        if (selectedValue !== '') {
            window.location.href = '/ma-giam-gia?trangThai=' + selectedValue;
        } else {
            window.location.href = '/ma-giam-gia';
        }
    });

    window.addEventListener('DOMContentLoaded', function () {
        var urlParams = new URLSearchParams(window.location.search);
        var trangThaiValue = urlParams.get('trangThai');
        if (trangThaiValue !== null) {
            document.getElementById('trangThaiSelect').value = trangThaiValue;
        }
    });
</script>
</body>

</html>

