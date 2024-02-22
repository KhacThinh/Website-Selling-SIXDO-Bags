<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Nhân Viên</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .search-input {
            border-radius: 20px;
        }
        .container {
            margin-top: 50px;
            margin-right: 50px;
        }

        .search-button {
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
        }

        .add-button {
            border-radius: 20px;
        }

        .table th,
        .table td {
            vertical-align: middle;
        }

        .modal-content {
            border-radius: 20px;
        }
    </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/quan_ly/navbar/navbar.jsp"/>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-12 text-center">
            <h2>Quản Lý Chi Tiết Sản Phẩm</h2>
            <hr>
            <div class="col-md-12 mb-3">
                <form>
                    <div class="input-group">
                        <input type="text" class="form-control search-input" id="inputSearch"
                               placeholder="Tìm kiếm nhân viên">
                        <div class="input-group-append">
                            <button class="btn btn-info search-button" type="submit"><i
                                    class="fas fa-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-12 mb-3">
                <button type="button" class="btn btn-success add-button" data-toggle="modal"
                        data-target="#addCustomerModal">Thêm Nhân Viên</button>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Tên</th>
                        <th scope="col">Email</th>
                        <th scope="col">Hành Động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Khách Hàng 1</td>
                        <td>khachhang1@example.com</td>
                        <td>
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal"
                                    data-target="#editCustomerModal">
                                <i class="fas fa-edit"></i> Sửa
                            </button>
                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal"
                                    data-target="#deleteCustomerModal">
                                <i class="fas fa-trash-alt"></i> Xóa
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>Khách Hàng 1</td>
                        <td>khachhang1@example.com</td>
                        <td>
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal"
                                    data-target="#editCustomerModal">
                                <i class="fas fa-edit"></i> Sửa
                            </button>
                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal"
                                    data-target="#deleteCustomerModal">
                                <i class="fas fa-trash-alt"></i> Xóa
                            </button>
                        </td>
                    </tr>
                    <!-- Thêm khách hàng khác ở đây -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Modal Thêm Nhân Viên -->
<div class="modal fade" id="addCustomerModal" tabindex="-1" role="dialog" aria-labelledby="addCustomerModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCustomerModalLabel">Thêm Nhân Viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="name">Tên:</label>
                        <input type="text" class="form-control" id="name" placeholder="Nhập tên">
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" placeholder="Nhập email">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" id="confirmAddBtn">Thêm Nhân Viên</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Sửa Nhân Viên -->
<div class="modal fade" id="editCustomerModal" tabindex="-1" role="dialog" aria-labelledby="editCustomerModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editCustomerModalLabel">Sửa Nhân Viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="editName">Tên:</label>
                        <input type="text" class="form-control" id="editName" placeholder="Nhập tên">
                    </div>
                    <div class="form-group">
                        <label for="editEmail">Email:</label>
                        <input type="email" class="form-control" id="editEmail" placeholder="Nhập email">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" id="confirmEditBtn">Lưu Thay Đổi</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Xóa Nhân Viên -->
<div class="modal fade" id="deleteCustomerModal" tabindex="-1" role="dialog"
     aria-labelledby="deleteCustomerModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteCustomerModalLabel">Xóa Nhân Viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Bạn có chắc muốn xóa nhân viên này?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Xóa</button>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    // Xử lý xác nhận thêm nhân viên
    document.getElementById('confirmAddBtn').addEventListener('click', function () {
        // Thực hiện các hành động cần thiết để thêm nhân viên
        $('#addCustomerModal').modal('hide');
    });

    // Xử lý xác nhận sửa nhân viên
    document.getElementById('confirmEditBtn').addEventListener('click', function () {
        // Thực hiện các hành động cần thiết để sửa nhân viên
        $('#editCustomerModal').modal('hide');
    });

    // Xử lý xác nhận xóa nhân viên
    document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
        // Thực hiện các hành động cần thiết để xóa nhân viên
        // Đóng modal
        $('#deleteCustomerModal').modal('hide');
    });
</script>
</body>

</html>