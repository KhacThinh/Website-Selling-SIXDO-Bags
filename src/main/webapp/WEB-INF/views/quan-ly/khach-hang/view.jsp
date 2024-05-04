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
        #test th,
        #test td {
            font-size: smaller; /* Hoặc bạn có thể sử dụng kích thước chữ mong muốn */
        }
        /* CSS styles */
        #test th {
            border-bottom: 1px #007bff dashed; /* Màu và kiểu của đường vạch ngăn cách */
        }
        /*/////*/
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
<body>
<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>
<div class="container">
    <div class="title text-center pt-5">
        <h2 class="position-relative d-inline-block">QUẢN LÝ KHÁCH HÀNG</h2>
    </div>
    <div class="row">
        <button type="button" class="btn btn-outline-secondary mt-5 rounded-pill" data-bs-toggle="modal"
                data-bs-target="#modalAddKhachHang">
            <i class="bi bi-bag-plus-fill"></i> <span>THÊM KHÁCH HÀNG</span>
        </button>
        <jsp:include page="them-khach-hang.jsp"/>
    </div>
</div>
<div class="container mt-4">
    <div class="row justify-content-between">
        <div class="col-md-4">
            <form action="/khach_hang" class="search-form" method="get">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <select class="form-select" name="trangThai" id="trangThaiSelect">
                            <option value="">Tất Cả</option>
                            <option  value="1">Hoạt động</option>
                            <option value="0">Không hoạt động</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-4">
            <form action="/khach_hang" class="search-form" method="get">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="bi bi-search"></i></span>
                    </div>
                    <input type="text" name="name" value="${nameSearch}" class="form-control" placeholder="Tìm kiếm theo sđt hoặc tên...">
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
                <th scope="col">Tài Khoản</th>
                <th scope="col">Mã Khách Hàng</th>
                <th scope="col">Tên Khách Hàng</th>
                <th scope="col">Giới Tính</th>
                <th scope="col">Ngày Sinh</th>
                <th scope="col">Sdt</th>
                <th scope="col">Email</th>
                <th scope="col">Trạng Thái</th>
                <th scope="col">Khác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listColors.content}" var="sp" varStatus="i">
                <tr  id="record_${sp.id}">
                    <td class="bold">${i.index + 1}</td>
                    <td>${sp.taiKhoan.tenDangNhap}</td>
                    <td>${sp.maKhachHang}</td>
                    <td>${sp.tenKhachHang}</td>
                    <td>${sp.gioiTinh== 1 ? 'Nam' : 'Nữ'}</td>
                    <td>${sp.ngaySinh}</td>
                    <td>${sp.sdt}</td>
                    <td>${sp.email}</td>
                    <td><span class="status ${sp.trangThai == 1 ? 'dangxuly' : 'pending'}">${sp.trangThai == 1 ? 'Hoạt Động' : 'Không Hoạt Động'}</span></td>



                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                                    <%--                            <li>--%>
                                    <%--                            <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modalUpdateKhachHang${sp.id}"><i class="bi bi-pencil"></i> Sửa--%>
                                    <%--                            </button>--%>
                                    <%--                        </li>--%>

