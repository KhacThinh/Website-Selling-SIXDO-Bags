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
        <h2 class="position-relative d-inline-block">QUẢN LÝ THƯƠNG HIỆU</h2>
    </div>
    <div class="row">
        <button type="button" class="btn btn-outline-secondary mt-5 rounded-pill" data-bs-toggle="modal"
                data-bs-target="#modalAddThuongHieu">
            <i class="bi bi-bag-plus-fill"></i> <span>THÊM THƯƠNG HIỆU</span>
        </button>
        <jsp:include page="./them-thuong-hieu-modal.jsp"/>
    </div>
</div>
<div class="container">
    <div id="test">
        <table class="table table-sm table-hover table-striped mb-5">
            <thead>
            <tr>
                <th scope="col">MÃ</th>
                <th scope="col">TÊN</th>
                <th scope="col">TRẠNG THÁI</th>
                <th scope="col">HOẠT ĐỘNG</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ listThuongHieu }" var="th" varStatus="i">
                <tr>
                    <td>${th.ma}</td>
                    <td>${th.ten}</td>
                    <td>${th.trangThai == true ? 'Hoạt Động' : 'Không Hoạt Động'}</td>


                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                                <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                        data-bs-target="#modalUpdate${th.id}"><i
                                        class="bi bi-pencil"></i> Sửa
                                </button>
                            <li>
                                <%--                            <a class="dropdown-item delete-color" href="/mau-sac/delete/${sp.id}" ><i class="bi bi-trash3"></i> Xóa</a>--%>
                            <a class="dropdown-item delete-color" href="#" onclick="xoaThuongHieu(${th.id})"><i class="bi bi-trash3"></i> Xóa</a>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                        </ul>

<%--                        Modal update--%>
                        <div class="modal fade" id="modalUpdate${th.id}" tabindex="-1"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Thương Hiệu</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group" hidden>
                                            <label  class="form-label">Id
                                                <span>*</span></label>
                                            <input value="${th.id}" name="id" id="id" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="modal-body">
                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label  class="form-label">Mã
                                                            <span>*</span></label>
                                                        <input value="${th.ma}" name="ma" id="maUpdate${th.id}" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label  class="form-label">Tên Thương Hiệu
                                                        <span>*</span></label>
                                                    <input value="${th.ten}" name="ten" id="tenUpdate${th.id}" class="form-control"/>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label  class="form-label">Trạng thái
                                                    <span>*</span></label>
                                                <select name="trangThai" id="trangThaiUpdate${th.id}" class="form-control">
                                                    <option value="true">Hoạt động</option>
                                                    <option value="false">Không hoạt động</option>
                                                </select>
<%--                                                <input value="${th.trangThai}" name="trangThai" id="trangThaiUpdate${th.id}" class="form-control"/>--%>
                                                </div>
                                        </div>
                                                </div>
                                            <div class="modal-footer justify-content-between">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                    Thoát
                                                </button>
                                                <button type="submit" id="uploadButton" class="btn btn-primary" onclick="updateThuongHieu(${th.id})">Lưu</button>
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
    function xoaThuongHieu(idThuongHieu) {
        var confirmation = confirm("Bạn có chắc chắn muốn xóa danh mục này?");
        if (confirmation) {
            $.ajax({
                url: '/thuong-hieu/xoa-thuong-hieu',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({idThuongHieu: idThuongHieu}),
                success: function (response) {
                    window.location.reload(); // Load lại trang sau khi xóa
                },
                error: function (error) {
                    console.error("Lỗi khi xóa thương hiệu:", error);
                }
            });
        }
    }

    function addThuongHieu() {
        var ma = document.getElementById("ma").value;
        var ten = document.getElementById("ten").value;
        var trangThai = document.getElementById("trangThai").value;
        console.log(ma);
        console.log(ten);
        if (ma.trim() === "" || ten.trim() === "") {
            alert("Vui lòng điền đầy đủ thông tin cho Mã Thương Hiệu và Tên Thương Hiệu.");
            return false;
        }
        $.ajax({
            url: '/thuong-hieu/add',
            type: 'POST',
            data: {
                ma: ma,
                ten: ten,
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

    function updateThuongHieu(id) {
        var ma = document.getElementById("maUpdate" + id).value;
        var ten = document.getElementById("tenUpdate" + id).value;
        var trangThai = document.getElementById("trangThaiUpdate" + id).value;


        console.log(ma);
        if (ma.trim() === "" || ten.trim() === "") {
            alert("Vui lòng điền đầy đủ thông tin cho Mã Thương Hiệu và Tên Thương Hiệu.");
            return false;
        }

        $.ajax({
            url: '/thuong-hieu/update',
            type: 'POST',
            data: {
                id: id,
                ma: ma,
                ten: ten,
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

<
</body>

</html>
