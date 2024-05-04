<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="modal modal-xl" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Sản Phẩm</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form:form method="POST" action="/san-pham" modelAttribute="sanPhamRequest" id="addSanPhamForm"
                           enctype="multipart/form-data">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="tenSanPham">Tên Sản Phẩm<span class="required">*</span></label>
                                <form:input path="tenSanPham" id="tenSanPham" class="form-control"/>
                                <span id="tenSanPhamError" class="error text-danger"></span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="chatLieu">Chất Liệu<span class="required">*</span></label>
                                <form:input path="chatLieu" id="chatLieu" class="form-control"/>
                                <span id="chatLieuError" class="error text-danger"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="xuatXu">Xuất Xứ<span class="required">*</span></label>
                                <form:input path="xuatXu" id="xuatXu" class="form-control"/>
                                <span id="xuatXuError" class="error text-danger"></span>
                            </div>
                            <div class="form-group">
                                <label for="hinhAnh">Ảnh</label>
                                <input type="file" id="hinhAnh" name="hinhAnh" class="form-control"/>
                                <input type="hidden" name="anh" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="kichThuoc">Kích Thước (cm)<span
                                        class="required">*</span></label>
                                <form:input path="kichThuoc" id="kichThuoc" class="form-control"
                                            placeholder="RộngxDàixCao"/>
                                <span id="kichThuocError" class="error text-danger"></span>
                            </div>
                            <div class="form-group">
                                <label for="khoiLuong">Khối Lượng (gram)<span class="required">*</span></label>
                                <form:input path="khoiLuong" type="number" min="0" id="khoiLuong" class="form-control"/>
                                <span id="khoiLuongError" class="error text-danger"></span>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="moTa">Mô Tả</label>
                                <form:textarea path="moTa" id="moTa" class="form-control" style="height: 100px;"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="idThoiGianBaoHanh">Thời Gian Bảo Hành(Tháng)<span
                                        class="required">*</span></label>
                                <div class="input-group">
                                    <form:select path="idThoiGianBaoHanh" class="form-control">
                                        <form:option value="" label="Chọn Thời Gian Bảo Hành"/>
                                        <c:forEach items="${thoiGianBaoHanhForm}" var="tgbhForm">
                                            <option value="${tgbhForm.id}" ${tgbhForm.id == sp.thoiGianBaoHanh.id ? 'selected' : ''}>${tgbhForm.thoiGian}</option>
                                        </c:forEach>
                                    </form:select>
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal"
                                                data-bs-target="#modalAddTGBH">
                                            <i class="bi bi-plus-circle-fill"></i>
                                        </button>
                                    </div>
                                </div>
                                <span id="thoiGianBaoHanhError" class="error text-danger"></span>
                            </div>

                            <div class="form-group">
                                <label for="idThuongHieu">Thương Hiệu <span class="required">*</span></label>
                                <div class="input-group">
                                    <form:select path="idThuongHieu" class="form-control">
                                        <form:option value="" label="Chọn Thương Hiệu"/>
                                        <c:forEach items="${thuongHieuForm}" var="thForm">
                                            <option value="${thForm.id}" ${thForm.id == sp.thuongHieu.id ? 'selected' : ''}>${thForm.ten}</option>
                                        </c:forEach>
                                    </form:select>
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal"
                                                data-bs-target="#modalAddThuongHieu">
                                            <i class="bi bi-plus-circle-fill"></i>
                                        </button>
                                    </div>
                                </div>
                                <span id="thuongHieuError" class="error text-danger"></span>
                            </div>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="idDanhMuc">Danh Mục <span class="required">*</span></label>
                                <div class="input-group">
                                    <form:select path="idDanhMuc" class="form-control">
                                        <form:option value="" label="Chọn Danh Mục"/>
                                        <c:forEach items="${danhMucForm}" var="dmForm">
                                            <option value="${dmForm.id}" ${dmForm.id == sp.danhMuc.id ? 'selected' : ''}>${dmForm.tenDanhMuc}</option>
                                        </c:forEach>
                                    </form:select>
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal"
                                                data-bs-target="#modalAddDanhMuc">
                                            <i class="bi bi-plus-circle-fill"></i>
                                        </button>
                                    </div>
                                </div>
                                <span id="danhMucError" class="error text-danger"></span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="idDoiTuongSuDung">Đối Tượng Sử Dụng <span class="required">*</span></label>
                                <div class="input-group">
                                    <form:select path="idDoiTuongSuDung" class="form-control">
                                        <form:option value="" label="Chọn Đối Tượng Sử Dụng"/>
                                        <c:forEach items="${doiTuongSuDungForm}" var="dtsdForm">
                                            <option value="${dtsdForm.id}" ${dtsdForm.id == sp.doiTuongSuDung.id ? 'selected' : ''}>${dtsdForm.tenDoiTuongSuDung}</option>
                                        </c:forEach>
                                    </form:select>
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal"
                                                data-bs-target="#modalAddDTSD">
                                            <i class="bi bi-plus-circle-fill"></i>
                                        </button>
                                    </div>
                                    <span id="doiTuongSuDungError" class="error text-danger"></span>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                        <button type="submit" class="btn btn-primary" id="addSanPham">Lưu</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>


