<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    /* =========== Google Fonts ============ */
    @import url("https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap");

    /* =============== Globals ============== */
    * {
        font-family: "Ubuntu", sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    :root {
        --blue: #2a2185;
        --white: #fff;
        --gray: #f5f5f5;
        --black1: #222;
        --black2: #999;
    }

    body {
        min-height: 100vh;
        overflow-x: hidden;
    }

    .container {
        position: relative;
        width: 100%;
    }

    /* =============== Navigation ================ */
    .navigation {
        position: fixed;
        width: 300px;
        height: 100%;
        background: var(--blue);
        border-left: 10px solid var(--blue);
        transition: 0.5s;
        overflow: hidden;
    }

    .navigation.active {
        width: 80px;
    }

    .navigation ul {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
    }

    .navigation ul li {
        position: relative;
        width: 100%;
        list-style: none;
        border-top-left-radius: 30px;
        border-bottom-left-radius: 30px;
    }

    .navigation ul li:hover,
    .navigation ul li.hovered {
        background-color: var(--white);
    }

    .navigation ul li:nth-child(1) {
        margin-bottom: 40px;
        pointer-events: none;
    }

    .navigation ul li a {
        position: relative;
        display: block;
        width: 100%;
        display: flex;
        text-decoration: none;
        color: var(--white);
    }

    .navigation ul li:hover a,
    .navigation ul li.hovered a {
        color: var(--blue);
    }

    .navigation ul li a .icon {
        position: relative;
        display: block;
        min-width: 60px;
        height: 60px;
        line-height: 75px;
        text-align: center;
    }

    .navigation ul li a .icon ion-icon {
        font-size: 1.75rem;
    }

    .navigation ul li a .title {
        position: relative;
        display: block;
        padding: 0 10px;
        height: 60px;
        line-height: 60px;
        text-align: start;
        white-space: nowrap;
    }

    /* --------- curve outside ---------- */
    .navigation ul li:hover a::before,
    .navigation ul li.hovered a::before {
        content: "";
        position: absolute;
        right: 0;
        top: -50px;
        width: 50px;
        height: 50px;
        background-color: transparent;
        border-radius: 50%;
        box-shadow: 35px 35px 0 10px var(--white);
        pointer-events: none;
    }

    .navigation ul li:hover a::after,
    .navigation ul li.hovered a::after {
        content: "";
        position: absolute;
        right: 0;
        bottom: -50px;
        width: 50px;
        height: 50px;
        background-color: transparent;
        border-radius: 50%;
        box-shadow: 35px -35px 0 10px var(--white);
        pointer-events: none;
    }

    /* ===================== Main ===================== */
    .main {
        position: absolute;
        width: calc(100% - 300px);
        left: 300px;
        min-height: 100vh;
        background: var(--white);
        transition: 0.5s;
    }

    .main.active {
        width: calc(100% - 80px);
        left: 80px;
    }

    .topbar {
        width: 100%;
        height: 60px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 10px;
    }

    .toggle {
        position: relative;
        width: 60px;
        height: 60px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 2.5rem;
        cursor: pointer;
    }

    .search {
        position: relative;
        width: 400px;
        margin: 0 10px;
    }

    .search label {
        position: relative;
        width: 100%;
    }

    .search label input {
        width: 100%;
        height: 40px;
        border-radius: 40px;
        padding: 5px 20px;
        padding-left: 35px;
        font-size: 18px;
        outline: none;
        border: 1px solid var(--black2);
    }

    .search label ion-icon {
        position: absolute;
        top: 0;
        left: 10px;
        font-size: 1.2rem;
    }

    .user {
        position: relative;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        overflow: hidden;
        cursor: pointer;
    }

    .user img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    /* ======================= Cards ====================== */
    .cardBox {
        position: relative;
        width: 100%;
        padding: 20px;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-gap: 30px;
    }

    .cardBox .card {
        position: relative;
        background: var(--white);
        padding: 30px;
        border-radius: 20px;
        display: flex;
        justify-content: space-between;
        cursor: pointer;
        box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
    }

    .cardBox .card .numbers {
        position: relative;
        font-weight: 500;
        font-size: 2.5rem;
        color: var(--blue);
    }

    .cardBox .card .cardName {
        color: var(--black2);
        font-size: 1.1rem;
        margin-top: 5px;
    }

    .cardBox .card .iconBx {
        font-size: 3.5rem;
        color: var(--black2);
    }

    .cardBox .card:hover {
        background: var(--blue);
    }

    .cardBox .card:hover .numbers,
    .cardBox .card:hover .cardName,
    .cardBox .card:hover .iconBx {
        color: var(--white);
    }

    /* ================== Charts JS ============== */
    .chartsBx {
        position: relative;
        width: 100%;
        padding: 20px;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        grid-gap: 30px;
    }

    .chartsBx .chart {
        position: relative;
        background: #fff;
        padding: 20px;
        width: 100%;
        max-width: 100%;
        box-sizing: border-box;
        box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
        border-radius: 20px;
        border: 1px solid var(--blue);
    }

    .chart-title {
        color: var(--blue);
        text-align: center;
        margin-bottom: 10px;
    }


    /* ================== Order Details List ============== */
    .details {
        position: relative;
        width: 100%;
        padding: 20px;
        display: grid;
        grid-template-columns: 2fr 1fr;
        grid-gap: 30px;
        /* margin-top: 10px; */
    }

    .details .recentOrders {
        position: relative;
        display: grid;
        min-height: 500px;
        background: var(--white);
        padding: 20px;
        box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
        border-radius: 20px;
    }

    .details .cardHeader {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
    }

    .cardHeader h2 {
        font-weight: 600;
        color: var(--blue);
    }

    .cardHeader .btn {
        position: relative;
        padding: 5px 10px;
        background: var(--blue);
        text-decoration: none;
        color: var(--white);
        border-radius: 6px;
    }

    .details table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    .details table thead td {
        font-weight: 600;
    }

    .details .recentOrders table tr {
        color: var(--black1);
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    }

    .details .recentOrders table tr:last-child {
        text-align: center;
        border-bottom: none;
    }

    .details .recentOrders table tbody tr:hover {
        background: var(--blue);
        color: var(--white);
    }

    .details .recentOrders table tr td {
        text-align: center;
        padding: 10px;
    }

    .details .recentOrders table tr td:last-child {
        text-align: center;
    }

    .details .recentOrders table tr td:nth-child(2) {
        text-align: left;
    }

    .details .recentOrders table tr td:nth-child(3) {
        text-align: center;
    }

    .status.delivered {
        padding: 2px 4px;
        background: #8de02c;
        color: var(--white);
        border-radius: 4px;
        font-size: 14px;
        font-weight: 500;
    }

    .status.pending {
        padding: 2px 4px;
        background: #e9b10a;
        color: var(--white);
        border-radius: 4px;
        font-size: 14px;
        font-weight: 500;
    }

    .status.return {
        padding: 2px 4px;
        background: #f00;
        color: var(--white);
        border-radius: 4px;
        font-size: 14px;
        font-weight: 500;
    }

    .status.inProgress {
        padding: 2px 4px;
        background: #1795ce;
        color: var(--white);
        border-radius: 4px;
        font-size: 14px;
        font-weight: 500;
    }

    .recentCustomers {
        position: relative;
        /*display: grid;*/
        min-height: 500px;
        padding: 20px;
        background: var(--white);
        box-shadow: 0 7px 25px rgba(0, 0, 0, 0.08);
        border-radius: 20px;
    }

    .recentCustomers .imgBx {
        position: relative;
        width: 40px;
        height: 40px;
        border-radius: 50px;
        overflow: hidden;
    }

    .recentCustomers .imgBx img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .recentCustomers table tr td {
        padding: 12px 10px;
    }

    .recentCustomers table tr td h4 {
        font-size: 16px;
        font-weight: 500;
        line-height: 1.2rem;
    }

    .recentCustomers table tr td h4 span {
        font-size: 14px;
        color: var(--black2);
    }

    .recentCustomers table tr:hover {
        background: var(--blue);
        color: var(--white);
    }

    .recentCustomers table tr:hover td h4 span {
        color: var(--white);
    }


    /* ====================== Responsive Design ========================== */
    @media (max-width: 991px) {
        .chartsBx {
            grid-template-columns: 1fr;
            height: auto;
        }

        .navigation {
            left: -300px;
        }

        .navigation.active {
            width: 300px;
            left: 0;
        }

        .main {
            width: 100%;
            left: 0;
        }

        .main.active {
            left: 300px;
        }

        .cardBox {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    @media (max-width: 768px) {
        .details {
            grid-template-columns: 1fr;
        }

        .recentOrders {
            overflow-x: auto;
        }

        .status.inProgress {
            white-space: nowrap;
        }
    }

    @media (max-width: 480px) {
        .cardBox {
            grid-template-columns: repeat(1, 1fr);
        }

        .cardHeader h2 {
            font-size: 20px;
        }

        .user {
            min-width: 40px;
        }

        .navigation {
            width: 100%;
            left: -100%;
            z-index: 1000;
        }

        .navigation.active {
            width: 100%;
            left: 0;
        }

        .toggle {
            z-index: 10001;
        }

        .main.active .toggle {
            color: #fff;
            position: fixed;
            right: 0;
            left: initial;
        }
    }

    /* Hiệu ứng hover */
    .chart-title select:hover {
        background-color: #f0f0f0; /* Màu nền hover */
    }

    .required {
        color: red;
        margin-left: 5px;
    }

</style>
<!-- Bootstrap Icons CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>

<div class="main">
    <div class="container">
        <!-- Form -->
        <div class="title text-center pt-5">
            <h2 class="position-relative d-inline-block">QUẢN LÝ SLIDE SHOW</h2>
        </div>
        <div class="row">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-outline-secondary mt-5 rounded-pill" data-bs-toggle="modal"
                    data-bs-target="#exampleModal">
                <i class="bi bi-bag-plus-fill"></i> <span>THÊM SLIDE SHOW</span>
            </button>

        </div>
    </div>


    <!-- Bảng -->
    <div class="row mt-5">
        <div class="col-md-12">
            <table class="table" id="dataTable">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tiêu đề trình chiếu văn bản</th>
                    <th>Nội dung tiêu đề</th>
                    <th>Ảnh</th>
                    <th>Link Chuyển Trang</th>
                    <th>Trạng Thái</th>
                    <th colspan="2">Hoạt động</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

</div>

<!-- Modal -->
<div class="modal modal-lg" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Silde Show</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="tieuDeSlideShow">Tiêu đề trình chiếu văn bản<span
                                    class="required">*</span></label>
                            <input type="text" id="tieuDeSlideShow" class="form-control">
                            <span id="tieuDeSlideShowError" class="error text-danger"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="noiDungTieuDe">Nội dung tiêu đề<span class="required">*</span></label>
                            <input type="text" id="noiDungTieuDe" class="form-control">
                            <span id="noiDungTieuDeError" class="error text-danger"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="urlHinhAnh">Hình ảnh<span class="required">*</span></label>
                            <input type="file" id="urlHinhAnh" class="form-control">
                            <span id="urlHinhAnhError" class="error text-danger"></span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="noiDungTieuDe">Link chuyển trang<span class="required">*</span></label>
                            <input type="text" id="linkChuyenTrang" class="form-control">
                            <span id="linkChuyenTrangError" class="error text-danger"></span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="trangThai">Trạng Thái</label>
                            <select id="trangThai" class="form-select" aria-label="Default select example">
                                <option value="1" selected>Hoạt động</option>
                                <option value="0">Không hoạt động</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                <button type="button" class="btn btn-primary" id="addSlideShow">Lưu</button>
            </div>
        </div>
    </div>
</div>


<div class="modal modal-lg" id="exampleModalEdit" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabell">Thông Tin Silde Show</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="idSlideShow">ID</label>
                            <input readonly type="text" id="idSlideShow" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="tieuDeSlideShow">Tiêu đề trình chiếu văn bản<span
                                    class="required">*</span></label>
                            <input type="text" id="tieuDeSlideShowEdit" class="form-control">
                            <span id="tieuDeSlideShowErrorEdit" class="error text-danger"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="noiDungTieuDe">Nội dung tiêu đề<span class="required">*</span></label>
                            <input type="text" id="noiDungTieuDeEdit" class="form-control">
                            <span id="noiDungTieuDeErrorEdit" class="error text-danger"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="urlHinhAnh">Hình ảnh<span class="required">*</span></label>
                            <input type="file" id="urlHinhAnhEdit" class="form-control">
                            <span id="urlHinhAnhErrorEdit" class="error text-danger"></span>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <img src="" id="hinhAnhEditShow" style="max-width: 100px; max-height: 60px" alt="Hình ảnh">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="noiDungTieuDe">Link chuyển trang<span class="required">*</span></label>
                            <input type="text" id="linkChuyenTrangEdit" class="form-control">
                            <span id="linkChuyenTrangErrorEdit" class="error text-danger"></span>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="trangThaiEdit">Trạng Thái</label>
                            <select id="trangThaiEdit" class="form-select" aria-label="Default select example">
                                <option value="1" selected>Hoạt động</option>
                                <option value="0">Không hoạt động</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                <button type="button" class="btn btn-primary" id="EditSlideShow">Lưu</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<!-- ======= Charts JS ====== -->
<!-- <script src="chartsJS.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<%-- jquery--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    $(document).ready(function () {
        hienThiSlideShow();

        $("#addSlideShow").on("click", function () {
            postDataToController();
        });
    });

    $("#EditSlideShow").on("click", function () {
        var id = $('#idSlideShow').val();
        var tieuDeSlideShow = $('#tieuDeSlideShowEdit').val();
        var noiDungTieuDe = $('#noiDungTieuDeEdit').val();
        var linkChuyenTrang = $('#linkChuyenTrangEdit').val();
        var trangThai = $('#trangThaiEdit').val();

        // Kiểm tra validate
        if (tieuDeSlideShow.trim() === '') {
            $('#tieuDeSlideShowErrorEdit').text('Vui lòng nhập tiêu đề trình chiếu văn bản');
            return;
        } else {
            $('#tieuDeSlideShowErrorEdit').text('');
        }

        if (noiDungTieuDe.trim() === '') {
            $('#noiDungTieuDeErrorEdit').text('Vui lòng nhập nội dung tiêu đề');
            return;
        } else {
            $('#noiDungTieuDeErrorEdit').text('');
        }

        var fileInput = $('#urlHinhAnhEdit')[0].files[0];


        var formData = new FormData();
        formData.append('idSlide', id);
        formData.append('textCollectionTitle', tieuDeSlideShow);
        formData.append('textNewArrivals', noiDungTieuDe);
        formData.append('linkChuyenTrang', linkChuyenTrang);
        formData.append('trangThai', trangThai);
        if (fileInput) {
            formData.append('hinhAnh', fileInput);
        }

        $.ajax({
            type: "POST",
            url: "/sixdo-shop/slide-show/sua",
            processData: false,
            contentType: false,
            data: formData,
            success: function (data) {
                Swal.fire({
                    icon: 'success',
                    title: 'Sửa Thành công',
                    showConfirmButton: false,
                    timer: 1500
                }).then(() => {
                    location.reload();
                });
            },
            error: function () {
                Swal.fire({
                    icon: 'error',
                    title: 'Đã có lỗi xảy ra',
                    showConfirmButton: false,
                    timer: 1500
                });
            }
        });
    });

    $(document).on('click', '.btn-edit-slide-show', function () {
        var slideShowId = $(this).data("id");
        $.ajax({
            type: "POST",
            url: "/sixdo-shop/slide-show/findById",
            data: {id: slideShowId},
            success: function (data) {
                if (data != null) {
                    var backgroundImageUrl = '${pageContext.request.contextPath}/../' + data.urlHinhAnh + ';'
                    $("#idSlideShow").val(data.id);
                    $("#tieuDeSlideShowEdit").val(data.textCollectionTitle);
                    $("#noiDungTieuDeEdit").val(data.textNewArrivals);
                    $("#linkChuyenTrangEdit").val(data.linkChuyenTrang);
                    $("#hinhAnhEditShow").attr("src", backgroundImageUrl);
                    $("#trangThaiEdit").val(data.trangThai);
                    $('#exampleModalEdit').modal('show');
                } else {
                    Swal.fire({
                        icon: 'success',
                        title: 'Lỗi không sửa được',
                        showConfirmButton: false,
                        timer: 1500
                    })
                }
            },
            error: function () {
                Swal.fire({
                    icon: 'error',
                    title: 'Đã có lỗi xảy ra',
                    showConfirmButton: false,
                    timer: 1500
                });
            }
        });

    });

    $(document).on('click', '.btn-delete-slide-show', function () {
        var id = $(this).data("id");
        $.ajax({
            type: "POST",
            url: "/sixdo-shop/slide-show/delete",
            data: {id: id},
            success: function (data) {
                Swal.fire({
                    icon: 'success',
                    title: 'Xoá Thành công',
                    showConfirmButton: false,
                    timer: 1500
                }).then(() => {
                    hienThiSlideShow();
                });
            },
            error: function () {
                Swal.fire({
                    icon: 'error',
                    title: 'Đã có lỗi xảy ra',
                    showConfirmButton: false,
                    timer: 1500
                });
            }
        });
    });


    function hienThiSlideShow() {
        // Sử dụng jQuery để gọi endpoint và nhận dữ liệu SlideShow từ server
        $.get("/sixdo-shop/slide-show/show", function (data) {
            // Xóa dữ liệu cũ trong bảng
            $('#dataTable tbody').empty();

            // Lặp qua danh sách SlideShow và thêm từng dòng vào bảng
            var index = 1;
            data.forEach(function (slideShow) {
                var csss = '';
                if (slideShow.trangThai === 1) {
                    csss = 'status delivered'
                } else {
                    csss = 'status return'
                }
                var backgroundImageUrl = '${pageContext.request.contextPath}/../' + slideShow.urlHinhAnh + ';'
                var row = "<tr>" +
                    "<th>" + index + "</th>" +
                    "<td>" + slideShow.textCollectionTitle + "</td>" +
                    "<td>" + slideShow.textNewArrivals + "</td>" +
                    "<td><img src='" + backgroundImageUrl + "' alt='Image' style='max-width: 100px; height: 50px; max-height: 60px'></td>" +
                    "<td>" + slideShow.linkChuyenTrang + "</td>" +
                    "<td><span class='" + csss + "'>" + (slideShow.trangThai === 1 ? "Hoạt động" : "Không hoạt động") + "</span></td>" +
                    "<td><button class='btn btn-primary btn-edit-slide-show' data-id='" + slideShow.id + "' >Sửa</button></td>" +
                    "<td><button class='btn btn-danger btn-delete-slide-show' data-id='" + slideShow.id + "'>Xoá</button></td>" +
                    "</tr>";
                $('#dataTable tbody').append(row);
                index += 1;
            });
        });

    }

    function postDataToController() {
        var tieuDeSlideShow = $('#tieuDeSlideShow').val();
        var noiDungTieuDe = $('#noiDungTieuDe').val();
        var linkChuyenTrang = $('#linkChuyenTrang').val();
        var trangThai = $('#trangThai').val();

        // Kiểm tra validate
        if (tieuDeSlideShow.trim() === '') {
            $('#tieuDeSlideShowError').text('Vui lòng nhập tiêu đề trình chiếu văn bản');
            return;
        } else {
            $('#tieuDeSlideShowError').text('');
        }

        if (noiDungTieuDe.trim() === '') {
            $('#noiDungTieuDeError').text('Vui lòng nhập nội dung tiêu đề');
            return;
        } else {
            $('#noiDungTieuDeError').text('');
        }

        var fileInput = $('#urlHinhAnh')[0].files[0];
        if (!fileInput) {
            $('#urlHinhAnhError').text('Vui lòng chọn hình ảnh');
            return;
        } else {
            $('#urlHinhAnhError').text('');
        }


        var formData = new FormData();
        formData.append('textCollectionTitle', tieuDeSlideShow);
        formData.append('textNewArrivals', noiDungTieuDe);
        formData.append('hinhAnh', fileInput);
        formData.append('linkChuyenTrang', linkChuyenTrang);
        formData.append('trangThai', trangThai);

        $.ajax({
            type: "POST",
            url: "/sixdo-shop/slide-show/add",
            processData: false,
            contentType: false,
            data: formData,
            success: function (data) {
                Swal.fire({
                    icon: 'success',
                    title: 'Thêm Thành công',
                    showConfirmButton: false,
                    timer: 1500
                }).then(() => {
                    location.reload();
                });
            },
            error: function () {
                Swal.fire({
                    icon: 'error',
                    title: 'Đã có lỗi xảy ra',
                    showConfirmButton: false,
                    timer: 1500
                });
            }
        });
    }

</script>


<!-- ====== ionicons ======= -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>