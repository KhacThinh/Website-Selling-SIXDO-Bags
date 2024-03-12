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
        /* CSS styles */
        #test th,
        #test td {
            font-size: smaller; /* Hoặc bạn có thể sử dụng kích thước chữ mong muốn */
        }
        /* CSS styles */
        #test th {
            border-bottom: 1px #007bff dashed; /* Màu và kiểu của đường vạch ngăn cách */
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>
<div class="container">
    <div class="title text-center pt-5">
        <h2 class="position-relative d-inline-block">QUẢN LÝ NHÂN VIÊN</h2>
    </div>
    <div class="row">
        <button type="button" class="btn btn-outline-secondary mt-5 rounded-pill" data-bs-toggle="modal"
                data-bs-target="#modalAddNhanVien">
            <i class="bi bi-bag-plus-fill"></i> <span>THÊM NHÂN VIÊN</span>
        </button>
        <jsp:include page="them-nhan-vien.jsp"/>
    </div>
</div>
<div class="container">
    <div id="test">
        <table class="table table-sm table-hover table-striped mb-5">
            <thead>
            <tr >
                <th scope="col">Chức Vụ</th>
                <th scope="col">Tên Đăng Nhập</th>
                <th scope="col">Mã </th>
                <th scope="col">Họ tên</th>
                <th scope="col">Ngày Sinh</th>
                <th scope="col">SDT</th>
<%--                <th scope="col">EMAIL</th>--%>
                <th scope="col">Mật Khẩu</th>
                <th scope="col">Quê Quán</th>
                <th scope="col">CCCD</th>
                <th scope="col">ONL</th>
                <th scope="col">OFF</th>
                <th scope="col">Trạng Thái</th>
                <th scope="col">Khác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listColors}" var="sp" varStatus="i">
                <tr id="record_${sp.id}">
                    <td>${sp.chucVu.tenChucVu}</td>
                    <td>${sp.taiKhoan.tenDangNhap}</td>
                    <td>${sp.maNhanVien}</td>
                    <td>${sp.hoTen}</td>
                    <td>${sp.ngaySinh}</td>
                    <td>${sp.sdt}</td>