<div class="modal modal-xl" id="modalAddDanhMuc" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content formcon">
            <h1 style="font-size: 20px ; margin-top: 20px ;margin-left:250px ; font-family:sans-serif">Thông Tin Danh
                Mục</h1>
            <hr>
            <div class="modal-body1">
                <div class="form-container1">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="maDanhMuc">Mã Danh Mục</label><span class="red-star"> *</span>
                            <input id="maDanhMuc" class="form-control" style="background-color: #f2f2f2;"/>
                        </div>
                        <div class="form-group">
                            <label for="tenDanhMuc">Tên Danh Mục</label><span class="red-star"> *</span>
                            <input id="tenDanhMuc" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="trangThai">Trạng Thái:</label>
                            <select id="trangThai" name="trangThai" class="form-select" disabled>
                                <option value="1">Hoạt Động</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="table-container1">
                    <div id="test1">
                        <table class="table table-sm table-hover table-striped mb-5">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">MÃ DANH MỤC</th>
                                <th scope="col">TÊN DANH MỤC</th>
                                <th scope="col">TRẠNG THÁI</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listColors}" var="sp" varStatus="i">
                                <tr id="record_${sp.id}">
                                    <td>${i.index + 1}</td>
                                    <td>${sp.maDanhMuc}</td>
                                    <td>${sp.tenDanhMuc}</td>
                                    <td><span
                                            class="status ${sp.trangThai == true ? 'dangxuly' : 'pending'}">${sp.trangThai == true ? 'Hoạt Động' : 'Không Hoạt Động'}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="closeModal2()">Thoát
                </button>
                <button type="submit" class="btn btn-primary" id="them" value="submit" onclick="addDanhMuc()">Lưu
                </button>
            </div>
        </div>
    </div>
</div>


<%--tgbh--%>

<div class="modal modal-xl" id="modalAddTGBH" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content formcon">
            <h1 style="font-size: 20px;margin-top: 20px;margin-left:250px ; font-family:sans-serif">Thông Tin Bảo
                Hành</h1>
            <hr>
            <div class="modal-body1">
                <div class="form-container1">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="ma">Mã Bảo Hành</label><span class="red-star"> *</span>
                            <input id="ma" class="form-control" style="background-color: #f2f2f2;"/>
                        </div>
                        <div class="form-group">
                            <label for="thoiGian">Thời Gian</label><span class="red-star"> *</span>
                            <input id="thoiGian" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="trangThai">Trạng Thái:</label>
                            <select id="trangThai" name="trangThai" class="form-select" disabled>
                                <option value="1">Hoạt Động</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="table-container1">
                    <div id="test2">
                        <table class="table table-sm table-hover table-striped mb-5">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">MÃ BẢO HÀNH</th>
                                <th scope="col">THỜI GIAN(Tháng)</th>
                                <th scope="col">TRẠNG THÁI</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listColorsBH}" var="sp" varStatus="i">
                                <tr id="record_${sp.id}">
                                    <td>${i.index + 1}</td>
                                    <td>${sp.ma}</td>
                                    <td>${sp.thoiGian}</td>
                                    <td><span
                                            class="status ${sp.trangThai == true ? 'dangxuly' : 'pending'}">${sp.trangThai == true ? 'Hoạt Động' : 'Không Hoạt Động'}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="closeModal2BH()">Thoát
                </button>
                <button type="submit" class="btn btn-primary" id="them" value="submit" onclick="addThoiGian()">Lưu
                </button>
            </div>
        </div>
    </div>
</div>


<%--thương hiệu--%>

