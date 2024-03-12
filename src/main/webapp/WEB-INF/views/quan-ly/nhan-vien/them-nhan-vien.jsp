<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
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

<div class="modal modal-xl" id="modalAddNhanVien" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">


        <div class="modal-content">
            <h1>Nhân Viên</h1>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mb-3 row">
                            <label for="chucVu" class="col-sm-3 col-form-label" >Chức Vụ</label>
                            <select id="chucVu" name="chucVu" class="form-select" >
                                <c:forEach items="${listColors2}" var="cv">
                                    <option value="${cv.id}"> ${cv.tenChucVu} </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="maNhanVien">Mã Nhân Viên</label>
                            <input id="maNhanVien" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label for="hoTen">Họ Tên</label>
                            <input id="hoTen" class="form-control"/>
                        </div>
                        <label>Giới Tính</label>
                        <select id="gioiTinh" name="gioiTinh">
                            <option value="1">Nam</option>
                            <option value="0">Nữ</option>

                        </select>
                        <div class="form-group">
                            <label for="ngaySinh">Ngày Sinh</label>
                            <input type="date" id="ngaySinh" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label for="sdt">SDT</label>
                            <input id="sdt" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input id="email" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label for="matKhau">Mật Khẩu</label>
                            <input id="matKhau" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label for="cccd">Số Căn Cước</label>
                            <input id="cccd" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="queQuan">Quê Quán</label>
                            <input id="queQuan" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="thoiGianVao">Thời Gian Vào Làm</label>
                            <input type="datetime-local" id="thoiGianVao" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label for="thoiGianRa">Thời Gian Ra Làm</label>
                            <input type="datetime-local" id="thoiGianRa" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="trangThai">Trạng Thái:</label>
                            <select id="trangThai" name="trangThai">
                                <option value="1">Hoạt Động</option>
                                <%--                            <option value="0">Không Hoạt Động</option>--%>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                    <button type="submit" class="btn btn-primary" id="them" value="submit" onclick="addNhanVien()">
                        Lưu
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="errorModalLabel">Thông báo lỗi</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="error-message">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>












