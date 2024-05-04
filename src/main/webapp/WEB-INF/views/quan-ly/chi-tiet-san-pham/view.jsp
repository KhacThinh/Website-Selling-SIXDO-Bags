<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>QUẢN LÝ</title>
    <!-- Bootstrap CSS -->
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

        /* CSS cho các trạng thái */
        .trang-thai-0 {
            color: #ff0000; /* Màu đỏ cho "Ngừng bán" */
        }

        .trang-thai-1 {
            color: #008000; /* Màu xanh cho "Đang bán" */
        }

        .trang-thai-2 {
            color: #ff8c00; /* Màu cam cho "Hết hàng" */
        }

        .trang-thai-default {
            color: #000000; /* Màu đen cho "Không xác định" */
        }

    </style>
</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>
<div class="container">
    <div class="title text-center pt-5">
        <h2 class="position-relative d-inline-block">QUẢN LÝ CHI TIẾT SẢN PHẨM</h2>
    </div>
    <div class="row">
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-outline-secondary mt-5 rounded-pill" data-bs-toggle="modal"
                data-bs-target="#modalAdd">

            <i class="bi bi-bag-plus-fill"></i> <span>THÊM SẢN PHẨM</span>
        </button>

        <!-- Modal add -->

        <jsp:include page="add-chi-tiet-san-pham.jsp"/>

    </div>
</div>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-7 mb-3">
            <form action="/chi-tiet-san-pham/filterCTSP" class="filter-form" method="get">
                <div class="row">

                    <div class="col-md-4 mb-3">
                        <select name="tenMauSac" class="form-select">
                            <option value="">Chọn màu sắc</option>
                            <c:forEach var="mauSacItem" items="${tenMauSacSelects}">
                                <option value="${mauSacItem}" ${tenMauSacSelect eq mauSacItem ? 'selected' : ''}>${mauSacItem}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <%--                    <div class="col-md-4 mb-3">--%>
                    <%--                        <select name="trangThai" class="form-select">--%>
                    <%--                            <option value="">Chọn Trạng Thái</option>--%>
                    <%--                            <option value="0">Ngừng bán</option>--%>
                    <%--                            <option value="1">Đang bán</option>--%>
                    <%--                            <option value="2">Hết hàng</option>--%>

                    <%--                        </select>--%>
                    <%--                    </div>--%>


                    <div class="col-md-4 mb-3">
                        <button type="submit" class="btn btn-primary">Lọc</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-5 mb-3">
            <form action="/chi-tiet-san-pham/searchCTSP" class="search-form" method="get">
                <div class="input-group">
                    <input type="text" name="name" class="form-control" placeholder="Tìm kiếm theo mã hoặc tên...">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit">Tìm kiếm</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function getTrangThaiString(trangThai) {
        // Hàm để trả về chuỗi màu dựa trên trạng thái
        switch (trangThai) {
            case 0:
                return '<span class="trang-thai-0">Ngừng bán</span>';
            case 1:
                return '<span class="trang-thai-1">Đang bán</span>';
            case 2:
                return '<span class="trang-thai-2">Hết hàng</span>';
            default:
                return '<span class="trang-thai-default">Không xác định</span>';
        }


    }

</script>

