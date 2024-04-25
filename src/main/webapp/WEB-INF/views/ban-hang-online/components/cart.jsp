<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charshet="utf-8"/>

</head>
<body>
<div class="wrap-header-cart js-panel-cart">
    <div class="s-full js-hide-cart"></div>

    <div class="header-cart flex-col-l p-l-40 p-r-18">
        <div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Giỏ hàng của bạn
				</span>
            <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                <i class="zmdi zmdi-close"></i>
            </div>
        </div>

        <div class="header-cart-content flex-w js-pscroll">
            <ul class="header-cart-wrapitem w-full" id="cartProductList">
                <li class="header-cart-item flex-w flex-t m-b-12">
                    <div class="header-cart-item-img" id="header-cart-item-img-cart">
                        <img src="" alt="IMG">
                        <!-- Thêm nút xóa vào đây -->
                        <button class="btn-remove-item">
                            <i class="zmdi zmdi-close"></i>
                        </button>
                    </div>

                    <div class="header-cart-item-txt p-t-8">
                        <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">

                        </a>
                        <span class="header-cart-item-info">
            </span>
                    </div>

                </li>
            </ul>

            <div class="w-full">
                <div class="header-cart-total w-full p-tb-28 font-weight-bold" id="totalCartValues"
                     style=" border-top: 3px solid black;">
                    <%--                    Total: $75.00--%>
                </div>

                <div class="header-cart-buttons flex-w w-full" style="text-align: center; justify-content: center">
                    <button id="buyNowButtonCart"
                            class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10"
                            style="width: 280px">
                        Mua Ngay
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- Nhúng thư viện SweetAlert -->

<script>

    document.getElementById('buyNowButtonCart').addEventListener('click', function () {
        $.get('/sixdo-shop/hien-thi-so-luong-cart-product', function (condition) {
            if (condition > 0) {
                window.location.href = '/sixdo-shop/shoping-cart';
            } else {
                Swal.fire({
                    title: 'Thông báo',
                    text: 'Giỏ hàng của bạn trống không thể mua hàng.',
                    icon: 'info',
                    confirmButtonText: 'OK'
                });
            }
        })
    });
</script>


<%-- delete product--%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

    function deleteProductToCart(productId, element) {
        var idKhachHang = document.getElementById("id-khach-hang").value;

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
                    var productElement = element.closest('.cart-item');
                    productElement.remove();
                    capNhapSoLuongSanPhamTrongGioHangHearder();
                    Swal.fire({
                        title: 'Đã xóa!',
                        text: 'Sản phẩm đã được xóa khỏi giỏ hàng.',
                        icon: 'success',
                        timer: 1500, // Thời gian tự đóng (ms)
                        showConfirmButton: false // Ẩn nút xác nhận
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
</script>


</body>
</html>