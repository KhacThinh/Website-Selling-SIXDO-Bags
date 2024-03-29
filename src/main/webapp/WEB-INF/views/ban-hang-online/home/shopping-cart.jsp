<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Shoping Cart</title>
    <link rel="Website Icon" type="png" href="../static/images/icon/LOGOSIXDO.jpg">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <style>

        <%@include file="../../../views/ban-hang-online/css/main.css" %>
        <%@include file="../../../views/ban-hang-online/css/util.css" %>
    </style>
</head>
<body class="animsition">

<!-- Header -->
<jsp:include page="/WEB-INF/views/ban-hang-online/components/hd.jsp"/>


<!-- Cart -->
<jsp:include page="/WEB-INF/views/ban-hang-online/components/cart.jsp"/>


<!-- breadcrumb -->
<div class="container">
    <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
        <a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
            Home
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>

        <span class="stext-109 cl4">
				Shoping Cart
			</span>
    </div>
</div>


<!-- Shoping Cart -->
<form class="bg0 p-t-75 p-b-85">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-xl-7 m-lr-auto m-b-30">
                <div class="m-l-12 m-r--38 m-lr-0-xl">
                    <div class="wrap-table-shopping-cart">
                        <table class="table-shopping-cart" id="iiiid">
                            <thead>
                            <tr class="table_head">
                                <th class="column-1">Product</th>
                                <th class="column-2"></th>
                                <th class="column-3">Price</th>
                                <th class="column-4">Quantity</th>
                                <th class="column-5">Total</th>
                            </tr>
                            </thead>

                            <tbody id="cartTableBody">
                            <c:set var="totalPrice" value="0"/>
                            <c:forEach var="o" items="${listGioHangBuyer}" varStatus="i">

                                <tr class="table_row">
                                    <td class="column-1">
                                        <div class="how-itemcart1">
                                            <img id="imageProduct-in-cart" src="${o.chiTietSanPham.hinhAnh}" alt="IMG">
                                        </div>
                                    </td>
                                    <td class="column-2"
                                        id="nameProduct-in-cart">${o.chiTietSanPham.sanPham.tenSanPham}</td>
                                    <td class="column-3" id="priceProduct-in-cart"><fmt:formatNumber pattern="#,###"
                                                                                                     var="donGia"
                                                                                                     value="${o.chiTietSanPham.giaBan}"></fmt:formatNumber>
                                            ${donGia}đ
                                    </td>
                                    <td class="column-4">
                                        <div class="wrap-num-product flex-w m-l-auto m-r-0">
                                            <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m" id="btn-minus-${i.index}">
                                                <i class="fs-16 zmdi zmdi-minus"></i>
                                            </div>

                                            <input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product${o.chiTietSanPham.id}" id="quantityProduct-${i.index}" value="${o.soLuong}">
                                            <span id="error-message"></span>
                                            <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m" id="btn-plus-${i.index}">
                                                <i class="fs-16 zmdi zmdi-plus"></i>
                                            </div>

                                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                                            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- Nhúng thư viện SweetAlert -->
                                        </div>
                                    </td>
                                    <script>
                                        // Lấy phần tử div có id là 'btn-minus'
                                        var btnMinus = document.getElementById('btn-minus-${i.index}');
                                        var btnPlus = document.getElementById('btn-plus-${i.index}');
                                        var quantityInput = document.getElementById('quantityProduct-${i.index}');
                                        var idKhachHang = document.getElementById("id-khach-hang").value;


                                        // Giam so Luong
                                        btnMinus.addEventListener('click', function() {
                                            var currentQuantity = parseInt(this.parentNode.querySelector('.num-product').value);
                                            if (currentQuantity > 1) { // Đảm bảo số lượng không nhỏ hơn 1
                                                var newQuantity = currentQuantity - 1;
                                                updateQuantity(${o.chiTietSanPham.id}, newQuantity, quantityInput);
                                                this.parentNode.querySelector('.num-product').value = newQuantity;
                                                // Cập nhật giá tiền
                                                updateTotalPriceForAllProducts();
                                            }
                                        });

                                        // Tang so luong
                                        btnPlus.addEventListener('click', function() {
                                            var currentQuantity = parseInt(this.parentNode.querySelector('.num-product').value);
                                            var newQuantity = currentQuantity + 1;
                                            updateQuantity(${o.chiTietSanPham.id}, newQuantity, quantityInput);
                                            this.parentNode.querySelector('.num-product').value = newQuantity;
                                            // Cập nhật giá tiền
                                            updateTotalPriceForAllProducts();
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
                                                success: function(response) {
                                                    if(response === "ok") {
                                                        updateTotalPriceForAllProducts();
                                                    }else if(response === "am"){
                                                        alert("Số lượng phải là 1 số dương");
                                                    }else if(response === 0){
                                                        alert("Số lượng phải lớn hơn 0");
                                                    }
                                                    else  {
                                                        alert("Bạn đã vượt quá số lượng tối đa: " + response + " sản phẩm");

                                                    }
                                                },
                                                error: function(xhr, status, error) {
                                                    console.error('Lỗi khi cập nhật số lượng sản phẩm:', error);
                                                }
                                            });
                                        }
                                    </script>