<div class="container">
    <div id="test">
        <table class="table table-hover table-striped mb-5">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">HÌNH ẢNH</th>
                <th scope="col">MÃ</th>
                <th scope="col">TÊN</th>
                <th scope="col">MÀU SẮC</th>
                <th scope="col">SỐ LƯỢNG</th>
                <th scope="col">GIÁ NHẬP</th>
                <th scope="col">GIÁ BÁN</th>
                <th scope="col">TRẠNG THÁI</th>
                <th scope="col">HOẠT ĐỘNG</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listCTSP}" var="sp">
            <tr id="record_${sp.id}">
                <td scope="col">${sp.id}</td>

                <td><img src="${pageContext.request.contextPath}${sp.hinhAnh}" alt="" width="50px" height="50px"></td>
                <!-- Thêm dòng này -->
                <td>${sp.ma}</td>
                <td>${sp.sanPham.tenSanPham}</td>
                <td>${sp.mauSac.tenMauSac}</td>
                <td>${sp.soLuong}</td>
                <td>${sp.giaNhap}</td>
                <td>${sp.giaBan}</td>
                <td id="trang-thai-chi-tiet-san-pham"><script>document.write(getTrangThaiString(${sp.trangThai}))</script></td>


                <td>
                    <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                            class="bi bi-three-dots-vertical"></i></a>
                    <ul class="dropdown-menu">
                        <li>
                            <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                    onclick="openModal(${sp.id})"
                                    data-bs-target="#modalChiTiet">
                                <i class="bi bi-exclamation-circle"></i> Chi Tiết</a>
                            </button>
                        </li>
                        <li>
                            <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                    data-bs-target="#modalUpdate${sp.id}"><i
                                    class="bi bi-pencil"></i> Sửa
                            </button>
                        <li>
                            <a class="dropdown-item" href="#" onclick="deleteItem(${sp.id})">
                                <i class="bi bi-trash3"></i> Xóa
                            </a>
                        </li>

                        <hr class="dropdown-divider">
                        </li>
                    </ul>
                        <%--                    Modal Update--%>
                    <div class="modal" id="modalUpdate${sp.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Sản Phẩm</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="row">

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="ma" class="form-label">Mã
                                                </label>
                                                <input value="${sp.ma}" name="ma" id="maUpdate${sp.id}"
                                                       class="form-control" readonly/>
                                            </div>
                                            <div class="form-group">
                                                <label for="soLuong" class="form-label">Số Lượng <span>*</span></label>
                                                </label>
                                                <input value="${sp.soLuong}" name="soLuong" id="soLuongUpdate${sp.id}"
                                                       class="form-control"/>
                                                <div id="soLuongUpdateError${sp.id}" class="error"></div>
                                            </div>

                                            <div class="form-group">
                                                <label for="giaNhap" class="form-label">Giá Nhập <span>*</span></label>
                                                </label>
                                                <input value="${sp.giaNhap}" name="giaNhap" id="giaNhapUpdate${sp.id}"
                                                       class="form-control"/>
                                                <div id="giaNhapUpdateError${sp.id}" class="error"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="giaBan" class="form-label">Giá Bán <span>*</span></label>
                                                </label>
                                                <input value="${sp.giaBan}" name="giaBan" id="giaBanUpdate${sp.id}"
                                                       class="form-control"/>
                                                <div id="giaBanUpdateError${sp.id}" class="error"></div>
                                            </div>
                                            <div class="form-group">
                                                <label for="images" class="form-label">Ảnh</label>
                                                <input type="file" value="${sp.hinhAnh}" id="images${sp.id}"
                                                       name="images"
                                                       class="form-control"/>
                                                <img id="previewImage" src="${sp.hinhAnh}"
                                                     style="max-width: 100%; height: 150px; margin-top: 4px"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="" class="form-label">Sản Phẩm</label>
                                                <div class="form-control">${sp.sanPham.tenSanPham}</div>
                                            </div>
                                            <div class="form-group">
                                                <label for="mauSac" class="form-label">Màu Sắc</label>
                                                <select name="mauSac" id="mauSac${sp.id}" class="form-control">
                                                    <option value="" label="Chọn Màu Sắc"/>
                                                    <option value="${sp.mauSac.id}"
                                                            selected>${sp.mauSac.tenMauSac}</option>
                                                    <c:forEach items="${MauSacs}" var="c">
                                                        <option value="${c.id}">${c.tenMauSac}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6" >
                                            <div class="form-group" style="display: none">
                                                <label for="khuyenMai" class="form-label">Khuyến Mãi</label>
                                                <select name="khuyenMai" id="khuyenMai${sp.id}" class="form-control">
                                                    <option value="" label="Chọn Khuyến Mãi"/>
                                                    <c:forEach items="${listKhuyenMai}" var="c">
                                                        <option value="${c.id}" ${c.id==sp.khuyenMai.id ? 'selected':''}>${c.ten}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="trangThai" class="form-label">Trạng Thái </label>
                                                    <select name="trangThai" class="form-select" id="trangThaiUpdate${sp.id}">
                                                        <option value="1"${sp.trangThai == 1 ? 'selected' : ''}>Đang Bán</option>
                                                        <option value="0"${sp.trangThai == 0? 'selected' : ''}>Ngừng Bán</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                                <div class="modal-footer justify-content-between">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                        Thoát
                                    </button>
                                    <button type="submit" id="uploadButton" class="btn btn-primary"
                                            onclick="validateFormUpdate(${sp.id})">Lưu
                                    </button>
                                </div>

                            </div>
                        </div>
                    </div>
    </div>


    </c:forEach>
    </td>
    </tr>

    </tbody>
    </table>
