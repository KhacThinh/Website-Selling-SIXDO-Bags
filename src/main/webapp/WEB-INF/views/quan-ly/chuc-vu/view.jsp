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
        .custom-select {
            position: relative;
            display: inline-block;
        }

        .toggle-input {
            display: none;
        }

        .toggle-label {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }

        .options {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            width: 100%;
            z-index: 999;
            border: 1px solid #ced4da;
            border-top: none;
            border-radius: 0 0 0.25rem 0.25rem;
            background-color: #fff;
        }

        .option {
            padding: 0.375rem 0.75rem;
            cursor: pointer;
        }

        .option:hover {
            background-color: #f8f9fa;
        }

        .toggle-input:checked + .toggle-label + .options {
            display: block;
        }
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
        <h2 class="position-relative d-inline-block">QUẢN LÝ MÀU SẮC</h2>
    </div>
<%--    <div class="row">--%>
<%--        <button type="button" class="btn btn-outline-secondary mt-5 rounded-pill" data-bs-toggle="modal"--%>
<%--                data-bs-target="#modalAddChucVu">--%>
<%--            <i class="bi bi-bag-plus-fill"></i> <span>THÊM SẢN PHẨM</span>--%>
<%--        </button>--%>
<%--        <jsp:include page="them-chuc-vu.jsp"/>--%>
<%--    </div>--%>
</div>
<div class="container">
    <div id="test">
        <table class="table table-sm table-hover table-striped mb-5">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">MÃ CHỨC VỤ</th>
                <th scope="col">TÊN CHỨC VỤ</th>
                <th scope="col">TRẠNG THÁI</th>
                <th scope="col">HOẠT ĐỘNG</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listColors}" var="sp" varStatus="i">
                <tr id="record_${sp.id}">
                    <td>${i.index + 1}</td>
                    <td>${sp.maChucVu}</td>
                    <td>${sp.tenChucVu}</td>
                    <td>${sp.trangThai == true ? 'Hoạt Động' : 'Không Hoạt Động'}</td>


                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
<%--                        <ul class="dropdown-menu">--%>
<%--                            <li>--%>
<%--                            <li>--%>
<%--                            <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modalUpdateCV${sp.id}"><i class="bi bi-pencil"></i> Sửa--%>
<%--                            </button>--%>
<%--                        </li>--%>

<%--                            </li>--%>
<%--                            <a class="dropdown-item delete-color" href="#" onclick="xoaChucVu(${sp.id})"><i class="bi bi-trash3"></i> Xóa</a>--%>
<%--                            <li>--%>
<%--                                <hr class="dropdown-divider">--%>
<%--                            </li>--%>
<%--                        </ul>--%>



<%--                        update--%>

                        <div class="modal fade" id="modalUpdateCV${sp.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Chức Vụ</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="mb-3 row">
                                                <label for="maUpdate${sp.id}" class="col-sm-3 col-form-label">Mã Chức Vụ <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input value="${sp.maChucVu}" name="maChucVu" id="maUpdate${sp.id}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label for="tenUpdate${sp.id}" class="col-sm-3 col-form-label">Tên Chức Vụ <span>*</span></label>
                                                <div class="col-sm-9">
                                                    <input value="${sp.tenChucVu}" name="tenChucVu" id="tenUpdate${sp.id}" class="form-control">
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
                                        <button type="submit" id="uploadButton" class="btn btn-primary" onclick="updateChucVu(${sp.id})">Lưu</button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

<script>
    function xoaChucVu(idChucVu) {
        $.ajax({
            url: '/chuc-vu/delete',
            type: 'POST',
            data: ({idChucVu: idChucVu}),
            success: function (response) {
                $('#record_' + idChucVu).remove();
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

    function addChucVu() {
        var maChucVu = document.getElementById("maChucVu").value;
        var tenChucVu = document.getElementById("tenChucVu").value;
        var trangThai = document.getElementById("trangThai").value;
        console.log(maChucVu);
        console.log(tenChucVu);
        if (maChucVu.trim() === "" || tenChucVu.trim() === "") {
            toastr.error("Vui lòng điền đầy đủ thông tin cho Mã Chức Vụ và Tên Chức Vụ.");
            return false;
        }
        $.ajax({
            url: '/chuc-vu/add',
            type: 'POST',
            data: {
                maChucVu: maChucVu,
                tenChucVu: tenChucVu,
                trangThai: trangThai,
            },
            success: function (response) {
                if (response === "ok") {
                    Swal.fire({
                        title: "Good job!",
                        text: "Thêm Thành Công!",
                        icon: "success"
                    }).then((result) => {
                        if (result.isConfirmed || result.isDismissed) {
                            window.location.reload(); // Load lại trang nếu thành công
                        }
                    });
                } else if (response === "errorMa") {
                    toastr.error("mã trùng");
                } else if (response === "errorTen") {
                    toastr.error("Trùng Tên");
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
                toastr.error("Có lỗi xảy ra");
            }
        });

    }

    function updateChucVu(id) {
        var maChucVu = document.getElementById("maUpdate" + id).value;
        var tenChucVu = document.getElementById("tenUpdate" + id).value;
        var trangThai = document.getElementById("trangThaiUpdate" + id).value;


        console.log(maChucVu);
        if (maChucVu.trim() === "" || tenChucVu.trim() === "") {
            toastr.error("Vui lòng điền đầy đủ thông tin cho Mã Chức Vụ và Tên Chức Vụ.");
            return false;
        }

        $.ajax({
            url: '/chuc-vu/update',
            type: 'POST',
            data: {
                id: id,
                maChucVu: maChucVu,
                tenChucVu: tenChucVu,
                trangThai: trangThai,

            },
            success: function (response) {
                if (response === "ok") {
                    Swal.fire({
                        title: "Good job!",
                        text: "Sửa Thành Công!",
                        icon: "success"
                    }).then((result) => {
                        if (result.isConfirmed || result.isDismissed) {
                            window.location.reload(); // Load lại trang nếu thành công
                        }
                    });
                } else if (response === "errorMa") {
                    toastr.error("Mã trùng");
                } else if (response === "errorTen") {
                    toastr.error("Trùng Tên");
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
                toastr.error("Có lỗi xảy ra");
            }
        });

    }
</script>
</body>

</html>

