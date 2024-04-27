<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>QUẢN LÝ</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
            integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Bao gồm Bootstrap CSS nếu cần -->


    <style type="text/css">
        #test {
            width: auto;
            height: 600px;
            overflow-x: hidden;
            overflow-y: auto;
            position: relative; /* Thiết lập vị trí tương đối */
            font-size: 13px;
        }

        /* Cố định thead */
        #test thead {
            position: sticky;
            top: 0;
            background-color: #fff; /* Để thêm một nền trắng dưới thead */
            z-index: 1; /* Đặt z-index để thead hiển thị trên top */
        }

        /* Thêm một padding-top cho tbody để giữ cho nội dung không bị che khuất bởi thead */
        #test tbody {
            padding-top: 40px; /* Chiều cao của thead */
        }

        .container {
            margin-top: 50px;
            margin-right: 50px;
            width: 1200px;
        }

        #trang-thai-hoa-don {
            color: black;
        }

        /* Trạng thái đã thanh toán */
        #trang-thai-hoa-don[data-status="0"] {
            color: #179954;
        }

        #trang-thai-hoa-don[data-status="2"] {
            color: #0b3cc1;
        }

        #trang-thai-hoa-don[data-status="1"] {
            color: #F39C12;
        }

        #trang-thai-hoa-don[data-status="3"] {
            color: #F39C12;
        }

        /* Trạng thái đã hủy */
        #trang-thai-hoa-don[data-status="4"] {
            color: darkred;
        }

        #trang-thai-hoa-don[data-status="5"] {
            color: #007bff;
        }

        #trang-thai-hoa-don[data-status="6"] {
            color:#0abf30;
        }

        .filter-bar {
            display: flex;
            justify-content: space-between; /* Canh các phần tử theo chiều ngang */
            align-items: center; /* Căn các phần tử theo chiều dọc */
        }



        .btn:last-child {
            margin-right: 0; /* Loại bỏ khoảng cách bên phải của nút cuối cùng */
        }

        .btn i {
            margin-right: 5px; /* Khoảng cách giữa icon và văn bản trong nút */
        }

    </style>

