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
    </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>
<div class="container">
    <div class="title text-center pt-5">
        <h2 class="position-relative d-inline-block">QUẢN LÝ THƯƠNG HIỆU</h2>
    </div>
    <div class="row">
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-outline-secondary mt-5 rounded-pill" data-bs-toggle="modal"
                data-bs-target="#addModelThuongHieu">
            <i class="bi bi-bag-plus-fill"></i> <span>THÊM THƯƠNG HIỆU</span>
        </button>

        <!-- Add modal -->
                <jsp:include page="./them-thuong-hieu-modal.jsp"/>
    </div>
</div>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-5 mb-3">
            <form action="/thuong-hieu" class="search-form" method="get">
<%--                <div class="input-group">--%>
<%--                    <input type="text" name="name" class="form-control" placeholder="Tìm kiếm theo mã hoặc tên...">--%>
<%--&lt;%&ndash;                    <div class="input-group-append">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <button class="btn btn-outline-secondary" type="submit">Tìm kiếm</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--                </div>--%>
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
<%--                <th scope="col">TRẠNG THÁI</th>--%>
                <th scope="col">HÀNH ĐỘNG</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listThuongHieu}" var="th" varStatus="i">
                <tr>
                    <th scope="col">${th.id}</th>
                    <td>${th.ma}</td>
                    <td>${th.ten}</td>
<%--                    <td> <c:if test="${th.trangThai == 'true'}">Hoạt động</c:if>--%>
<%--                        <c:if test="${th.trangThai == 'false'}">Dừng hoạt động</c:if></td>--%>
                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                                <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal"><i class="bi bi-pencil"></i> Sửa
                                </button>
                            </li>
                            <li><a class="dropdown-item" href="/thuong-hieu/delete/${th.id}"><i class="bi bi-trash3"></i> Xóa</a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>


                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<!-- Bootstrap JS (Tùy chọn) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<!-- Link JavaScript của Bootstrap (cần thiết cho một số tính năng của Bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
