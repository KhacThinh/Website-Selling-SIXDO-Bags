<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Modal -->
<div class="modal fade" id="exampleModal${sp.maSanPham}" tabindex="-1"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel -edit">Thông Tin Sản
                    Phẩm</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editProductForm">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="tenSanPham">Mã<span
                                        class="required">*</span></label>
                                <input type="hidden" id="idSanPham" value="${sp.id}"
                                       class="form-control"/>
                                <input type="text" id="maSanPham" value="${sp.maSanPham}"
                                       class="form-control" readonly/>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="tenSanPham">Tên Sản Phẩm<span
                                        class="required">*</span></label>
                                <input type="text" id="tenSanPham"
                                       class="form-control" value="${sp.tenSanPham}"/>
                                <span id="tenSanPhamError"
                                      class="error text-danger"></span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="chatLieu">Chất Liệu<span
                                        class="required">*</span></label>
                                <input type="text" id="chatLieu"
                                       class="form-control" value="${sp.chatLieu}"/>
                                <span id="chatLieuError"
                                      class="error text-danger"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="xuatXu">Xuất Xứ<span
                                        class="required">*</span></label>
                                <input type="text" id="xuatXu" class="form-control" value="${sp.xuatXu}"/>
                                <span id="xuatXuError" class="error text-danger"></span>
                            </div>
                            <div class="form-group">
                                <label for="hinhAnh">Ảnh</label>
                                <input type="file" id="hinhAnh" name="hinhAnh" class="form-control"/>
                                <img src="${sp.anh}" alt="Ảnh sản phẩm" id="previewImage"
                                     style="max-width: 100%; height: 100px;"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="kichThuoc">Kích Thước<span class="required">*</span></label>
                                <input type="text" id="kichThuoc" class="form-control" value="${sp.kichThuoc}"/>
                                <span id="kichThuocError"
                                      class="error text-danger"></span>
                            </div>
                            <div class="form-group">
                                <label for="khoiLuong">Khối Lượng (gram)<span class="required">*</span></label>
                                <fmt:formatNumber pattern="###" value="${sp.khoiLuong}"
                                                  var="khoiLuongSua"></fmt:formatNumber>
                                <input type="number" id="khoiLuong" min="0" class="form-control"
                                       value="${khoiLuongSua}"/>
                                <span id="khoiLuongError" class="error text-danger"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="moTa">Mô Tả</label>
                                <textarea id="moTa" class="form-control">${sp.moTa}</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="idThoiGianBaoHanh">Thời Gian Bảo Hành</label>
                                <select id="idThoiGianBaoHanh" class="form-control">
                                    <option value="">Chọn Thời Gian Bảo Hành</option>
                                    <c:forEach items="${thoiGianBaoHanhForm}" var="tgbhForm">
                                        <option value="${tgbhForm.id}" ${tgbhForm.id == sp.thoiGianBaoHanh.id ? 'selected' : ''} >${tgbhForm.thoiGian}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="idThuongHieu">Thương Hiệu</label>
                                <select id="idThuongHieu" class="form-control">
                                    <option value="">Chọn Thương Hiệu</option>
                                    <c:forEach items="${thuongHieuForm}" var="thForm">
                                        <option value="${thForm.id}" ${thForm.id == sp.thuongHieu.id ? 'selected' : ''} >${thForm.ten}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="idDanhMuc">Danh Mục</label>
                                <select id="idDanhMuc" class="form-control">
                                    <option value="">Chọn Danh Mục</option>
                                    <c:forEach items="${danhMucForm}" var="dmForm">
                                        <option value="${dmForm.id}" ${dmForm.id == sp.danhMuc.id ? 'selected' : ''} >${dmForm.tenDanhMuc}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="idDoiTuongSuDung">Đối Tượng Sử Dụng</label>
                                <select id="idDoiTuongSuDung" class="form-control">
                                    <option value="">Chọn Đối Tượng Sử Dụng</option>
                                    <c:forEach items="${doiTuongSuDungForm}" var="dtsdForm">
                                        <option value="${dtsdForm.id}" ${dtsdForm.id == sp.doiTuongSuDung.id ? 'selected' : ''} >${dtsdForm.tenDoiTuongSuDung}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">Thoát
                </button>
                <button type="button" class="btn btn-primary" id="editSanPham">Sửa</button>
            </div>
        </div>
    </div>
</div>


<script>
    document.getElementById('editProductForm').addEventListener('click', function (event) {
        event.preventDefault();

        var idSanPham = document.getElementById('idSanPham').value;
        var tenSanPham = document.getElementById('tenSanPham').value.trim();
        var chatLieu = document.getElementById('chatLieu').value.trim();
        var xuatXu = document.getElementById('xuatXu').value.trim();
        var khoiLuong = document.getElementById('khoiLuong').value.trim();
        var kichThuoc = document.getElementById('kichThuoc').value.trim();
        var hinhAnh = $('#hinhAnh')[0].files[0];
        var idThoiGianBaoHanh = document.getElementById('idThoiGianBaoHanh').value;
        var idThuongHieu = document.getElementById('idThuongHieu').value;
        var idDanhMuc = document.getElementById('idDanhMuc').value;
        var idDoiTuongSuDung = document.getElementById('idDoiTuongSuDung').value;
        var moTa = document.getElementById('moTa').value.trim();

        let hasError = false;

        if (tenSanPham === '') {
            document.getElementById('tenSanPhamError').innerText = 'Vui lòng nhập Tên Sản Phẩm.';
            hasError = true;
        } else if (tenSanPham.length > 100) {
            document.getElementById('tenSanPhamError').innerText = 'Tên Sản Phẩm không được vượt quá 100 ký tự.';
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
            document.getElementById('xuatXuError').innerText = 'Xuất xứ không được vượt quá 100 ký tự.';
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
            alert("hello")

        if (!hasError) {
            var formData = new FormData();
            formData.append('maSanPham', idSanPham);
            formData.append('tenSanPham', tenSanPham);
            formData.append('chatLieu', chatLieu);
            formData.append('xuatXu', xuatXu);
            formData.append('khoiLuong', khoiLuong);
            formData.append('kichThuoc', kichThuoc);
            formData.append('hinhAnh', hinhAnh);
            formData.append('moTa', moTa);
            formData.append('idThoiGianBaoHanh', idThoiGianBaoHanh);
            formData.append('idThuongHieu', idThuongHieu);
            formData.append('idDanhMuc', idDanhMuc);
            formData.append('idDoiTuongSuDung', idDoiTuongSuDung);


            var jsonObject = {};
            formData.forEach(function (value, key) {
                jsonObject[key] = value;
            });
            // Sử dụng AJAX để gửi dữ liệu đến controller
            $.ajax({
                type: 'PUT',
                url: '/san-pham/edit/' + idSanPham,
                data: JSON.stringify(jsonObject),
                contentType: 'application.json',
                processData: false
            })
                .done(function (data) {
                    // Xử lý kết quả trả về từ controller nếu cần
                    console.log(data);
                    // Sau khi sửa thành công, có thể redirect hoặc làm mới trang
                    window.location.href = '/san-pham';
                })
                .fail(function (data) {
                    // Xử lý khi gặp lỗi
                    console.log('Có lỗi xảy ra.');
                });
        }
    });

</script>