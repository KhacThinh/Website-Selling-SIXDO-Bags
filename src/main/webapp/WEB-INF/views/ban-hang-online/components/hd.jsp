<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
    <style>

        .dropdown-menu {
            /* Default styles for the menu (optional) */
            /* ... */
            display: none; /* Initially hidden */
        }

        /* Add logic to show the menu on hover or click (example using hover) */
        .dropdown:hover .dropdown-menu {
            display: block; /* Show menu on hover */
        }


        .loader {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            display: inline-block;
            border-top: 4px solid #413aa7;
            border-right: 4px solid transparent;
            box-sizing: border-box;
            animation: rotation 0.5s linear infinite;
            justify-content: center;
            text-align: center;
        }

        .loader::after {
            content: '';
            box-sizing: border-box;
            position: absolute;
            left: 0;
            top: 0;
            width: 48px;
            height: 48px;
            border-radius: 50%;
            border-left: 4px solid #FF3D00;
            border-bottom: 4px solid transparent;
            animation: rotation 0.25s linear infinite reverse;
        }

        @keyframes rotation {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        .navbar_content {
            display: flex;
            align-items: center;
            column-gap: 5px;
        }

        .navbar_content i {
            cursor: pointer;
            font-size: 20px;
            color: var(--grey-color);
        }

        .limiter-menu-desktop img {
            width: 78px;
            height: 54px;
            object-fit: cover;
        }

        .limiter-menu-desktop #js-rounded-circle-avt-hearder {
            width: 35px;
            height: 35px;
            object-fit: cover;
            border-radius: 50%;
        }

        .main-menu > li > a {
            font-family: 'Poppins-Medium', sans-serif;
            text-decoration: none;
        }
    </style>
</head>
<body>

<header class="header-v4">
    <div id="loading-spinner" class="spinner-container loader"
         style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 100">
        <div class="spinner"></div>
    </div>
    <div class="container-menu-desktop">

        <div class="wrap-menu-desktop how-shadow1">
            <nav class="limiter-menu-desktop" style="margin: 0 30px">

