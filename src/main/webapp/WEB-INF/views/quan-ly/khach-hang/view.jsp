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
                data-bs-target="#modalAddKhachHang">
            <i class="bi bi-bag-plus-fill"></i> <span>THÊM KHÁCH HÀNG</span>
        </button>
        <jsp:include page="them-khach-hang.jsp"/>
    </div>
</div>
<div class="container">
    <div id="test">
        <table class="table table-sm table-hover table-striped mb-5">
            <thead>
            <tr>
                <th scope="col">Tài Khoản</th>
                <th scope="col">Mã Khách Hàng</th>
                <th scope="col">Tên Khách Hàng</th>
                <th scope="col">Giới Tính</th>
                <th scope="col">Ngày Sinh</th>
                <th scope="col">Sdt</th>
                <th scope="col">Email</th>
                <th scope="col">Mật Khẩu</th>
                <th scope="col">Trạng Thái</th>
                <th scope="col">Khác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listColors}" var="sp" varStatus="i">
                <tr  id="record_${sp.id}">
                    <td>${sp.taiKhoan.tenDangNhap}</td>
                    <td>${sp.maKhachHang}</td>
                    <td>${sp.tenKhachHang}</td>
                    <td>${sp.gioiTinh== 1 ? 'Nam' : 'Nữ'}</td>
                    <td>${sp.ngaySinh}</td>
                    <td>${sp.sdt}</td>
                    <td>${sp.email}</td>
                    <td>${sp.matKhau}</td>
                    <td>${sp.trangThai == 1 ? 'Hoạt Động' : 'Không Hoạt Động'}</td>


                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                            <li>
                            <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modalUpdateKhachHang${sp.id}"><i class="bi bi-pencil"></i> Sửa
                            </button>
                        </li>

                            </li>
                                <%--                            <a class="dropdown-item delete-color" href="/mau-sac/delete/${sp.id}" ><i class="bi bi-trash3"></i> Xóa</a>--%>
                            <a class="dropdown-item delete-color" href="#" onclick="xoaKhachHang(${sp.id})"><i class="bi bi-trash3"></i> Xóa</a>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>

                        <div class="modal fade" id="modalUpdateKhachHang${sp.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Khách Hàng</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="mb-3 row">
                                                <label for="tenKhachHang" class="col-sm-3 col-form-label">Tên Khách Hàng <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="tenKhachHang" id="tenUpdate${sp.id}" value="${sp.tenKhachHang}">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="gioiTinh" class="col-sm-3 col-form-label">Giới Tính <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <select class="form-select" name="gioiTinh" id="gioiTinhUpdate${sp.id}">
                                                        <option value="1">Nam</option>
                                                        <option value="0">Nữ</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="ngaySinh" class="col-sm-3 col-form-label">Ngày Sinh <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="ngaySinh" type="date" class="form-control" id="ngaySinhUpdate${sp.id}" value="${sp.ngaySinh}">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="sdt" class="col-sm-3 col-form-label">Số Điện Thoại <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="sdt" type="text" class="form-control" id="sdtUpdate${sp.id}" value="${sp.sdt}">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="email" class="col-sm-3 col-form-label">Email <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="email" type="email" class="form-control" id="emailUpdate${sp.id}" value="${sp.email}">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="matKhau" class="col-sm-3 col-form-label">Mật Khẩu <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="matKhau"  class="form-control" id="matKhauUpdate${sp.id}" value="${sp.matKhau}">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="trangThai" class="col-sm-3 col-form-label">Trạng Thái <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <select name="trangThai" class="form-select" id="trangThaiUpdate${sp.id}">
                                                        <option value="1">Hoạt động</option>
                                                        <option value="0">Không hoạt động</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer justify-content-between">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                                        <button type="submit" id="uploadButton" class="btn btn-primary" onclick="updateKhachHang(${sp.id})">Lưu</button>
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
                url: '/khach_hang/delete',
                type: 'POST',
                data: ({idKhachHang: idKhachHang}),
                success: function (response) {
                    $('#record_' + idKhachHang).remove();
                    Swal.fire({
                        title: "Good job!",
                        text: "Xóa Thành Công!",
                        icon: "success"
                    });
                },
                error: function (error) {
                    console.error("Lỗi khi xóa màu sắc:", error);
                }
            });
    }

    function addKhachHang() {
        // var maKhachHang = document.getElementById("maKhachHang").value;
        var tenKhachHang = document.getElementById("tenKhachHang").value;
         var gioiTinh = document.getElementById("gioiTinh").value;
        var ngaySinh = document.getElementById("ngaySinh").value;
        var sdt = document.getElementById("sdt").value;
        var email = document.getElementById("email").value;
        var matKhau = document.getElementById("matKhau").value;
        var trangThai = document.getElementById("trangThai").value;
        // var taiKhoan = document.getElementById("taiKhoan").value;



        // console.log(maGiamGia);
        // console.log(tenMaGiamGia);
        if (
            // maKhachHang.trim() === ""
             tenKhachHang.trim() === ""
            || sdt.trim() === ""


        ) {
            alert("Vui lòng điền đầy đủ thông tin ");
            return false;
        }
        $.ajax({
            url: '/khach_hang/add',
            type: 'POST',
            data: {
                // maKhachHang:maKhachHang,
                tenKhachHang: tenKhachHang,
                gioiTinh: gioiTinh,
                ngaySinh: ngaySinh,
                sdt: sdt,
                email: email,
                matKhau: matKhau,
                trangThai: trangThai,
                // taiKhoan : taiKhoan,
            },
            success: function (response) {
                if (response === "ok") {
                    window.location.reload(); // Load lại trang nếu thành công
                }
                // else if (response === "errorMa") {
                //     alert("mã trùng");
                // } else if (response === "errorTen") {
                //     alert("Trùng Tên");
                // }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
            }
        });

    }

        function updateKhachHang(id) {
            var tenKhachHang = document.getElementById("tenUpdate" + id).value;
            var gioiTinh = document.getElementById("gioiTinhUpdate" + id).value;
            var ngaySinh = document.getElementById("ngaySinhUpdate" + id).value;
            var sdt = document.getElementById("sdtUpdate" + id).value;
            var email = document.getElementById("emailUpdate" + id).value;
            var matKhau = document.getElementById("matKhauUpdate" + id).value;
            var trangThai = document.getElementById("trangThaiUpdate" + id).value;
            // console.log(maGiamGia);

            if ( tenKhachHang.trim() === ""
                || sdt.trim() === ""



            ) {
                alert("Vui lòng điền đầy đủ thông tin ");
                return false;
            }
            var phoneNumberRegex = /^(0\d{9,9})$/;
            if (!phoneNumberRegex.test(sdt)) {
                alert("Số điện thoại phải có 10 số và bắt đầu bằng số 0.");
                return false;
            }

            // Kiểm tra định dạng email
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                alert("Email không đúng định dạng.");
                return false;
            }

            // Kiểm tra độ dài mật khẩu
            if (matKhau.trim().length < 6) {
                alert("Mật khẩu phải có ít nhất 6 kí tự.");
                return false;
            }

            var dob = new Date(ngaySinh);
            var currentDate = new Date();
            if (dob >= currentDate) {
                alert("Ngày sinh phải trước ngày hiện tại.");
                return false;
            }

            $.ajax({
                url: '/khach_hang/update',
                type: 'POST',
                data: {
                    id: id,
                    tenKhachHang: tenKhachHang,
                    gioiTinh: gioiTinh,
                    ngaySinh: ngaySinh,
                    sdt: sdt,
                    email: email,
                    matKhau: matKhau,
                    trangThai: trangThai,

                },
                success: function (response) {
                    if (response === "ok") {
                        window.location.reload(); // Load lại trang nếu thành công
                        alert("Thành Công")
                    }
                    // else if (response === "errorEmail") {
                    //     alert("Email Đã tồn tại");
                    // } else if (response === "errorTen") {
                    //     alert("Sdt Đã Tồn Tại");
                    // }
                },
                error: function (error) {
                    console.error("Có lỗi xảy ra:", error);
                }
            });

        }
</script>
</body>

</html>

