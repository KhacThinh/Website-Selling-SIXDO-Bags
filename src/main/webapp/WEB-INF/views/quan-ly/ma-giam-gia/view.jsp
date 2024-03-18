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
        .input-group .form-control {
            height: 100%;
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
            <i class="bi bi-bag-plus-fill"></i> <span>THÊM MÃ GIẢM GIÁ</span>
        </button>
        <jsp:include page="them-ma-giam-gia.jsp"/>
    </div>
</div>
<div class="container mt-4">
    <div class="row justify-content-between">
        <div class="col-md-4">
            <form action="/ma_giam_gia" class="search-form" method="get">
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
            <form action="/ma_giam_gia" class="search-form" method="get">
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
                <th scope="col">Mã Giảm Giá</th>
                <th scope="col">Tên Mã Giảm Giá</th>
                <th scope="col">Mã Giảm Giá</th>
                <th scope="col">Ngày Bắt Đầu</th>
                <th scope="col">Ngày Kết Thúc</th>
                <th scope="col">Số Lượng</th>
                <th scope="col">Điều Kiện Giảm</th>
                <th scope="col">Mô Tả</th>
                <th scope="col">Trạng Thái</th>
                <th scope="col">Khác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listColors.content}" var="sp" varStatus="i">
                <tr id="record_${sp.id}">
                    <td>${i.index + 1}</td>
                    <td>${sp.maGiamGia}</td>
                    <td>${sp.tenMaGiamGia}</td>
                    <td>${sp.giaTriGiam}</td>
                    <td>${sp.ngayBatDau}</td>
                    <td>${sp.ngayKetThuc}</td>
                    <td>${sp.soLuong}</td>
                    <td>${sp.dieuKienGiam}</td>
                    <td>${sp.moTa}</td>
                    <td>${sp.trangThai == true ? 'Hoạt Động' : 'Không Hoạt Động'}</td>


                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                            <li><button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modalUpdateMGG${sp.id}"><i class="bi bi-pencil"></i> Sửa
                        </button>
                        </li>

                            </li>
                                <%--                            <a class="dropdown-item delete-color" href="/mau-sac/delete/${sp.id}" ><i class="bi bi-trash3"></i> Xóa</a>--%>
                            <a class="dropdown-item delete-color" href="#" onclick="xoaMaGiamGia(${sp.id})"><i class="bi bi-trash3"></i> Xóa</a>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>






                        <div class="modal fade" id="modalUpdateMGG${sp.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Chương Trình Khuyến Mãi</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="mb-3 row">
                                                <label for="maUpdate${sp.id}" class="col-sm-3 col-form-label" >Mã Giảm Giá <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input disabled value="${sp.maGiamGia}" name="maGiamGia" id="maUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="tenUpdate${sp.id}" class="col-sm-3 col-form-label">Tên Mã Giảm Giá <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input value="${sp.tenMaGiamGia}" name="tenMaGiamGia" id="tenUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="giaTriGiamUpdate${sp.id}" class="col-sm-3 col-form-label">Giá Trị Giảm <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input value="${sp.giaTriGiam}" name="giaTriGiam" id="giaTriGiamUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="ngayBatDauUpdate${sp.id}" class="col-sm-3 col-form-label">Ngày Bắt Đầu <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input type="date" value="${sp.ngayBatDau}" name="ngayBatDau" id="ngayBatDauUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="ngayKetThucUpdate${sp.id}" class="col-sm-3 col-form-label">Ngày Kết Thúc <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input type="date" value="${sp.ngayKetThuc}" name="ngayKetThuc" id="ngayKetThucUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="soLuongUpdate${sp.id}" class="col-sm-3 col-form-label">Số Lượng <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input value="${sp.soLuong}" name="soLuong" id="soLuongUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="dieuKienGiamUpdate${sp.id}" class="col-sm-3 col-form-label">Điều Kiện Giảm <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input value="${sp.dieuKienGiam}" name="dieuKienGiam" id="dieuKienGiamUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="moTaUpdate${sp.id}" class="col-sm-3 col-form-label">Mô Tả <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input value="${sp.moTa}" name="moTa" id="moTaUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="trangThaiUpdate${sp.id}" class="col-sm-3 col-form-label">Trạng Thái <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <select name="trangThai" id="trangThaiUpdate${sp.id}" class="form-select">
                                                        <option value="true"${sp.trangThai == true ? 'selected' : ''}>Hoạt động</option>
                                                        <option value="false" ${sp.trangThai == false? 'selected' : ''}>Không hoạt động</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer justify-content-between">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                                        <button type="submit" id="uploadButton" class="btn btn-primary" onclick="updateMaGiamGia(${sp.id})">Lưu</button>
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
                        <a class="page-link" href="/ma_giam_gia?page=${loop.begin+loop.count-2}">
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
        function xoaMaGiamGia(id) {
            $.ajax({
                url: '/ma_giam_gia/delete/' + id,
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



    function addMaGiamGia() {
        var maGiamGia = document.getElementById("maGiamGia").value;
        var tenMaGiamGia = document.getElementById("tenMaGiamGia").value;
        var giaTriGiam = document.getElementById("giaTriGiam").value;
        var ngayBatDau = document.getElementById("ngayBatDau").value;
        var ngayKetThuc = document.getElementById("ngayKetThuc").value;
        var soLuong = document.getElementById("soLuong").value;
        var dieuKienGiam = document.getElementById("dieuKienGiam").value;
        var moTa = document.getElementById("moTa").value;
        var trangThai = document.getElementById("trangThai").value;


        if (   maGiamGia.trim() === ""
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

        $.ajax({
            url: '/ma_giam_gia/add',
            type: 'POST',
            data: {
                maGiamGia: maGiamGia,
                tenMaGiamGia: tenMaGiamGia,
                giaTriGiam: giaTriGiam,
                ngayBatDau: ngayBatDau,
                ngayKetThuc: ngayKetThuc,
                soLuong: soLuong,
                dieuKienGiam: dieuKienGiam,
                moTa: moTa,
                trangThai: trangThai
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



    function updateMaGiamGia(id) {
        var maGiamGia = document.getElementById("maUpdate" + id).value;
        var tenMaGiamGia = document.getElementById("tenUpdate" + id).value;
        var giaTriGiam = document.getElementById("giaTriGiamUpdate" + id).value;
        var ngayBatDau = document.getElementById("ngayBatDauUpdate" + id).value;
        var ngayKetThuc = document.getElementById("ngayKetThucUpdate" + id).value;
        var soLuong = document.getElementById("soLuongUpdate" + id).value;
        var dieuKienGiam = document.getElementById("dieuKienGiamUpdate" + id).value;
        var moTa = document.getElementById("moTaUpdate" + id).value;
        var trangThai = document.getElementById("trangThaiUpdate" + id).value;


        if (   maGiamGia.trim() === ""
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
        $.ajax({
            url: '/ma_giam_gia/update',
            type: 'POST',
            data: {
                id: id,
                maGiamGia: maGiamGia,
                tenMaGiamGia: tenMaGiamGia,
                giaTriGiam: giaTriGiam,
                ngayBatDau: ngayBatDau,
                ngayKetThuc: ngayKetThuc,
                soLuong: soLuong,
                dieuKienGiam: dieuKienGiam,
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

        document.getElementById('trangThaiSelect').addEventListener('change', function() {
            var selectedValue = this.value;
            if (selectedValue !== '') {
                window.location.href = '/ma_giam_gia?trangThai=' + selectedValue;
            } else {
                window.location.href = '/ma_giam_gia';
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