<%--                                    update TongTien--%>
                                    <script>
                                        function updateTotalPriceForAllProducts() {
                                            var total = 0;
                                            var tableRows = document.querySelectorAll('#cartTableBody .table_row');

                                            // Lặp qua từng hàng trong bảng giỏ hàng
                                            tableRows.forEach(function(row) {
                                                var quantity = parseInt(row.querySelector('.num-product').value);
                                                var pricePerProductString = row.querySelector('#priceProduct-in-cart').innerText; // Lấy giá mỗi sản phẩm từ cột giá trong hàng
                                                var pricePerProduct = parseFloat(pricePerProductString.replace(/[^\d.-]/g, '')); // Xóa tất cả các ký tự không phải số, dấu chấm và dấu gạch ngang
                                                total += quantity * pricePerProduct;
                                            });

                                            // Cập nhật giá tiền tổng cho toàn bộ giỏ hàng
                                            var formattedTotal = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(total);
                                            document.getElementById('sumCart').innerText = formattedTotal;
                                        }

                                    </script>

<%--                                    checkDuLieuNhap--%>
                                    <script>
                                        document.getElementById('quantityProduct-${i.index}').addEventListener('blur', function() {
                                            var newQuantity = parseInt(this.value);
                                            var productId = ${o.chiTietSanPham.id};
                                            var idKhachHang = document.getElementById("id-khach-hang").value;

                                            // if (newQuantity <= 0) {
                                            //     newQuantity = 1;
                                            //     this.value = newQuantity;
                                            //     alert("Số lượng tối thiểu bằng 1");
                                            // }
                                            updateQuantityInPut(idKhachHang,productId,newQuantity);
                                        });


                                        // checkInput
                                        function updateQuantityInPut(idKhachHang,productId, newQuantity) {
                                            $.ajax({
                                                type: 'POST',
                                                url: '/sixdo-shop/edit-soLuong-checkout',
                                                contentType: 'application/json',
                                                data: JSON.stringify({
                                                    idKhachHang: idKhachHang,
                                                    idChiTietSanPham: productId,
                                                    soLuong: newQuantity
                                                }),
                                                success: function(response) {
                                                    if(response === "ok") {
                                                        updateTotalPriceForAllProducts();
                                                    }else if(response === "am"){
                                                        alert("Số lượng phải là 1 số dương");

                                                    }else if(response === 0){
                                                        alert("Số lượng phải lớn hơn 0");
                                                    }
                                                    else  {
                                                        alert("Bạn đã vượt quá số lượng tối đa: " + response + " sản phẩm");
                                                        // Xử lý khi có lỗi
                                                    }
                                                },
                                                error: function(xhr, status, error) {
                                                    console.error('Lỗi khi cập nhật số lượng sản phẩm:', error);
                                                    // Xử lý khi có lỗi
                                                }
                                            });
                                        }
                                    </script>
                                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


                                    <td class="column-5" id="sumPrice-in-cart"><fmt:formatNumber pattern="#,###"
                                                                                                 var="tongTam"
                                                                                                 value="${o.chiTietSanPham.giaBan*o.soLuong}"></fmt:formatNumber>
                                            ${tongTam}đ
                                    </td>

                                    <c:set var="temp" value="${o.chiTietSanPham.giaBan * o.soLuong}"/>
                                    <c:set var="totalPrice" value="${totalPrice + temp}"/>
                                </tr>

                            </c:forEach>

                            </tbody>

                        </table>
                    </div>
                    <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
                        <div class="flex-w flex-m m-r-20 m-tb-5">
                            <input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" type="text"
                                   name="coupon" placeholder="Coupon Code" id="maGiamGiaInput">

                            <div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5 apply-coupon">
                                Apply coupon
                            </div>
                        </div>


                    </div>
                </div>
            </div>

            <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
                <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm" style="width: 430px;">
                    <h4 class="mtext-109 cl2 p-b-30">
                        Cart Totals
                    </h4>

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

                    <div class="flex-w flex-t bor12 p-b-13">
                        <div class="size-208">
								<span class="stext-110 cl2">
                                    Giảm Giá :
								</span>
                        </div>

                        <div class="size-209">
								<span class="mtext-110 cl2" style="color: red" id="maGiamGiaOnline">
                                </span>
                        </div>
                    </div>

                    <div class="flex-w flex-t bor12 p-t-15 p-b-30">
                        <%--                        <div class="size-208 w-full-ssm">--%>

                        <%--                        </div>--%>

                        <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
                            <p class="stext-112 cl8 p-b-15">Thông Tin Người Nhận</p>

                            <div style="display: flex; width: 370px;">
                                <div class="bor8 bg0 m-b-12 m-r-15 w-150">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="name-for-cart"
                                           placeholder="Tên người nhận">
                                </div>

                                <div class="bor8 bg0 m-b-12">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="phone-for-cart"
                                           placeholder="Số điện thoại">
                                </div>
                            </div>

                            <div class="bor8 bg0 m-b-12" style="width: 370px;">
                                <input class="stext-111 cl8 plh3 size-111 p-lr-15 w-400" type="email"
                                       name="email-for-cart"
                                       placeholder="Email  ( Không Bắt Buộc, Gửi Email Để Xác Nhận )">
                            </div>

                            <div class="p-t-15">
                                <span class="stext-112 cl8">
										Địa Chỉ
									</span>

                                <div style="display: flex; width: 370px;">


                                    <div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9"
                                         style="width: 180px; margin-right: 16px">
                                        <select class="js-select2" name="time" id="city">
                                            <option>Chọn Tỉnh Thành</option>
                                        </select>
                                        <div class="dropDownSelect2"></div>
                                    </div>

                                    <div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9" style="width: 180px;">
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
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15 w-400" type="text" id="village"
                                           placeholder="Địa Chỉ Cụ Thể  (Số Nhà, Thôn, Ấp...)">
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="flex-w flex-t p-t-27 p-b-33">
                        <div class="size-208">
								<span class="mtext-101 cl2">
									Total:
								</span>
                        </div>

                        <div class="size-209 p-t-1">
								<span class="mtext-110 cl2" id="last-price">
