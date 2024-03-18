<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Màu Sắc</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        /* CSS styles */
        .modal-content {
            border-radius: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .modal-footer {
            justify-content: flex-end;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-secondary {
            background-color: #ccc;
            color: #fff;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
            font-family: "Arial Blackw";
        }

        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="modal modal-xl" id="modalAddMaGiamGia" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <h1 class="text-center mb-4"> MÃ GIẢM GIÁ</h1>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="maGiamGia">Mã Giảm Giá</label>
                            <input id="maGiamGia" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="tenMaGiamGia">Tên Mã Giảm Giá</label>
                            <input id="tenMaGiamGia" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="giaTriGiam">Giá Trị Giảm</label>
                            <input id="giaTriGiam" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="soLuong">Số lượng</label>
                            <input id="soLuong" class="form-control"/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="ngayBatDau">Ngày Bắt Đầu</label>
                            <input type="date" id="ngayBatDau" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="ngayKetThuc">Ngày Kết Thúc</label>
                            <input type="date" id="ngayKetThuc" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="dieuKienGiam">Điều Kiện</label>
                            <input id="dieuKienGiam" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="moTa">Mô Tả</label>
                            <input id="moTa" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="trangThai" class="col-sm-3 col-form-label">Trạng Thái:</label>
                            <select id="trangThai" name="trangThai" class="form-select" disabled>
                                <option value="1" >Hoạt Động</option>
                                <!-- <option value="0">Không Hoạt Động</option> -->
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                <button type="submit" class="btn btn-primary" id="them" value="submit" onclick="addMaGiamGia()">Lưu</button>
            </div>
        </div>
    </div>
    </div>
</body>
</html>