<%--                <a href="/sixdo-shop" class="logo">--%>
<%--                    <img src="../static/images/logo1.jpg"--%>
<%--                         alt="" id="js-logo-header">--%>
<%--                </a>--%>

                <a href="/sixdo-shop" class="logo">
                    <img src="../static/images/logo1.jpg"
                         alt="">
                </a>


                <div class="menu-desktop">
                    <ul class="main-menu">
                        <li>
                            <a href="/sixdo-shop">Trang chủ</a>
                        </li>

                        <li class="label1" data-label1="hot">
                            <a href="/sixdo-shop/product">Sản phẩm</a>
                        </li>

                        <li>
                            <a href="/sixdo-shop/contact">Liên hệ</a>
                        </li>

                        <li id="don-mua-menu-item" style="display: none">
                            <a href="/sixdo-shop/manager-oder-customer">Quản lý đơn hàng</a>
                        </li>

                    </ul>
                </div>


                <div class="wrap-icon-header flex-w flex-r-m">
                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart icon-count-cart"
                         data-notify="0">
                        <i class="zmdi zmdi-shopping-cart"></i>
                    </div>

                    <div id="product-favorite-header">
                        <%-- sản phẩm yêu thích--%>
                    </div>

                    <input type="hidden" id="id-khach-hang" value="${khachHang.id}"/>

                </div>
                <div class="navbar_content" id="login-profile-nav">
                    <c:choose>
                        <c:when test="${khachHang == null}">
                            <button type="button" class="btn btn-outline-secondary me-2 ml-5" id="btn-login"
                                    style="margin-left: 20px;">Đăng nhập
                            </button>
                        </c:when>
                        <c:otherwise>
                            <div class="dropdown" style="margin-left: 20px;">
                                <button class="dropbtn icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 i">
                                    <i class='bx bx-sun' id="darkLight"></i>
                                    <i class='bx bx-bell'></i>
                                    <img src="../static/images/profile.jpg" id="js-rounded-circle-avt-hearder" alt=""
                                         class="profile"/>
                                    <i class="bi bi-caret-down-fill" style="color: #1d1d1d; font-size: 15px;"></i>
                                </button>
                                <div class="dropdown" style="margin-left: -30px;">
                                    <ul class="dropdown-menu" id="dropdownMenu">
                                            <%--                                        <li><a class="dropdown-item" href="#">Cài đặt</a></li>--%>
                                        <li><a class="dropdown-item" href="#" data-bs-toggle="modal"
                                               data-bs-target="#exampleModalProfile">Hồ sơ</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="#" id="logoutLink">Đăng xuất</a></li>
                                    </ul>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </nav>
        </div>
    </div>

    <div class="wrap-header-mobile">

        <div class="logo-mobile">
            <a href="/sixdo-shop" class="logo">
                <img src="../static/images/logo1.jpg"
                     alt="IMG-PRODUCT">
            </a></div>

        <div class="wrap-icon-header flex-w flex-r-m m-r-15">

            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
                 data-notify="2">
                <i class="zmdi zmdi-shopping-cart"></i>
            </div>

            <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
               data-notify="0">
                <i class="zmdi zmdi-favorite-outline"></i>
            </a>

            <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
               data-notify="0">
                <i class="zmdi zmdi-favorite-outline"></i>

            </a>
        </div>

        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
        </div>
    </div>


    <!-- Menu Mobile -->
    <div class="menu-mobile">
        <ul class="main-menu-m">
            <li>
                <a href="/sixdo-shop">Trang chủ</a>
                <span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
            </li>

            <li>
                <a href="/sixdo-shop/product">Sản phẩm</a>
            </li>

            <%--            <li>--%>
            <%--                <a href="/sixdo-shop/hello" class="label1 rs1" data-label1="hot">Bộ sưu tập</a>--%>
            <%--            </li>--%>

            <li>
                <a href="/sixdo-shop/contact">Liên hệ</a>
            </li>

            <li id="don-mua-menu-item-mobi" style="display: none">
                <a href="/sixdo-shop/manager-oder-customer">Quản lý đơn hàng</a>
            </li>
        </ul>
    </div>

    <!-- Modal Search -->
    <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
        <div class="container-search-header">
            <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
                <img src="images/icons/icon-close2.png" alt="CLOSE">
            </button>

            <form class="wrap-search-header flex-w p-l-15">
                <button class="flex-c-m trans-04">
                    <i class="zmdi zmdi-search"></i>
                </button>
                <input class="plh3" type="text" name="search" placeholder="Search Tên...">
            </form>
        </div>

    </div>
