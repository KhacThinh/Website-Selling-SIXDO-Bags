<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">

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
            width: 35px;
            height: 35px;
            object-fit: cover;
            border-radius: 50%;
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
            <nav class="limiter-menu-desktop container">


                <a href="/sixdo-shop" class="logo">
                    <img src="../static/images/logo1.jpg"
                         alt="IMG-PRODUCT">
                </a>


                <div class="menu-desktop">
                    <ul class="main-menu">
                        <li>
                            <a href="/sixdo-shop">Home</a>
                            <ul class="sub-menu">
                                <li><a href="index.html">Homepage 1</a></li>
                                <li><a href="home-02.html">Homepage 2</a></li>
                                <li><a href="home-03.html">Homepage 3</a></li>
                            </ul>
                        </li>

                        <li class="active-menu">
                            <a href="/sixdo-shop/product">Shop</a>
                        </li>

                        <li class="label1" data-label1="hot">
                            <a href="shoping-cart.html">Features</a>
                        </li>

                        <li>
                            <a href="blog.html">Blog</a>
                        </li>

                        <li>
                            <a href="about.html">About</a>
                        </li>

                        <div id="don-mua-menu-item">
<%--                            menu đơn mua--%>
                        </div>

                    </ul>
                </div>


                <div class="wrap-icon-header flex-w flex-r-m">
                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
                        <i class="zmdi zmdi-search"></i>
                    </div>

                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart icon-count-cart"
                         data-notify="${soLuongSanPhamGioHang}">
                        <i class="zmdi zmdi-shopping-cart"></i>
                    </div>

                    <div  id="product-favorite-header">
                        <%--                        sản phẩm yêu thích--%>
                    </div>


                    <input type="hidden" id="id-khach-hang" value="${khachHang.id}"/>


                </div>
                <div class="navbar_content">
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
                                    <img src="../static/images/profile.jpg" id="js-rounded-circle-avt-hearder" alt="" class="profile"/>
                                    <i class="bi bi-caret-down-fill" style="color: #1d1d1d; font-size: 15px;"></i>
                                </button>
                                <div class="dropdown" style="margin-left: 20px;">
                                    <ul class="dropdown-menu" id="dropdownMenu">
                                        <li><a class="dropdown-item" href="#">Cài đặt</a></li>
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
            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
                <i class="zmdi zmdi-search"></i>
            </div>

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
                <a href="/user/ban-hang">Home</a>
                <ul class="sub-menu-m">
                    <li><a href="index.html">Homepage 1</a></li>
                    <li><a href="home-02.html">Homepage 2</a></li>
                    <li><a href="home-03.html">Homepage 3</a></li>
                </ul>
                <span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
            </li>

            <li>
                <a href="/sixdo-shop/product">Shop</a>
            </li>

            <li>
                <a href="shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a>
            </li>

            <li>
                <a href="blog.html">Blog</a>
            </li>

            <li>
                <a href="about.html">About</a>
            </li>

            <li>
                <a href="contact.html">Đơn mua</a>
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
        capNhapSoLuongSanPhamYeuThichHearder();
    });

    document.addEventListener('DOMContentLoaded', function () {
        // Lắng nghe sự kiện click trên nút "Login"
        document.getElementById('btn-login').addEventListener('click', function () {
            // Hiển thị thông báo yêu cầu đăng nhập
            Swal.fire({
                title: 'Thông báo',
                text: 'Bạn cần đăng nhập để tiếp tục.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Đăng nhập',
                cancelButtonText: 'Đóng',
            }).then((result) => {
                // Xử lý hành động sau khi người dùng nhấn nút
                if (result.isConfirmed) {
                    // Chuyển hướng tới trang đăng nhập khi người dùng nhấn nút "Đăng nhập"
                    window.location.href = '/sixdo-shop/login';
                } else {
                    // Log ra console nếu người dùng nhấn nút "Đóng" hoặc click ra ngoài
                    console.log('Đã đóng thông báo');
                }
            });
        });
    });

    function capNhapSoLuongSanPhamYeuThichHearder() {
        $.get('/product-favorite/hien-thi-so-luong-product-favorite', function (data) {
            displaySoLuongSanPhamFavorite(data);
            displayMenuDonMua();
        });
    }

    function displayMenuDonMua() {
        const containerDonMua = $('#don-mua-menu-item');
        containerDonMua.empty();
        var donMuaHTML = '<li>'
        donMuaHTML += '<a href="contact.html">Đơn mua</a>'
        donMuaHTML += '</li>'
        containerDonMua.append(donMuaHTML);
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