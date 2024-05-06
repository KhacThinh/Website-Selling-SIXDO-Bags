<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>QUẢN LÝ</title>
    <!-- Bootstrap CSS -->
    <link rel="Website Icon" type="png" href="../static/images/icon/LOGOSIXDO.png">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style type="text/css">
        #test {
            width: auto;
            height: 400px;
            overflow-x: hidden;
            overflow-y: auto;
            position: relative; /* Thiết lập vị trí tương đối */
        }

        /* Cố định thead */
        #test thead {
            position: sticky;
            top: 0;
            background-color: #fff; /* Để thêm một nền trắng dưới thead */
            z-index: 1; /* Đặt z-index để thead hiển thị trên top */
        }

        /* Thêm một padding-top cho tbody để giữ cho nội dung không bị che khuất bởi thead */
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

        .required {
            color: red;
            margin-left: 5px;
        }

        /*.colDM {*/
        /*    margin-left: 100px;*/
        /*    */
        /*}*/

        #idDoiTuongSuDung {
            width: 400px;
        }


        .modal-body1 {
            display: flex;
        }

        .form-container1 {
            flex: 1;
            padding-right: 20px; /* Khoảng cách giữa form và table */
        }

        .table-container1 {
            flex: 1;
            overflow-y: auto; /* Kích hoạt thanh cuộn khi nội dung vượt quá chiều cao */
            max-height: 300px; /* Đặt chiều cao tối đa cho bảng */
        }

        @media (max-width: 768px) {
            /* Đảo chiều của cả form và table khi trên thiết bị có độ rộng nhỏ hơn hoặc bằng 768px */
            .modal-body1 {
                flex-direction: column;
            }

            .form-container1, .table-container1 {
                width: 100%; /* Chiếm toàn bộ chiều rộng */
                padding-right: 0; /* Xóa khoảng cách */
            }
        }

        .formcon {
            width: 700px;
            margin-left: 250px;
        }

        .table-container1 th {
            font-size: 12px; /* Đặt kích thước font chữ cho tiêu đề */
            background-color: #f2f2f2; /* Màu nền của tiêu đề */
        }

        /* Nếu bạn muốn đặt kích thước font chữ cho các ô <td> luôn giữ nguyên */
        .table-container1 td {
            font-size: 12px; /* Đặt kích thước font chữ cho ô */
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

    <!-- Bootstrap JS (Tùy chọn) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <!-- Link JavaScript của Bootstrap (cần thiết cho một số tính năng của Bootstrap) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
            integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
            crossorigin="anonymous"></script>
</head>

<body>
<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>
<div class="container">
    <div class="title text-center pt-5">
        <h2 class="position-relative d-inline-block">QUẢN LÝ SẢN PHẨM</h2>
    </div>
    <div class="row">
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-outline-secondary mt-5 rounded-pill" data-bs-toggle="modal"
                data-bs-target="#exampleModal">
            <i class="bi bi-bag-plus-fill"></i> <span>THÊM SẢN PHẨM</span>
        </button>


        <jsp:include page="./them-san-pham-modal.jsp"/>
    </div>
</div>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-7 mb-3">
            <form action="/san-pham/filter" class="filter-form" method="post">
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <select name="tenChatLieu" class="form-select" name="category">
                            <option value="">Chọn Chất Liệu</option>
                            <c:forEach items="${tenChatLieuSelects}" var="cl">
                                <option value="${cl}" ${tenChatLieuSelect eq cl ? 'selected' : ''}>${cl}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-3 mb-3">
                        <select name="tenThuongHieu" class="form-select" name="category">
                            <option value="">Chọn thương hiệu</option>
                            <c:forEach items="${tenThuongHieuSelects}" var="th">
                                <option value="${th}" ${tenThuongHieuSelect eq th ? 'selected' : ''}>${th}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-3 mb-3">
                        <select name="trangThai" class="form-select">
                            <option value="true" ${trangThaiSelect ? 'selected' : ''}>Đang Bán</option>
                            <option value="false" ${!trangThaiSelect ? 'selected' : ''}>Ngừng Bán</option>
                        </select>
                    </div>
                    <div class="col-md-3 mb-3">
                        <button type="submit" class="btn btn-primary">Lọc</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-5 mb-3">
            <form action="/san-pham" class="search-form" method="get">
                <div class="input-group">
                    <input type="text" name="name" value="${nameSearch}" class="form-control"
                           placeholder="Tìm kiếm theo mã hoặc tên...">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit">Tìm kiếm</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="container">
    <div id="test">
        <table class="table table-hover table-striped mb-5">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">MÃ</th>
                <th scope="col">TÊN</th>
                <th scope="col">KÍCH THƯỚC</th>
                <th scope="col">KHỐI LƯỢNG(gram)</th>
                <th scope="col">CHẤT LIỆU</th>
                <th scope="col">XUẤT XỨ</th>
                <th scope="col">THƯƠNG HIỆU</th>
                <th scope="col">HOẠT ĐỘNG</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sanPhams}" var="sp" varStatus="i">
                <tr>
                    <th scope="col">${sp.id}</th>
                    <td>${sp.maSanPham}</td>
                    <td>${sp.tenSanPham}</td>
                    <td>${sp.kichThuoc}</td>
                    <fmt:formatNumber pattern="#,###" value="${sp.khoiLuong}"
                                      var="khoiLuong"></fmt:formatNumber>
                    <td>${khoiLuong}</td>
                    <td>${sp.chatLieu}</td>
                    <td>${sp.xuatXu}</td>
                    <td>${sp.thuongHieu.ten}</td>
                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>

                                <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal${i.index}">
                                    <i class="bi bi-exclamation-circle"></i> Thông tin</a>
                                </button>
                            </li>

                            <c:if test="${sp.trangThai}">
                                <li>
                                    <a class="dropdown-item" href="/chi-tiet-san-pham/detailCTSP?id=${sp.id}"><i
                                            class="bi bi-box-arrow-right"></i> Quản lý sản phẩm chi tiết</a>
                                </li>
                            </c:if>
                            <li>
                                <button type="button" class="dropdown-item btn-modal-sua" data-bs-toggle="modal"
                                        data-bs-target="#exampleModallll" data-id="${sp.id}"><i
                                        class="bi bi-pencil"></i> Sửa
                                </button>

                            </li>
                            <li>
                                <button type="button" class="dropdown-item btn-modal-xoa" data-id-xoa="${sp.id}"
                                        href="#"><i class="bi bi-trash3"></i> Xóa
                                </button>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>
                            <%-- modal thông tin sản phẩm --%>
                        <div class="modal fade" id="exampleModal${i.index}" tabindex="-1"
                             aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Sản Phẩm</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row detail-product">
                                            <div class="col-md-6">
                                                <!-- Hiển thị thông tin sản phẩm -->
                                                <div class="product-info">
                                                    <h2 class="mb-4">${sp.tenSanPham}</h2>
                                                    <p><strong>Mã sản phẩm:</strong> ${sp.maSanPham}</p>
                                                    <p><strong>Kích thước:</strong> ${sp.kichThuoc}</p>
                                                    <p><strong>Khối lượng:</strong>${khoiLuong} gram</p>
                                                    <p><strong>Chất liệu:</strong> ${sp.chatLieu}</p>
                                                    <p><strong>Xuất xứ:</strong> ${sp.xuatXu}</p>
                                                    <p><strong>Thương hiệu:</strong> ${sp.thuongHieu.ten}</p>
                                                    <p><strong>Danh mục:</strong> ${sp.danhMuc.tenDanhMuc}</p>
                                                    <p><strong>Mô tả:</strong> ${sp.moTa}</p>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <!-- Hiển thị ảnh sản phẩm -->
                                                <div class="product-image text-center">
                                                    <img src="${sp.anh}" alt="${sanPham.tenSanPham}"
                                                         class="img-fluid rounded">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Thoát
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
    </div>