</header>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

    $(document).ready(function () {
        hienThiMenuQuanLyDonHangOnle();
        capNhapSoLuongSanPhamYeuThichHearder();
        capNhapSoLuongSanPhamTrongGioHangHearder();
    });

    document.addEventListener('DOMContentLoaded', function () {
        // Lắng nghe sự kiện click trên nút "Login"
        document.getElementById('btn-login').addEventListener('click', function () {
            window.location.href = '/sixdo-shop/login-customer';
        });
    });


    function capNhapSoLuongSanPhamTrongGioHangHearder() {
        $.get('/sixdo-shop/hien-thi-so-luong-cart-product', function (data) {
            var cartIcon = document.querySelector('.js-show-cart');
            var soLuongSanPham = data;
            cartIcon.setAttribute('data-notify', soLuongSanPham);
        });
    }

    function capNhapSoLuongSanPhamYeuThichHearder() {
        $.get('/product-favorite/hien-thi-so-luong-product-favorite', function (data) {
            displaySoLuongSanPhamFavorite(data);
        });
    }

    function hienThiMenuQuanLyDonHangOnle() {
        $.get('/product-favorite/check-thong-tin-khach-hang', function (data) {
            const containerDonMua = $('#don-mua-menu-item');
            const containerDonMuaMobi = $('#don-mua-menu-item-mobi');
            const containerSanPhamYeuThich = $('#product-favorite-header');

            if (data == 0) {
                containerDonMuaMobi.hide();
                containerDonMua.hide();
                containerSanPhamYeuThich.hide();
            } else {
                containerSanPhamYeuThich.show();
                containerDonMuaMobi.show();
                containerDonMua.show();
            }

        });
    }

    $('.js-show-cart').on('click', function () {

        $.get('/product-favorite/check-thong-tin-khach-hang', function (response) {
            if (response !== 0) {
                $('.js-panel-cart').addClass('show-header-cart');
                var cartListElement = document.getElementById('cartProductList');
                cartListElement.innerHTML = ''; // Xóa các mục cũ
                var totalAmount = 0; // Biến để tính tổg giá trị đơn hàng

                var idKhachHang = document.getElementById('id-khach-hang').value;
                $.ajax({
                    url: '/sixdo-shop/get-cart-by-buyer',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        idKhachHang2: idKhachHang
                    }),
                    success: function (response) {
                        if (response.length == 0) {
                            cartListElement.innerHTML = '<p>Giỏ hàng trống</p>';
                        } else {
                            var formatter = new Intl.NumberFormat('vi-VN', {
                                style: 'currency',
                                currency: 'VND'
                            });

                            response.forEach(function (product) {
                                var imageProductForCart = '${pageContext.request.contextPath}/' + product.chiTietSanPham.hinhAnh;
                                var listItem = document.createElement('li');
                                listItem.className = 'cart-item';

                                if (product.chiTietSanPham.trangThai === 1 &&  product.chiTietSanPham.sanPham.trangThai ===true) {
                                    var itemHTML = '<li class="header-cart-item flex-w flex-t m-b-12">' +
                                        '<div class="header-cart-item-img" data-product-id="' + product.chiTietSanPham.id + '" data-product-price="' + product.chiTietSanPham.giaBan + '" data-product-soluong="' + product.soLuong + '">' +
                                        '<img style="width: 74px; height: 80px; margin-bottom: 16px;" src="' + imageProductForCart + '" alt="IMG">' +
                                        '</div>' +
                                        '<div class="header-cart-item-txt p-t-8">' +
                                        '<a href="#" class="header-cart-item-name m-b-5 hov-cl1 trans-04 font-weight-bold" style="text-decoration: none;">' + product.chiTietSanPham.sanPham.tenSanPham + '</a>' +
                                        '<a href="#" class="header-cart-item-name m-b-12 hov-cl1 trans-04" style="text-decoration: none;">' + product.chiTietSanPham.mauSac.tenMauSac + '</a>' +
                                        '<span class="header-cart-item-info">' + product.soLuong + ' x ' + formatter.format(product.chiTietSanPham.giaBan) + '</span>' +
                                        '</div>' +
                                        // '<div class="header-cart-item-remove">' +
                                        // '<button class="btn-remove-item" onclick="deleteProductToCart(' + product.chiTietSanPham.id + ', this); return false;"><i class="zmdi zmdi-close"></i></button>' +
                                        // '</div>' +
                                        '</li>';
                                    listItem.innerHTML = itemHTML;
                                    cartListElement.appendChild(listItem);
                                    totalAmount += product.chiTietSanPham.giaBan * product.soLuong;
                                } else {
                                    var trangThaiText;
                                    if (product.chiTietSanPham.trangThai === 0 || product.chiTietSanPham.sanPham.trangThai ===false) {
                                        trangThaiText = 'Ngừng Bán';
                                    } else if (product.chiTietSanPham.trangThai === 2) {
                                        trangThaiText = 'Hết hàng';
                                    } else {
                                        trangThaiText = '';
                                    }
                                    // Sản phẩm không có sẵn
                                    var itemHTML = '<li class="header-cart-item flex-w flex-t m-b-12" style="filter: brightness(50%);">' +
                                        '<div class="header-cart-item-img" data-product-id="' + product.chiTietSanPham.id + '">' +
                                        '<img style="width: 74px; height: 80px; margin-bottom: 16px;" src="' + imageProductForCart + '" alt="IMG">' +
                                        '</div>' +
                                        '<div class="header-cart-item-txt p-t-8">' +
                                        '<span class="header-cart-item-name m-b-5 hov-cl1 trans-04 font-weight-bold"> ' + product.chiTietSanPham.sanPham.tenSanPham + '</span>' +
                                        '<span class="header-cart-item-info">' + formatter.format(product.chiTietSanPham.giaBan) + '</span>' +
                                        '<span class="header-cart-item-info" style="color: red" >' + trangThaiText + '</span>' +

                                        '</div>' +
                                        // '<div class="header-cart-item-remove">' +
                                        // '<button class="btn-remove-item" onclick="deleteProductToCart(' + product.chiTietSanPham.id + ', this); return false;"><i class="zmdi zmdi-close"></i></button>' +
                                        // '</div>' +
                                        '</li>';
                                    listItem.innerHTML = itemHTML;
                                    cartListElement.appendChild(listItem);
                                }
                                // Thêm sự kiện click vào phần tử hình ảnh
                                var headerCartItemImg = listItem.querySelector('.header-cart-item-img');
                                headerCartItemImg.addEventListener('click', function () {
                                    var productId = this.getAttribute('data-product-id');
                                    var productPrice = this.getAttribute('data-product-price');
                                    var productSoLuong = this.getAttribute('data-product-soluong');
                                    deleteProductToCart(productId, this);
                                    totalAmount = totalAmount - productPrice * productSoLuong;
                                    var formattedTotalAmount = formatter.format(totalAmount);
                                    var totalAmountElement = document.getElementById('totalCartValues');
                                    totalAmountElement.innerHTML = 'TỔNG TIỀN:  ' + formattedTotalAmount;
                                });
                            });

                            var formattedTotalAmount = formatter.format(totalAmount);
                            var totalAmountElement = document.getElementById('totalCartValues');
                            totalAmountElement.innerHTML = 'TỔNG TIỀN:  ' + formattedTotalAmount;
                        }
                    },

                    error: function (error) {
                        console.error(error);
                    }
                });
                return;
            } else {
                showLoginPrompt();
            }
        });

    });

    function showLoginPrompt() {
        Swal.fire({
            title: 'Bạn không thể xem giỏ hàng',
            text: 'Vui lòng đăng nhập để xem giỏ hàng.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Đăng nhập',
            cancelButtonText: 'Hủy'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = 'http://localhost:8080/sixdo-shop/login-customer';
            }
        });
    }

    function displaySoLuongSanPhamFavorite(soLuong) {
        const container = $('#product-favorite-header');
        container.empty();
        var productHTML = '<a href="/sixdo-shop/product-favorite" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="' + soLuong + '">';
        productHTML += '<i class="zmdi zmdi-favorite-outline"></i></a>';
        container.append(productHTML);
    }


    document.addEventListener("DOMContentLoaded", function () {
        // Hiển thị spinner
        document.getElementById("loading-spinner").style.display = "block";

        // Ẩn spinner sau 3 giây
        setTimeout(function () {
            document.getElementById("loading-spinner").style.display = "none";
        }, 150);


    });

    document.getElementById("logoutLink").addEventListener("click", function (event) {
        event.preventDefault();

        Swal.fire({
            title: "Bạn muốn đăng xuất?",
            icon: "question",
            showCancelButton: true,
            confirmButtonText: "Đăng xuất",
            cancelButtonText: "Hủy",
            cancelButtonColor: "#d33",
            confirmButtonColor: "#3085d6",
            reverseButtons: true,
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "/sixdo-shop/logout";
            }
        });
    });

</script>
<jsp:include page="profile-customer.jsp"/>

</body>
</html>