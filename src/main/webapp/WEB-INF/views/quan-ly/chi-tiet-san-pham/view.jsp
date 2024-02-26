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


    </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>
<div class="container">
    <div class="title text-center pt-5">
        <h2 class="position-relative d-inline-block">QUẢN LÝ CHI TIẾT SẢN PHẨM</h2>
    </div>
    <div class="row">
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-outline-secondary mt-5 rounded-pill" data-bs-toggle="modal"
                data-bs-target="#exampleModal">

            <i class="bi bi-bag-plus-fill"></i> <span>THÊM SẢN PHẨM</span>
        </button>

        <!-- Modal add -->

        <jsp:include page="add-chi-tiet-san-pham.jsp"/>


    </div>
</div>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-7 mb-3">
            <form action="/san-pham/filter" class="filter-form" method="post">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <select name="tenChatLieu" class="form-select" name="category">
                            <option value="">Chọn Chất Liệu</option>
                            <c:forEach items="${tenChatLieuSelects}" var="cl">
                                <option value="${cl}" ${tenChatLieuSelect eq cl ? 'selected' : ''}>${cl}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <select name="tenThuongHieu" class="form-select" name="category">
                            <option value="">Chọn thương hiệu</option>
                            <c:forEach items="${tenThuongHieuSelects}" var="th">
                                <option value="${th}" ${tenThuongHieuSelect eq th ? 'selected' : ''}>${th}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <button type="submit" class="btn btn-primary">Lọc</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-5 mb-3">
            <form action="/san-pham" class="search-form" method="get">
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
                <th scope="col">HOẠT ĐỘNG</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listCTSP}" var="sp">
            <tr>
                <th scope="col">${sp.id}</th>

                <td><img src="${pageContext.request.contextPath}${sp.hinhAnh}" alt="" width="50px" height="50px"></td> <!-- Thêm dòng này -->
                <td>${sp.ma}</td>
                <td>${sp.sanPham.tenSanPham}</td>
                <td>${sp.mauSac.tenMauSac}</td>
                <td>${sp.soLuong}</td>
                <td>${sp.giaNhap}</td>
                <td>${sp.giaBan}</td>
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
                                    data-bs-target="#exampleModal"><i class="bi bi-pencil"></i> Sửa
                            </button>
                        </li>
                        <li><a class="dropdown-item" href="#"><i class="bi bi-trash3"></i> Xóa</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                    </ul>
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
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
</div><script>
    // Function để hiển thị dữ liệu chi tiết sản phẩm trong modal
    function openModal(productId) {
        // Gửi yêu cầu đến server để lấy dữ liệu chi tiết sản phẩm
        $.ajax({
            type: "POST",
            url: "/chi-tiet-san-pham/detail",
            data: { id: productId }, // Chuyển tham số id qua cơ thể của yêu cầu
            success: function(response) {
                // Hiển thị dữ liệu chi tiết trong modal
                console.log(response);
                renderChiTiet(response);
            },
            error: function(xhr, status, error) {
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


<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<!-- Bootstrap JS (Tùy chọn) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>





<!-- Bootstrap JS (Tùy chọn) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>


</body>

</html>