</div>
</div>


<!-- Modal -->
<div class="modal fade" id="modalChiTiet" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Sản Phẩm</h1>
                <button type="button" class="btn-close close-thanh-cong" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="detailForm">
                    <table class="table table-hover table-striped mb-5">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">HÌNH ẢNH</th>
                            <th scope="col">MÃ</th>
                            <th scope="col">TÊN</th>
                            <th scope="col">MÀU SẮC</th>
                            <th scope="col">SỐ LƯỢNG</th>
                            <th scope="col">THỜI GIAN</th>
                            <th scope="col">GIÁ NHẬP</th>
                            <th scope="col">GIÁ BÁN</th>
                            <th scope="col">KHUYẾN MẠi</th>

                        </tr>
                        </thead>
                        <tbody id="detailBody">
                        <!-- Dữ liệu sẽ được cập nhật ở đây -->
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script>
    // Function để hiển thị dữ liệu chi tiết sản phẩm trong modal
    function openModal(productId) {
        // Gửi yêu cầu đến server để lấy dữ liệu chi tiết sản phẩm
        $.ajax({
            type: "POST",
            url: "/chi-tiet-san-pham/detail",
            data: {id: productId}, // Chuyển tham số id qua cơ thể của yêu cầu
            success: function (response) {
                // Hiển thị dữ liệu chi tiết trong modal
                console.log(response);
                renderChiTiet(response);
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
            }
        });
    }


    // Function để render dữ liệu chi tiết vào modal
    function renderChiTiet(chiTietSanPham) {
        // Compile template Handlebars
        var source = document.getElementById("detail-template").innerHTML;
        var template = Handlebars.compile(source);

        // Hiển thị dữ liệu chi tiết sản phẩm trong modal
        var modalBody = $('#detailBody');
        modalBody.empty(); // Xóa dữ liệu cũ trong modal

        // Thêm dữ liệu vào modal bằng cách sử dụng template Handlebars
        modalBody.append(template(chiTietSanPham));
    }


</script>
<script id="detail-template" type="text/x-handlebars-template">
    <tr>
        <td>{{id}}</td>
        <td><img src="{{hinhAnh}}" alt="" width="100px" height="100px"></td>
        <td>{{ma}}</td>
        <td>{{sanPham.tenSanPham}}</td>
        <td>{{mauSac.tenMauSac}}</td>
        <td>{{soLuong}}</td>
        <td>{{thoiGian}}</td>
        <td>{{giaNhap}}</td>
        <td>{{giaBan}}</td>
        <td>{{khuyenMai.maKhuyenMai}}</td>


    </tr>
</script>
<script id="detail-template" type="text/x-handlebars-template">
    <tr>
        <td>{{id}}</td>
        <td><img src="{{hinhAnh}}" alt="" width="100px" height="100px"></td>
        <td>{{ma}}</td>
        <td>{{sanPham.tenSanPham}}</td>
        <td>{{mauSac.tenMauSac}}</td>
        <td>{{soLuong}}</td>
        <td>{{thoiGian}}</td>
        <td>{{giaNhap}}</td>
        <td>{{giaBan}}</td>
        <td>{{khuyenMai.maKhuyenMai}}</td>


    </tr>
</script>


<%--Xóa--%>
<script>
    function deleteItem(itemId) {
        $.ajax({
            url: '/chi-tiet-san-pham/delete',
            type: 'DELETE',
            data: {id: itemId},
            success: function (result) {
                Swal.fire({
                    title: "Good job!",
                    text: "Chuyển Trạng Thái Thành Công!",
                    icon: "success"
                });

                // Set thời gian đóng thông báo là 2 giây và sau đó load lại trang
                setTimeout(function () {
                    location.reload(); // Load lại trang sau 2 giây
                }, 2000); // 2000 milliseconds = 2 giây


            },

            error: function (xhr, status, error) {
                console.error('Lỗi khi xóa: ', error);
            }
        });
    }