<%--                    <td>${sp.email}</td>--%>
                    <td>${sp.matKhau}</td>
                    <td>${sp.queQuan}</td>
                    <td>${sp.cccd}</td>
                    <td>${sp.thoiGianVao}</td>
                    <td>${sp.thoiGianRa}</td>
                    <td>${sp.trangThai == 1 ? 'Hoạt Động' : 'Không Hoạt Động'}</td>


                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                            <li>
                            <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modalUpdateNhanVien${sp.id}"><i class="bi bi-pencil"></i> Sửa
                            </button>
                        </li>

                            </li>
                                <%--                            <a class="dropdown-item delete-color" href="/mau-sac/delete/${sp.id}" ><i class="bi bi-trash3"></i> Xóa</a>--%>
                            <a class="dropdown-item delete-color" href="#" onclick="xoaNhanVien(${sp.id})"><i class="bi bi-trash3"></i> Xóa</a>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>


                        <div class="modal fade" id="modalUpdateNhanVien${sp.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Nhân Viên</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="mb-3 row">
                                                <label for="chucVu" class="col-sm-3 col-form-label">Chức Vụ</label>
                                                <div class="col-sm-9">
                                                    <select id="chucVuUpdate${sp.id}" name="chucVu" class="form-select">
                                                        <c:forEach items="${listColors2}" var="cv">
                                                            <option value="${cv.id}" ${cv.id==sp.chucVu.id ? 'selected':''}>${cv.tenChucVu}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="mb-3 row">
                                                <label for="maNhanVien" class="col-sm-3 col-form-label">Mã Nhân Viên <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="maNhanVien" id="maUpdate${sp.id}" value="${sp.maNhanVien}">
                                                </div>
                                            </div>

                                            <div class="mb-3 row">
                                                <label for="hoTen" class="col-sm-3 col-form-label">Họ Tên <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="hoTen" id="tenUpdate${sp.id}" value="${sp.hoTen}">
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
                                                <label for="cccd" class="col-sm-3 col-form-label">Số Căn Cước <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="cccd"  class="form-control" id="cccdUpdate${sp.id}" value="${sp.cccd}">
                                                </div>
                                            </div>

                                            <div class="mb-3 row">
                                                <label for="queQuan" class="col-sm-3 col-form-label">Số Căn Cước <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="queQuan"  class="form-control" id="queQuanUpdate${sp.id}" value="${sp.queQuan}">
                                                </div>
                                            </div>

                                            <div class="mb-3 row">
                                                <label for="thoiGianVao" class="col-sm-3 col-form-label">Thời Gian Vào <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="thoiGianVao" type="datetime-local" class="form-control" id="thoiGianVaoUpdate${sp.id}" value="${sp.thoiGianVao}">
                                                </div>
                                            </div>

                                            <div class="mb-3 row">
                                                <label for="thoiGianRa" class="col-sm-3 col-form-label">Thời Gian Ra <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input name="thoiGianRa" type="datetime-local" class="form-control" id="thoiGianRaUpdate${sp.id}" value="${sp.thoiGianRa}">
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
                                        <button type="submit" id="uploadButton" class="btn btn-primary" onclick="updateNhanVien(${sp.id})">Lưu</button>
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
    function xoaNhanVien(idNhanVien) {
        $.ajax({
            url: '/nhan-vien/delete',
            type: 'POST',
            data: ({idNhanVien: idNhanVien}),
            success: function (response) {
                $('#record_' + idNhanVien).remove();
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

    function addNhanVien() {
        var maNhanVien = document.getElementById("maNhanVien").value;
        var hoTen = document.getElementById("hoTen").value;
        var ngaySinh = document.getElementById("ngaySinh").value;
        var sdt = document.getElementById("sdt").value;
        var email = document.getElementById("email").value;
        var matKhau = document.getElementById("matKhau").value;
        var queQuan= document.getElementById("queQuan").value;
        var cccd = document.getElementById("cccd").value;
        var thoiGianVao = document.getElementById("thoiGianVao").value;
        var thoiGianRa = document.getElementById("thoiGianRa").value;
        var gioiTinh = document.getElementById("gioiTinh").value;
        var trangThai = document.getElementById("trangThai").value;
        var chucVu = document.getElementById("chucVu").value;



        // console.log(maGiamGia);
        // console.log(tenMaGiamGia);
        if (maNhanVien.trim() === ""
            || hoTen.trim() === ""
            || sdt.trim() === ""
            || email.trim() === ""
            || matKhau.trim() === ""
            || queQuan.trim() === ""

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

        var thoiGianVaoDate = new Date(thoiGianVao);
        var thoiGianRaDate = new Date(thoiGianRa);
        if (thoiGianVaoDate >= thoiGianRaDate) {
            alert("Thời Gian Ra phải sau Thời Gian Vào.");
            return false;
        }
        $.ajax({
            url: '/nhan-vien/add',
            type: 'POST',
            data: {
                id:chucVu,
                maNhanVien:maNhanVien,
                hoTen: hoTen,
                gioiTinh: gioiTinh,
                ngaySinh: ngaySinh,
                sdt: sdt,
                email: email,
                matKhau: matKhau,
                queQuan:queQuan,
                cccd:cccd,
                thoiGianVao:thoiGianVao,
                thoiGianRa : thoiGianRa,
                trangThai: trangThai,
            },
            success: function (response) {
                if (response === "ok") {
                    window.location.reload(); // Load lại trang nếu thành công
                } else if (response === "errorMa") {
                    alert("mã trùng");
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
            }




        });

    }


    function updateNhanVien(id) {

        var maNhanVien = document.getElementById("maUpdate" + id).value;
        var hoTen = document.getElementById("tenUpdate" + id).value;
        var gioiTinh = document.getElementById("gioiTinhUpdate" + id).value;
        var ngaySinh = document.getElementById("ngaySinhUpdate" + id).value;
        var sdt = document.getElementById("sdtUpdate" + id).value;
        var email = document.getElementById("emailUpdate" + id).value;
        var matKhau = document.getElementById("matKhauUpdate" + id).value;
        var cccd = document.getElementById("cccdUpdate" + id).value;
        var queQuan = document.getElementById("queQuanUpdate" + id).value;
        var thoiGianVao = document.getElementById("thoiGianVaoUpdate" + id).value;
        var thoiGianRa = document.getElementById("thoiGianRaUpdate" + id).value;
        var trangThai = document.getElementById("trangThaiUpdate" + id).value;
        var chucVu = document.getElementById("chucVuUpdate" + id).value;

        // console.log(maGiamGia);

        if( maNhanVien.trim() === ""
            || hoTen.trim() === ""
            || sdt.trim() === ""
            || email.trim() === ""
            || matKhau.trim() === ""
            || queQuan.trim() === ""
        ){
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
        var thoiGianVaoDate = new Date(thoiGianVao);
        var thoiGianRaDate = new Date(thoiGianRa);
        if (thoiGianVaoDate >= thoiGianRaDate) {
            alert("Thời Gian Ra phải sau Thời Gian Vào.");
            return false;
        }
        $.ajax({
            url: '/nhan-vien/update',
            type: 'POST',
            data: {
                id: id,
                maNhanVien: maNhanVien,
                hoTen: hoTen,
                gioiTinh: gioiTinh,
                ngaySinh: ngaySinh,
                sdt: sdt,
                email: email,
                matKhau: matKhau,
                cccd:cccd,
                queQuan:queQuan,
                thoiGianVao:thoiGianVao,
                thoiGianRa:thoiGianRa,
                trangThai: trangThai,
                idCV:chucVu

            },
            success: function (response) {
                if (response === "ok") {
                    window.location.reload(); // Load lại trang nếu thành công
                    alert("Thành Công")
                }else if (response === "errorMa") {
                    alert("mã trùng");
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