<%--                            </li>--%>
<%--                                &lt;%&ndash;                            <a class="dropdown-item delete-color" href="/mau-sac/delete/${sp.id}" ><i class="bi bi-trash3"></i> Xóa</a>&ndash;%&gt;--%>
<%--                            <a class="dropdown-item delete-color" href="#" onclick="xoaKhachHang(${sp.id})"><i class="bi bi-trash3"></i> Xóa</a>--%>
<%--                            <li>--%>
<%--                                <hr class="dropdown-divider">--%>
                            </li>
                            <li>
                                <button type="button" class="dropdown-item btnXemDonHang" data-id="${sp.id}" data-bs-toggle="modal" data-bs-target="#modalThongTinDonHang${sp.id}">
                                    <i class="bi bi-eye"></i> Xem Đơn Hàng
                                </button>
                            </li>
                        </ul>

                        <div class="modal fade" id="modalUpdateKhachHang${sp.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Khách Hàng</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="mb-3 row">
                                                <label for="tenKhachHang" class="col-sm-3 col-form-label">Tên Khách Hàng <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="tenKhachHang" id="tenUpdate${sp.id}" value="${sp.tenKhachHang}">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="gioiTinh" class="col-sm-3 col-form-label">Giới Tính <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <select class="form-select" name="gioiTinh" id="gioiTinhUpdate${sp.id}">
                                                        <option value="1">Nam</option>
                                                        <option value="0">Nữ</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="ngaySinh" class="col-sm-3 col-form-label">Ngày Sinh <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="ngaySinh" type="date" class="form-control" id="ngaySinhUpdate${sp.id}" value="${sp.ngaySinh}">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="sdt" class="col-sm-3 col-form-label">Số Điện Thoại <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="sdt" type="text" class="form-control" id="sdtUpdate${sp.id}" value="${sp.sdt}">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="email" class="col-sm-3 col-form-label">Email <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="email" type="email" class="form-control" id="emailUpdate${sp.id}" value="${sp.email}">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="matKhau" class="col-sm-3 col-form-label">Mật Khẩu <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="matKhau"  class="form-control" id="matKhauUpdate${sp.id}" value="${sp.matKhau}">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="trangThai" class="col-sm-3 col-form-label">Trạng Thái <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <select name="trangThai" class="form-select" id="trangThaiUpdate${sp.id}">
                                                        <option value="1"${sp.trangThai == 1 ? 'selected' : ''}>Hoạt động</option>
                                                        <option value="0"${sp.trangThai == 0 ? 'selected' : ''}>Không hoạt động</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer justify-content-between">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                                        <button type="submit" id="uploadButton" class="btn btn-primary" onclick="updateKhachHang(${sp.id})">Lưu</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--                        Modal xem dơn hàng--%>
                        <div class="modal fade" id="modalThongTinDonHang" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Đơn Hàng</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <table class="table">
                                            <thead class="thead-dark">
                                            <tr>
                                                <th>STT</th>
                                                <th>MÃ HOÁ ĐƠN</th>
                                                <th>TÊN KHÁCH HÀNG</th>
                                                <th>SDT KHÁCH HÀNG</th>
                                                <th>THỜI GIAN TẠO</th>
                                                <th>TỔNG TIỀN</th>
                                                <th>TRẠNG THÁI</th>
                                            </tr>
                                            </thead>
                                            <tbody id="donHangTableBody"></tbody>
                                        </table>
                                    </div>
                                    <div class="modal-footer justify-content-between">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
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
                        <a class="page-link" href="/khach_hang?page=${loop.begin+loop.count-2}">
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