</head>
<body>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<jsp:include page="/WEB-INF/views/quan-ly/sidebar-manager/sidebar-manager.jsp"/>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-5 mb-3">
            <form action="/hoa-don/search-hoa-don" class="search-form" method="get">
                <div class="input-group">
                    <input type="text" name="nameSearch" class="form-control" placeholder="Tìm kiếm theo mã hoặc sdt...">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit">Tìm kiếm</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="container">

    <div class="filter-bar">
        <form action="/hoa-don/filterBanTaiQuay" method="post">
            <button type="submit" class="btn btn-light" id="taiQuayBtn"><i class="fas fa-store"></i> Tại quầy</button>
        </form>
        <form action="/hoa-don/filterChoXacNhan" method="post">
            <button type="submit" class="btn btn-light" id="pendingBtn"><i class="fas fa-hourglass-half" ></i> Chờ xác nhận </button>
        </form>
        <form action="/hoa-don/filterXuLy" method="post">
            <button type="submit" class="btn btn-light" id="processingBtn"><i class="fas fa-cog" ></i> Đang xử lý </button>

        </form>
        <form action="/hoa-don/filterGiaoHang" method="post">
            <button type="submit" class="btn btn-light" id="shippingBtn"><i class="fas fa-truck"></i> Đang giao hàng </button>

        </form>
        <form action="/hoa-don/filterHoanThanh" method="post">
            <button type="submit" class="btn btn-light" id="deliveredBtn"><i class="fas fa-check-circle"></i> Hoàn Thành </button>

        </form>
        <form action="/hoa-don/filterHuy" method="post">
            <button type="submit" class="btn btn-light" id="btnHuy"><i class="fas fa-times" ></i> Đã Hủy</button>

        </form>

    </div>


    <div id="test">
        <table class="table table-hover table-striped mb-5">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">MÃ HOÁ ĐƠN</th>
                <th scope="col">TÊN KHÁCH HÀNG</th>
                <th scope="col">SDT KHÁCH HÀNG</th>
                <th scope="col">THỜI GIAN TẠO</th>
                <th scope="col">SỐ LƯỢNG SẢN PHẨM</th>
                <th scope="col">TỔNG TIỀN</th>
                <th scope="col">TRẠNG THÁI</th>
                <th scope="col">HOẠT ĐỘNG</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${hoaDons}" var="hd" varStatus="i">
                <tr>
                    <th scope="col">${i.index + 1}</th>
                    <td>${hd.key.maHoaDon}</td>
                    <td>${hd.key.tenNguoiNhan}</td>
                    <td>${hd.key.sdtNguoiNhan}</td>
                    <td>${hd.key.thoiGianTao}</td>
                    <td>${hd.value.size()}</td>
                    <fmt:formatNumber pattern="#,###" var="tongTien"
                                      value="${hd.key.tongTien}"></fmt:formatNumber>
                    <td>${tongTien}</td>

                    <td id="trang-thai-hoa-don" data-status="${hd.key.trangThai}">
                        <script>
                            var trangThai = ${hd.key.trangThai};
                            var trangThaiString = '';
                            switch (trangThai) {
                                case 0:
                                    trangThaiString = 'Đã Thanh Toán Tại Quầy';
                                    break;
                                case 1:
                                    trangThaiString = 'Hóa Đơn Tạm';
                                    break;
                                case 2:
                                    trangThaiString = 'Chưa Xác Nhận';
                                    break;
                                case 3:
                                    trangThaiString = 'Đã Xác Nhận';
                                    break;
                                case 4:
                                    trangThaiString = 'Đã Hủy';
                                    break;
                                case 5:
                                    trangThaiString = 'Đang Giao Hàng';
                                    break;
                                case 6:
                                    trangThaiString = 'Giao Hàng Thành Công';
                                    break;
                                default:
                                    trangThaiString = 'Unknown';
                            }
                            document.write(trangThaiString);
                        </script>
                    </td>

                    <td>
                        <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><i
                                class="bi bi-three-dots-vertical"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                                <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal${i.index}">
                                    <i class="bi bi-exclamation-circle"></i> Chi Tiết</a>
                                </button>
                            </li>
                        </ul>
                        <div class="modal fade" id="exampleModal${i.index}" tabindex="-1"
                             aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content" style="height: 665px">
                                    <div class="modal-header" style="height: 50px">
                                        <h4 class="modal-title fs-5" id="exampleModalLabel">HOÁ ĐƠN CHI TIẾT</h4>
                                        <button class="btn btn-success" onclick="inHoaDon('${hd.key.maHoaDon}')">
                                            <i class="bi bi-printer"></i> In Hoá Đơn
                                        </button>
                                    </div>
                                    <p style="font-size: 15px; font-weight: bold; margin: 10px 0px 0px 23px;background-color: #d3ead9 ; padding: 7px;border-radius: 5px ">
                                        Thông Tin</p>

                                    <div class="row" style="margin: 10px 0px 0px 25px">
                                        <div class="col-md-6" style="margin: 0px">
                                            <div class="form-group">
                                                <label>Mã Đơn Hàng : </label>
                                                <span> ${hd.key.maHoaDon}</span>
                                            </div>
                                            <div class="form-group">
                                                <label>Tài Khoản :<a>${hd.key.khachHang.tenKhachHang}
                                                    - ${hd.key.khachHang.maKhachHang} </a> </label>
                                            </div>
                                        </div>
                                        <div class="col-md-6" style="margin: 0px">
                                            <div class="form-group">
                                                <label>Trạng Thái Đơn Hàng : </label>
                                                <span>
        <script>
            var trangThai = ${hd.key.trangThai};
            var trangThaiString = '';
            switch (trangThai) {
                case 0:
                    trangThaiString = 'Đã Thanh Toán';
                    break;
                case 1:
                    trangThaiString = 'Hóa Đơn Tạm';
                    break;
                case 2:
                    trangThaiString = 'Chưa Xác Nhận';
                    break;
                case 3:
                    trangThaiString = 'Đã Xác Nhận';
                    break;
                case 4:
                    trangThaiString = 'Đã Hủy';
                    break;
                case 5:
                    trangThaiString = 'Đang Giao Hàng';
                    break;
                case 6:
                    trangThaiString = 'Giao Hàng Thành Công';
                    break;
                default:
                    trangThaiString = 'Unknown';
            }
            document.write(trangThaiString);
        </script>
    </span>
                                                <span style="color: red;">${hd.key.lyDoKhachHuy}</span>
                                            </div>

                                            <div class="form-group">
                                                <label>Thời Gian Đặt Hàng : </label>
                                                <span> ${hd.key.thoiGianTao}</span>

                                            </div>
                                        </div>
                                    </div>
                                    <p style="font-size: 15px; font-weight: bold; margin: 0px 0px 0px 23px;background-color: #d3ead9 ; padding: 7px;border-radius: 5px ">
                                        Thông Tin Người Nhận</p>
                                    <div class="row" style="margin: 10px 0px 0px 25px">
                                        <div class="col-md-6" style="margin: 0px">
                                            <div class="form-group">
                                                <label>Tên Người Nhận : </label>
                                                <span> ${hd.key.tenNguoiNhan}</span>
                                            </div>
                                            <div class="form-group">
                                                <label>Số Điện Thoại : </label>
                                                <span> ${hd.key.sdtNguoiNhan}</span>

                                            </div>
                                        </div>
                                        <div class="col-md-6" style="margin-bottom: 0px">
                                            <div class="form-group">
                                                <label>Địa Chỉ : </label>
                                                <span> ${hd.key.diaChiNguoiNhan}</span>
                                            </div>
                                            <div class="form-group">
                                                <label>Email : </label>
                                                <span> ${hd.key.emailNguoiNhan}</span>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-body" style="margin-top: 0px; padding-top:0px ">
                                        <div style="max-height: 164px; overflow-y: auto;">
                                            <table class="table table-hover table-striped mb-5"
                                                   style="margin-top: 0px;">
                                                <thead>
                                                <tr>
                                                    <th scope="col">STT</th>
                                                    <th scope="col">TÊN SẢN PHẨM</th>
                                                    <th scope="col">MÀU SẮC</th>
                                                    <th scope="col">DANH MỤC</th>
                                                    <th scope="col">THƯƠNG HIỆU</th>
                                                    <th scope="col">SỐ LƯỢNG</th>
                                                    <th scope="col">ĐƠN GIÁ</th>
                                                    <th scope="col">THÀNH TIỀN</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${hd.value}" var="cthd" varStatus="j">
                                                    <tr>
                                                        <th scope="col">${j.index + 1}</th>
                                                        <td>${cthd.chiTietSanPham.sanPham.tenSanPham}</td>
                                                        <td>${cthd.chiTietSanPham.mauSac.tenMauSac}</td>
                                                        <td>${cthd.chiTietSanPham.sanPham.danhMuc.tenDanhMuc}</td>
                                                        <td>${cthd.chiTietSanPham.sanPham.thuongHieu.ten}</td>
                                                        <td>${cthd.soLuong}</td>
                                                        <fmt:formatNumber pattern="#,###" var="donGia"
                                                                          value="${cthd.chiTietSanPham.giaBan}"></fmt:formatNumber>
                                                        <td>${donGia}</td>
                                                        <fmt:formatNumber pattern="#,###" var="thanhTien"
                                                                          value="${cthd.soLuong*cthd.chiTietSanPham.giaBan}"></fmt:formatNumber>
                                                        <td>${thanhTien}</td>
                                                    </tr>

                                                </c:forEach>
                                                </tbody>

                                            </table>
                                        </div>



                                        <c:set var="phiVanChuyen" value="${empty hd.key.phiVanChuyen ? '0' : hd.key.phiVanChuyen}" />
                                        <p style="position: absolute; bottom: 60px; right: 30px; font-size: 14px">
                                            Phí Vận Chuyển : <script>document.write(parseInt(${phiVanChuyen}).toLocaleString('en'))</script> đ</p>





                                        <fmt:formatNumber pattern="#,###" var="giamGia"
                                                          value="${hd.key.giamGia}"></fmt:formatNumber>
                                        <p style="position: absolute; bottom: 30px;  right: 30px; font-size: 14px;color: red">
                                            Giảm Giá : ${giamGia} đ</p>


                                        <fmt:formatNumber pattern="#,###" var="tongTien"
                                                          value="${hd.key.tongTien}"></fmt:formatNumber>
                                        <p style="position: absolute; bottom: 0;  right: 30px; font-weight: bold ; font-size: 15px">
                                            Tổng Thanh Toán : ${tongTien} đ</p>
                                    </div>
                                    <div class="modal-footer">
                                        <c:choose>
                                            <c:when test="${hd.key.trangThai == 2}">
                                                <%--                                                <button class="btn btn-success"--%>
                                                <%--                                                        onclick="xacNhanFromLichSuHoaDon('${hd.key.id}')">Xác Nhận--%>
                                                <%--                                                </button>--%>
                                                <a href="/ban-tai-quay/${hd.key.id}" target="_blank">
                                                    <button type="button" class="btn btn-success"><i
                                                            class="bi bi-truck"></i> Xử Lý Đơn Hàng
                                                    </button>
                                                </a>
                                                <%--                                                <button type="button" class="btn btn-success"><i class="bi bi-cash-coin"></i> Đã Thanh Toán</button>--%>
                                                <button type="button" class="btn btn-danger"
                                                        onclick="xoaHoaDonChuaXacNhan(${hd.key.id})">Hủy Đơn
                                                </button>
                                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                                                    Đóng
                                                </button>

                                            </c:when>
                                            <c:when test="${hd.key.trangThai == 3}">
                                                <a href="/ban-tai-quay/${hd.key.id}" target="_blank">
                                                    <button type="button" class="btn btn-success"><i
                                                            class="bi bi-truck"></i> Xử Lý Đơn Hàng
                                                    </button>
                                                </a>
                                                <%--                                                <button type="button" class="btn btn-success"><i class="bi bi-cash-coin"></i> Đã Thanh Toán</button>--%>
                                                <%--                                                <button type="button" class="btn btn-danger">Hủy Đơn</button>--%>
                                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                                                    Đóng
                                                </button>

                                            </c:when>
                                            <c:when test="${hd.key.trangThai == 5}">
                                                <button type="button" class="btn btn-success"
                                                        onclick="giaoHangThanhCong(${hd.key.id})">Xác Nhận Giao Hàng
                                                    Thành
                                                    Công
                                                </button>
                                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                                                    Đóng
                                                </button>

                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                                                    Đóng
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


