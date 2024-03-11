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
        <jsp:include page="./them-khuyen-mai.jsp"/>
    </div>
</div>
<div class="container">
    <div id="test">
        <table class="table table-sm table-hover table-striped mb-5">
            <thead>
            <tr>
                <th scope="col">Mã Khuyến Mãi</th>
                <th scope="col">Tên Khuyến Mãi</th>
                <th scope="col">Giá Trị Giảm</th>
                <th scope="col">Ngày Bắt Đầu</th>
                <th scope="col">Ngày Kết Thúc</th>
                <th scope="col">Mô Tả</th>
                <th scope="col">Trạng Thái</th>
                <th scope="col">Khác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listColors}" var="sp" varStatus="i">
                <tr id="record_${sp.id}">
                    <td>${sp.maKhuyenMai}</td>
                    <td>${sp.ten}</td>
                    <td>${sp.giaTriGiam}</td>
                    <td>${sp.ngayBatDau}</td>
                    <td>${sp.ngayKetThuc}</td>
                    <td>${sp.moTa}</td>
                    <td>${sp.trangThai == true ? 'Hoạt Động' : 'Không Hoạt Động'}</td>


                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                            <li><button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modalUpdateKhuyenMai${sp.id}"><i class="bi bi-pencil"></i> Sửa
                            </button>
                            </li>

                            </li>
                                <%--                            <a class="dropdown-item delete-color" href="/mau-sac/delete/${sp.id}" ><i class="bi bi-trash3"></i> Xóa</a>--%>
                            <a class="dropdown-item delete-color" href="#" onclick="xoaKhuyenMai(${sp.id})"><i class="bi bi-trash3"></i> Xóa</a>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>




                        <div class="modal fade" id="modalUpdateKhuyenMai${sp.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Chương Trình Khuyến Mãi</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="mb-3 row">
                                                <label for="maUpdate${sp.id}" class="col-sm-3 col-form-label">Mã Khuyến Mãi<span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input value="${sp.maKhuyenMai}" name="maKhuyenMai" id="maUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="tenUpdate${sp.id}" class="col-sm-3 col-form-label">Tên Khuyến Mãi <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input value="${sp.ten}" name="ten" id="tenUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="giaTriGiamUpdate${sp.id}" class="col-sm-3 col-form-label">Giá Trị Giảm <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input value="${sp.giaTriGiam}" name="giaTriGiam" id="giaTriGiamUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="ngayBatDauUpdate${sp.id}" class="col-sm-3 col-form-label">Ngày Bắt Đầu <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input type="datetime-local" value="${sp.ngayBatDau}" name="ngayBatDau" id="ngayBatDauUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="ngayKetThucUpdate${sp.id}" class="col-sm-3 col-form-label">Ngày Kết Thúc <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input type="datetime-local" value="${sp.ngayKetThuc}" name="ngayKetThuc" id="ngayKetThucUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="moTaUpdate${sp.id}" class="col-sm-3 col-form-label">Mô Tả <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input value="${sp.moTa}" name="moTa" id="moTaUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="trangThaiUpdate${sp.id}" class="col-sm-3 col-form-label">Trạng Thái <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <select name="trangThai" id="trangThaiUpdate${sp.id}" class="form-control custom-select">
                                                        <option value="true">Hoạt động</option>
                                                        <option value="false">Không hoạt động</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer justify-content-between">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                                        <button type="submit" id="uploadButton" class="btn btn-primary" onclick="updateKhuyenMai(${sp.id})">Lưu</button>
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
    function xoaKhuyenMai(idKhuyenMai) {
        $.ajax({
            url: '/khuyen-mai/delete',
            type: 'POST',
            data: ({idKhuyenMai: idKhuyenMai}),
            success: function (response) {
                $('#record_' + idKhuyenMai).remove();
                Swal.fire({
                    title: "Good job!",
                    text: "Xóa Thành Công!",
                    icon: "success"
                });
            },
            error: function (error) {
                console.error("Lỗi khi xóa Khuyến Mãi:", error);
            }
        });

    }



    function addKhuyenMai() {
        var maKhuyenMai = document.getElementById("maKhuyenMai").value;
        var ten = document.getElementById("ten").value;
        var giaTriGiam = document.getElementById("giaTriGiam").value;
        var ngayBatDau = document.getElementById("ngayBatDau").value;
        var ngayKetThuc = document.getElementById("ngayKetThuc").value;
        var moTa = document.getElementById("moTa").value;
        var trangThai = document.getElementById("trangThai").value;


        if (maKhuyenMai.trim() === ""
            || ten.trim() === ""
            || giaTriGiam.trim() === ""
            || ngayBatDau.trim() === ""
            || ngayKetThuc.trim() === ""
            || moTa.trim() === ""
        ) {
            alert("Vui lòng điền đầy đủ thông tin ");
            return false;
        }
        var startDate = new Date(ngayBatDau);
        var endDate = new Date(ngayKetThuc);
        if (startDate >= endDate) {
            alert("Ngày bắt đầu phải trước ngày kết thúc.");
            return false;
        }



        if (parseInt(giaTriGiam) <= 0 || isNaN(parseInt(giaTriGiam))) {
            alert("Giá trị giảm phải lớn hơn 0 và là một số.");
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
                trangThai: trangThai
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

    function updateKhuyenMai(id) {
        var maKhuyenMai = document.getElementById("maUpdate" + id).value;
        var ten = document.getElementById("tenUpdate" + id).value;
        var giaTriGiam = document.getElementById("giaTriGiamUpdate" + id).value;
        var ngayBatDau = document.getElementById("ngayBatDauUpdate" + id).value;
        var ngayKetThuc = document.getElementById("ngayKetThucUpdate" + id).value;
        var moTa = document.getElementById("moTaUpdate" + id).value;
        var trangThai = document.getElementById("trangThaiUpdate" + id).value;


        if (maKhuyenMai.trim() === ""
            || ten.trim() === ""
            || giaTriGiam.trim() === ""
            || ngayBatDau.trim() === ""
            || ngayKetThuc.trim() === ""
            || moTa.trim() === ""

        ) {
            alert("Vui lòng điền đầy đủ thông tin ");
            return false;
        }
        var startDate = new Date(ngayBatDau);
        var endDate = new Date(ngayKetThuc);
        if (startDate >= endDate) {
            alert("Ngày bắt đầu phải trước ngày kết thúc.");
            return false;
        }


        if (parseInt(giaTriGiam) <= 0 || isNaN(parseInt(giaTriGiam))) {
            alert("Giá trị giảm phải lớn hơn 0 và là một số.");
            return false;
        }


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
                    alert("Thành Công")
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

