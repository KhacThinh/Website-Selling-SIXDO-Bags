<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Modal -->
<div class="modal fade" id="exampleModallll" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel-edit">Thông Tin Sản
                    Phẩm</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="uploadForm" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="idSanPhamSua">Mã<span
                                        class="required">*</span></label>
                                <input type="hidden" id="idSanPhamSua"
                                       class="form-control"/>
                                <input type="text" id="maSanPhamSua"
                                       class="form-control" readonly/>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="tenSanPhamSua">Tên Sản Phẩm<span
                                        class="required">*</span></label>
                                <input type="text" id="tenSanPhamSua"
                                       class="form-control"/>
                                <span id="tenSanPhamErrorr"
                                      class="error text-danger"></span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="chatLieuSua">Chất Liệu<span
                                        class="required">*</span></label>
                                <input type="text" id="chatLieuSua"
                                       class="form-control"/>
                                <span id="chatLieuErrorr"
                                      class="error text-danger"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="xuatXuSua">Xuất Xứ<span
                                        class="required">*</span></label>
                                <input type="text" id="xuatXuSua" class="form-control"/>
                                <span id="xuatXuErrorr" class="error text-danger"></span>
                            </div>
                            <div class="form-group">
                                <label for="previewImage">Ảnh</label>
                                <img id="previewImage"
                                     style="max-width: 100%; height: 150px;"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="kichThuocSua">Kích Thước (cm)<span
                                        class="required">*</span></label>
                                <input type="text" id="kichThuocSua" class="form-control"
                                       value="${sp.kichThuoc}" placeholder="RộngxDàixCao"/>
                                <span id="kichThuocErrorr"
                                      class="error text-danger"></span>
                            </div>
                            <div class="form-group">
                                <label for="khoiLuongSua">Khối Lượng (gram)<span
                                        class="required">*</span></label>
                                <input type="number" id="khoiLuongSua" min="0"
                                       class="form-control"/>
                                <span id="khoiLuongErrorr" class="error text-danger"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="moTaSua">Mô Tả</label>
                                <textarea id="moTaSua" class="form-control" style="height: 120px;"></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="idThoiGianBaoHanhSua">Thời Gian Bảo Hành</label>
                                <select id="idThoiGianBaoHanhSua" class="form-control">
                                    <option value="">Chọn Thời Gian Bảo Hành</option>
                                    <c:forEach items="${thoiGianBaoHanhForm}" var="tgbhForm">
                                        <option value="${tgbhForm.id}" ${tgbhForm.id == sp.thoiGianBaoHanh.id ? 'selected' : ''}>${tgbhForm.thoiGian}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="idThuongHieuSua">Thương Hiệu</label>
                                <select id="idThuongHieuSua" class="form-control">
                                    <option value="">Chọn Thương Hiệu</option>
                                    <c:forEach items="${thuongHieuForm}" var="thForm">
                                        <option value="${thForm.id}" ${thForm.id == sp.thuongHieu.id ? 'selected' : ''}>${thForm.ten}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="idDanhMucSua">Danh Mục</label>
                                <select id="idDanhMucSua" class="form-control">
                                    <option value="">Chọn Danh Mục</option>
                                    <c:forEach items="${danhMucForm}" var="dmForm">
                                        <option value="${dmForm.id}" ${dmForm.id == sp.danhMuc.id ? 'selected' : ''}>${dmForm.tenDanhMuc}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="idDoiTuongSuDungSua">Đối Tượng Sử Dụng</label>
                                <select id="idDoiTuongSuDungSua" class="form-control">
                                    <option value="">Chọn Đối Tượng Sử Dụng</option>
                                    <c:forEach items="${doiTuongSuDungForm}" var="dtsdForm">
                                        <option value="${dtsdForm.id}" ${dtsdForm.id == sp.doiTuongSuDung.id ? 'selected' : ''}>${dtsdForm.tenDoiTuongSuDung}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Thoát
                        </button>
                        <button type="submit" class="btn btn-primary edit-product-btn"
                                id="editSanPham">Sửa
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>

    document.addEventListener('DOMContentLoaded', function () {
        var editButtons = document.querySelectorAll('.btn-modal-sua');
        editButtons.forEach(function (button) {
            button.addEventListener('click', function () {
                var id = this.getAttribute('data-id');
                suaSanPhamModal(id);
            });
        });
    });

    function suaSanPhamModal(decodeText) {
        $.ajax({
            type: "POST",
            url: "/san-pham/findById",
            data: {idSanPham: decodeText},
            success: function (response) {
                $('#idSanPhamSua').val(response.id)
                $('#maSanPhamSua').val(response.maSanPham);
                $('#tenSanPhamSua').val(response.tenSanPham);
                $('#chatLieuSua').val(response.chatLieu);
                $('#xuatXuSua').val(response.xuatXu);
                $('#kichThuocSua').val(response.kichThuoc);
                $('#khoiLuongSua').val(response.khoiLuong);
                $('#moTaSua').val(response.moTa);
                $('#idThoiGianBaoHanhSua').val(response.thoiGianBaoHanh.id);
                $('#idThuongHieuSua').val(response.thuongHieu.id);
                $('#idDanhMucSua').val(response.danhMuc.id);
                $('#idDoiTuongSuDungSua').val(response.doiTuongSuDung.id);
                $('#previewImage').attr('src', response.anh);
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
            }
        });
    }

    document.getElementById('editSanPham').addEventListener('click', function (event) {
        event.preventDefault();
        var idSanPham = $("#idSanPhamSua").val();
        var tenSanPham = $("#tenSanPhamSua").val();
        var maSanPham = $("#maSanPhamSua").val();
        var chatLieu = $("#chatLieuSua").val();
        var xuatXu = $("#xuatXuSua").val();
        var khoiLuong = $("#khoiLuongSua").val();
        var kichThuoc = $("#kichThuocSua").val();
        var idThoiGianBaoHanh = $("#idThoiGianBaoHanhSua").val();
        var idThuongHieu = $("#idThuongHieuSua").val();
        var idDanhMuc = $("#idDanhMucSua").val();
        // var idDoiTuongSuDung = $("#idDoiTuongSuDungSua option:selected" ).text(); // cái này là lấy nam hay nữ
        var idDoiTuongSuDung = $("#idDoiTuongSuDungSua").val();  // cái này là lấy được value
        var moTa = $("#moTaSua").val()

        let hasError = false;

        if (tenSanPham === '') {
            document.getElementById('tenSanPhamErrorr').innerText = 'Vui lòng nhập Tên Sản Phẩm.';
            hasError = true;
        } else if (tenSanPham.length > 100) {
            document.getElementById('tenSanPhamErrorr').innerText = 'Tên Sản Phẩm không được vượt quá 100 ký tự.';
            hasError = true;
        } else {
            document.getElementById('tenSanPhamErrorr').innerText = '';
        }

        if (chatLieu === '') {
            document.getElementById('chatLieuErrorr').innerText = 'Vui lòng nhập Chất Liệu.';
            hasError = true;
        } else if (chatLieu.length > 200) {
            document.getElementById('chatLieuErrorr').innerText = 'Chất Liệu không được vượt quá 200 ký tự.';
            hasError = true;
        } else {
            document.getElementById('chatLieuErrorr').innerText = '';
        }

        if (xuatXu === '') {
            document.getElementById('xuatXuErrorr').innerText = 'Vui lòng nhập Xuất Xứ.';
            hasError = true;
        } else if (xuatXu.length > 100) {
            document.getElementById('xuatXuErrorr').innerText = 'Xuất xứ không được vượt quá 100 ký tự.';
            hasError = true;
        } else {
            document.getElementById('xuatXuErrorr').innerText = '';
        }

        if (khoiLuong === '') {
            hasError = true;
            document.getElementById('khoiLuongErrorr').innerText = 'Vui lòng nhập Khối Lượng.';
        } else if (isNaN(khoiLuong)) {
            document.getElementById('khoiLuongErrorr').innerText = 'Khối Lượng phải là số.';
            hasError = true;
        } else if (khoiLuong <= 1) {
            document.getElementById('khoiLuongErrorr').innerText = 'Khối Lượng phải lớn hơn 1.';
            hasError = true;
        } else {
            document.getElementById('khoiLuongErrorr').innerText = '';
        }

        if (kichThuoc === '') {
            document.getElementById('kichThuocErrorr').innerText = 'Vui lòng nhập Kích Thước.';
            hasError = true;
        } else if (!isKichCo(kichThuoc)) {
            document.getElementById('kichThuocError').innerText = 'Vui lòng nhập đúng định dạng rộngxDàixCao.';
            hasError = true;
        } else if (kichThuoc.length > 200) {
            document.getElementById('kichThuocErrorr').innerText = 'Kích Thước không được vượt quá 200 ký tự.';
            hasError = true;
        } else {
            document.getElementById('kichThuocErrorr').innerText = '';
        }

        if (!hasError) {
            suaSanPhamToServer(idSanPham, maSanPham, tenSanPham, chatLieu, xuatXu, khoiLuong, kichThuoc, hinhAnh, moTa, idThoiGianBaoHanh, idThuongHieu, idDanhMuc, idDoiTuongSuDung);
        }
    });

    function suaSanPhamToServer(idSanPham, maSanPham, tenSanPham, chatLieu, xuatXu, khoiLuong, kichThuoc, hinhAnh, moTa, idThoiGianBaoHanh, idThuongHieu, idDanhMuc, idDoiTuongSuDung) {
        const data = {
            idSanPham: idSanPham,
            maSanPham: maSanPham,
            tenSanPham: tenSanPham,
            chatLieu: chatLieu,
            xuatXu: xuatXu,
            khoiLuong: khoiLuong,
            kichThuoc: kichThuoc,
            moTa: moTa,
            idThoiGianBaoHanh: idThoiGianBaoHanh,
            idThuongHieu: idThuongHieu,
            idDanhMuc: idDanhMuc,
            idDoiTuongSuDung: idDoiTuongSuDung
        };

        $.ajax({
            type: 'POST',
            url: '/san-pham/sua?idSanPham=' + idSanPham,
            contentType: "application/json",
            data: JSON.stringify(data),
            processData: false,
            dataType: 'json',
            success: function (response) {
                setTimeout('Redirect()', 1000);
                Swal.fire({
                    icon: "success",
                    title: "Sản phẩm của bạn đã được sửa",
                    showConfirmButton: false,
                    timer: 1500
                });
            },
            error: function (xhr, status, error) {
                // Xử lý khi gặp lỗi
                console.log('Có lỗi xảy ra: ' + error);
            }
        });
    }

    function Redirect() {
        window.location = '/san-pham';
    }

</script>
