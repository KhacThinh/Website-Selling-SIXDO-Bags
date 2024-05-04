<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Shoping Cart</title>
    <link rel="Website Icon" type="png" href="../static/images/icon/LOGOSIXDO.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!--===============================================================================================-->
    <%--    <link rel="icon" type="image/png" href="images/icons/favicon.png"/>--%>
    <!--===============================================================================================-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hamburgers/1.1.3/hamburgers.min.css">
    <!--===============================================================================================-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animsition/3.2.1/js/animsition.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/1.5.0/css/perfect-scrollbar.min.css">
    <!--===============================================================================================-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    <!--===============================================================================================-->

    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="/static/css/util.css">
    <link rel="stylesheet" href="/static/css/shopping-cart/style.css">
</head>
<body class="animsition">

<!-- Header -->
<jsp:include page="/WEB-INF/views/ban-hang-online/components/hd.jsp"/>

<!-- Shoping Cart -->
<form class="bg0 p-t-75 p-b-85">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-xl-8 m-lr-auto m-b-30">
                <div class="m-l-12 m-r--38 m-lr-0-xl">
                    <div class="wrap-table-shopping-cart">
                        <table class="table-shopping-cart" id="iiiid">
                            <thead>
                            <tr class="table_head">
                                <th class="column-1" colspan="2">Sản Phẩm</th>
                                <th class="column-3">Giá</th>
                                <th class="column-4" style="vertical-align: middle; text-align: center;">Số Lượng</th>
                                <th class="column-5">Tổng Tiền</th>
                                <th class="column-6">Xoá</th>

                            </tr>
                            </thead>

                            <tbody class="tbody_GioHang" id="cartTableBody">
                            <c:set var="totalPrice" value="0"/>
                            <c:forEach var="o" items="${listGioHangBuyer}" varStatus="i">

                                <tr class="table_row" id="itemCtsp${i.index}">

                                    <input value="${o.idChiTietSanPham}" id="idChiTietSanPhamFormShoppingCart"
                                           type="hidden">

                                    <td class="column-1">
                                        <div class="how-itemcart1">
                                            <img id="imageProduct-in-cart" src="${o.chiTietSanPham.hinhAnh}" alt="IMG">
                                        </div>
                                    </td>
                                    <td class="column-2">
                                        <p id="nameProduct-in-cart">${o.chiTietSanPham.sanPham.tenSanPham}</p>
                                        <p id="MauSacProduct-in-cart"
                                           style="font-size: 14px">${o.chiTietSanPham.mauSac.tenMauSac}</p>


                                    </td>
                                    <td class="column-3" id="priceProduct-in-cart"><fmt:formatNumber pattern="#,###"
                                                                                                     var="donGia"
                                                                                                     value="${o.chiTietSanPham.giaBan}"></fmt:formatNumber>
                                            ${donGia}đ
                                    </td>
                                    <td class="column-4">
                                        <div class="wrap-num-product flex-w m-l-auto m-r-0">
                                            <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m"
                                                 id="btn-minus-${i.index}">
                                                <i class="fs-16 zmdi zmdi-minus"></i>
                                            </div>

                                            <input class="mtext-104 cl3 txt-center num-product" type="number"
                                                   name="num-product${o.chiTietSanPham.id}"
                                                   id="quantityProduct-${i.index}" value="${o.soLuong}" min="1"
                                            >
                                            <span id="error-message"></span>
                                            <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m"
                                                 id="btn-plus-${i.index}">
                                                <i class="fs-16 zmdi zmdi-plus"></i>
                                            </div>


                                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                                            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                                            <!-- Nhúng thư viện SweetAlert -->
                                        </div>
                                    </td>
                                    <td class="column-5" id="sumPrice-in-cart${i.index}"><fmt:formatNumber
                                            pattern="#,###"
                                            var="tongTam"
                                            value="${o.chiTietSanPham.giaBan*o.soLuong}"></fmt:formatNumber>
                                            ${tongTam}đ
                                    </td>

                                    <c:set var="temp" value="${o.chiTietSanPham.giaBan * o.soLuong}"/>
                                    <c:set var="totalPrice" value="${totalPrice + temp}"/>


                                    <td style="width: 70px">
                                        <button class="delete-product" data-product-id="${o.chiTietSanPham.id}"
                                                onclick="deleteProductShopingCart(${o.chiTietSanPham.id}, this); return false;">
                                            <i class="bi bi-trash3"></i>
                                        </button>

                                    </td>
                                </tr>


                                <link rel="stylesheet"
                                      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
                                <script>
                                    var checkDieuKienApMaGiamGia = 0;
                                    // Lấy phần tử div có id là 'btn-minus'
                                    var btnMinus = document.getElementById('btn-minus-${i.index}');
                                    var btnPlus = document.getElementById('btn-plus-${i.index}');
                                    var quantityInput = document.getElementById('quantityProduct-${i.index}');
                                    var idKhachHang = document.getElementById("id-khach-hang").value;


                                    // Giam so Luong
                                    btnMinus.addEventListener('click', function () {
                                        var currentQuantity = parseInt(this.parentNode.querySelector('.num-product').value);
                                        if (currentQuantity > 1) { // Đảm bảo số lượng không nhỏ hơn 1
                                            var newQuantity = currentQuantity - 1;
                                            updateQuantity(${o.chiTietSanPham.id}, newQuantity, quantityInput);
                                            this.parentNode.querySelector('.num-product').value = newQuantity;
                                            updateTotalPrice(newQuantity, ${o.chiTietSanPham.giaBan}, ${i.index});
                                            updateTotalPriceForAllProducts();
                                        }
                                    });
                                    // Tang so luong

                                    btnPlus.addEventListener('click', function () {
                                        var input = document.getElementById('quantityProduct-${i.index}');

                                        $.ajax({
                                            type: 'POST',
                                            url: '/sixdo-shop/get-soLuong',
                                            data: {
                                                idChiTietSanPham: ${o.idChiTietSanPham}
                                            },
                                            success: function (response) {
                                                var max = response;
                                                var currentQuantity = parseInt(input.value);
                                                var newQuantity = currentQuantity + 1;

                                                if (newQuantity > max) {
                                                    Swal.fire(
                                                        'Lỗi!',
                                                        'Số Lượng vượt quá ' + max + 'Sản Phẩm',
                                                        'error'
                                                    );
                                                    updateQuantity(${o.chiTietSanPham.id}, max, quantityInput);
                                                    input.value = max;
                                                    updateTotalPrice(max, ${o.chiTietSanPham.giaBan}, ${i.index});
                                                    updateTotalPriceForAllProducts()
                                                } else {
                                                    updateQuantity(${o.chiTietSanPham.id}, newQuantity, quantityInput);
                                                    input.value = newQuantity;
                                                    updateTotalPrice(newQuantity, ${o.chiTietSanPham.giaBan}, ${i.index});
                                                    updateTotalPriceForAllProducts();
                                                }
                                            },
                                            error: function (xhr, status, error) {
                                                console.error('Lỗi khi cập nhật số lượng sản phẩm:', error);
                                            }
                                        });
                                    });


                                    // update quantity "+" "-"
                                    function updateQuantity(productId, newQuantity) {
                                        $.ajax({
                                            type: 'POST',
                                            url: '/sixdo-shop/edit-soLuong-checkout',
                                            contentType: 'application/json',
                                            data: JSON.stringify({
                                                idKhachHang: idKhachHang,
                                                idChiTietSanPham: productId,
                                                soLuong: newQuantity
                                            }),
                                            success: function (response) {
                                            },
                                            error: function (xhr, status, error) {
                                                console.error('Lỗi khi cập nhật số lượng sản phẩm:', error);
                                            }
                                        });
                                    }
                                </script>

                                <%--                                    update TongTien--%>
                                <script>

                                    var formatter = new Intl.NumberFormat('vi-VN', {
                                        style: 'currency',
                                        currency: 'VND'
                                    });

                                    function updateTotalPriceForAllProducts() {
                                        var total = 0;
                                        var tableRows = document.querySelectorAll('#cartTableBody .table_row');
                                        tableRows.forEach(function (row) {
                                            var quantity = parseInt(row.querySelector('.num-product').value);
                                            var pricePerProductString = row.querySelector('#priceProduct-in-cart').innerText; // Lấy giá mỗi sản phẩm từ cột giá trong hàng
                                            var pricePerProduct = parseFloat(pricePerProductString.replace(/[^\d.-]/g, '')); // Xóa tất cả các ký tự không phải số, dấu chấm và dấu gạch ngang
                                            total += quantity * pricePerProduct;
                                        });

                                        document.getElementById('giaTriTienTam').value = total;
                                        // Cập nhật giá tiền tổng cho toàn bộ giỏ hàng
                                        var formattedTotal = new Intl.NumberFormat('vi-VN', {
                                            style: 'currency',
                                            currency: 'VND'
                                        }).format(total);
                                        document.getElementById('sumCart').innerText = formattedTotal;
                                        kiemTraMaGiamGiaKhiThayDoiSoLuong();


                                    }

                                    function kiemTraMaGiamGiaKhiThayDoiSoLuong() {
                                        var sumCart = document.getElementById('giaTriTienTam').value;

                                        var maGiamGiaValue = document.getElementById('maGiamGiaInput').value;
                                        console.log("mggg" + maGiamGiaValue)
                                        console.log("khachHang" +${khachHang.id})
                                        $.ajax({
                                            url: '/sixdo-shop/check-ma-giam-gia',
                                            type: 'POST',
                                            data: {
                                                <%--idKhachHang:${khachHang.id},--%>
                                                maGiamGia: maGiamGiaValue
                                            },
                                            success: function (maGiamGia1) {
                                                console.log("sumcartkk " + sumCart)
                                                if (parseFloat(maGiamGia1.dieuKienGiam) > parseFloat(sumCart)) {
                                                    document.getElementById('maGiamGiaOnlineValue').value = 0;
                                                    document.getElementById('maGiamGiaOnline').innerText = "0 đ"
                                                    console.log("mkkkk " + document.getElementById('maGiamGiaOnlineValue').value)

                                                } else {
                                                    document.getElementById('maGiamGiaOnlineValue').value = maGiamGia1.giaTriGiam;
                                                    document.getElementById('maGiamGiaOnline').innerText = maGiamGia1.giaTriGiam > 0 ? formatter.format(maGiamGia1.giaTriGiam) : 0 + " đ";
                                                }
                                                let giaTriMaGiamGia = document.getElementById('maGiamGiaOnlineValue').value;

                                                let lastPriceValue = sumCart - giaTriMaGiamGia;
                                                console.log("" + sumCart + "-" + giaTriMaGiamGia)
                                                document.getElementById('last-price').innerText = formatter.format(lastPriceValue);
                                            },
                                            error: function (error) {
                                                // Xử lý lỗi nếu có
                                                document.getElementById('maGiamGiaOnlineValue').value = 0;
                                                document.getElementById('maGiamGiaOnline').innerText = "0 đ"
                                                document.getElementById('last-price').innerText = formatter.format(sumCart);

                                                console.error(error);
                                            }
                                        });
                                    }

                                </script>

                                <%--                                    tính tiền mỗi sps--%>
                                <script>
                                    function updateTotalPrice(newQuantity, pricePerProduct, index) {
                                        var totalPrice = newQuantity * pricePerProduct;
                                        var formattedTotalPrice = new Intl.NumberFormat('vi-VN', {
                                            style: 'currency',
                                            currency: 'VND'
                                        }).format(totalPrice);
                                        var totalPriceElement = document.getElementById('sumPrice-in-cart' + index);
                                        totalPriceElement.innerHTML = formattedTotalPrice;
                                    }
                                </script>

                                <%--                                    checkDuLieuNhap--%>
                                <script>
                                    document.getElementById('quantityProduct-${i.index}').addEventListener('blur', function () {
                                        var newQuantity = parseInt(this.value);
                                        var productId = ${o.chiTietSanPham.id};
                                        var idKhachHang = document.getElementById("id-khach-hang").value;
                                        var input = document.getElementById('quantityProduct-${i.index}');
                                        var max = 0;
                                        $.ajax({
                                            type: 'POST',
                                            url: '/sixdo-shop/get-soLuong',
                                            data: {
                                                idChiTietSanPham:${o.idChiTietSanPham}
                                            },
                                            success: function (response) {
                                                max = response;
                                                if (newQuantity <= max && newQuantity > 0) {
                                                    updateQuantityInPut(idKhachHang, productId, newQuantity);
                                                    updateTotalPrice(newQuantity, ${o.chiTietSanPham.giaBan}, ${i.index});
                                                    updateTotalPriceForAllProducts();
                                                } else if (newQuantity <= 0) {
                                                    input.value = 1;
                                                    updateQuantityInPut(idKhachHang, productId, 1);
                                                    updateTotalPrice(1, ${o.chiTietSanPham.giaBan}, ${i.index});
                                                    updateTotalPriceForAllProducts();
                                                    Swal.fire(
                                                        'Lỗi!',
                                                        'Số lượng không hợp lệ.',
                                                        'error'
                                                    );
                                                } else {
                                                    input.value = max;
                                                    updateTotalPriceForAllProducts();
                                                    updateQuantityInPut(idKhachHang, productId, max);
                                                    updateTotalPrice(max, ${o.chiTietSanPham.giaBan}, ${i.index});
                                                    Swal.fire(
                                                        'Lỗi!',
                                                        'Số Lượng vượt quá ' + max + 'Sản Phẩm',
                                                        'error'
                                                    );
                                                }

                                            },
                                            error: function (xhr, status, error) {
                                                console.error('Lỗi khi cập nhật số lượng sản phẩm:', error);
                                            }
                                        });


                                    });


                                    // checkInput
                                    function updateQuantityInPut(idKhachHang, productId, newQuantity) {
                                        $.ajax({
                                            type: 'POST',
                                            url: '/sixdo-shop/edit-soLuong-checkout',
                                            contentType: 'application/json',
                                            data: JSON.stringify({
                                                idKhachHang: idKhachHang,
                                                idChiTietSanPham: productId,
                                                soLuong: newQuantity
                                            }),
                                            success: function (response) {

                                            },
                                            error: function (xhr, status, error) {
                                                console.error('Lỗi khi cập nhật số lượng sản phẩm:', error);
                                                // Xử lý khi có lỗi
                                            }
                                        });
                                    }
                                </script>
                                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

                                <%--                                    Xóa Sp trong giỏ hàng--%>
                                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                                <script>
                                    function deleteProductShopingCart(productId, element) {
                                        var idKhachHang = document.getElementById("id-khach-hang").value;
                                        Swal.fire({
                                            title: 'Xác nhận xóa sản phẩm',
                                            text: "Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?",
                                            icon: 'warning',
                                            showCancelButton: true,
                                            confirmButtonColor: '#d33',
                                            cancelButtonColor: '#3085d6',
                                            confirmButtonText: 'Xóa',
                                            cancelButtonText: 'Hủy'
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                $.ajax({
                                                    type: 'POST',
                                                    url: '/sixdo-shop/delete_ctsp-gio-hang-online',
                                                    data: {
                                                        idKhachHang: idKhachHang,
                                                        idChiTietSanPham: productId,
                                                    },
                                                    success: function (response) {
                                                        if (response === "ok") {
                                                            // Xóa sản phẩm từ giao diện người dùng
                                                            var productElement = element.closest('.table_row');
                                                            productElement.remove();
                                                            updateTotalPriceForAllProducts();
                                                            capNhapSoLuongSanPhamTrongGioHangHearder();
                                                            Swal.fire({
                                                                title: 'Đã xóa!',
                                                                text: 'Sản phẩm đã được xóa khỏi giỏ hàng.',
                                                                icon: 'success',
                                                                timer: 1500,
                                                                showConfirmButton: false
                                                            }).then((result) => {
                                                                $.get('/sixdo-shop/hien-thi-so-luong-cart-product', function (data) {
                                                                    if (data <= 0) {
                                                                        window.location.href = '/sixdo-shop/shoping-cart';
                                                                    }else{
                                                                        window.location.href = '/sixdo-shop/shoping-cart';
                                                                    }
                                                                });
                                                            });

                                                        } else {
                                                            Swal.fire(
                                                                'Lỗi!',
                                                                'Sản phẩm không tồn tại trong giỏ hàng.',
                                                                'error'
                                                            );
                                                        }
                                                    },
                                                    error: function (xhr, status, error) {
                                                        console.error('Lỗi khi xóa sản phẩm:', error);
                                                        Swal.fire(
                                                            'Lỗi!',
                                                            'Đã xảy ra lỗi khi xóa sản phẩm.',
                                                            'error'
                                                        );
                                                    }
                                                });
                                            }
                                        });
                                    }
                                </script>
                            </c:forEach>

                            </tbody>

                        </table>
                    </div>
                    <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
                        <div class="d-flex align-items-center m-r-20 m-tb-5">
                            <select class="form-select flex-grow-1 m-r-20" style="width: 50%;"
                                    aria-label="Default select example" id="maGiamGiaInput">
                                <option value="">Chọn mã giảm giá</option>
                                <c:forEach items="${danhSachMaGiamGia}" var="mgg">
                                    <fmt:formatNumber pattern="#,###" value="${mgg.giaTriGiam}"
                                                      var="giaTriGiam"></fmt:formatNumber>
                                    <option value="${mgg.maGiamGia}">${mgg.tenMaGiamGia} - Giảm giá: ${giaTriGiam} đ</option>
                                </c:forEach>
                            </select>
                            <div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5 apply-coupon">
                                Áp dụng ngay
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-10 col-lg-4 col-xl-4 m-lr-auto m-b-50">
                <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm"
                     style="width: 430px; margin: 0 20px;">
                    <h4 class="mtext-109 cl2 p-b-30">
                        TỔNG GIỎ HÀNG
                    </h4>
                    <input id="giaTriTienTam" type="number" style="display: none">
                    <div class="flex-w flex-t bor12 p-b-13">
                        <div class="size-208">
								<span class="stext-110 cl2">
									Tổng Tạm :
								</span>
                        </div>

                        <div class="size-209">
                            <span class="mtext-110 cl2" id="sumCart">
                                <fmt:formatNumber pattern="#,###" var="tempTongTam"
                                                  value="${totalPrice}"></fmt:formatNumber> ${tempTongTam}đ
                            </span>
                        </div>
                    </div>
                    <input type="number" value="0" id="maGiamGiaOnlineValue" style="display: none">

                    <div class="flex-w flex-t bor12 p-b-13 mt-2">
                        <div class="size-208">
								<span class="stext-110 cl2">
                                    Giảm Giá :
								</span>
                        </div>
                        <div class="size-209">
                            <span class="mtext-110 cl2" style="color: red" id="maGiamGiaOnline"></span>
                        </div>
                    </div>

                    <div class="flex-w flex-t bor12 p-t-15 p-b-30">
                        <p class="stext-112 cl8 p-b-15">Thông Tin Người Nhận</p>
                        <div style="display: flex; justify-content: space-between;">
                            <button type="button"
                                    class="btn-select-address btn-selected stext-111 cl8 plh3 size-111 p-lr-15 px-4 bor8 bg0"
                                    id="defaultAddressBtn" style="width: 150px">Địa chỉ mặc định
                            </button>
                            <button type="button"
                                    class="btn-select-address stext-111 cl8 plh3 size-111 p-lr-15 bor8 bg0"
                                    id="customAddressBtn" style="width: 200px">Nhập địa chỉ nhận hàng
                            </button>
                        </div>
                        <div id="infoRecipient" style="display:none;">
                            <p class="stext-112 cl8 p-b-15"></p>
                            <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">

                                <div style="display: flex; width: 370px;">
                                    <div class="bor8 bg0 m-b-12 m-r-15 w-150">
                                        <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text"
                                               name="name-for-cart" placeholder="Tên người nhận">
                                    </div>

                                    <div class="bor8 bg0 m-b-12">
                                        <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text"
                                               name="phone-for-cart" placeholder="Số điện thoại">
                                    </div>
                                </div>

                                <div class="bor8 bg0 m-b-12" style="width: 370px;">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15 w-400" type="email"
                                           name="email-for-cart"
                                           placeholder="Email (Không Bắt Buộc, Gửi Email Để Xác Nhận)">
                                </div>

                                <div class="p-t-15" id="diaChiDiv">
                                    <span class="stext-112 cl8">Địa Chỉ</span>
                                    <div style="display: flex; width: 370px;">
                                        <div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9"
                                             style="width: 180px; margin-right: 16px">
                                            <select class="js-select2" name="time" id="city">
                                                <option>Chọn Tỉnh Thành</option>
                                            </select>
                                            <div class="dropDownSelect2"></div>
                                        </div>

                                        <div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9"
                                             style="width: 180px;">
                                            <select class="js-select2" name="time" id="district">
                                                <option>Chọn Quận Huyện</option>
                                            </select>
                                            <div class="dropDownSelect2"></div>
                                        </div>
                                    </div>

                                    <div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9" style="width: 370px;">
                                        <select class="js-select2" name="time" id="ward">
                                            <option>Chọn Phường Xã</option>
                                        </select>
                                        <div class="dropDownSelect2"></div>
                                    </div>
                                    <div class="bor8 bg0 m-b-12" style="width: 370px;">
                                        <input class="stext-111 cl8 plh3 size-111 p-lr-15 w-400" type="text"
                                               id="village" placeholder="Địa Chỉ Cụ Thể (Số Nhà, Thôn, Ấp...)">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="flex-w flex-t p-t-27 p-b-33">
                        <div class="size-208">
								<span class="mtext-101 cl2">
									Tổng Tiền:
								</span>
                        </div>

                        <div class="size-209 p-t-1">
								<span class="mtext-110 cl2" id="last-price">
                        <fmt:formatNumber pattern="#,###" var="tempTongTam"
                                          value="${totalPrice}"></fmt:formatNumber> ${tempTongTam}đ</span>
                        </div>
                    </div>

                    <button type="button"
                            class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 submit-oder-by-cart">
                        Đặt Hàng
                    </button>

                </div>
            </div>
        </div>
    </div>