<%--Xem đơn hàng--%>
<script>
    $(document).ready(function () {
        $('.btnXemDonHang').click(function () {
            var idKh = $(this).data('id');

            $.ajax({
                url: '/khach_hang/getHoaDonByKhachHang',
                type: 'GET',
                data: {id: idKh},
                success: function (response) {
                    console.log(response);
                    var tableBody = $('#donHangTableBody');
                    tableBody.empty();
                    if(response.length===0){
                        var noResultRow = "<tr  style='color: #0E4BF1'>";
                        noResultRow += "<td colspan='4'>Chưa có đơn hàng nào...</td>";
                        noResultRow += "</tr>";
                        tableBody.append(noResultRow);
                    }


                    response.forEach(function (donHang, index) {
                        var row = $('<tr></tr>');
                        row.append('<td>' + (index + 1) + '</td>');
                        row.append('<td>' + donHang.maHoaDon + '</td>');
                        row.append('<td>' + donHang.tenNguoiNhan + '</td>');
                        row.append('<td>' + donHang.sdtNguoiNhan + '</td>');
                        row.append('<td>' + donHang.thoiGianTao + '</td>');
                        row.append('<td>' + donHang.tongTien.toLocaleString() + ' đ</td>');
                        var trangThaiString = '';
                        switch (donHang.trangThai) {
                            case 0:
                                trangThaiString = 'Đã Thanh Toán Tại Quầy';
                                break;
                            case 1:
                                trangThaiString = 'Hóa Đơn Tạm';
                                break;
                            case 2:
                                trangThaiString = 'Chưa Xác Nhận';
                                break;
                            case 3:
                                trangThaiString = 'Đã Xác Nhận';
                                break;
                            case 4:
                                trangThaiString = 'Đã Hủy';
                                break;
                            case 5:
                                trangThaiString = 'Đang Giao Hàng';
                                break;
                            case 6:
                                trangThaiString = 'Giao Hàng Thành Công';
                                break;
                            default:
                                trangThaiString = 'Unknown';
                        }
                        row.append('<td >' + trangThaiString + '</td>');
                        tableBody.append(row);


                    });

                    $('#modalThongTinDonHang').modal('show');
                },


                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                }
            });
        });
    });

</script>


