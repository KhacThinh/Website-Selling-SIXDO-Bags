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

                            <li>
                                <a class="dropdown-item" href="/chi-tiet-san-pham/detailCTSP?id=${sp.id}"><i class="bi bi-box-arrow-right"></i> Quản lý sản phẩm chi tiết</a>
                            </li>
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


</body>

</html>
