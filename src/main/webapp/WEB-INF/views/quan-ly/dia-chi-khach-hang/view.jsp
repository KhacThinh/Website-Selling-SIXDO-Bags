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
                data-bs-target="#modalAddDiaChiKhachHang">
            <i class="bi bi-plus-square-fill"></i> <span>THÊM ĐỊA CHỈ KHÁCH HÀNG</span>
        </button>
        <jsp:include page="them-dia-chi-khach-hang.jsp"/>
    </div>
</div>
<div class="container mt-4">
    <div class="row justify-content-between">

        <div class="col-md-4">
            <form action="/dia_chi_khach_hang" class="search-form" method="get">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <select class="form-select" name="khachHangId" id="khachHangIdSelect">
                            <option value="">Chọn khách hàng</option>
                            <c:forEach items="${listColors1}" var="khachHang">
                                <option value="${khachHang.id}">${khachHang.tenKhachHang}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-4">
            <form action="/dia_chi_khach_hang" class="search-form" method="get">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <select class="form-select" name="trangThai" id="trangThaiSelect">
                            <option value="">Tất Cả</option>
                            <option  value="true">Hoạt động</option>
                            <option value="false">Không hoạt động</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-4">
            <form action="/dia_chi_khach_hang" class="search-form" method="get">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="bi bi-search"></i></span>
                    </div>
                    <input type="text" name="name" value="${nameSearch}" class="form-control" placeholder="Tìm kiếm theo mã hoặc tên...">
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
                <th scope="col">Khách Hàng</th>
                <th scope="col">Tên Địa Chỉ</th>
                <th scope="col">Mô Tả</th>
                <th scope="col">Trạng Thái</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listColors.content}" var="sp" varStatus="i">
                <tr id="record_${sp.id}">
                    <td class="bold">${i.index + 1}</td>
                    <td>${sp.khachHang.tenKhachHang}</td>
                    <td>${sp.tenDiaChi}</td>
                    <td>${sp.moTa}</td>
                    <td><span class="status ${sp.trangThai == true ? 'dangxuly' : 'pending'}">${sp.trangThai == true ? 'Hoạt Động' : 'Không Hoạt Động'}</span></td>


                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">

                            <li>
                                <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                        data-bs-target="#modalUpdateDCKH${sp.id}"><i class="bi bi-pencil"></i> Sửa
                                </button>
                            <li>
                                <a class="dropdown-item delete-color" href="#" onclick="xoaKhachHang(${sp.id})"><i
                                        class="bi bi-trash3"></i> Xóa</a>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>

                            <%--                        // Modal update--%>

                        <div class="modal fade" id="modalUpdateDCKH${sp.id}" tabindex="-1"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Địa Chỉ Khách
                                            Hàng</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="mb-3 row">
                                                <label for="khachHang" class="col-sm-3 col-form-label">Khách Hàng</label>
                                                <div class="col-sm-9">
                                                    <select id="khachHangUpdate${sp.id}" name="khachHang" class="form-select" disabled>
                                                        <c:forEach items="${listColors1}" var="cv">
                                                            <option value="${cv.id}" ${cv.id==sp.khachHang.id ? 'selected':''}>${cv.tenKhachHang}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="tenDiaChi" class="col-sm-3 col-form-label">Tên Địa Chỉ
                                                    <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="tenDiaChi"
                                                           id="tenUpdate${sp.id}" value="${sp.tenDiaChi}">
                                                </div>
                                            </div>

                                            <div class="mb-3 row">
                                                <label for="moTa" class="col-sm-3 col-form-label">Mô Tả
                                                    <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="moTa" type="text" class="form-control"
                                                           id="moTaUpdate${sp.id}" value="${sp.moTa}">
                                                </div>
                                            </div>


                                            <div class="mb-3 row">
                                                <label for="trangThai" class="col-sm-3 col-form-label">Trạng Thái <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <select name="trangThai" class="form-select"
                                                            id="trangThaiUpdate${sp.id}">
                                                        <option value="true">Hoạt động</option>
                                                        <option value="false">Không hoạt động</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer justify-content-between">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát
                                        </button>
                                        <button type="submit" id="uploadButton" class="btn btn-primary"
                                                onclick="updateDCKH(${sp.id})">Lưu
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
                        <a class="page-link" href="/dia_chi_khach_hang?page=${loop.begin+loop.count-2}">
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
    function xoaKhachHang(id) {
        $.ajax({
            url: '/dia_chi_khach_hang/delete/' + id,
            type: 'POST',
            success: function(response) {
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
            error: function(xhr, status, error) {
                console.error("Có lỗi xảy ra:", error);
                Swal.fire({
                    title: "Error!",
                    text: "Có lỗi xảy ra khi xóa khuyến mãi",
                    icon: "error"
                });
            }
        });

    }

    function addDCKH() {
        var khachHang = document.getElementById("khachHang").value;
        var tenDiaChi = document.getElementById("tenDiaChi").value;
        var moTa = document.getElementById("moTa").value;
        var trangThai = document.getElementById("trangThai").value;
        console.log(khachHang);

        if (
            tenDiaChi.trim() === ""

        ) {
            toastr.error("Vui lòng điền đầy đủ thông tin ");
            return false;
        }
        $.ajax({
            url: '/dia_chi_khach_hang/add',
            type: 'POST',
            data: {
                id: khachHang,
                tenDiaChi: tenDiaChi,
                moTa: moTa,
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

    function updateDCKH(id) {
        var tenDiaChi = document.getElementById("tenUpdate" + id).value;
        var moTa = document.getElementById("moTaUpdate" + id).value;
        var trangThai = document.getElementById("trangThaiUpdate" + id).value;


        if (tenDiaChi.trim() === "" ) {
            toastr.error("Vui lòng điền đầy đủ thông tin cho tên địa chỉ");
            return false;
        }

        $.ajax({
            url: '/dia_chi_khach_hang/update',
            type: 'POST',
            data: {
                id: id,
                tenDiaChi: tenDiaChi,
                moTa: moTa,
                trangThai: trangThai,

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
            window.location.href = '/dia_chi_khach_hang?trangThai=' + selectedValue;
        } else {
            window.location.href = '/dia_chi_khach_hang';
        }
    });

    window.addEventListener('DOMContentLoaded', function() {
        var urlParams = new URLSearchParams(window.location.search);
        var trangThaiValue = urlParams.get('trangThai');
        if (trangThaiValue !== null) {
            document.getElementById('trangThaiSelect').value = trangThaiValue;
        }
    });

    // Thay đổi sự kiện từ 'click' sang 'change'
    document.getElementById('khachHangIdSelect').addEventListener('change', function() {
        var selectedValue = this.value;
        if (selectedValue !== '') {
            // Sử dụng giá trị được chọn cho truy vấn URL thay vì 'chon khach hang'
            window.location.href = '/dia_chi_khach_hang?khachHangId=' + selectedValue;
        } else {
            window.location.href = '/dia_chi_khach_hang';
        }
    });

    // Cập nhật giá trị được chọn khi trang được load
    window.addEventListener('DOMContentLoaded', function() {
        var urlParams = new URLSearchParams(window.location.search);
        var khachHangIdValue = urlParams.get('khachHangId');
        if (khachHangIdValue !== null) {
            document.getElementById('khachHangIdSelect').value = khachHangIdValue;
        }
    });

</script>
</body>

</html>