</script>

<%--Validate Update--%>
<script>
    function validateFormUpdate(id) {
        var soLuong = document.getElementById('soLuongUpdate' + id).value;

        var giaNhap = document.getElementById('giaNhapUpdate' + id).value;
        var giaBan = document.getElementById('giaBanUpdate' + id).value;
        var mauSac = document.getElementById('mauSac' + id).value;
        var khuyenMai = document.getElementById('khuyenMai' + id).value;
        var trangThai = document.getElementById('trangThaiUpdate' + id).value;
        var fileInput = document.getElementById('images' + id);
        var file = fileInput.files[0];
        console.log(file);

        var formData = new FormData();
        formData.append('id', id);
        formData.append('soLuong', soLuong);
        formData.append('giaNhap', giaNhap);
        formData.append('giaBan', giaBan);
        formData.append('mauSac', mauSac);
        formData.append('khuyenMai', khuyenMai);
        formData.append('trangThai', trangThai);
        if (file) {
            formData.append('images', file);
        }
        var isValid = true;
        if (soLuong.trim() === '') {
            document.getElementById('soLuongUpdateError' + id).innerText = 'Vui lòng nhập số lượng.';
            isValid = false;
        } else if (parseFloat(soLuong) < 0) {
            document.getElementById('soLuongUpdateError' + id).innerText = 'Số lượng không thể là số âm.';
            isValid = false;
        } else if (!isNumeric(soLuong)) {
            document.getElementById('soLuongUpdateError' + id).innerText = 'Số lượng phải là một số.';
            isValid = false;
        } else {
            document.getElementById('soLuongUpdateError' + id).innerText = '';
        }

        if (giaNhap.trim() === '') {
            document.getElementById('giaNhapUpdateError' + id).innerText = 'Vui lòng nhập giá nhập.';
            isValid = false;
        } else if (parseFloat(giaNhap) < 0) {
            document.getElementById('giaNhapUpdateError' + id).innerText = 'Giá nhập không thể là số âm.';
            isValid = false;
        } else if (!isNumeric(giaNhap)) {
            document.getElementById('giaNhapUpdateError' + id).innerText = 'Giá nhập phải là một số.';
            isValid = false;
        } else {
            document.getElementById('giaNhapUpdateError' + id).innerText = '';
        }

        if (giaBan.trim() === '') {
            document.getElementById('giaBanUpdateError' + id).innerText = 'Vui lòng nhập giá bán.';
            isValid = false;
        } else if (parseFloat(giaBan) < 0) {
            document.getElementById('giaBanUpdateError' + id).innerText = 'Giá bán không thể là số âm.';
            isValid = false;
        }
        else if (!isNumeric(giaBan)) {
            document.getElementById('giaBanUpdateError' + id).innerText = 'Giá bán phải là một số.';
            isValid = false;
        } else {
            document.getElementById('giaBanUpdateError' + id).innerText = '';
        }

        if (isValid === true ) {
            $.ajax({
                url: '/chi-tiet-san-pham/update',
                type: 'PUT',
                data: formData,
                processData: false,
                contentType: false,
                success: function (result) {
                    var id = result.sanPham.id;
                    setTimeout(function () {
                        window.location.href = '/chi-tiet-san-pham/detailCTSP?id=' + id;
                    }, 1000);
                    Swal.fire({
                        icon: "success",
                        title: "Sản phẩm chi tiết của bạn đã được sửa",
                        showConfirmButton: false,
                        timer: 1500
                    });
                },
                error: function (xhr, status, error) {
                    if (xhr.status === 400) {
                        console.error("Lỗi khi kiểm tra mã:", error);
                    } else {
                        console.error('Lỗi khi xóa: ', error);
                    }
                }
            });

        }
    }

    function Redirect(id) {
        window.location = '/chi-tiet-san-pham/detailCTSP?id=' + id;
    }

    function isNumeric(value) {
        return /^\d+$/.test(value);
    }

</script>



<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<!-- Bootstrap JS (Tùy chọn) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<!-- Bootstrap JS (Tùy chọn) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>

</html>
