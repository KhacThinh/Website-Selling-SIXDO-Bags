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
            height: 600px;
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
            margin-top: 50px;
            margin-right: 50px;
            width: 1200px;
        }


    </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>

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
                <th scope="col">STT</th>
                <th scope="col">MÃ HOÁ ĐƠN</th>
                <th scope="col">THỜI GIAN TẠO</th>
                <th scope="col">SỐ LƯỢNG SẢN PHẨM</th>
                <th scope="col">TỔNG TIỀN</th>
                <th scope="col">HOẠT ĐỘNG</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${hoaDons}" var="hd" varStatus="i">
                <tr>
                    <th scope="col">${i.index + 1}</th>
                    <td>${hd.key.maHoaDon}</td>
                    <td>${hd.key.thoiGianTao}</td>
                    <td>${hd.value.size()}</td>
                    <fmt:formatNumber pattern="#,###" var="tongTien" value="${hd.key.tongTien}"></fmt:formatNumber>
                    <td>${tongTien}</td>
                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                                <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal${i.index}">
                                    <i class="bi bi-exclamation-circle"></i> Chi Tiết</a>
                                </button>
                            </li>
                                <%--                            <li>--%>
                                <%--                                <button type="button" class="dropdown-item" data-bs-toggle="modal"--%>
                                <%--                                        data-bs-target="#exampleModal"><i class="bi bi-pencil"></i> Sửa--%>
                                <%--                                </button>--%>
                                <%--                            </li>--%>
                                <%--                            <li><a class="dropdown-item" href="#"><i class="bi bi-trash3"></i> Xóa</a></li>--%>
                                <%--                            <li>--%>
                                <%--                                <hr class="dropdown-divider">--%>
                                <%--                            </li>--%>
                        </ul>
                        <div class="modal fade" id="exampleModal${i.index}" tabindex="-1"
                             aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">HOÁ ĐƠN CHI TIẾT</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <table class="table table-hover table-striped mb-5">
                                            <thead>
                                            <tr>
                                                <th scope="col">STT</th>
                                                <th scope="col">TÊN SẢN PHẨM</th>
                                                <th scope="col">DANH MỤC</th>
                                                <th scope="col">THƯƠNG HIỆU</th>
                                                <th scope="col">MÀU SẮC</th>
                                                <th scope="col">SỐ LƯỢNG</th>
                                                <th scope="col">ĐƠN GIÁ</th>
                                                <th scope="col">THÀNH TIỀN</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${hd.value}" var="cthd" varStatus="j">
                                                <tr>
                                                    <th scope="col">${j.index + 1}</th>
                                                    <td>${cthd.chiTietSanPham.sanPham.tenSanPham}</td>
                                                    <td>${cthd.chiTietSanPham.sanPham.danhMuc.tenDanhMuc}</td>
                                                    <td>${cthd.chiTietSanPham.sanPham.thuongHieu.ten}</td>
                                                    <td>${cthd.chiTietSanPham.mauSac.tenMauSac}</td>
                                                    <td>${cthd.soLuong}</td>
                                                    <fmt:formatNumber pattern="#,###" var="donGia" value="${cthd.gia}"></fmt:formatNumber>
                                                    <td>${donGia}</td>
                                                    <fmt:formatNumber pattern="#,###" var="thanhTien" value="${cthd.soLuong*cthd.gia}"></fmt:formatNumber>
                                                    <td>${thanhTien}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Huỷ
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


</div>


<!-- Bootstrap JS (Tùy chọn) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>

</html>
