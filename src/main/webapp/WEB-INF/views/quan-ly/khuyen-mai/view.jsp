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
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>
<div class="container">
    <div class="title text-center pt-5">
        <h2 class="position-relative d-inline-block">QUẢN LÝ KHUYẾN MÃI</h2>
    </div>
    <div class="row">
        <button type="button" class="btn btn-outline-secondary mt-5 rounded-pill" data-bs-toggle="modal"
                data-bs-target="#modalAddKhuyenMai">
            <i class="bi bi-bag-plus-fill"></i> <span>THÊM KHUYẾN MÃI</span>
        </button>
        <jsp:include page="./them-khuyen-mai-modal.jsp"/>
    </div>
</div>
<div class="container">
    <div id="test">
        <table class="table table-sm table-hover table-striped mb-5">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">MÃ</th>
                <th scope="col">TÊN</th>
                <th scope="col">GIÁ TRỊ GIẢM</th>
                <th scope="col">NGÀY BẮT ĐẦU(YY/MM/DD)</th>
                <th scope="col">NGÀY KẾT THÚC(YY/MM/DD)</th>
                <th scope="col">MÔ TẢ</th>
                <th scope="col">TRẠNG THÁI</th>
                <th scope="col">HOẠT ĐỘNG</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listKhuyenMai}" var="km" varStatus="i">
                <tr>
                    <td>${km.id}</td>
                    <td>${km.maKhuyenMai}</td>
                    <td>${km.ten}</td>
                    <td>${km.giaTriGiam}</td>
                    <td>${km.ngayBatDau}</td>
                    <td>${km.ngayKetThuc}</td>
                    <td>${km.moTa}</td>
                    <td>${km.trangThai == true ? 'Hoạt Động' : 'Không Hoạt Động'}</td>
                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                                <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                        data-bs-target="#modalUpdate${km.id}"><i
                                        class="bi bi-pencil"></i> Sửa
                                </button>
                            <li>
                                <%--                            <a class="dropdown-item delete-color" href="/mau-sac/delete/${sp.id}" ><i class="bi bi-trash3"></i> Xóa</a>--%>
                            <a class="dropdown-item delete-color" href="#" onclick="xoaKhuyenMai(${km.id})"><i class="bi bi-trash3"></i> Xóa</a>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>
                        <div class="modal fade" id="modalUpdate${km.id}" tabindex="-1"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Khuyến Mãi</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group" hidden>
                                            <label  class="form-label">Id
                                                <span>*</span></label>
                                            <input value="${km.id}" name="id" id="id" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label  class="form-label">Mã
                                                        <span>*</span></label>
                                                    <input value="${km.maKhuyenMai}" name="ma" id="maUpdate${km.id}" class="form-control"/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label  class="form-label">Tên Khuyến Mãi
                                                        <span>*</span></label>
                                                    <input value="${km.ten}" name="ten" id="tenUpdate${km.id}" class="form-control"/>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label  class="form-label">Ngày Bắt Đầu
                                                        <span>*</span></label>
                                                    <input type="datetime-local" value="${km.ngayBatDau}" name="ngayBatDau" id="tenUpdate${km.id}" class="form-control"/>

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label  class="form-label">Ngày Kết Thúc
                                                        <span>*</span></label>
                                                    <input type="datetime-local" value="${km.ngayKetThuc}" name="ngayKetThuc" id="tenUpdate${km.id}" class="form-control"/>

                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label  class="form-label">Giá Trị Giảm
                                                        <span>*</span></label>
                                                    <input value="${km.giaTriGiam}" name="giaTriGiam" id="tenUpdate${km.id}" class="form-control"/>

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label  class="form-label">Mô Tả
                                                        <span>*</span></label>
                                                    <input value="${km.moTa}" name="moTa" id="tenUpdate${km.id}" class="form-control"/>

                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label  class="form-label">Trạng Thái
                                                    <span>*</span></label>
                                                <select name="trangThai" id="trangThaiUpdate${km.id}" class="form-control">
                                                    <option value="true">Hoạt động</option>
                                                    <option value="false">Không hoạt động</option>
                                                </select>
                                            </div>


                                        </div>
                                    </div>
                                    <div class="modal-footer justify-content-between">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                            Thoát
                                        </button>
                                        <button type="submit" id="uploadButton" class="btn btn-primary" onclick="updateKhuyenMai(${km.id})">Lưu</button>
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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
    function xoaKhuyenMai(idKhuyenMai) {
        var confirmation = confirm("Bạn có chắc chắn muốn xóa danh mục này?");
        if (confirmation) {
            $.ajax({
                url: '/khuyen-mai/xoa-khuyen-mai',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({idKhuyenMai: idKhuyenMai}),
                success: function (response) {
                    window.location.reload(); // Load lại trang sau khi xóa
                },
                error: function (error) {
                    console.error("Lỗi khi xóa danh mục:", error);
                }
            });
        }
    }

    function addKhuyenMai() {
        var maKhuyenMai = document.getElementById("maKhuyenMai").value;
        var ten = document.getElementById("ten").value;
        var giaTriGiam = document.getElementById("giaTriGiam").value;
        var ngayBatDau = document.getElementById("ngayBatDau").value;
        var ngayKetThuc = document.getElementById("ngayKetThuc").value;
        var moTa = document.getElementById("moTa").value;
        var trangThai = document.getElementById("trangThai").value;
        console.log(maKhuyenMai);
        console.log(ten);
        console.log(giaTriGiam);
        console.log(ngayBatDau);
        console.log(ngayKetThuc);
        console.log(moTa);
        console.log(trangThai);
        if (maKhuyenMai.trim() === "" || ten.trim() === "" || giaTriGiam === "" || ngayBatDau === "" || ngayKetThuc ==="" || moTa === "") {
            alert("Vui lòng điền đầy đủ thông tin cho các trường dữ liệu.");
            return false;
        }

        $.ajax({
            url: '/khuyen-mai/add',
            type: 'POST',
            data: {
                maKhuyenMai: maKhuyenMai,
                ten: ten,
                giaTriGiam: giaTriGiam,
                ngayBatDau: ngayBatDau,
                ngayKetThuc: ngayKetThuc,
                moTa: moTa,
                trangThai: trangThai,
            },
            success: function (response) {

                if (response === "ok") {
                    window.location.reload(); // Load lại trang nếu thành công
                } else if (response === "errorMa") {
                    alert("Mã trùng");
                } else if (response === "errorTen") {
                    alert("Trùng Tên");
                } else  if(ngayBatDau>ngayKetThuc){
                    alert("Ngày bắt đầu phải trước ngày kết thúc.")
                } else if (response === "errorNgayKT"){
                    alert("Ngày kết thúc phải sau thời gian nhập vào")
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
            }
        });

    }
    function updateKhuyenMai(id) {
        var maKhuyenMai = document.getElementById("maKhuyenMai" + id).value;
        var ten = document.getElementById("ten"+ id).value;
        var giaTriGiam = document.getElementById("giaTriGiam"+ id).value;
        var ngayBatDau = document.getElementById("ngayBatDau"+ id).value;
        var ngayKetThuc = document.getElementById("ngayKetThuc"+ id).value;
        var moTa = document.getElementById("moTa"+ id).value;
        var trangThai = document.getElementById("trangThai"+ id).value;
        console.log(maKhuyenMai);
        console.log(ten);
        console.log(giaTriGiam);
        console.log(ngayBatDau);
        console.log(ngayKetThuc);
        console.log(moTa);
        console.log(trangThai);
        if (maKhuyenMai.trim() === "" || ten.trim() === "" || giaTriGiam === "" || ngayBatDau === "" || ngayKetThuc ==="" || moTa === "") {
            alert("Vui lòng điền đầy đủ thông tin cho các trường dữ liệu.");
            return false;
        }
        console.log(ma);
        // if (ma.trim() === "" || ten.trim() === "") {
        //     alert("Vui lòng điền đầy đủ thông tin cho Mã Thương Hiệu và Tên Thương Hiệu.");
        //     return false;
        // }
        $.ajax({
            url: '/khuyen-mai/update',
            type: 'POST',
            data: {
                id: id,
                maKhuyenMai: maKhuyenMai,
                ten: ten,
                giaTriGiam: giaTriGiam,
                ngayBatDau: ngayBatDau,
                ngayKetThuc: ngayKetThuc,
                moTa: moTa,
                trangThai: trangThai,
            },
            success: function (response) {
                if (response === "ok") {
                    window.location.reload(); // Load lại trang nếu thành công
                } else if (response === "errorMa") {
                    alert("Mã trùng");
                } else if (response === "errorTen") {
                    alert("Trùng Tên");
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
            }
        });

    }
</script>
</body>

</html>
