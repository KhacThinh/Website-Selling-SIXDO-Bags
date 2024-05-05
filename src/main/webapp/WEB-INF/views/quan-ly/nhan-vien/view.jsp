<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        /* CSS styles */
        #test th,
        #test td {
            font-size: smaller; /* Hoặc bạn có thể sử dụng kích thước chữ mong muốn */
        }

        /* CSS styles */
        #test th {
            border-bottom: 1px #007bff dashed; /* Màu và kiểu của đường vạch ngăn cách */
        }

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

        .form-select1 {
            /*background-color: #fb5231;*/
            color: black;
            box-shadow: 0 2px 0 rgba(255, 88, 5, 0.06);
            font-weight: bold;
            height: 45px;
            border-radius: 10px;
        }

        .mt-4 {
            border-radius: 10px;
        }

        th:not(:nth-child(14)) {
            /*background-color: #FF6600;*/
            height: 40px;
            vertical-align: middle;

        }

        td:not(:nth-child(14)) {
            height: 60px;
            vertical-align: middle;
        }

        .containerAll {
            /*background-color: #EEEEEE;*/
        }

        .table1 {
            border-radius: 20px;

        }


        .status.pending {
            padding: 2px 4px;
            background: red;
            color: var(--white);
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
        }

        .status.dangxuly {
            padding: 2px 4px;
            background: #0b3cc1;
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
<body class="containerAll">
<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>
<div class="container">
    <div class="title text-center pt-5">
        <h2 class="position-relative d-inline-block">QUẢN LÝ NHÂN VIÊN</h2>
    </div>
    <div class="row">
        <button type="button" class="btn btn-outline-secondary mt-5 rounded-pill" data-bs-toggle="modal"
                data-bs-target="#modalAddNhanVien">
            <i class="bi bi-plus-square-fill"></i> <span>THÊM NHÂN VIÊN</span>
        </button>
        <jsp:include page="them-nhan-vien.jsp"/>
    </div>
</div>
<div class="container mt-4">
    <div class="row justify-content-between">
        <div class="col-md-4">
            <form action="/nhan-vien" class="search-form" method="get">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <select class="form-select1" name="chucVuId" id="chucVuIdSelect">
                            <option value="">Chức Vụ</option>
                            <c:forEach items="${listColors2}" var="khachHang">
                                <option value="${khachHang.id}">${khachHang.tenChucVu}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-4">
            <form action="/nhan-vien" class="search-form" method="get">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <select class="form-select1" name="trangThai" id="trangThaiSelect">
                            <option value="">Tất Cả</option>
                            <option value="1">Hoạt động</option>
                            <option value="0">Không hoạt động</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-4">
            <form action="/nhan-vien" class="search-form" method="get">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="bi bi-search"></i></span>
                    </div>
                    <input type="text" name="name" value="${nameSearch}" class="form-control"
                           placeholder="Tìm kiếm theo tên hoặc sdt...">
                    <%--                    <div class="input-group-append">--%>
                    <%--                        <button class="btn btn-outline-secondary" type="submit">Tìm kiếm</button>--%>
                    <%--                    </div>--%>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="container">
    <div id="test" class="table1">
        <table class="table table-sm table-hover table-striped mb-5">
            <thead>
            <tr>
                <th scope="col">Stt</th>
                <th scope="col">Chức Vụ</th>
                <th scope="col">Tên Đăng Nhập</th>
                <th scope="col">Mã</th>
                <th scope="col">Họ tên</th>
<%--                <th scope="col">Ngày Sinh</th>--%>
                <th scope="col">SDT</th>
                <%--                <th scope="col">EMAIL</th>--%>
                <%--                <th scope="col">Mật Khẩu</th>--%>
                <th scope="col">Quê Quán</th>
                <th scope="col">CCCD</th>
                <th scope="col">THỜI GIAN VÀO LÀM</th>
                <%--                <th scope="col">OFF</th>--%>
                <th scope="col">Trạng Thái</th>
                <th scope="col">Khác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listColors.content}" var="sp" varStatus="i">
                <tr id="record_${sp.id}">
                    <td class="bold">${i.index + 1 }</td>
                    <td>${sp.chucVu.tenChucVu}</td>
                    <td>${sp.taiKhoan.tenDangNhap}</td>
                    <td>${sp.maNhanVien}</td>
                    <td>${sp.hoTen}</td>

                    <td>${sp.sdt}</td>
                        <%--                    <td>${sp.email}</td>--%>
                        <%--                    <td>${sp.matKhau}</td>--%>
                    <td>${sp.queQuan}</td>
                    <td>${sp.cccd}</td>
                    <td>${sp.thoiGianVao == '1900-01-01' ? ' ':  sp.thoiGianVao }</td>
                        <%--                    <td>${sp.thoiGianRa == '1900-01-01' ? ' ':  sp.thoiGianRa  }</td>--%>
                    <td><span
                            class="status ${sp.trangThai == 1 ? 'dangxuly' : 'pending'}">${sp.trangThai == 1 ? 'Hoạt Động' : 'Không Hoạt Động'}</span>
                    </td>


                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                            <li>
                                <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                        data-bs-target="#modalUpdateNhanVien${sp.id}"><i class="bi bi-pencil"></i> Sửa
                                </button>
                            </li>

                            </li>
                                <%--                            <a class="dropdown-item delete-color" href="/mau-sac/delete/${sp.id}" ><i class="bi bi-trash3"></i> Xóa</a>--%>
                            <a class="dropdown-item delete-color" href="#" onclick="xoaNhanVien(${sp.id})"><i
                                    class="bi bi-trash3"></i> Xóa</a>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>


                        <div class="modal fade" id="modalUpdateNhanVien${sp.id}" tabindex="-1"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title">Thông Tin Nhân Viên</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label for="chucVu" class="form-label">Chức Vụ</label>
                                                    <select id="chucVuUpdate${sp.id}" name="chucVu" class="form-select">
                                                        <c:forEach items="${listColors2}" var="cv">
                                                            <option value="${cv.id}" ${cv.id==sp.chucVu.id ? 'selected':''}>${cv.tenChucVu}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="maNhanVien" class="form-label">Mã Nhân Viên</label>
                                                    <input id="maUpdate${sp.id}" class="form-control"
                                                           placeholder="Nhập mã nhân viên" value="${sp.maNhanVien}"
                                                           readonly/>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="hoTen" class="form-label">Họ Tên</label>
                                                    <input id="tenUpdate${sp.id}" class="form-control"
                                                           placeholder="Nhập họ tên" value="${sp.hoTen}"/>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="gioiTinh" class="form-label">Giới Tính</label>
                                                    <select id="gioiTinhUpdate${sp.id}" name="gioiTinh"
                                                            class="form-select">
                                                        <option value="1" ${sp.gioiTinh == 1 ? 'selected' : ''}>Nam
                                                        </option>
                                                        <option value="0" ${sp.gioiTinh == 0 ? 'selected' : ''}>Nữ
                                                        </option>
                                                    </select>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="ngaySinh" class="form-label">Ngày Sinh</label>
                                                        <input type="date" id="ngaySinhUpdate${sp.id}"
                                                               class="form-control" value="${sp.ngaySinh}"/>
                                                    </div>
                                                    <div class="col">
                                                        <label for="sdt" class="form-label">SDT</label>
                                                        <input id="sdtUpdate${sp.id}" class="form-control"
                                                               placeholder="Nhập số điện thoại" value="${sp.sdt}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label for="email" class="form-label">Email</label>
                                                    <input id="emailUpdate${sp.id}" class="form-control"
                                                           placeholder="Nhập địa chỉ email" value="${sp.email}"
                                                    />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="matKhau" class="form-label">Mật Khẩu</label>
                                                    <input id="matKhauUpdate${sp.id}" type="password" class="form-control"
                                                           placeholder="Nhập mật khẩu" value="${sp.matKhau}"/>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="cccd" class="form-label">Số Căn Cước</label>
                                                        <input id="cccdUpdate${sp.id}" class="form-control"
                                                               placeholder="Nhập số căn cước" value="${sp.cccd}" readonly/>
                                                    </div>
                                                    <div class="col">
                                                        <label for="queQuan" class="form-label">Quê Quán</label>
                                                        <input id="queQuanUpdate${sp.id}" class="form-control"
                                                               placeholder="Nhập quê quán" value="${sp.queQuan}"/>
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <label for="thoiGianVao" class="form-label">Thời Gian Vào
                                                            Làm</label>
                                                        <input type="date" id="thoiGianVaoUpdate${sp.id}"
                                                               class="form-control" value="${sp.thoiGianVao}"/>
                                                    </div>
                                                        <%--                                                    <div class="col">--%>
                                                        <%--                                                        <label for="thoiGianRa" class="form-label">Thời Gian Ra--%>
                                                        <%--                                                            Làm</label>--%>
                                                        <%--                                                        <input type="date" id="thoiGianRaUpdate${sp.id}"--%>
                                                        <%--                                                               class="form-control" value="${sp.thoiGianRa}"/>--%>
                                                        <%--                                                    </div>--%>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="trangThai" class="form-label">Trạng Thái</label>
                                                    <select id="trangThaiUpdate${sp.id}" name="trangThai"
                                                            class="form-select">
                                                        <option value="1" ${sp.trangThai == 1 ? 'selected' : ''}>Hoạt
                                                            Động
                                                        </option>
                                                        <!-- <option value="0">Không Hoạt Động</option> -->
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer justify-content-between">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát
                                        </button>
                                        <button type="submit" class="btn btn-primary" id="uploadButton"
                                                onclick="updateNhanVien(${sp.id})">Lưu
                                        </button>
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
                        <a class="page-link" href="/nhan-vien?page=${loop.begin+loop.count-2}">
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
    function xoaNhanVien(id) {
        $.ajax({
            url: '/nhan-vien/delete/' + id,
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


    function addNhanVien() {
        var maNhanVien = document.getElementById("maNhanVien").value.trim();
        var hoTen = document.getElementById("hoTen").value.trim();
        var ngaySinh = document.getElementById("ngaySinh").value;
        var sdt = document.getElementById("sdt").value;
        var email = document.getElementById("email").value;
        var matKhau = document.getElementById("matKhau").value;
        var queQuan = document.getElementById("queQuan").value;
        var cccd = document.getElementById("cccd").value;
        var thoiGianVao = document.getElementById("thoiGianVao").value;
        var gioiTinh = document.getElementById("gioiTinh").value;
        var trangThai = document.getElementById("trangThai").value;
        var chucVu = document.getElementById("chucVu").value;

        if (hoTen.trim() === "") {
            toastr.error("Vui lòng điền họ tên nhân viên ");
            return false;
        }
        if (sdt.trim() === "") {
            toastr.error("Vui lòng điền số điện thoại");
            return false;
        }
        if (email.trim() === "") {
            toastr.error("Vui lòng điền email ");
            return false;
        }
        if (cccd.trim() === "") {
            toastr.error("Vui lòng điền thông tin căn cước ");
            return false;
        }
        if (matKhau.trim() === "") {
            toastr.error("Vui lòng không bỏ trống mật khẩu ");
            return false;
        }
        var phoneNumberRegex = /^(0\d{9}|\+84\d{9}|84\d{9})$/;
        if (!phoneNumberRegex.test(sdt)) {
            toastr.error("Số điện thoại không đúng định dạng");
            return false;
        }

        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            toastr.error("Email không đúng định dạng.");
            return false;
        }


        if (matKhau.trim().length < 6) {
            toastr.error("Mật khẩu phải có ít nhất 6 kí tự.");
            return false;

        }

        var cmndRegex = /^\d{12}$/;
        if (!cmndRegex.test(cccd)) {
            toastr.error("Số căn cước bạn nhập không hợp lệ ");
            return false;
        }

        var dob = new Date(ngaySinh);
        var currentDate = new Date();
        var minAgeDate = new Date();
        minAgeDate.setFullYear(minAgeDate.getFullYear() - 16);
        if (dob >= minAgeDate) {
            toastr.error("Năm sinh không phù hợp");
            return false;
        }

        var selectedDate = new Date(thoiGianVao);
        if (selectedDate >= currentDate) {
            toastr.error("Thời gian vào làm không thể sau ngày hiện tại.");
            return false;
        }
        $.ajax({
            url: '/nhan-vien/checkSDT',
            type: 'GET',
            data: {
                sdt: sdt
            },
            success: function (sdtResponse) {
                if (sdtResponse) {
                    toastr.error("Số điện thoại đã tồn tại.");
                } else {
                    // Tiếp tục kiểm tra số CCCD
                    $.ajax({
                        url: '/nhan-vien/checkCCCD',
                        type: 'GET',
                        data: {
                            cccd: cccd
                        },
                        success: function (cccdResponse) {
                            if (cccdResponse) {
                                toastr.error("Số CCCD đã tồn tại.");
                            } else {
                                // Tiếp tục kiểm tra email
                                $.ajax({
                                    url: '/nhan-vien/checkMail',
                                    type: 'GET',
                                    data: {
                                        email: email
                                    },
                                    success: function (emailResponse) {
                                        if (emailResponse) {
                                            toastr.error("Email đã tồn tại.");
                                        } else {
                                            // Tiếp tục thêm nhân viên
                                            $.ajax({
                                                url: '/nhan-vien/add',
                                                type: 'POST',
                                                data: {
                                                    id: chucVu,
                                                    maNhanVien: maNhanVien,
                                                    hoTen: hoTen,
                                                    gioiTinh: gioiTinh,
                                                    ngaySinh: ngaySinh,
                                                    sdt: sdt,
                                                    email: email,
                                                    matKhau: matKhau,
                                                    queQuan: queQuan,
                                                    cccd: cccd,
                                                    thoiGianVao: thoiGianVao,
                                                    trangThai: trangThai,
                                                    idCv: chucVu
                                                },
                                                success: function (response) {
                                                    if (response === "ok") {
                                                        Swal.fire({
                                                            title: "Good job!",
                                                            text: "Thêm Thành Công!",
                                                            icon: "success"
                                                        }).then((result) => {
                                                            if (result.isConfirmed || result.isDismissed) {
                                                                window.location.reload();
                                                            }
                                                        });
                                                    } else if (response === "errorMa") {
                                                        toastr.error("Mã trùng");
                                                    }
                                                },
                                                error: function (error) {
                                                    console.error("Có lỗi xảy ra:", error);
                                                    toastr.error("Có lỗi khi thêm nhân viên");
                                                }
                                            });
                                        }
                                    },
                                    error: function (error) {
                                        console.error("Có lỗi xảy ra:", error);
                                        toastr.error("Đã có lỗi xảy ra khi kiểm tra email.");
                                    }
                                });
                            }
                        },
                        error: function (error) {
                            console.error("Có lỗi xảy ra:", error);
                            toastr.error("Đã có lỗi xảy ra khi kiểm tra số CCCD.");
                        }
                    });
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
                toastr.error("Đã có lỗi xảy ra khi kiểm tra số điện thoại.");
            }
        });
    }


    function updateNhanVien(id) {

        var maNhanVien = document.getElementById("maUpdate" + id).value.trim();
        var hoTen = document.getElementById("tenUpdate" + id).value.trim();
        var gioiTinh = document.getElementById("gioiTinhUpdate" + id).value;
        var ngaySinh = document.getElementById("ngaySinhUpdate" + id).value;
        var sdt = document.getElementById("sdtUpdate" + id).value;
        var email = document.getElementById("emailUpdate" + id).value;
        var matKhau = document.getElementById("matKhauUpdate" + id).value;
        var cccd = document.getElementById("cccdUpdate" + id).value;
        var queQuan = document.getElementById("queQuanUpdate" + id).value;
        var thoiGianVao = document.getElementById("thoiGianVaoUpdate" + id).value;
        var trangThai = document.getElementById("trangThaiUpdate" + id).value;
        var chucVu = document.getElementById("chucVuUpdate" + id).value;

        if (hoTen.trim() === "") {
            toastr.error("Vui lòng điền họ tên nhân viên ");
            return false;
        }
        if (sdt.trim() === "") {
            toastr.error("Vui lòng điền số điện thoại");
            return false;
        }
        if (email.trim() === "") {
            toastr.error("Vui lòng điền email ");
            return false;
        }
        // if (cccd.trim() === "") {
        //     toastr.error("Vui lòng điền thông tin căn cước ");
        //     return false;
        // }


        var phoneNumberRegex = /^(0\d{9}|\+84\d{9}|84\d{9})$/;
        if (!phoneNumberRegex.test(sdt)) {
            toastr.error("Số điện thoại không đúng định dạng");
            return false;
        }
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            toastr.error("Email không đúng định dạng.");
            return false;
        }
        if (matKhau.trim() !== "") {
            if (matKhau.trim().length < 6) {
                toastr.error("Mật khẩu phải có ít nhất 6 kí tự.");
                return false;
            }
        }

        // var cmndRegex = /^\d{12}$/; // Biểu thức chính quy để kiểm tra số căn cước có 12 chữ số
        // if (!cmndRegex.test(cccd)) {
        //     toastr.error("Số căn cước bạn nhập không hợp lệ ");
        //     return false;
        // }
        var dob = new Date(ngaySinh);
        var currentDate = new Date();
        var minAgeDate = new Date();
        minAgeDate.setFullYear(minAgeDate.getFullYear() - 16); // Ngày hiện tại trừ 16 năm
        if (cccd.trim() !== "") {
            if (dob >= minAgeDate) {
                toastr.error("Năm sinh không phù hợp");
                return false;
            }
        }

        var currentDate = new Date();
        var selectedDate = new Date(thoiGianVao);
        if (thoiGianVao.trim() !== "") {
            if (selectedDate >= currentDate) {
                toastr.error("Thời gian vào làm không thể sau ngày hiện tại.");
                return false;
            }
        }

        $.ajax({
                url: '/nhan-vien/checkSDT-update',
                type: 'GET',
                data: {
                    sdt: sdt,
                    idNv: id
                },
                success: function (sdtResponse) {
                    if (sdtResponse) {
                        toastr.error("Số điện thoại đã tồn tại.");
                    } else {
                        // Tiếp tục kiểm tra email
                        $.ajax({
                            url: '/nhan-vien/checkMail-update',
                            type: 'GET',
                            data: {
                                email: email,
                                idNv: id
                            },
                            success: function (emailResponse) {
                                if (emailResponse) {
                                    toastr.error("Email đã tồn tại.");
                                } else {
                                    // Tiếp tục thêm nhân viên
                                    $.ajax({
                                        url: '/nhan-vien/update',
                                        type: 'POST',
                                        data: {
                                            id: id,
                                            maNhanVien: maNhanVien,
                                            hoTen: hoTen,
                                            gioiTinh: gioiTinh,
                                            ngaySinh: ngaySinh,
                                            sdt: sdt,
                                            email: email,
                                            matKhau: matKhau,
                                            queQuan: queQuan,
                                            cccd: cccd,
                                            thoiGianVao: thoiGianVao,
                                            trangThai: trangThai,
                                            idCV: chucVu
                                        },
                                        success: function (response) {
                                            if (response === "ok") {
                                                Swal.fire({
                                                    title: "Good job!",
                                                    text: "Sửa Thành Công!",
                                                    icon: "success"
                                                }).then((result) => {
                                                    if (result.isConfirmed || result.isDismissed) {
                                                        window.location.reload();
                                                    }
                                                });
                                            } else if (response === "errorMa") {
                                                toastr.error("Mã trùng");
                                            }
                                        },
                                        error: function (error) {
                                            console.error("Có lỗi xảy ra:", error);
                                            toastr.error("Có lỗi khi thêm nhân viên");
                                        }
                                    });
                                }
                            },
                            error: function (error) {
                                console.error("Có lỗi xảy ra:", error);
                                toastr.error("Đã có lỗi xảy ra khi kiểm tra email.");
                            }
                        });
                    }


                }
            },


            function (error) {
                console.error("Có lỗi xảy ra:", error);
                toastr.error("Đã có lỗi xảy ra khi kiểm tra số điện thoại.");
            }
        )
        ;
    }

    function fetchGeoLocation() {
        fetch('/getGeoLocation')
            .then(response => response.json())
            .then(data => {
                document.getElementById('queQuanUpdate${sp.id}').value = data.city; // Assuming city is the relevant field
            })
            .catch(error => console.error('Error fetching geolocation data:', error));
    }

    window.onload = function () {
        fetchGeoLocation();
    };


    document.getElementById('trangThaiSelect').addEventListener('change', function () {
        var selectedValue = this.value;
        if (selectedValue !== '') {
            window.location.href = '/nhan-vien?trangThai=' + selectedValue;
        } else {
            window.location.href = '/nhan-vien';
        }
    });

    window.addEventListener('DOMContentLoaded', function () {
        var urlParams = new URLSearchParams(window.location.search);
        var trangThaiValue = urlParams.get('trangThai');
        if (trangThaiValue !== null) {
            document.getElementById('trangThaiSelect').value = trangThaiValue;
        }
    });

    // Thay đổi sự kiện từ 'click' sang 'change'
    document.getElementById('chucVuIdSelect').addEventListener('change', function () {
        var selectedValue = this.value;
        if (selectedValue !== '') {
            // Sử dụng giá trị được chọn cho truy vấn URL thay vì 'chon khach hang'
            window.location.href = '/nhan-vien?chucVuId=' + selectedValue;
        } else {
            window.location.href = '/nhan-vien';
        }
    });

    // Cập nhật giá trị được chọn khi trang được load
    window.addEventListener('DOMContentLoaded', function () {
        var urlParams = new URLSearchParams(window.location.search);
        var khachHangIdValue = urlParams.get('chucVuId');
        if (khachHangIdValue !== null) {
            document.getElementById('chucVuIdSelect').value = khachHangIdValue;
        }
    });

</script>
</body>
</html>