<div class="modal modal-xl" id="modalAddThuongHieu" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content formcon">
            <h1 style="font-size: 20px;margin-top: 20px;margin-left:250px ; font-family:sans-serif">Thông Tin Thương
                Hiệu</h1>
            <hr>
            <div class="modal-body1">
                <div class="form-container1">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="maTH">Mã Thương Hiệu</label><span class="red-star"> *</span>
                            <input id="maTH" class="form-control" style="background-color: #f2f2f2;"/>
                        </div>
                        <div class="form-group">
                            <label for="ten">Tên Thương Hiệu</label><span class="red-star"> *</span>
                            <input id="ten" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="trangThai">Trạng Thái:</label>
                            <select id="trangThai" name="trangThai" class="form-select" disabled>
                                <option value="1">Hoạt Động</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="table-container1">
                    <div id="test3">
                        <table class="table table-sm table-hover table-striped mb-5">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">MÃ</th>
                                <th scope="col">TÊN</th>
                                <th scope="col">TRẠNG THÁI</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listColorsTH}" var="sp" varStatus="i">
                                <tr id="record_${sp.id}">
                                    <td>${i.index + 1}</td>
                                    <td>${sp.maTH}</td>
                                    <td>${sp.ten}</td>
                                    <td><span
                                            class="status ${sp.trangThai == true ? 'dangxuly' : 'pending'}">${sp.trangThai == true ? 'Hoạt Động' : 'Không Hoạt Động'}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="closeModal2TH()">Thoát
                </button>
                <button type="submit" class="btn btn-primary" id="them" value="submit" onclick="addThuongHieu()">Lưu
                </button>
            </div>
        </div>
    </div>
</div>

<%--dtsd--%>

<div class="modal modal-xl" id="modalAddDTSD" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content formcon">
            <h1 style="font-size: 20px;margin-top: 20px;margin-left:250px ; font-family:sans-serif">Thông Tin Đối
                Tượng</h1>
            <hr>
            <div class="modal-body1">
                <div class="form-container1">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="maDoiTuongSuDung">Mã Đối Tượng</label><span class="red-star"> *</span>
                            <input id="maDoiTuongSuDung" class="form-control" style="background-color: #f2f2f2;"/>
                        </div>
                        <div class="form-group">
                            <label for="tenDoiTuongSuDung">Tên Đối Tượng</label><span class="red-star"> *</span>
                            <input id="tenDoiTuongSuDung" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="trangThai">Trạng Thái:</label>
                            <select id="trangThai" name="trangThai" class="form-select" disabled>
                                <option value="1">Hoạt Động</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="table-container1">
                    <div id="test4">
                        <table class="table table-sm table-hover table-striped mb-5">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">MÃ ĐỐI TƯỢNG</th>
                                <th scope="col">TÊN ĐỐI TƯỢNG</th>
                                <th scope="col">TRẠNG THÁI</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listColorsDTSD}" var="sp" varStatus="i">
                                <tr id="record_${sp.id}">
                                    <td>${i.index + 1}</td>
                                    <td>${sp.maDoiTuongSuDung}</td>
                                    <td>${sp.tenDoiTuongSuDung}</td>
                                    <td><span
                                            class="status ${sp.trangThai == true ? 'dangxuly' : 'pending'}">${sp.trangThai == true ? 'Hoạt Động' : 'Không Hoạt Động'}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="closeModal2DTSD()">
                    Thoát
                </button>
                <button type="submit" class="btn btn-primary" id="them" value="submit" onclick="addDTSD()">Lưu
                </button>
            </div>
        </div>
    </div>
</div>