<fmt:formatNumber pattern="#,###" var="tempTongTam"
                  value="${totalPrice}"></fmt:formatNumber> ${tempTongTam}đ								</span>
                        </div>
                    </div>

                    <p class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 submit-oder-by-cart">
                        Đặt Hàng
                    </p>


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


<script>


    $(document).ready(function () {


        $('.apply-coupon').on('click', function () {
            var maGiamGiaValue = document.getElementById('maGiamGiaInput').value;
            console.log("mggg"+maGiamGiaValue)
            console.log("khachHang"+${khachHang.id})
            $.ajax({
                url: '/ma-giam-gia/ap-dung-ma-giam-gia',
                type: 'POST',
                data: {
                    idKhachHang:${khachHang.id},
                    maGiamGia:maGiamGiaValue
                },
                success: function (response) {
                    console.log("number "+response)
               document.getElementById('maGiamGiaOnline').innerText= formatter.format(response) ;
                    showAlertAddCart('Order Success!', 'Apply Success', 'success');
                },
                error: function (error) {
                    // Xử lý lỗi nếu có
                    console.error(error);
                    showAlertAddCart('Order error.', '', 'error');
                }
            });


        });
        var productList = [];

        <c:forEach var="o" items="${listGioHangBuyer}">
        var product = {
            idCtSanPham: ${o.idChiTietSanPham},
            soLuong: ${o.soLuong},
            gia:${o.chiTietSanPham.giaBan *o.soLuong},
        };
        productList.push(product);
        </c:forEach>

        function createOrderData() {
            var name = document.querySelector('input[name="name-for-cart"]').value;
            var phone = document.querySelector('input[name="phone-for-cart"]').value;
            var email = document.querySelector('input[name="email-for-cart"]').value;
            var city = document.getElementById('city').value;
            var district = document.getElementById('district').value;
            var ward = document.getElementById('ward').value;
            var village = document.getElementById('village').value;
            var lastPrice = document.getElementById('last-price').textContent;
            var lastPriceCleaned = lastPrice.replace(/,/g, '').replace(/\./g, '');

            console.log("kkkkkkkss " + parseFloat(lastPriceCleaned))

            var orderData = {
                cart: productList,
                hoadon: {
                    tenNguoiNhan:"${khachHang.tenKhachHang}",
                    sdtNguoiNhan: ${khachHang.sdt},
                    emailNguoiNhan: "${khachHang.email}",
                    diaChiNguoiNhan: "${khachHang.diaChi}",
                    tongTien: parseFloat(${totalPrice})

                },
                khachHang :{
                    id:${khachHang.id}
                }
            };


            return orderData;
        }

        var formatter = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        });
        $('.submit-oder-by-cart').on('click', function () {
            var orderData = createOrderData();

            // Gửi dữ liệu giỏ hàng lên máy chủ
            $.ajax({
                url: '/sixdo-shop/placeOrder',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(orderData),
                success: function (response) {
                    // Xử lý phản hồi từ máy chủ nếu cần
                    console.log(response);
                    document.cookie = "cart=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                    showAlertAddCart('Order Success!', 'The order has been placed', 'success');
                    document.getElementById('sumCart').innerText = '0 đ';
                    document.getElementById('last-price').innerText = '0 đ';

                },
                error: function (error) {
                    // Xử lý lỗi nếu có
                    console.error(error);
                    showAlertAddCart('Order error.', '', 'error');
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
                timer: 1000,
                customClass: {
                    container: 'swal-custom'
                }
            });
        }

    });

</script>
</body>
</html>