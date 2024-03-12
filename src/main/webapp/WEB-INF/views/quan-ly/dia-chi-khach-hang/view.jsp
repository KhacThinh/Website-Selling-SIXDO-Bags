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
        <h2 class="position-relative d-inline-block">QUẢN LÝ KHÁCH HÀNG</h2>
    </div>
    <div class="row">
        <button type="button" class="btn btn-outline-secondary mt-5 rounded-pill" data-bs-toggle="modal"
                data-bs-target="#modalAddDiaChiKhachHang">
            <i class="bi bi-bag-plus-fill"></i> <span>THÊM KHÁCH HÀNG</span>
        </button>
        <jsp:include page="them-dia-chi-khach-hang.jsp"/>
    </div>
</div>
<div class="container">
    <div id="test">
        <table class="table table-sm table-hover table-striped mb-5">
            <thead>
            <tr>
                <th scope="col">KHÁCH HÀNG</th>
                <th scope="col">TÊN ĐỊA CHỈ</th>
                <th scope="col">MÔ TẢ</th>
                <th scope="col">TRẠNG THÁI</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listColors}" var="sp" varStatus="i">
                <tr id="record_${sp.id}">
                    <td>${sp.khachHang.tenKhachHang}</td>
                    <td>${sp.tenDiaChi}</td>
                    <td>${sp.moTa}</td>
                    <td>${sp.trangThai == true ? 'Hoạt Động' : 'Không Hoạt Động'}</td>


                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">

                            <li>
                                <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modalUpdateDCKH${sp.id}"><i class="bi bi-pencil"></i> Sửa
                                </button>
                            <li>
                                <a class="dropdown-item delete-color" href="#" onclick="xoaKhachHang(${sp.id})"><i
                                        class="bi bi-trash3"></i> Xóa</a>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>

                            <%--                        // Modal update--%>

                        <div class="modal fade" id="modalUpdateDCKH${sp.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Địa Chỉ Khách Hàng</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="mb-3 row">
                                                <label for="tenDiaChi" class="col-sm-3 col-form-label">Tên Địa Chỉ <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="tenDiaChi" id="tenUpdate${sp.id}" value="${sp.tenDiaChi}">
                                                </div>
                                            </div>

                                            <div class="mb-3 row">
                                                <label for="moTa" class="col-sm-3 col-form-label">Mô Tả <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="moTa" type="text" class="form-control" id="moTaUpdate${sp.id}" value="${sp.moTa}">
                                                </div>
                                            </div>


                                            <div class="mb-3 row">
                                                <label for="trangThai" class="col-sm-3 col-form-label">Trạng Thái <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <select name="trangThai" class="form-select" id="trangThaiUpdate${sp.id}">
                                                        <option value="true">Hoạt động</option>
                                                        <option value="false">Không hoạt động</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer justify-content-between">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                                        <button type="submit" id="uploadButton" class="btn btn-primary" onclick="updateDCKH(${sp.id})">Lưu</button>
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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    function xoaKhachHang(idKhachHang) {
        $.ajax({
            url: '/dia_chi_khach_hang/delete',
            type: 'POST',
            data: {idKhachHang: idKhachHang},
            success: function (response) {
                $('#record_' + idKhachHang).remove();
                Swal.fire({
                    title: "Good job!",
                    text: "Xóa Thành Công!",
                    icon: "success"
                });
            },
            error: function (error) {
                console.error("Lỗi khi xóa chức vụ:", error);
            }
        });

    }

    function addDCKH() {
        var khachHang = document.getElementById("khachHang").value;
        var tenDiaChi = document.getElementById("tenDiaChi").value;
        var moTa = document.getElementById("moTa").value;
        var trangThai = document.getElementById("trangThai").value;
        console.log(khachHang);

        if (
            tenDiaChi.trim() === ""
            || moTa.trim() === ""
        ) {
            alert("Vui lòng điền đầy đủ thông tin ");
            return false;
        }
        $.ajax({
            url: '/dia_chi_khach_hang/add',
            type: 'POST',
            data: {
                id: khachHang,
                tenDiaChi: tenDiaChi,
                moTa: moTa,
                trangThai: trangThai,
            },

            success: function (response) {

                if (response === "ok") {
                    window.location.reload(); // Load lại trang nếu thành công
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
            }
        });
    }

    function updateDCKH(id) {
        var tenDiaChi = document.getElementById("tenUpdate" + id).value;
        var moTa = document.getElementById("moTaUpdate" + id).value;
        var trangThai = document.getElementById("trangThaiUpdate" + id).value;



        if (tenDiaChi.trim() === "" || moTa.trim() === "") {
            alert("Vui lòng điền đầy đủ thông tin cho Mã Đ và Tên Chức Vụ.");
            return false;
        }

        $.ajax({
            url: '/dia_chi_khach_hang/update',
            type: 'POST',
            data: {
                id: id,
                tenDiaChi: tenDiaChi,
                moTa: moTa,
                trangThai: trangThai,

            },
            success: function (response) {
                if (response === "ok") {
                    window.location.reload(); // Load lại trang nếu thành công
                    alert("Thành Công")
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

