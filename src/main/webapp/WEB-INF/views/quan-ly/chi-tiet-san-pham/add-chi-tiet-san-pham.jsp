<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="modal modal-xl" id="modalAdd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Sản Phẩm</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form:form method="POST" action="/chi-tiet-san-pham/add" enctype="multipart/form-data" modelAttribute="chiTietSanPham">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="ma" class="form-label">Mã</label>
                                <form:input path="ma" id="ma" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="soLuong" class="form-label">Số Lượng</label>
                                <form:input path="soLuong" id="soLuong" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="giaNhap" class="form-label">Giá Nhập</label>
                                <form:input path="giaNhap" id="giaNhap" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="giaBan" class="form-label">Giá Bán</label>
                                <form:input path="giaBan" id="giaBan" class="form-control"/>
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
                                <label for="sanPham" class="form-label">Sản Phẩm</label>
                                <form:select path="sanPham" class="form-control">
                                    <c:forEach items="${listSp}" var="c">
                                        <option value="${c.id}">${c.tenSanPham}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="form-group">
                                <label for="mauSac" class="form-label">Màu Sắc</label>
                                <form:select path="mauSac" class="form-control">
                                    <c:forEach items="${listMauSac}" var="c">
                                        <option value="${c.id}">${c.tenMauSac}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="khuyenMai" class="form-label">Khuyến Mãi</label>
                                <form:select path="khuyenMai" class="form-control">
                                    <c:forEach items="${listKhuyenMai}" var="c">
                                        <option value="${c.id}">${c.ten}</option>
                                    </c:forEach>
                                </form:select>
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
<%--<script>--%>
<%--    $(document).ready(function(){--%>
<%--        $('#uploadButton').on('click', function(){--%>
<%--            var formData = new FormData();--%>
<%--            var file = $('#images')[0].files[0];--%>
<%--            formData.append('images', file);--%>

<%--            $.ajax({--%>
<%--                url: 'chi-tiet-san-pham/add', // Địa chỉ URL của endpoint xử lý việc tải ảnh lên máy chủ--%>
<%--                type: 'POST',--%>
<%--                data: formData,--%>
<%--                contentType: false,--%>
<%--                processData: false,--%>
<%--                success: function(response){--%>
<%--                    console.log('Upload successful');--%>
<%--                    // Xử lý phản hồi từ máy chủ nếu cần--%>
<%--                },--%>
<%--                error: function(xhr, status, error){--%>
<%--                    console.error('Upload error:', error);--%>
<%--                    // Xử lý lỗi nếu có--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
