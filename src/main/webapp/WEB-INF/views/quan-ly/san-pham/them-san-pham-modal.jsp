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
                <form:form method="POST" action="/san-pham" modelAttribute="sanPhamRequest"
                           enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-12">

                        <div class="form-group">
                            <label for="chatLieu">Chất Liệu</label>
                            <form:input path="chatLieu" id="chatLieu" class="form-control"/>

                        </div>
                        <div class="form-group">
                            <label for="tenSanPham">Tên Sản Phẩm</label>
                            <form:input path="tenSanPham" id="tenSanPham" class="form-control"/>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="xuatXu">Xuất Xứ</label>
                            <form:input path="xuatXu" id="xuatXu" class="form-control"/>

                        </div>
                        <div class="form-group">
                            <label for="hinhAnh">Ảnh</label>
                            <input type="file" id="hinhAnh" name="hinhAnh" class="form-control"/>
                            <input type="hidden" name="anh" class="form-control"/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="kichThuoc">Kích Thước</label>
                            <form:input path="kichThuoc" id="kichThuoc" class="form-control"/>

                        </div>
                        <div class="form-group">
                            <label for="khoiLuong">Khối Lượng</label>
                            <form:input path="khoiLuong" id="khoiLuong" class="form-control"/>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="moTa">Mô Tả</label>
                            <form:textarea path="moTa" id="moTa" class="form-control"/>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="idThoiGianBaoHanh">Thời Gian Bảo Hành</label>
                            <form:select path="idThoiGianBaoHanh" class="form-control">
                                <form:option value="" label="Chọn Thời Gian Bảo Hành"/>
                                <form:options items="${thoiGianBaoHanhForm}" itemValue="id"
                                              itemLabel="thoiGian"/>
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
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                <button type="submit" class="btn btn-primary" id="addSanPham">Lưu</button>
            </div>
            </form:form>
        </div>
    </div>
</div>

