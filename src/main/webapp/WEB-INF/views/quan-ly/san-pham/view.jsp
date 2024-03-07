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
            margin-top: 50px;
            margin-right: 50px;
        }


    </style>
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

        <!-- Modal -->
        <div class="modal modal-xl" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Sản Phẩm</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form ng-submit="onSubmit($event)"
                              class="ng-pristine ng-invalid ng-invalid-required ng-valid-min">
                            <div class="mb-3">
                                <!-- <label for="recipient-name" class="col-form-label">Recipient:</label> -->
                                <input ng-model="product.id" type="number"
                                       class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"
                                       id="recipient-name" placeholder="ID" required="">
                            </div>
                            <div class="mb-3">
                                <!-- <label for="recipient-name" class="col-form-label">Recipient:</label> -->
                                <input ng-model="product.tenSP" type="text"
                                       class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"
                                       id="recipient-name" placeholder="Tên Sản Phẩm" required="">
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="recipient-name" class="col-form-label">Giá Nhập:</label>
                                    <input ng-model="product.giaNhap" type="number"
                                           class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required"
                                           id="recipient-name" placeholder="Giá Nhập" required="">
                                </div>
                                <div class="col-md-6">
                                    <label for="recipient-name" class="col-form-label">Giá Bán:</label>
                                    <input ng-model="product.giaBan" type="number"
                                           class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required"
                                           id="recipient-name" placeholder="Giá Bán" required="">
                                </div>
                            </div>
                            <div class=" row mb-3">
                                <div class="col-md-6">
                                    <label for="recipient-name" class="col-form-label">Số
                                        Lượng</label>
                                    <input type="number" ng-model="product.soLuong"
                                           class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-min"
                                           id="recipient-name" min="0">
                                </div>
                                <div class="col-md-6">
                                    <label for="recipient-name" class="col-form-label">Ngày Nhập Kho</label>
                                    <input ng-model="product.ngayNhapHang" ng-model-options="{ getterSetter: true }"
                                           type="text"
                                           class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"
                                           id="recipient-name" required="" placeholder="Định dạng yyyy-MM-dd">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-8">
                                    <label for="recipient-name" class="col-form-label">File Image</label>
                                    <input ng-model="product.urlImage" type="text"
                                           class="form-control ng-pristine ng-untouched ng-valid ng-empty"
                                           id="recipient-name" placeholder="Đường dẫn ảnh">
                                </div>
                                <div class="col-md-4">
                                    <label for="recipient-name" class="col-form-label">Trạng Thái</label>
                                    <select ng-model="product.trangThai"
                                            class="form-select ng-pristine ng-untouched ng-valid ng-empty"
                                            aria-label="Default select example">
                                        <option value="? string: ?" selected="selected"></option>
                                        <option value="Đang Bán">Đang Bán</option>
                                        <option value="Ngừng Bán">Ngừng Bán</option>
                                    </select>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary">Thêm Sản Phẩm</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                    </div>
                </div>
            </div>
        </div>
