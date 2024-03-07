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

        <!-- Add modal -->
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
                                    <i class="bi bi-exclamation-circle"></i> Chi Tiết</a>
                                </button>
                            </li>
                            <li>
                                <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal${sp.maSanPham}"><i class="bi bi-pencil"></i> Sửa
                                </button>
                            </li>
                            <li><a class="dropdown-item" href="#"><i class="bi bi-trash3"></i> Xóa</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>

                            <%--                        <jsp:include page="./sua-san-pham-modal.jsp"/>--%>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal${sp.maSanPham}" tabindex="-1"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel-edit">Thông Tin Sản
                                            Phẩm</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="tenSanPham">Mã<span
                                                            class="required">*</span></label>
                                                    <input type="hidden" id="idSanPham" value="${sp.id}"
                                                           class="form-control"/>
                                                    <input type="text" id="maSanPham" value="${sp.maSanPham}"
                                                           class="form-control" readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="tenSanPham">Tên Sản Phẩm<span
                                                            class="required">*</span></label>
                                                    <input type="text" id="tenSanPham"
                                                           class="form-control" value="${sp.tenSanPham}"/>
                                                    <span id="tenSanPhamError"
                                                          class="error text-danger"></span>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="chatLieu">Chất Liệu<span
                                                            class="required">*</span></label>
                                                    <input type="text" id="chatLieu"
                                                           class="form-control" value="${sp.chatLieu}"/>
                                                    <span id="chatLieuError"
                                                          class="error text-danger"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="xuatXu">Xuất Xứ<span
                                                            class="required">*</span></label>
                                                    <input type="text" id="xuatXu" class="form-control"
                                                           value="${sp.xuatXu}"/>
                                                    <span id="xuatXuError" class="error text-danger"></span>
                                                </div>
                                                <!-- <div class="form-group">
                            <label for="hinhAnh">Ảnh</label>
                            <input type="file" id="hinhAnh" name="hinhAnh"
                                class="form-control" />
                            <img src="${sp.anh}" alt="Ảnh sản phẩm" id="previewImage"
                                style="max-width: 100%; height: 100px;" />
                        </div> -->
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="kichThuoc">Kích Thước<span
                                                            class="required">*</span></label>
                                                    <input type="text" id="kichThuoc" class="form-control"
                                                           value="${sp.kichThuoc}"/>
                                                    <span id="kichThuocError"
                                                          class="error text-danger"></span>
                                                </div>
                                                <div class="form-group">
                                                    <label for="khoiLuong">Khối Lượng (gram)<span
                                                            class="required">*</span></label>
                                                    <input type="number" id="khoiLuong" min="0" class="form-control"
                                                           value="${sp.khoiLuong}"/>
                                                    <span id="khoiLuongError" class="error text-danger"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="moTa">Mô Tả</label>
                                                    <textarea id="moTa" class="form-control">${sp.moTa}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="idThoiGianBaoHanh">Thời Gian Bảo Hành</label>
                                                    <select id="idThoiGianBaoHanh" class="form-control">
                                                        <option value="">Chọn Thời Gian Bảo Hành</option>
                                                        <c:forEach items="${thoiGianBaoHanhForm}" var="tgbhForm">
                                                            <option value="${tgbhForm.id}" ${tgbhForm.id == sp.thoiGianBaoHanh.id ? 'selected' : ''}>${tgbhForm.thoiGian}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="idThuongHieu">Thương Hiệu</label>
                                                    <select id="idThuongHieu" class="form-control">
                                                        <option value="">Chọn Thương Hiệu</option>
                                                        <c:forEach items="${thuongHieuForm}" var="thForm">
                                                            <option value="${thForm.id}" ${thForm.id == sp.thuongHieu.id ? 'selected' : ''}>${thForm.ten}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="idDanhMuc">Danh Mục</label>
                                                    <select id="idDanhMuc" class="form-control">
                                                        <option value="">Chọn Danh Mục</option>
                                                        <c:forEach items="${danhMucForm}" var="dmForm">
                                                            <option value="${dmForm.id}" ${dmForm.id == sp.danhMuc.id ? 'selected' : ''}>${dmForm.tenDanhMuc}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="idDoiTuongSuDung">Đối Tượng Sử Dụng</label>
                                                    <select id="idDoiTuongSuDung" class="form-control">
                                                        <option value="">Chọn Đối Tượng Sử Dụng</option>
                                                        <c:forEach items="${doiTuongSuDungForm}" var="dtsdForm">
                                                            <option value="${dtsdForm.id}" ${dtsdForm.id == sp.doiTuongSuDung.id ? 'selected' : ''}>${dtsdForm.tenDoiTuongSuDung}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Thoát
                                            </button>
                                            <button type="button" class="btn btn-primary" id="editSanPham"
                                                    onclick="handleEdit()">Sửa
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <script>
                            <%--// Lấy tham chiếu đến nút "Sửa" trong modal--%>
                            <%--const editSanPhamButton = document.querySelector('#exampleModal${sp.maSanPham} #editSanPham');--%>

                            <%--// Thêm sự kiện click cho nút "Sửa"--%>
                            <%--editSanPhamButton.addEventListener('click', (event) => {--%>
                            <%--    event.preventDefault();--%>

                            function submitEditSanPham() {

                                var idSanPham = document.getElementById('idSanPham').value;
                                var maSanPham = document.getElementById('maSanPham').value.trim();
                                var tenSanPham = document.getElementById('tenSanPham').value.trim();
                                var chatLieu = document.getElementById('chatLieu').value.trim();
                                var xuatXu = document.getElementById('xuatXu').value.trim();
                                var khoiLuong = document.getElementById('khoiLuong').value.trim();
                                var kichThuoc = document.getElementById('kichThuoc').value.trim();
                                var hinhAnh = $('#hinhAnh')[0].files[0];
                                var idThoiGianBaoHanh = document.getElementById('idThoiGianBaoHanh').value;
                                var idThuongHieu = document.getElementById('idThuongHieu').value;
                                var idDanhMuc = document.getElementById('idDanhMuc').value;
                                var idDoiTuongSuDung = document.getElementById('idDoiTuongSuDung').value;
                                var moTa = document.getElementById('moTa').value.trim();

                                let hasError = false;

                                if (tenSanPham === '') {
                                    document.getElementById('tenSanPhamError').innerText = 'Vui lòng nhập Tên Sản Phẩm.';
                                    hasError = true;
                                } else if (tenSanPham.length > 100) {
                                    document.getElementById('tenSanPhamError').innerText = 'Tên Sản Phẩm không được vượt quá 100 ký tự.';
                                    hasError = true;
                                } else {
                                    document.getElementById('tenSanPhamError').innerText = '';
                                }

                                if (chatLieu === '') {
                                    document.getElementById('chatLieuError').innerText = 'Vui lòng nhập Chất Liệu.';
                                    hasError = true;
                                } else if (chatLieu.length > 200) {
                                    document.getElementById('chatLieuError').innerText = 'Chất Liệu không được vượt quá 200 ký tự.';
                                    hasError = true;
                                } else {
                                    document.getElementById('chatLieuError').innerText = '';
                                }

                                if (xuatXu === '') {
                                    document.getElementById('xuatXuError').innerText = 'Vui lòng nhập Xuất Xứ.';
                                    hasError = true;
                                } else if (xuatXu.length > 100) {
                                    document.getElementById('xuatXuError').innerText = 'Xuất xứ không được vượt quá 100 ký tự.';
                                    hasError = true;
                                } else {
                                    document.getElementById('xuatXuError').innerText = '';
                                }

                                if (khoiLuong === '') {
                                    hasError = true;
                                    document.getElementById('khoiLuongError').innerText = 'Vui lòng nhập Khối Lượng.';
                                } else if (isNaN(khoiLuong)) {
                                    document.getElementById('khoiLuongError').innerText = 'Khối Lượng phải là số.';
                                    hasError = true;
                                } else if (khoiLuong <= 0) {
                                    document.getElementById('khoiLuongError').innerText = 'Khối Lượng phải lớn hơn 0.';
                                    hasError = true;
                                } else {
                                    document.getElementById('khoiLuongError').innerText = '';
                                }

                                if (kichThuoc === '') {
                                    document.getElementById('kichThuocError').innerText = 'Vui lòng nhập Kích Thước.';
                                    hasError = true;
                                } else if (kichThuoc.length > 200) {
                                    document.getElementById('kichThuocError').innerText = 'Kích Thước không được vượt quá 200 ký tự.';
                                    hasError = true;
                                } else {
                                    document.getElementById('kichThuocError').innerText = '';
                                }

                                if (!hasError) {
                                    sendDataToServer(idSanPham, maSanPham, tenSanPham, chatLieu, xuatXu, khoiLuong, kichThuoc, hinhAnh, moTa, idThoiGianBaoHanh, idThuongHieu, idDanhMuc, idDoiTuongSuDung);
                                }

                            }
                            // );


                            // Hàm để gửi dữ liệu đến server bằng AJAX
                            function sendDataToServer(idSanPham, maSanPham, tenSanPham, chatLieu, xuatXu, khoiLuong, kichThuoc, hinhAnh, moTa, idThoiGianBaoHanh, idThuongHieu, idDanhMuc, idDoiTuongSuDung) {
                                // Tạo đối tượng JSON chứa dữ liệu cần gửi đến server
                                const data = {
                                    idSanPham: idSanPham,
                                    maSanPham: maSanPham,
                                    tenSanPham: tenSanPham,
                                    chatLieu: chatLieu,
                                    xuatXu: xuatXu,
                                    khoiLuong: khoiLuong,
                                    kichThuoc: kichThuoc,
                                    hinhAnh: hinhAnh, // Thêm tham số hình ảnh
                                    moTa: moTa, // Thêm tham số mô tả
                                    idThoiGianBaoHanh: idThoiGianBaoHanh, // Thêm tham số ID thời gian bảo hành
                                    idThuongHieu: idThuongHieu, // Thêm tham số ID thương hiệu
                                    idDanhMuc: idDanhMuc, // Thêm tham số ID danh mục
                                    idDoiTuongSuDung: idDoiTuongSuDung // Thêm tham số ID đối tượng sử dụng
                                };

                                // Gửi dữ liệu đến server bằng AJAX
                                // Sử dụng thư viện jQuery để gửi AJAX request
                                $.ajax({
                                    type: 'PUT', // Phương thức PUT cho việc cập nhật dữ liệu
                                    url: '/san-pham/edit/' + idSanPham, // Đường dẫn tới API hoặc endpoint của server để xử lý dữ liệu
                                    data: JSON.stringify(data), // Chuyển đối tượng JSON thành chuỗi JSON để gửi đi
                                    contentType: 'application/json', // Loại dữ liệu gửi đi là JSON
                                    processData: false, // Không xử lý dữ liệu trước khi gửi đi
                                    success: function (response) {
                                        // Xử lý kết quả trả về từ server nếu cần
                                        console.log(response);
                                        // Sau khi sửa thành công, có thể redirect hoặc làm mới trang
                                        window.location.href = '/san-pham';
                                    },
                                    error: function (xhr, status, error) {
                                        // Xử lý khi gặp lỗi
                                        console.log('Có lỗi xảy ra: ' + error);
                                    }
                                });
                            }


                        </script>


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

<!-- Bootstrap JS (Tùy chọn) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<!-- Link JavaScript của Bootstrap (cần thiết cho một số tính năng của Bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>

</html>