<script>
    // Hàm để mở modal 2 và đóng modal 1
    function openModal2() {
        $('#exampleModal').modal('hide'); // Đóng modal 1
        $('#modalAddDanhMuc').modal('show'); // Mở modal 2
    }

    // Hàm để đóng modal 2 và mở lại modal 1
    function closeModal2() {
        $('#modalAddDanhMuc').modal('hide'); // Đóng modal 2
        $('#exampleModal').modal('show'); // Mở lại modal 1
    }

    // bảo hành

    function openModal2BH() {
        $('#exampleModal').modal('hide'); // Đóng modal 1
        $('#modalAddTGBH').modal('show'); // Mở modal 2
    }

    // Hàm để đóng modal 2 và mở lại modal 1
    function closeModal2BH() {
        $('#modalAddTGBH').modal('hide'); // Đóng modal 2
        $('#exampleModal').modal('show'); // Mở lại modal 1
    }

    // thuong hieu
    function openModal2TH() {
        $('#exampleModal').modal('hide'); // Đóng modal 1
        $('#modalAddThuongHieu').modal('show'); // Mở modal 2
    }

    // Hàm để đóng modal 2 và mở lại modal 1
    function closeModal2TH() {
        $('#modalAddThuongHieu').modal('hide'); // Đóng modal 2
        $('#exampleModal').modal('show'); // Mở lại modal 1
    }

    // dtsd
    function openModal2DTSD() {
        $('#exampleModal').modal('hide'); // Đóng modal 1
        $('#modalAddDTSD').modal('show'); // Mở modal 2
    }

    // Hàm để đóng modal 2 và mở lại modal 1
    function closeModal2DTSD() {
        $('#modalAddDTSD').modal('hide'); // Đóng modal 2
        $('#exampleModal').modal('show'); // Mở lại modal 1
    }


    document.getElementById('addSanPham').addEventListener('click', function (event) {
        event.preventDefault();

        var tenSanPham = document.getElementById('tenSanPham').value.trim();
        var chatLieu = document.getElementById('chatLieu').value.trim();
        var xuatXu = document.getElementById('xuatXu').value.trim();
        var khoiLuong = document.getElementById('khoiLuong').value.trim();
        var kichThuoc = document.getElementById('kichThuoc').value.trim();
        var idThoiGianBaoHanh = document.getElementById('idThoiGianBaoHanh').value;
        var idDanhMuc = document.getElementById('idDanhMuc').value;
        var idThuongHieu = document.getElementById('idThuongHieu').value;
        var idDoiTuongSuDung = document.getElementById('idDoiTuongSuDung').value;

        let hasError = false;

        function checkErrorsAndSubmitAdd() {
            if (!hasError) {
                document.getElementById('addSanPhamForm').submit();
                Swal.fire({
                    icon: "success",
                    title: "Sản phẩm của bạn đã thêm thành công",
                    showConfirmButton: false,
                    timer: 1500
                }).then(function () {

                    window.location.href = 'http://localhost:8080/san-pham';
                });
            }
        }

        if (tenSanPham === '') {
            document.getElementById('tenSanPhamError').innerText = 'Vui lòng nhập Tên Sản Phẩm.';
            hasError = true;
        } else if (tenSanPham.length > 100) {
            document.getElementById('tenSanPhamError').innerText = 'Tên Sản Phẩm không được vượt quá 300 ký tự.';
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
            document.getElementById('chatLieuError').innerText = 'Xuất xứ không được vượt quá 100 ký tự.';
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
        } else if (khoiLuong <= 1) {
            document.getElementById('khoiLuongError').innerText = 'Khối Lượng phải lớn hơn 1.';
            hasError = true;
        } else {
            document.getElementById('khoiLuongError').innerText = '';
        }

        if (kichThuoc === '') {
            document.getElementById('kichThuocError').innerText = 'Vui lòng nhập Kích Thước.';
            hasError = true;
        } else if (!isKichCo(kichThuoc)) {
            document.getElementById('kichThuocError').innerText = 'Vui lòng nhập đúng định dạng rộngxDàixCao.';
            hasError = true;
        } else if (kichThuoc.length > 200) {
            document.getElementById('kichThuocError').innerText = 'Kích Thước không được vượt quá 200 ký tự.';
            hasError = true;
        } else {
            document.getElementById('kichThuocError').innerText = '';
        }

        if (idThuongHieu === '') {
            document.getElementById('thuongHieuError').innerText = 'Vui lòng nhập chọn thương hiệu.';
            hasError = true;
        } else {
            document.getElementById('thuongHieuError').innerText = '';
        }

        if (idDanhMuc === '') {
            document.getElementById('danhMucError').innerText = 'Vui lòng nhập chọn danh mục.';
            hasError = true;
        } else {
            document.getElementById('danhMucError').innerText = '';
        }

        if (idDoiTuongSuDung === '') {
            document.getElementById('doiTuongSuDungError').innerText = 'Vui lòng nhập chọn đối tượng sử dụng.';
            hasError = true;
        } else {
            document.getElementById('doiTuongSuDungError').innerText = '';
        }

        if (idThoiGianBaoHanh === '') {
            document.getElementById('thoiGianBaoHanhError').innerText = 'Vui lòng nhập chọn thời gian bảo hành.';
            hasError = true;
        } else {
            document.getElementById('thoiGianBaoHanhError').innerText = '';
        }

        if (!hasError) {
            $.get('/san-pham/search-name', {tenSanPham: tenSanPham}, function (data) {
                if (data) {
                    document.getElementById('tenSanPhamError').innerText = 'Tên sản phẩm đã tồn tại vui lòng để tên khác!';
                    hasError = true;
                }
                checkErrorsAndSubmitAdd();
            });
        } else {
            checkErrorsAndSubmitAdd();
        }


    });


    function isKichCo(value) {
        return /^\d+x\d+x\d+$/.test(value);
    }
</script>
