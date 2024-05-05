<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    .error {
        font-size: 0.8em; /* Kích thước chữ nhỏ hơn */
        color: red; /* Màu chữ đỏ */
    }

    span {
        color: red; /* Thiết lập màu đỏ cho dấu sao */
    }


</style>

<div class="modal modal-xl" id="modalAdd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Sản Phẩm</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form:form method="POST" action="/chi-tiet-san-pham/add" enctype="multipart/form-data"
                           modelAttribute="chiTietSanPham" id="yourFormId">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="soLuong" class="form-label">Số Lượng <span>*</span></label>
                                <form:input path="soLuong" id="soLuong" class="form-control"/>
                                <div id="soLuongError" class="error"></div>
                            </div>
                            <div class="form-group">
                                <label for="giaNhap" class="form-label">Giá Nhập <span>*</span></label>
                                <form:input path="giaNhap" id="giaNhap" class="form-control"/>
                                <div id="giaNhapError" class="error"></div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="giaBan" class="form-label">Giá Bán <span>*</span></label>
                                <form:input path="giaBan" id="giaBan" class="form-control"/>
                                <div id="giaBanError" class="error"></div>
                            </div>
                            <div class="form-group">
                                <label for="images" class="form-label">Ảnh</label>
                                <input type="file" id="images" name="images" class="form-control"/>
                                <input type="hidden" id="hinhAnh" name="hinhAnh" class="form-control"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="" class="form-label">Sản Phẩm</label>
                                <div class="form-control">${sp.tenSanPham}</div>
                                <input value="${sp.id}" name="idSp" type="hidden"
                                       class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="mauSac" class="form-label">Màu Sắc</label>
                                <form:select path="mauSac" class="form-control">
                                    <option value="" label="Chọn Màu Sắc"/>
                                    <c:forEach items="${MauSacs}" var="c">
                                        <option value="${c.id}">${c.tenMauSac}</option>
                                    </c:forEach>
                                </form:select>
                                <span id="mauSacError" style="color: red;font-size: 0.8em; display: none;">Vui lòng chọn một màu sắc.</span>

                            </div>
                        </div>

                    </div>

                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                        <button type="submit" id="uploadButton" class="btn btn-primary">Lưu</button>
                    </div>
                </form:form>

            </div>
        </div>
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    document.getElementById("yourFormId").addEventListener("submit", function (event) {
        if (!validateForm()) {
            event.preventDefault(); // Ngăn chặn form gửi đi nếu không hợp lệ
        }
    });

    function validateForm() {
        var soLuong = document.getElementById('soLuong').value;
        var giaNhap = document.getElementById('giaNhap').value;
        var giaBan = document.getElementById('giaBan').value;
        var selectedValue = document.getElementById("mauSac").value;
        var isValid = true;

        if (selectedValue === "") {
            document.getElementById("mauSacError").style.display = "block";
            isValid = false;
        } else {
            document.getElementById("mauSacError").style.display = "none";
        }
        if (soLuong.trim() === '') {
            document.getElementById('soLuongError').innerText = 'Vui lòng nhập số lượng.';
            isValid = false;
        } else if (!isNumeric(soLuong)) {
            document.getElementById('soLuongError').innerText = 'Số lượng phải là một số và Luôn Dương.';
            isValid = false;
        } else {
            document.getElementById('soLuongError').innerText = '';
        }

        if (giaNhap.trim() === '') {
            document.getElementById('giaNhapError').innerText = 'Vui lòng nhập giá nhập.';
            isValid = false;
        } else if (!isNumeric(giaNhap)) {
            document.getElementById('giaNhapError').innerText = 'Giá nhập phải là một số và luôn Dương.';
            isValid = false;
        } else {
            document.getElementById('giaNhapError').innerText = '';
        }

        if (giaBan.trim() === '') {
            document.getElementById('giaBanError').innerText = 'Vui lòng nhập giá bán.';
            isValid = false;
        } else if (!isNumeric(giaBan)) {
            document.getElementById('giaBanError').innerText = 'Giá bán phải là một số và luôn Dương.';
            isValid = false;
        } else {
            document.getElementById('giaBanError').innerText = '';
        }


        return isValid;
    }

    function isNumeric(value) {
        return /^\d+$/.test(value);
    }
</script>