</div>


<!-- Bootstrap JS (Tùy chọn) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<%--xóa hóa đơn chưa xác nhận--%>

<script>
    function xoaHoaDonChuaXacNhan(id) {
        Swal.fire({
            title: 'Bạn có chắc chắn muốn huỷ đơn hàng này không?',
            showCancelButton: true,
            confirmButtonText: 'Có, huỷ đơn hàng',
            cancelButtonText: 'Không, giữ nguyên',
            reverseButtons: true,
            preConfirm: async () => {
                const {value: inputReason, dismiss} = await Swal.fire({
                    title: 'Vui lòng cung cấp lý do huỷ đơn',
                    input: 'text',
                    inputPlaceholder: 'Nhập lý do ở đây...',
                    inputAttributes: {
                        autocapitalize: 'off'
                    },
                    showCancelButton: true,
                    cancelButtonText: 'Hủy',
                    confirmButtonText: 'Xác nhận',
                    showLoaderOnConfirm: true,
                    preConfirm: (inputReason) => {
                        if (!inputReason || inputReason.trim().length === 0) {
                            Swal.showValidationMessage('Vui lòng nhập lý do');
                            return false;
                        }
                        // Gửi request POST

                    },
                });

                if (dismiss === 'cancel' && !inputReasonEntered) {
                    // Nếu người dùng ấn nút "Huỷ" mà không nhập lý do, hủy hành động
                    return false;
                }

                return inputReason;
            },
            allowOutsideClick: () => !Swal.isLoading()
        }).then((result) => {
            if (result.isConfirmed) {
                if (result !== true) {
                    Swal.fire({
                        title: 'Đã huỷ đơn hàng',
                        text: `Đơn hàng của bạn đã được huỷ. Lý do: ${inputReason}`,
                        icon: 'success'
                    });
                } else {
                    // Hiển thị thông báo lỗi
                    Swal.fire({
                        title: 'Lỗi',
                        text: 'Có lỗi xảy ra khi huỷ đơn hàng',
                        icon: 'error'
                    });
                }
            }
        });
    }


    function xoaHoaDonChuaXacNhan(id) {

        // Nếu người dùng chọn "Hủy Đơn"
        Swal.fire({
            title: 'Nhập lí do hủy đơn',
            input: 'text',
            inputAttributes: {
                autocapitalize: 'off'
            },
            showCancelButton: true,
            confirmButtonText: 'Hủy Đơn',
            cancelButtonText: 'Quay lại',
            showLoaderOnConfirm: true,
            preConfirm: (cancelReason) => {
                if (!cancelReason) {
                    Swal.showValidationMessage('Vui lòng nhập lí do hủy đơn');
                }
                return cancelReason;
            },
            allowOutsideClick: () => !Swal.isLoading()
        }).then((result) => {
            if (result.isConfirmed) {
                // Nếu người dùng chọn "Hủy Đơn"
                const cancelReason = result.value;
                $.ajax({
                    type: "POST",
                    url: "/ban-tai-quay/huy-hoaDon",
                    data: {
                        id: id,
                        reason: cancelReason
                    },
                    success: function (response) {
                        if (response === "ok") {
                            Swal.fire({
                                title: "Good job!",
                                text: "Đơn hàng đã được Hủy!",
                                icon: "success",
                                confirmButtonText: "OK"
                            }).then(() => {
                                window.location.href = "http://localhost:8080/hoa-don/lich-su";
                            });
                        } else if (response === "error") {
                            Swal.fire({
                                title: "No",
                                text: "Đơn hàng đã được hủy từ trước đó",
                                icon: "warning",
                                confirmButtonText: "OK"
                            }).then(() => {
                                window.location.href = "http://localhost:8080/hoa-don/lich-su";
                            });
                        } else if (response === "errorGiaoHang") {
                            Swal.fire({
                                title: "No",
                                text: "Đơn hàng đã được giao. Không thể hủy",
                                icon: "warning",
                                confirmButtonText: "OK"
                            }).then(() => {
                                window.location.href = "http://localhost:8080/hoa-don/lich-su";
                            });
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
            }
        });
    }


    function inHoaDon(maHD) {
        var form = document.createElement('form');
        form.setAttribute('action', '/ban-tai-quay/export');
        form.setAttribute('method', 'get');
        form.style.display = 'none'; // Ẩn form đi để tránh hiển thị trên giao diện
        var input = document.createElement('input');
        input.setAttribute('type', 'hidden');
        input.setAttribute('name', 'maHoaDon');
        input.setAttribute('value', maHD); // Truyền giá trị tabActive vào biến maHoaDon
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
        // Redirect();
    }

    function xacNhanDonHang(ma) {
        $.ajax({
            url: '/hoa-don/xac-nhan-don-hang',
            type: 'POST',
            data: {
                maChucVu: ma
            },
            success: function (response) {
                if (response === "ok") {
                    window.location.reload();
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
            }
        });
    }
</script>

<script>


    function xacNhanFromLichSuHoaDon(id) {
        $.ajax({
            url: '/hoa-don/check-trangThai-ctsp',
            type: 'POST',
            data: {
                id: id,
            },
            success: function (response) {
                if (response.length === 0) {

                    $.ajax({
                        url: '/hoa-don/check-soLuong-xacNhan',
                        type: 'POST',
                        data: {
                            id: id,
                        },
                        success: function (response) {
                            if (response.length === 0) {
                                $.ajax({
                                    url: '/hoa-don/xacNhan-lichSuHoaDon',
                                    type: 'POST',
                                    data: {
                                        id: id,
                                    },
                                    success: function (response) {

                                        if (response === "ok") {
                                            Swal.fire({
                                                title: "Good job!",
                                                text: "Đơn hàng đã được xác nhận",
                                                icon: "success"
                                            });

                                            setTimeout(function () {
                                                window.location.href = "http://localhost:8080/hoa-don/lich-su";
                                            }, 2000); // Đợi 2 giây trước khi chuyển trang
                                        } else if (response === "errerXacNhan") {

                                            Swal.fire({
                                                title: "No",
                                                text: "Đơn hàng đã được xác nhận từ trước đó",
                                                icon: "warning",
                                                showCancelButton: false, // Đặt showCancelButton thành false để loại bỏ nút Cancel
                                                confirmButtonText: "OK"
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    window.location.href = "http://localhost:8080/hoa-don/lich-su";
                                                }
                                            });

                                        } else if (response === "null") {
                                            Swal.fire({
                                                title: "Bạn muốn hủy đơn hàng này?",
                                                icon: "warning",
                                                showCancelButton: true,
                                                confirmButtonText: "Hủy",
                                                cancelButtonText: "Cancel",
                                                customClass: {
                                                    confirmButton: 'swal-confirm-button',
                                                    cancelButton: 'swal-cancel-button'
                                                }
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    // Xử lý khi người dùng chọn "Giữ"
                                                    // Ví dụ: window.location.href = "http://example.com";
                                                } else {
                                                    // Xử lý khi người dùng chọn "Hủy"
                                                    // Ví dụ: alert("Hủy đơn hàng");
                                                }
                                            });
                                        }


                                    },
                                    error: function (error) {
                                        console.error("Có lỗi xảy ra:", error);

                                    }
                                });

                            } else {
                                // Tạo chuỗi thông báo để hiển thị tên sản phẩm và màu sắc trên cùng một dòng
                                var message = "";
                                var soLuong = "";
                                response.forEach(function (item) {
                                    if (item.soLuong === 0) {
                                        soLuong = " - Hết Hàng"
                                    } else {
                                        soLuong = " .Chỉ được thêm tối đa: " + item.soLuong + " Sản Phẩm"
                                    }
                                    message += "<span class='bold'>" + item.sanPham.tenSanPham + "</span> - " + item.mauSac.tenMauSac + soLuong + "<br>";
                                });

                                Swal.fire({
                                    title: "Thông tin sản phẩm",
                                    html: message,
                                    icon: "warning",
                                    customClass: {
                                        htmlContainer: 'swal2-html-container',
                                        popup: 'swal2-popup',
                                        title: 'swal2-title',
                                        content: 'swal2-content',
                                        confirmButton: 'swal2-confirm',
                                        cancelButton: 'swal2-cancel',
                                    }
                                });
                            }
                        },
                        error: function (error) {
                            console.error("Có lỗi xảy ra:", error);

                        }
                    });


                } else {
                    var message = "";
                    var trangThai = "";
                    response.forEach(function (item) {
                        if (item.trangThai === 0) {
                            trangThai = " - Ngừng Bán"
                        }
                        message += "<span class='bold'>" + item.sanPham.tenSanPham + "</span> - " + item.mauSac.tenMauSac + trangThai + "<br>";
                    });

                    Swal.fire({
                        title: "Thông tin sản phẩm",
                        html: message,
                        icon: "warning",
                        customClass: {
                            htmlContainer: 'swal2-html-container',
                            popup: 'swal2-popup',
                            title: 'swal2-title',
                            content: 'swal2-content',
                            confirmButton: 'swal2-confirm',
                            cancelButton: 'swal2-cancel',
                        }
                    });
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);

            }
        });


    }

</script>

<script>
    function giaoHangThanhCong(id) {
        $.ajax({
            url: '/hoa-don/giao-hang-thanh-cong',
            type: 'POST',
            data: {
                id: id
            },
            success: function (response) {
                if (response === "ok") {
                    Swal.fire({
                        title: "Good job!",
                        text: "Đơn hàng đã được giao thành công",
                        icon: "success"
                    });

                    setTimeout(function () {
                        window.location.href = "http://localhost:8080/hoa-don/lich-su";
                    }, 2000); // Đợi 2 giây trước khi chuyển trang
                } else {
                    Swal.fire({
                        title: "No",
                        text: "Đơn hàng đã được hủy từ trước đó",
                        icon: "warning",
                        confirmButtonText: "OK"
                    }).then(() => {
                        window.location.href = "http://localhost:8080/hoa-don/lich-su";
                    });
                }
            },
            error: function (error) {
                console.error("Có lỗi xảy ra:", error);
            }
        });
    }
</script>

<%--Lọc--%>



</body>

</html>