<%--        <!-- Modal -->--%>
<%--        <div class="modal modal-xl" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--            <div class="modal-dialog">--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-header">--%>
<%--                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Sản Phẩm</h1>--%>
<%--                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body">--%>
<%--                        <form ng-submit="onSubmit($event)" class="ng-pristine ng-invalid ng-invalid-required ng-valid-min">--%>
<%--                            <div class="row mb-3">--%>
<%--                                <div class="col-md-4">--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <input ng-model="product.id" type="number" class="form-control" id="productId" placeholder="ID" required="">--%>
<%--                                    </div>--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <input ng-model="product.tenSanPham" type="text" class="form-control" id="productName" placeholder="Tên Sản Phẩm" required="">--%>
<%--                                    </div>--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <label class="col-form-label">Giá Nhập:</label>--%>
<%--                                        <input ng-model="product.giaNhap" type="number" class="form-control" id="importPrice" placeholder="Giá Nhập" required="">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4">--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <label class="col-form-label">Giá Bán:</label>--%>
<%--                                        <input ng-model="product.giaBan" type="number" class="form-control" id="sellingPrice" placeholder="Giá Bán" required="">--%>
<%--                                    </div>--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <label class="col-form-label">Số Lượng</label>--%>
<%--                                        <input type="number" ng-model="product.soLuong" class="form-control" id="quantity" min="0">--%>
<%--                                    </div>--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <label class="col-form-label">Ngày Nhập Kho</label>--%>
<%--                                        <input ng-model="product.ngayNhapKho" ng-model-options="{ getterSetter: true }" type="text" class="form-control" id="importDate" required="" placeholder="Định dạng yyyy-MM-dd">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4">--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <label class="col-form-label">File Image</label>--%>
<%--                                        <input type="file" id="imageInput" class="form-control">--%>
<%--                                        <button type="button" class="btn btn-primary mt-2" onclick="document.getElementById('imageInput').click();">Chọn Ảnh</button>--%>
<%--                                    </div>--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <label class="col-form-label">Trạng Thái</label>--%>
<%--                                        <select ng-model="product.trangThai" class="form-select" aria-label="Default select example">--%>
<%--                                            <option value="true">Đang Bán</option>--%>
<%--                                            <option value="false">Ngừng Bán</option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <!-- Các trường còn lại -->--%>
<%--                            <div class="mb-3">--%>
<%--                                <label class="col-form-label">Kích Thước</label>--%>
<%--                                <input ng-model="product.kichThuoc" type="text" class="form-control" id="size" placeholder="Kích Thước">--%>
<%--                            </div>--%>
<%--                            <!-- Các trường còn lại -->--%>
<%--                            <button type="submit" class="btn btn-primary">Thêm Sản Phẩm</button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                    <div class="modal-footer">--%>
<%--                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

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
                <th scope="col">MÃ</th>
                <th scope="col">TÊN</th>
                <th scope="col">KÍCH THƯỚC</th>
                <th scope="col">KHỐI LƯỢNG(kg)</th>
                <th scope="col">CHẤT LIỆU</th>
                <th scope="col">XUẤT XỨ</th>
                <th scope="col">THƯƠNG HIỆU</th>
                <th scope="col">HOẠT ĐỘNG</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sanPhams}" var="sp">
                <tr>
                    <th scope="col">${sp.id}</th>
                    <td>${sp.maSanPham}</td>
                    <td>${sp.tenSanPham}</td>
                    <td>${sp.kichThuoc}</td>
                    <td>${sp.khoiLuong}</td>
                    <td>${sp.chatLieu}</td>
                    <td>${sp.xuatXu}</td>
                    <td>${sp.thuongHieu.ten}</td>
                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                                    <button type="submit" class="dropdown-item" data-bs-toggle="modal"
                                            data-bs-target="#exampleModall">
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
git                     </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<div class="modal fade" id="exampleModall" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form ng-submit="onSubmit($event)">
                    <div class="mb-3">
                        <!-- <label for="recipient-name" class="col-form-label">Recipient:</label> -->
                        <input ng-model="product.id" type="number" class="form-control" id="recipient-name"
                               placeholder="ID" required>
                    </div>
                    <div class="mb-3">
                        <!-- <label for="recipient-name" class="col-form-label">Recipient:</label> -->
                        <input ng-model="product.tenSP" type="text" class="form-control" id="recipient-name"
                               placeholder="Tên Sản Phẩm" required>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="recipient-name" class="col-form-label">Giá Nhập:</label>
                            <input ng-model="product.giaNhap" type="number" class="form-control"
                                   id="recipient-name" placeholder="Giá Nhập" required>
                        </div>
                        <div class="col-md-6">
                            <label for="recipient-name" class="col-form-label">Giá Bán:</label>
                            <input ng-model="product.giaBan" type="number" class="form-control"
                                   id="recipient-name" placeholder="Giá Bán" required>
                        </div>
                    </div>
                    <div class=" row mb-3">
                        <div class="col-md-6">
                            <label for="recipient-name" class="col-form-label">Số
                                Lượng</label>
                            <input type="number" ng-model="product.soLuong" class="form-control"
                                   id="recipient-name" min="0">
                        </div>
                        <div class="col-md-6">
                            <label for="recipient-name" class="col-form-label">Ngày Nhập Kho</label>
                            <input ng-model="product.ngayNhapHang" ng-model-options="{ getterSetter: true }"
                                   type="text" class="form-control" id="recipient-name" required
                                   placeholder="Định dạng yyyy-MM-dd">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="recipient-name"
                                   class="col-form-label">File Image</label>
                            <input ng-model="product.urlImage" type="text" class="form-control" id="recipient-name"
                                   placeholder="Đường dẫn ảnh">
                        </div>
                        <div class="col-md-4">
                            <label for="recipient-name" class="col-form-label">Trạng Thái</label>
                            <select ng-model="product.trangThai" class="form-select"
                                    aria-label="Default select example">
                                <option value="Đang Bán">Đang Bán</option>
                                <option value="Ngừng Bán">Ngừng Bán</option>
                            </select>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">Thêm Sản Phẩm</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary">Huỷ</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Thêm</button>
            </div>
        </div>
    </div>
</div>
</div>


<!-- Bootstrap JS (Tùy chọn) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>

</html>