<script>

    function xoaKhachHang(id) {
        $.ajax({
            url: '/khach_hang/delete/' + id,
            type: 'POST',
            success: function(response) {
                if (response === "ok") {
                    Swal.fire({
                        title: "Good job!",
                        text: "Thành Công!",
                        icon: "success"
                    }).then((result) => {
                        if (result.isConfirmed || result.isDismissed) {
                            window.location.reload(); // Load lại trang nếu thành công
                        }
                    });
                } else {
                    Swal.fire({
                        title: "Error!",
                        text: "Lỗi khi xóa Khách Hàng",
                        icon: "error"
                    });
                }
            },
            error: function(xhr, status, error) {
                console.error("Có lỗi xảy ra:", error);
                Swal.fire({
                    title: "Error!",
                    text: "Có lỗi xảy ra khi xóa Khách Hàng",
                    icon: "error"
                });
            }
        });
    }

    function addKhachHang() {
        var maKhachHang = document.getElementById("maKhachHang").value.trim();
        var tenKhachHang = document.getElementById("tenKhachHang").value.trim();
        var gioiTinh = document.getElementById("gioiTinh").value;
        var ngaySinh = document.getElementById("ngaySinh").value;
        var sdt = document.getElementById("sdt").value;
        var email = document.getElementById("email").value;
        // var matKhau = document.getElementById("matKhau").value;
        var trangThai = document.getElementById("trangThai").value;
        if (tenKhachHang.trim() === "") {
            toastr.error("Vui lòng điền tên khách hàng ");
            return false;
        }
        if (sdt.trim() === "") {
            toastr.error("Vui lòng điền sđt ");
            return false;
        }

        var phoneNumberRegex = /^(0\d{9}|\+84\d{9}|84\d{9})$/;
        if (!phoneNumberRegex.test(sdt)) {
            toastr.error("Số điện thoại không đúng định dạng");
            return false;
        }


        // Kiểm tra nếu email được nhập vào
        if (email.trim() !== "") {
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                toastr.error("Email không đúng định dạng.");
                return false;
            }
        }

        var dob = new Date(ngaySinh);
        var currentDate = new Date();
        if (dob >= currentDate) {
            toastr.error("Ngày sinh không đúng định dạng.");
            return false;
        }

        $.ajax({
            url: '/khach_hang/checkSDT',
            type: 'GET',
            data: {
                sdt: sdt
            },
            success: function (sdtResponse) {
                if (sdtResponse) {
                    toastr.error("Số điện thoại đã tồn tại.");
                } else {
                    // Kiểm tra nếu email được nhập vào
                    if (email.trim() !== "") {
                        // Tiếp tục kiểm tra email
                        $.ajax({
                            url: '/khach_hang/checkMail',
                            type: 'GET',
                            data: {
                                mail: email // Sửa thành 'email' thay vì 'mail'
                            },
                            success: function (mailResponse) {
                                if (mailResponse) {
                                    toastr.error("Email đã tồn tại.");
                                } else {
                                    // Tiếp tục thêm khách hàng
                                    $.ajax({
                                        url: '/khach_hang/add',
                                        type: 'POST',
                                        data: {
                                            maKhachHang: maKhachHang,
                                            tenKhachHang: tenKhachHang,
                                            gioiTinh: gioiTinh,
                                            ngaySinh: ngaySinh,
                                            sdt: sdt,
                                            email: email,
                                            trangThai: trangThai,
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
                                            toastr.error("Có lỗi xảy ra");
                                        }
                                    });
                                }
                            },
                            error: function (error) {
                                console.error("Có lỗi xảy ra:", error);
                                toastr.error("Đã có lỗi xảy ra khi kiểm tra email.");
                            }
                        });
                    } else {
                        // Nếu không có email, tiếp tục thêm khách hàng mà không cần kiểm tra email
                        $.ajax({
                            url: '/khach_hang/add',
                            type: 'POST',
                            data: {
                                maKhachHang: maKhachHang,
                                tenKhachHang: tenKhachHang,
                                gioiTinh: gioiTinh,
                                ngaySinh: ngaySinh,
                                sdt: sdt,
                                email: email,

                                trangThai: trangThai,
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
                                toastr.error("Khách hàng này đã tồn tại");
                            }
                        });
                    }
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
                toastr.error("Đã có lỗi xảy ra khi kiểm tra số điện thoại.");
            }
        });
    }



    function updateKhachHang(id) {
        var tenKhachHang = document.getElementById("tenUpdate" + id).value.trim();
        var gioiTinh = document.getElementById("gioiTinhUpdate" + id).value;
        var ngaySinh = document.getElementById("ngaySinhUpdate" + id).value;
        var sdt = document.getElementById("sdtUpdate" + id).value;
        var email = document.getElementById("emailUpdate" + id).value;

        var trangThai = document.getElementById("trangThaiUpdate" + id).value;

        if (tenKhachHang.trim() === "" || sdt.trim() === "") {
            toastr.error("Vui lòng điền đầy đủ thông tin ");
            return false;
        }

        var phoneNumberRegex = /^(0\d{9,9})$/;
        if (!phoneNumberRegex.test(sdt)) {
            toastr.error("Số điện thoại không đúng định dạng");
            return false;
        }

        // Kiểm tra định dạng email
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            toastr.error("Email không đúng định dạng.");
            return false;
        }

        // Kiểm tra độ dài mật khẩu


        var dob = new Date(ngaySinh);
        var currentDate = new Date();
        if (dob >= currentDate) {
            toastr.error("Ngày sinh không đúng định dạng");
            return false;
        }

        $.ajax({
            url: '/khach_hang/update',
            type: 'POST',
            data: {
                id: id,
                tenKhachHang: tenKhachHang,
                gioiTinh: gioiTinh,
                ngaySinh: ngaySinh,
                sdt: sdt,
                email: email,

                trangThai: trangThai
            },
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
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
                toastr.error("Có lỗi xảy ra");
            }
        });
    }

    document.getElementById('trangThaiSelect').addEventListener('change', function() {
        var selectedValue = this.value;
        if (selectedValue !== '') {
            window.location.href = '/khach_hang?trangThai=' + selectedValue;
        } else {
            window.location.href = '/khach_hang';
        }
    });

    window.addEventListener('DOMContentLoaded', function() {
        var urlParams = new URLSearchParams(window.location.search);
        var trangThaiValue = urlParams.get('trangThai');
        if (trangThaiValue !== null) {
            document.getElementById('trangThaiSelect').value = trangThaiValue;
        }
    });
</script>
</body>

</html>

