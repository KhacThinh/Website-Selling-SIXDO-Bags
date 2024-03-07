<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Modal -->
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
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tenSanPham">Tên Sản Phẩm<span class="required">*</span></label>
                                <form:input path="tenSanPham" id="tenSanPham" class="form-control"/>
                                <span id="tenSanPhamError" class="error text-danger"></span>
                            </div>
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
                                <label for="kichThuoc">Kích Thước<span class="required">*</span></label>
                                <form:input path="kichThuoc" id="kichThuoc" class="form-control"/>
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
                                <form:textarea path="moTa" id="moTa" class="form-control"/>
                                    <%--                                <form:errors path="moTa" cssClass="error text-danger"/>--%>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="idThoiGianBaoHanh">Thời Gian Bảo Hành</label>
                                <form:select path="idThoiGianBaoHanh" class="form-control">
                                    <form:option value="" label="Chọn Thời Gian Bảo Hành"/>
                                    <form:options items="${thoiGianBaoHanhForm}" itemValue="id" itemLabel="thoiGian"/>
                                </form:select>
                            </div>
                            <div class="form-group">
                                <label for="idThuongHieu">Thương Hiệu</label>
                                <form:select path="idThuongHieu" class="form-control">
                                    <form:option value="" label="Chọn Thương Hiệu"/>
                                    <form:options items="${thuongHieuForm}" itemValue="id" itemLabel="ten"/>
                                </form:select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="idDanhMuc">Danh Mục</label>
                                <form:select path="idDanhMuc" class="form-control">
                                    <form:option value="" label="Chọn Danh Mục"/>
                                    <form:options items="${danhMucForm}" itemValue="id" itemLabel="tenDanhMuc"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="idDoiTuongSuDung">Đối Tượng Sử Dụng</label>
                                <form:select path="idDoiTuongSuDung" class="form-control">
                                    <form:option value="" label="Chọn Đối Tượng Sử Dụng"/>
                                    <form:options items="${doiTuongSuDungForm}" itemValue="id"
                                                  itemLabel="tenDoiTuongSuDung"/>
                                </form:select>
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


<script>
    document.getElementById('addSanPham').addEventListener('click', function (event) {
        event.preventDefault();

        var tenSanPham = document.getElementById('tenSanPham').value.trim();
        var chatLieu = document.getElementById('chatLieu').value.trim();
        var xuatXu = document.getElementById('xuatXu').value.trim();
        var khoiLuong = document.getElementById('khoiLuong').value.trim();
        var kichThuoc = document.getElementById('kichThuoc').value.trim();

        let hasError = false;

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

        // if (tenSanPham !== '' && chatLieu !== '' && xuatXu !== '' && khoiLuong !== '' && kichThuoc !== '') {
        //     document.getElementById('addSanPhamForm').submit();
        // }

        if(!hasError){
            document.getElementById('addSanPhamForm').submit();
        }
    });
</script>