</form>


<!-- Footer -->
<jsp:include page="/WEB-INF/views/ban-hang-online/components/footer.jsp"/>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
</div>


<!--===============================================================================================-->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/animsition/4.0.2/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<!--===============================================================================================-->
<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
<script src="https://cdn.jsdelivr.net/npm/perfect-scrollbar@1.5.0/dist/perfect-scrollbar.min.js"></script>
<script>
    $('.js-pscroll').each(function () {
        $(this).css('position', 'relative');
        $(this).css('overflow', 'hidden');
        var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
        });

        $(window).on('resize', function () {
            ps.update();
        })
    });
</script>
<!--===============================================================================================-->
<script type="text/javascript">
    <%@include file="../../../views/ban-hang-online/js/main.js" %>

</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>

    let maGiamGiaValue = '';

    var currentClick = "default";

    $("#defaultAddressBtn").click(function () {
        if (currentClick !== "default") {
            // Xử lý khi chuyển từ click khác sang "defaultAddressBtn"
            $("#infoRecipient").hide();
            // Loại bỏ lớp CSS và thêm lớp CSS mới cho các nút
            $("#defaultAddressBtn").removeClass("btn-unselected").addClass("btn-selected");
            $("#customAddressBtn").removeClass("btn-selected").addClass("btn-unselected");
        }
        currentClick = "default";
    });

    $("#customAddressBtn").click(function () {
        if (currentClick !== "custom") {
            // Xử lý khi chuyển từ click khác sang "customAddressBtn"
            $("#infoRecipient").show();
            // Loại bỏ lớp CSS và thêm lớp CSS mới cho các nút
            $("#customAddressBtn").removeClass("btn-unselected").addClass("btn-selected");
            $("#defaultAddressBtn").removeClass("btn-selected").addClass("btn-unselected");
        }
        currentClick = "custom";
    });

    window.onload = function () {
        updateTotalPriceForAllProducts();
    };

    $(document).ready(function () {
        $('.apply-coupon').on('click', function () {
            var sumCart = document.getElementById('giaTriTienTam').value;

            maGiamGiaValue = document.getElementById("maGiamGiaInput").value;

            if (maGiamGiaValue != '') {
                $.post('/sixdo-shop/check-ma-giam-gia', {
                    maGiamGia: maGiamGiaValue
                }, function (maGiamGia1) {
                    if (Number(maGiamGia1.dieuKienGiam) <= Number(sumCart)) {
                        checkDieuKienApMaGiamGia = maGiamGia1.dieuKienGiam;
                        document.getElementById('maGiamGiaOnline').innerText = formatter.format(maGiamGia1.giaTriGiam);
                        document.getElementById('maGiamGiaOnlineValue').value = maGiamGia1.giaTriGiam;
                        updateTotalPriceForAllProducts();

                        showAlertAddCart('Mã Giảm Giá Được Sử Dụng!', 'Thành công', 'success');
                    } else {
                        document.getElementById('maGiamGiaOnlineValue').value = 0;
                        updateTotalPriceForAllProducts();

                        document.getElementById('maGiamGiaOnline').innerText = "0 đ";
                        showAlertAddCart('Chỉ Áp Dụng Cho Đơn Hàng Tối Thiểu ' + formatter.format(maGiamGia1.dieuKienGiam), '', 'error');
                        // showAlertAddCart('', 'Bạn đã huỷ áp dụng giảm giá', 'success');
                    }
                }).fail(function (jqXHR, textStatus, errorThrown) {
                    document.getElementById('maGiamGiaOnline').innerText = "0 đ"
                    console.error(error);
                    showAlertAddCart('Mã Giảm Giá Không Hợp Lệ.', '', 'error');
                });
            } else {
                document.getElementById('maGiamGiaOnlineValue').value = 0;
                updateTotalPriceForAllProducts();
                document.getElementById('maGiamGiaOnline').innerText = "0 đ";
                showAlertAddCart('', 'Bạn đã huỷ áp dụng giảm giá', 'success');
            }

        });
        var productList = [];

        function showErrorAlert(message) {
            Swal.fire({
                title: 'Lỗi',
                text: message,
                icon: 'error'
            });
        }

        function isValidPhoneNumber(phone) {
            var phonePattern = /^0[0-9]{9}$/;
            return phone.match(phonePattern);
        }


        let orderData = {};

        function createOrderCustomerinput() {
            var name = document.querySelector('input[name="name-for-cart"]').value.trim();
            var phone = document.querySelector('input[name="phone-for-cart"]').value.trim();
            var email = document.querySelector('input[name="email-for-cart"]').value.trim();
            var city = document.getElementById('city').value;
            var district = document.getElementById('district').value;
            var ward = document.getElementById('ward').value;
            var village = document.getElementById('village').value.trim();
            var lastPrice = document.getElementById('last-price').textContent;
            var lastPriceCleaned = lastPrice.replace(/,/g, '').replace(/\./g, '');
            var giamGia = document.getElementById('maGiamGiaOnlineValue').value;
            var giaTriGiam = 0;
            var maGiamGia = null;

<%--            <c:forEach var="o" items="${listGioHangBuyer}" varStatus="i">--%>
<%--            var product = {--%>
<%--                idCtSanPham: ${o.idChiTietSanPham},--%>
<%--                soLuong: document.getElementById('quantityProduct-${i.index}').value,--%>
<%--                gia:${o.chiTietSanPham.giaBan *o.soLuong},--%>
<%--            };--%>
<%--            productList.push(product);--%>
<%--            </c:forEach>--%>

            $.get('/product-favorite/check-gio-hang-chi-tiet', function (data) {
                if (data.length > 0) {
                    // Xử lý dữ liệu nhận được
                    data.forEach(function (item) {
                        var product = {
                            idCtSanPham: item.idChiTietSanPham,
                            soLuong: item.soLuong,
                            gia: item.chiTietSanPham.giaBan * item.soLuong,
                        };
                        productList.push(product);
                    });
                } else {
                    Swal.fire({
                        icon: 'info',
                        title: 'Giỏ hàng của bạn đang trống',
                    });
                }
            });


            var errors = [];

            if (name === '') {
                errors.push("Vui lòng nhập Tên người nhận!");
            }

            if (phone === '' || !isValidPhoneNumber(phone)) {
                errors.push("Số điện thoại không hợp lệ!");
            }

            if (city === 'Chọn Tỉnh Thành') {
                errors.push("Vui lòng chọn Tỉnh Thành!");
            }

            if (district === 'Chọn Quận Huyện') {
                errors.push("Vui lòng chọn Quận Huyện!");
            }

            if (ward === 'Chọn Phường Xã') {
                errors.push("Vui lòng chọn Phường Xã!");
            }

            if (village === '') {
                errors.push("Vui lòng nhập Địa Chỉ Cụ Thể!");
            }

            if (errors.length > 0) {
                showErrorAlert(errors.join('\n'));

                return false;
            }

            var address = village + ', ' + ward + ', ' + district + ', ' + city;

            if (maGiamGiaValue !== '') {
                $.post('/sixdo-shop/check-ma-giam-gia', {maGiamGia: maGiamGiaValue}, function (data) {
                    if (data != 'error') {
                        if (data.soLuong > 0) {
                        if (Number(giamGia) > 0) {
                            // order data này khác với order data ở dưới lên đừng copy chung
                            orderData = {
                                cart: productList,
                                hoadon: {
                                    tenNguoiNhan: name,
                                    sdtNguoiNhan: phone,
                                    emailNguoiNhan: email,
                                    diaChiNguoiNhan: address,
                                    tongTien: parseFloat(lastPriceCleaned),
                                    giamGia: parseFloat(data.giaTriGiam),
                                    maGiamGia: data
                                },
                                khachHang: {
                                    id:${khachHang.id}
                                }
                            };
                        }} else {
                            Swal.fire({
                                icon: 'info',
                                title: 'Mã giảm giá đã hết!',
                            });
                            return false;
                        }
                    }
                });
            } else {
                orderData = {
                    cart: productList,
                    hoadon: {
                        tenNguoiNhan: name,
                        sdtNguoiNhan: phone,
                        emailNguoiNhan: email,
                        diaChiNguoiNhan: address,
                        tongTien: parseFloat(lastPriceCleaned),
                        giamGia: parseFloat(giaTriGiam),
                        maGiamGia: maGiamGia
                    },
                    khachHang: {
                        id:${khachHang.id}
                    }
                };
            }


        }

        function defaultAddressCustomer() {
            var lastPrice = document.getElementById('last-price').textContent;
            var lastPriceCleaned = lastPrice.replace(/,/g, '').replace(/\./g, '');
            var giamGia = document.getElementById('maGiamGiaOnlineValue').value;
            var giaTriGiam = 0;
            var maGiamGia = null;

            if (maGiamGiaValue !== '') {
                $.post('/sixdo-shop/check-ma-giam-gia', {maGiamGia: maGiamGiaValue}, function (data) {
                    if (data != 'error') {
                        if (data.soLuong > 0) {
                            if (Number(giamGia) > 0) {
                                maGiamGia = data;
                                giaTriGiam = data.giaTriGiam;
                                console.log('akvm' + maGiamGia + giaTriGiam);
                            }
                        } else {
                            Swal.fire({
                                icon: 'info',
                                title: 'Mã giảm giá đã hết!',
                            });
                            return false;
                        }
                    }
                });
            }

<%--            <c:forEach var="o" items="${listGioHangBuyer}" varStatus="i">--%>
<%--            var product = {--%>
<%--                idCtSanPham: ${o.idChiTietSanPham},--%>
<%--                soLuong: document.getElementById('quantityProduct-${i.index}').value,--%>
<%--                gia:${o.chiTietSanPham.giaBan *o.soLuong},--%>
<%--            };--%>
<%--            productList.push(product);--%>
<%--            </c:forEach>--%>

            $.get('/product-favorite/check-gio-hang-chi-tiet', function (data) {
                if (data.length > 0) {
                    // Xử lý dữ liệu nhận được
                    data.forEach(function (item) {
                        var product = {
                            idCtSanPham: item.idChiTietSanPham,
                            soLuong: item.soLuong,
                            gia: item.chiTietSanPham.giaBan * item.soLuong,
                        };
                        productList.push(product);
                    });
                } else {
                    Swal.fire({
                        icon: 'info',
                        title: 'Giỏ hàng của bạn đang trống',
                    });
                }
            });

            $.ajax({
                type: 'GET',
                url: '/check-customer/mail',
                data: {id: "${khachHang.id}"},
                success: function (data) {
                    if (data != null) {
                        if (data.tenKhachHang.trim() === '' || data.tenKhachHang === null || data.sdt.trim() === '' || data.sdt === null || data.diaChi.trim() === '' || data.diaChi === null) {
                            showErrorAlert("Địa chỉ mặc định vẫn còn thiếu vui lòng vô kiểm tra lại!");
                            return false;
                        }
                        orderData = {
                            cart: productList,
                            hoadon: {
                                tenNguoiNhan: data.tenKhachHang,
                                sdtNguoiNhan: data.sdt,
                                emailNguoiNhan: data.email,
                                diaChiNguoiNhan: data.diaChi,
                                tongTien: parseFloat(lastPriceCleaned),
                                giamGia: parseFloat(giaTriGiam),
                                maGiamGia: maGiamGia
                            },
                            khachHang: {
                                id:${khachHang.id}
                            }
                        };
                        console.log('akvmm' + orderData.hoadon.maGiamGia + orderData.hoadon.giamGia);
                    }
                },
                error: function () {
                    Swal.fire('Lỗi', 'Có lỗi xảy ra. Vui lòng thử lại sau.', 'error');
                }
            });
        }

        var formatter = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        });


        $('.submit-oder-by-cart').on('click', function () {
            if( document.getElementById("maGiamGiaInput").value !== maGiamGiaValue){
                maGiamGiaValue = '';
            }
            if (Object.keys(orderData).length === 0) {
                if (currentClick === 'default') {
                    if (defaultAddressCustomer() == false) {
                        return;
                    }
                } else if (currentClick === 'custom') {
                    if (createOrderCustomerinput() == false) {
                        return;
                    }
                }
            }

            var tableRows = document.querySelectorAll('#cartTableBody .table_row');

            Swal.fire({
                title: 'Xác nhận đặt đơn',
                text: 'Bạn có chắc chắn muốn đặt đơn hàng?',
                showCancelButton: true,
                confirmButtonText: 'Đồng ý',
                cancelButtonText: 'Huỷ',
                reverseButtons: true,
                icon: 'info',
                allowOutsideClick: false,
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: '/sixdo-shop/check-trangThai-ctsp-checkout',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(orderData),
                        success: function (response) {
                            if (response.length===0) {
                                // ktra so luong trong kho
                                $.ajax({
                                    url: '/sixdo-shop/check-soLuong-checkout',
                                    type: 'POST',
                                    contentType: 'application/json',
                                    data: JSON.stringify(orderData),
                                    success: function (response) {
                                        if (response.length === 0) {
                                            // thực hiện việc check out
                                            $.ajax({
                                                url: '/sixdo-shop/placeOrder',
                                                type: 'POST',
                                                contentType: 'application/json',
                                                data: JSON.stringify(orderData),
                                                success: function (response) {
                                                    // Xử lý phản hồi từ máy chủ nếu cần
                                                    console.log(response);
                                                    document.cookie = "cart=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";

                                                    Swal.fire({
                                                        title: 'Order Success!',
                                                        text: 'Đơn hàng đã được đặt, để ý điện thoại shop sẽ gọi để xác nhận nha!',
                                                        icon: 'success',
                                                        showConfirmButton: false, // Ẩn nút "OK"
                                                        timer: 1500 // Tự động đóng thông báo sau 1.5 giây
                                                    }).then(function () {
                                                        // Sau khi thông báo đóng, chuyển hướng sang trang mới
                                                        window.location.href = 'http://localhost:8080/sixdo-shop/manager-oder-customer';
                                                        // gửi mail
                                                        $.ajax({
                                                            type: 'POST',
                                                            url: '/sixdo-shop/sendMail',
                                                            contentType: 'application/json',
                                                            data: JSON.stringify(orderData),
                                                            success: function (data) {

                                                            },
                                                            error: function () {
                                                                Swal.fire('Lỗi', 'Có lỗi xảy ra. Vui lòng thử lại sau.', 'error');
                                                            }
                                                        });
                                                    });

                                                    document.getElementById('sumCart').innerText = '0 đ';
                                                    document.getElementById('last-price').innerText = '0 đ';

                                                },
                                                error: function (error) {
                                                    // Xử lý lỗi nếu có
                                                    console.error(error);
                                                    showAlertAddCart('Order error.', '', 'error');
                                                }
                                            });
                                        } else {
                                            var message = "";
                                            var soLuong = "";
                                            response.forEach(function (item) {

                                                if (item.soLuong === 0) {
                                                    soLuong = " - Hết Hàng"
                                                } else {
                                                    soLuong = " .Chỉ được thêm tối đa: " + item.soLuong + " Sản Phẩm "
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
                                                },
                                                confirmButtonText: 'OK', // Đổi tiêu đề của nút xác nhận thành "OK"
                                                allowOutsideClick: true // Cho phép nhấn ra ngoài hộp thoại
                                            }).then((result) => {
                                                // Nếu người dùng nhấn OK hoặc ấn ra ngoài hộp thoại
                                                if (result.isConfirmed || result.dismiss === Swal.DismissReason.overlay || result.dismiss === Swal.DismissReason.close) {
                                                    window.location.reload(); // Load lại trang
                                                }
                                            });

                                        }
                                    },
                                    error: function (error) {
                                        // Xử lý lỗi nếu có
                                        console.error(error);
                                        showAlertAddCart('Order error 1111111111111 .', '', 'error');
                                    }
                                });
                            } else {
                                console.log("listCheckTrangThai"+response);
                                var message = "";
                                var trangThai = "";
                                response.forEach(function (item) {

                                    if (item.trangThai === 2) {
                                        trangThai = " - Hết Hàng"
                                    } else if(item.trangThai=== 0) {
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
                                    },
                                    confirmButtonText: 'OK', // Đổi tiêu đề của nút xác nhận thành "OK"
                                    allowOutsideClick: true // Cho phép nhấn ra ngoài hộp thoại
                                }).then((result) => {
                                    // Nếu người dùng nhấn OK hoặc ấn ra ngoài hộp thoại
                                    if (result.isConfirmed || result.dismiss === Swal.DismissReason.overlay || result.dismiss === Swal.DismissReason.close) {
                                        window.location.reload(); // Load lại trang
                                    }
                                });


                            }
                        },
                        error: function (error) {
                            // Xử lý lỗi nếu có
                            console.error(error);
                            showAlertAddCart('Order error 22222222222222s.', '', 'error');
                        }
                    });
                }
            });
        });


        $(".js-select2").each(function () {
            $(this).select2({
                minimumResultsForSearch: 20,
                dropdownParent: $(this).next('.dropDownSelect2')
            });
        })

        function showAlertAddCart(mess, title, icon) {
            Swal.fire({
                position: 'center',
                icon: icon,
                title: title,
                text: mess,
                showConfirmButton: false,
                timer: 2000,
                customClass: {
                    container: 'swal-custom'
                }
            });
        }

    });

</script>
</body>
</html>