</div>
<jsp:include page="sua-san-pham-modal.jsp"></jsp:include>
<jsp:include page="xoa-san-pham.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

    function addDanhMuc() {
        var maDanhMuc = document.getElementById("maDanhMuc").value;
        var tenDanhMuc = document.getElementById("tenDanhMuc").value;
        var trangThai = document.getElementById("trangThai").value;

        if (tenDanhMuc.trim() === "") {
            toastr.error("Vui lòng điền đầy đủ thông tin tên danh mục ");
            return false;
        }
        $.ajax({
            url: '/danh-muc/add',
            type: 'POST',
            data: {
                maDanhMuc: maDanhMuc,
                tenDanhMuc: tenDanhMuc,
                trangThai: trangThai,
            },

            success: function (response) {

                if (response === "errorMa") {
                    toastr.error("Mã Danh Mục Đã Tồn Tại");
                } else if (response === "errorTen") {
                    toastr.error("Tên Danh Mục Đã Tồn Tại");
                } else {

                    var selectElement = document.getElementById("idDanhMuc");
                    selectElement.innerHTML = "";
                    var defaultOption = document.createElement("option");
                    defaultOption.text = "Chọn Danh Mục";
                    defaultOption.value = "";
                    selectElement.add(defaultOption);
                    response.forEach(function (item) {
                        var option = document.createElement("option");
                        option.value = item.id;
                        option.text = item.tenDanhMuc;
                        selectElement.add(option);
                    });

//table
                    var tableBody = document.querySelector("#test1 tbody");

                    // Xóa hết các hàng hiện có trong bảng
                    while (tableBody.firstChild) {
                        tableBody.removeChild(tableBody.firstChild);
                    }
                    response.forEach(function (item, index) {
                        var newRow = tableBody.insertRow();

                        var cellSTT = newRow.insertCell(0);
                        cellSTT.textContent = index + 1;

                        var cellMaDanhMuc = newRow.insertCell(1);
                        cellMaDanhMuc.textContent = item.maDanhMuc;

                        var cellTenDanhMuc = newRow.insertCell(2);
                        cellTenDanhMuc.textContent = item.tenDanhMuc;

                        var cellTrangThai = newRow.insertCell(3);
                        var statusSpan = document.createElement("span");
                        statusSpan.className = "status " + (item.trangThai ? "dangxuly" : "pending");
                        statusSpan.textContent = item.trangThai ? "Hoạt Động" : "Không Hoạt Động";
                        cellTrangThai.appendChild(statusSpan);
                    });


                    Swal.fire({
                        title: "Good job!",
                        text: "Thêm Thành Công!",
                        icon: "success"
                    }).then((result) => {
                        if (result.isConfirmed || result.isDismissed) {
                            document.getElementById("maDanhMuc").value = '';
                            document.getElementById("tenDanhMuc").value = '';
                            closeModal2();
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


    function addDTSD() {
        var maDoiTuongSuDung = document.getElementById("maDoiTuongSuDung").value;
        var tenDoiTuongSuDung = document.getElementById("tenDoiTuongSuDung").value;
        var trangThai = document.getElementById("trangThai").value;

        if (tenDoiTuongSuDung.trim() === "") {
            toastr.error("Vui lòng điền đầy đủ thông tin ");
            return false;
        }
        $.ajax({
            url: '/doi-tuong-su-dung/add',
            type: 'POST',
            data: {
                maDoiTuongSuDung: maDoiTuongSuDung,
                tenDoiTuongSuDung: tenDoiTuongSuDung,
                trangThai: trangThai,
            },
            success: function (response) {
                if (response === "errorMa") {
                    toastr.error("mã đối tượng đã tồn tại");
                } else if (response === "errorTen") {
                    toastr.error("Tên Đối Tượng Đã Tồn Tại");
                } else {


                    var selectElement = document.getElementById("idDoiTuongSuDung");
                    selectElement.innerHTML = "";
                    var defaultOption = document.createElement("option");
                    defaultOption.text = "Chọn Đối Tượng Sử Dụng";
                    defaultOption.value = "";
                    selectElement.add(defaultOption);
                    response.forEach(function (item) {
                        var option = document.createElement("option");
                        option.value = item.id;
                        option.text = item.tenDoiTuongSuDung;
                        selectElement.add(option);
                    });

//table
                    var tableBody = document.querySelector("#test4 tbody");

                    // Xóa hết các hàng hiện có trong bảng
                    while (tableBody.firstChild) {
                        tableBody.removeChild(tableBody.firstChild);
                    }
                    response.forEach(function (item, index) {
                        var newRow = tableBody.insertRow();

                        var cellSTT = newRow.insertCell(0);
                        cellSTT.textContent = index + 1;

                        var cellMaDTSD = newRow.insertCell(1);
                        cellMaDTSD.textContent = item.maDoiTuongSuDung;

                        var cellTenDTSD = newRow.insertCell(2);
                        cellTenDTSD.textContent = item.tenDoiTuongSuDung;

                        var cellTrangThai = newRow.insertCell(3);
                        var statusSpan = document.createElement("span");
                        statusSpan.className = "status " + (item.trangThai ? "dangxuly" : "pending");
                        statusSpan.textContent = item.trangThai ? "Hoạt Động" : "Không Hoạt Động";
                        cellTrangThai.appendChild(statusSpan);
                    });

                    Swal.fire({
                        title: "Good job!",
                        text: "Thêm Thành Công!",
                        icon: "success"
                    }).then((result) => {
                        if (result.isConfirmed || result.isDismissed) {
                            document.getElementById("maDoiTuongSuDung").value = '';
                            document.getElementById("tenDoiTuongSuDung").value = '';
                            closeModal2DTSD();
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


    function addThuongHieu() {

        var maTH = document.getElementById("maTH").value;
        var ten = document.getElementById("ten").value;
        var trangThai = document.getElementById("trangThai").value;
        console.log(maTH);
        console.log(ten);


        if (ten.trim() === "") {
            toastr.error("Vui lòng điền thông tin thương hiệu ");
            return false;
        }
        $.ajax({
            url: '/thuonghieu/add',
            type: 'POST',
            data: {
                maTH: maTH,
                ten: ten,
                trangThai: trangThai,
            },
            success: function (response) {
                if (response === "errorMa") {
                    toastr.error("Mã trùng");
                } else if (response === "errorTen") {
                    toastr.error("Tên Thương Hiệu Đã Tồn Tại");
                } else {

                    var selectElement = document.getElementById("idThuongHieu");
                    selectElement.innerHTML = "";
                    var defaultOption = document.createElement("option");
                    defaultOption.text = "Chọn Thương Hiệu";
                    defaultOption.value = "";
                    selectElement.add(defaultOption);


                    response.forEach(function (item) {
                        var option = document.createElement("option");
                        option.value = item.id;
                        option.text = item.ten;
                        selectElement.add(option);
                    });

//table
                    var tableBody = document.querySelector("#test3 tbody");

                    // Xóa hết các hàng hiện có trong bảng
                    while (tableBody.firstChild) {
                        tableBody.removeChild(tableBody.firstChild);
                    }

                    response.forEach(function (item, index) {
                        var newRow = tableBody.insertRow(); // Tạo một dòng mới trong tbody

                        var cellSTT = newRow.insertCell(0);
                        cellSTT.textContent = index + 1;

                        var cellMaTH = newRow.insertCell(1);
                        cellMaTH.textContent = item.maTH;

                        var cellTenTH = newRow.insertCell(2);
                        cellTenTH.textContent = item.ten;

                        var cellTrangThai = newRow.insertCell(3);
                        var statusSpan = document.createElement("span");
                        statusSpan.className = "status " + (item.trangThai ? "dangxuly" : "pending");
                        statusSpan.textContent = item.trangThai ? "Hoạt Động" : "Không Hoạt Động";
                        cellTrangThai.appendChild(statusSpan);
                    });


                    Swal.fire({
                        title: "Good job!",
                        text: "Thêm Thành Công!",
                        icon: "success"
                    }).then((result) => {
                        if (result.isConfirmed || result.isDismissed) {
                            document.getElementById("maTH").value = '';
                            document.getElementById("ten").value = '';
                            closeModal2TH();
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


    function addThoiGian() {
        var ma = document.getElementById("ma").value;
        var thoiGian = document.getElementById("thoiGian").value;
        var trangThai = document.getElementById("trangThai").value;

        if (thoiGian === "") {
            toastr.error("Vui lòng điền thông tin thời gian bảo hành ");
            return false;
        }
        if (isNaN(thoiGian) || thoiGian <= 0) {
            toastr.error("Vui lòng nhập một giá trị thời gian hợp lệ (số lớn hơn 0)");
            return false;
        }
        $.ajax({
            url: '/thoi_gian_bao_hanh/add',
            type: 'POST',
            data: {
                ma: ma,
                thoiGian: thoiGian,
                trangThai: trangThai,
            },
            success: function (response) {
                if (response === "errorMa") {
                    toastr.error("Mã Bảo Hành Đã Tồn Tại");
                } else if (response === "errorTen") {
                    toastr.error("Thời Gian Đã Tồn Tại");
                } else {

                    // console(response);
                    var selectElement = document.getElementById("idThoiGianBaoHanh");
                    selectElement.innerHTML = "";
                    var defaultOption = document.createElement("option");
                    defaultOption.text = "Chọn Thời Gian Bảo Hành";
                    defaultOption.value = "";
                    selectElement.add(defaultOption);


                    response.forEach(function (item) {
                        var option = document.createElement("option");
                        option.value = item.id;
                        option.text = item.thoiGian;
                        selectElement.add(option);
                    });

//table
                    var tableBody = document.querySelector("#test2 tbody");

                    // Xóa hết các hàng hiện có trong bảng
                    while (tableBody.firstChild) {
                        tableBody.removeChild(tableBody.firstChild);
                    }

                    response.forEach(function (item, index) {
                        var newRow = tableBody.insertRow(); // Tạo một dòng mới trong tbody

                        var cellSTT = newRow.insertCell(0);
                        cellSTT.textContent = index + 1;

                        var cellMaBH = newRow.insertCell(1);
                        cellMaBH.textContent = item.ma;

                        var cellTG = newRow.insertCell(2);
                        cellTG.textContent = item.thoiGian;

                        var cellTrangThai = newRow.insertCell(3);
                        var statusSpan = document.createElement("span");
                        statusSpan.className = "status " + (item.trangThai ? "dangxuly" : "pending");
                        statusSpan.textContent = item.trangThai ? "Hoạt Động" : "Không Hoạt Động";
                        cellTrangThai.appendChild(statusSpan);
                    });


                    Swal.fire({
                        title: "Good job!",
                        text: "Thêm Thành Công!",
                        icon: "success"
                    }).then((result) => {
                        if (result.isConfirmed || result.isDismissed) {
                            document.getElementById("ma").value = '';
                            document.getElementById("thoiGian").value = '';
                            closeModal2BH();
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
</script>
</body>

</html>
