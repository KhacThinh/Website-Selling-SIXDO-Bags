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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

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
        /* Áp dụng chiều cao tối đa cho bảng */
        .table-wrapper {

            max-height: 270px;
            overflow-y: auto; /* Hiển thị thanh trượt nếu nội dung vượt quá */
        }
        .table-wrapper thead {
            position: sticky;
            top: 0;
            background-color: white; /* Màu nền của tiêu đề */
            z-index: 99; /* Đảm bảo tiêu đề hiển thị trên cùng */
            margin-top: 0px;
        }
        .alert {
            margin-top: 20px;
        }
        .red-star {
            color: red;
        }
    </style>
</head>
<body>

<div class="modal modal-xl" id="modalAddMaGiamGia" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <h5 class=" mb-4" style="padding-top: 15px;margin-left: 20px; font-weight: bold"> <i class="fas fa-tags"></i>
                MÃ GIẢM GIÁ</h5>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="maGiamGia">Mã Giảm Giá</label><span class="red-star"> *</span>
                            <input id="maGiamGia" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label for="giaTriGiam">Giá Trị Giảm</label><span class="red-star"> *</span>
                            <input id="giaTriGiam" class="form-control"/>
                        </div>


                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="tenMaGiamGia">Tên Mã Giảm Giá</label><span class="red-star"> *</span>
                            <input id="tenMaGiamGia" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="soLuong">Số lượng</label><span class="red-star"> *</span>
                            <input id="soLuong" class="form-control"/>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="ngayBatDau">Ngày Bắt Đầu</label><span class="red-star"> *</span>
                            <input type="datetime-local" id="ngayBatDau" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label for="dieuKienGiam">Điều Kiện</label><span class="red-star"> *</span>
                            <input id="dieuKienGiam" class="form-control"/>
                        </div>
                    </div>



                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="ngayKetThuc">Ngày Kết Thúc</label><span class="red-star"> *</span>
                            <input type="datetime-local" id="ngayKetThuc" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label for="moTa">Mô Tả</label>
                            <input id="moTa" value="OK" class="form-control"/>
                        </div>
                        <%--                        <div class="form-group">--%>
                        <%--                            <label for="trangThai" class="col-sm-3 col-form-label">Trạng Thái:</label>--%>
                        <%--                            <select id="trangThai" name="trangThai" class="form-select" disabled>--%>
                        <%--                                <option value="1" >Hoạt Động</option>--%>
                        <%--                                <!-- <option value="0">Không Hoạt Động</option> -->--%>
                        <%--                            </select>--%>
                        <%--                        </div>--%>
                    </div>
                </div>
            </div>
            <h5 class=" mb-4" style="padding-top: 0px;margin-left: 20px; font-weight: bold">
                <i class="fas fa-tags"></i>Áp Dụng (Bỏ trống để áp dụng cho tất cả) </h5>
            <div class="modal-body table-wrapper" style="margin-top: 0px;padding-top: 0px" >
                <table class="table" style="margin-top: 0px;padding-top: 0px">
                    <thead>
                    <tr>
                        <th scope="col">Mã Khách Hàng</th>
                        <th scope="col">Tên Khách Hàng</th>
                        <th scope="col">Email</th>
                        <th scope="col">SĐT</th>

                        <th scope="col">Chọn</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="customer" items="${listsKhachHang}">
                        <tr>
                            <th scope="row">${customer.maKhachHang}</th>
                            <td>${customer.tenKhachHang}</td>
                            <td>${customer.email}</td>
                            <td>${customer.sdt}</td>

                            <td>
                                <input type="checkbox" class="form-check-input add-checkbox-for" id="customer-${customer.id}">
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                <button type="submit" class="btn btn-primary" id="them" value="submit" onclick="addMaGiamGia()">Lưu</button>
            </div>
        </div>
    </div>
</div>

<script>
    // function addMaGiamGia() {
    //     // Mảng để lưu các ID của khách hàng đã chọn
    //     var selectedCustomers = [];
    //     // Duyệt qua các input checkbox trong bảng
    //     $("input[type='checkbox']").each(function() {
    //
    //         // Kiểm tra xem checkbox có được chọn không
    //         if ($(this).is(":checked")) {
    //             // Lấy ID của khách hàng từ thuộc tính id của input
    //             var customerId = $(this).attr("id").split("-")[1];
    //             // Thêm ID của khách hàng vào mảng selectedCustomers
    //             selectedCustomers.push(customerId);
    //
    //         }
    //
    //     });
    //
    //
    //         console.log("ID của các khách hàng đã chọn:", selectedCustomers);
    //
    //
    // }

</script>
</body>
</html>



