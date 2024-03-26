<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>SIXDO</title>
    <link rel="Website Icon" type="png" href="../static/images/icon/LOGOSIXDO.jpg">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">

    <!-- Linearicons CSS -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hamburgers/1.1.3/hamburgers.min.css">

    <!-- Animsition CSS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animsition/3.2.1/js/animsition.min.js"></script>

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css">

    <!-- DateRangePicker CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker@3.0.3/daterangepicker.css">

    <!-- Slick Carousel CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css">

    <!-- Perfect Scrollbar CSS -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/1.5.0/css/perfect-scrollbar.min.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Animsition -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animsition/4.0.2/js/animsition.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Bootstrap Popper.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.1/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Select2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>


<style>

    <%@include file="../../../views/ban-hang-online/css/main.css" %>
    <%@include file="../../../views/ban-hang-online/css/util.css" %>
</style>
</head>


<body class="animsition">
<%--header--%>
<jsp:include page="/WEB-INF/views/ban-hang-online/components/hd.jsp"/>
<%--header--%>

<!-- Cart -->
<jsp:include page="/WEB-INF/views/ban-hang-online/components/cart.jsp"/>
<!-- Cart -->


<!-- Product -->
<div class="bg0 m-t-23 p-b-140">
    <div class="container">
        <div class="p-b-10">
            <h3 class="ltext-103 cl5">
                SẢN PHẨM YÊU THÍCH
            </h3>
        </div>
        <div class="flex-w flex-sb-m p-b-52">
            <div class="flex-w flex-l-m filter-tope-group m-tb-10">
                <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
                    All Products
                </button>

                <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".women">
                    Women
                </button>

                <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".men">
                    Men
                </button>

                <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".bag">
                    Bag
                </button>

                <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".shoes">
                    Shoes
                </button>

                <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".watches">
                    Watches
                </button>
            </div>

            <div class="flex-w flex-c-m m-tb-10">
                <div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
                    <i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
                    <i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                    Filter
                </div>

                <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
                    <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
                    <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                    Search
                </div>
            </div>

            <!-- Search product -->
            <div class="dis-none panel-search w-full p-t-10 p-b-15">
                <div class="bor8 dis-flex p-l-15">
                    <button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
                        <i class="zmdi zmdi-search"></i>
                    </button>

                    <input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product"
                           placeholder="Search">
                </div>
            </div>


            <!-- Filter -->
            <div class="dis-none panel-filter w-full p-t-10">
                <div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
                    <div class="filter-col1 p-r-15 p-b-27">
                        <div class="mtext-102 cl2 p-b-15">
                            Sort By
                        </div>

                        <ul>
                            <li class="p-b-6">
                                <a href="#" class="filter-link stext-106 trans-04">
                                    Default
                                </a>
                            </li>

                        </ul>
                    </div>

                    <div class="filter-col2 p-r-15 p-b-27">
                        <div class="mtext-102 cl2 p-b-15">
                            Thương Hiệu
                        </div>

                        <ul>
                            <li class="p-b-6">
                                <a href="#" class="filter-link stext-106 trans-04 filter-link-active">
                                    All
                                </a>
                            </li>

                            <li class="p-b-6">
                                <a href="#" class="filter-link stext-106 trans-04">
                                    $0.00 - $50.00
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="filter-col3 p-r-15 p-b-27">
                        <div class="mtext-102 cl2 p-b-15">
                            Màu Sắc
                        </div>

                        <ul>
                            <li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #222;">
										<i class="zmdi zmdi-circle"></i>
									</span>

                                <a href="#" class="filter-link stext-106 trans-04">
                                    Black
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="filter-col4 p-b-27">
                        <div class="mtext-102 cl2 p-b-15">
                            Tags
                        </div>

                        <div class="flex-w p-t-4 m-r--5">
                            <a href="#"
                               class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                                Fashion
                            </a>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="search-results" class="row">
        </div>

        <%--JavaScript Search--%>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.6.15/sweetalert2.min.js"
                integrity="sha512-yOZAw8NpGZyqxokHrsFrJDdNIlzJzya9qxPD4GyranfFCr0jCyYaq5/ShcwP8YT5SNtrbtlDbAKlDmNt6bS5Vw=="
                crossorigin="anonymous"></script>
        <%--            <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>--%>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script>
            $(document).ready(function () {
                // Gọi hàm loadData khi tài liệu đã sẵn sàng
                loadData();
                loadFilterThuongHieu();
                loadFilterHienThi();
                loadFilterMauSac();

                themSanPhamYeuThich();
                // Sự kiện khi form tìm kiếm được submit
                $('#search-form').submit(function (event) {
                    event.preventDefault(); // Ngăn chặn form gửi đi
                    var searchTerm = $('#search-input-product-home').val(); // Lấy giá trị từ ô tìm kiếm
                    searchProducts(searchTerm); // Gọi hàm tìm kiếm
                });
            });


            // sản phẩm yêu thích product favorites
            function themSanPhamYeuThich() {
                $(document).on('click', '.js-addwish-b2', function () {
                    var heartFill = $(this).find('.bi-heart-fill');
                    var heartOutline = $(this).find('.bi-heart');
                    var productId = $(this).data('product-id');

                    $.get('/product-favorite/check-thong-tin-khach-hang', function (response) {
                        if (response !== 0) {
                            console.log('Khách hàng đã đăng nhập với ID:', response);
                            if (heartFill.css('display') !== 'none') {
                                $.get('/product-favorite/xoa-san-pham-yeu-thich', {idSanPham: productId}, function (sanPhamCheck) {
                                    if(sanPhamCheck != 0){
                                        // Ngược lại, chuyển về icon đậm và ẩn icon fill
                                        heartFill.css('display', 'none');
                                        heartOutline.css('display', 'inline');
                                        // Hiển thị thông báo hủy thành công
                                        Swal.fire({
                                            icon: 'success',
                                            title: 'Đã xóa khỏi danh sách yêu thích!',
                                            showConfirmButton: false,
                                            timer: 1500
                                        });
                                        loadData();
                                        capNhapSoLuongSanPhamYeuThichHearder();
                                    }else{
                                        console.log("không xoá được sản phẩm yêu thích");
                                        alert("Lỗi");
                                    }
                                });
                            }
                        }
                    }).fail(function (xhr, status, error) {
                        // Xử lý lỗi nếu có
                        console.error('Lỗi khi gửi yêu cầu kiểm tra thông tin khách hàng:', error);
                    });
                });
            }

            function themVoSanPhamYeuThich() {
                $('.js-addcart-detail-customer').on('click', function () {
                    var idKhachHang = document.getElementById("id-khach-hang").innerText;
                    var selectedIdValue = document.getElementById('select-id-color').value;
                    var quantityProduct = 0;
                    quantityProduct = parseInt(document.getElementById('quantity-product-add-to-cart').value);
                    if (idKhachHang == "") {
                        Swal.fire({
                            title: "Login to add products to cart",
                            icon: "warning",
                            showCancelButton: true,
                            confirmButtonText: "Log in",
                            cancelButtonText: "Close",
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = "/sixdo-shop/login";
                            }
                        });
                    }

                    $.ajax({
                        url: '/sixdo-shop/add-to-cart-buyer',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            idKhachHang: idKhachHang,
                            idChiTietSanPham: selectedIdValue,
                            soLuong: quantityProduct
                        }),
                        success: function (response) {
                            const count = document.querySelector('.icon-count-cart');
                            count.setAttribute('data-notify', response);
                            showAlertAddCart('Success!', 'Product added to cart!', 'success');

                        },
                        error: function (error) {
                            console.error(error);
                        }
                    });


                });
            }


            // tải tự động dữ liệu lên từ product controller
            function loadData() {
                $.get('/product-favorite/load-data', function (data) {
                    displayProducts(data);
                });
            }

            // Hàm tìm kiếm sản phẩm dựa trên từ khóa
            function searchProducts(searchTerm) {
                $.get('/load-du-lieu/search', {name: searchTerm}, function (data) {
                    if (data) {
                        displayProducts(data);
                    } else {
                        console.error("Không tìm thấy kết quả cho từ khóa: " + searchTerm);
                    }
                });
            }


            // Thương Hiệu Hiển Thị
            function loadFilterThuongHieu() {
                $.get('/load-du-lieu/hien-thi-thuong-hieu-components-product-home', function (data) {
                    displayFilterThuongHieuHienThi(data);
                });
            }

            // Màu Sắc Hiển Thị
            function loadFilterMauSac() {
                $.get('/load-du-lieu/hien-thi-mau-sac-components-product-home', function (data) {
                    displayFilterMauSacHienThi(data);
                });
            }


            var selectedFilters = {
                maMauSac: '',
                tenThuongHieu: ''
            };

            function displayFilterThuongHieuHienThi(thuongHieus) {
                const container = $('#display-filter-thuong-hieu-hien-thi');
                container.empty();
                var productHTML = '<div class="mtext-102 cl2 p-b-15">Thương hiệu </div>';
                productHTML += '<ul>';
                $.each(thuongHieus, function (index, thuongHieu) {
                    productHTML += '<li class="p-b-6">';
                    productHTML += '<button class="filter-link stext-106 trans-04" data-brand="' + thuongHieu + '">' + thuongHieu + '</button>';
                    productHTML += '</li>';
                });
                productHTML += '</ul>';
                container.append(productHTML);

                // Xử lý sự kiện khi người dùng nhấp vào nút thương hiệu
                container.find('.filter-link').click(function () {
                    // Kiểm tra xem nút hiện tại đã có lớp filter-link-active chưa
                    var isActive = $(this).hasClass('filter-link-active');

                    // Loại bỏ lớp filter-link-active từ tất cả các nút
                    container.find('.filter-link').removeClass('filter-link-active');

                    // Nếu nút hiện tại chưa có lớp filter-link-active, thêm lớp này vào
                    if (!isActive) {
                        $(this).addClass('filter-link-active');
                    }

                    // Lấy giá trị của data-brand
                    var selectedBrand = $(this).data('brand');


                    if (selectedFilters.tenThuongHieu === selectedBrand) {
                        selectedFilters.tenThuongHieu = '';
                    } else {
                        selectedFilters.tenThuongHieu = selectedBrand;
                    }
                    sendFiltersToController(selectedFilters);
                });
            }

            function displayFilterMauSacHienThi(mauSacs) {
                const container = $('#display-filter-mau-sac-hien-thi');
                container.empty();
                var productHTML = '<div class="mtext-102 cl2 p-b-15">Màu Sắc </div>';
                productHTML += '<ul>';

                $.each(mauSacs, function (index, mauSac) {
                    productHTML += '<li class="p-b-6">';
                    productHTML += '<span class="fs-15 lh-12 m-r-6" style="color: ' + mauSac.maMauSac + ';">';
                    productHTML += '<i class="zmdi zmdi-circle"></i>';
                    productHTML += '</span>';
                    productHTML += '<button class="filter-link stext-106 trans-04" data-color=' + mauSac.maMauSac + '>' + mauSac.tenMauSac + '</button>';
                    productHTML += '</li>';
                });

                productHTML += '</ul>';
                container.append(productHTML);

                // Xử lý sự kiện khi người dùng nhấp vào nút màu sắc
                container.find('.filter-link').click(function () {
                    // Kiểm tra xem nút hiện tại đã có lớp filter-link-active chưa
                    var isActive = $(this).hasClass('filter-link-active');

                    // Loại bỏ lớp filter-link-active từ tất cả các nút
                    container.find('.filter-link').removeClass('filter-link-active');

                    // Nếu nút hiện tại chưa có lớp filter-link-active, thêm lớp này vào
                    if (!isActive) {
                        $(this).addClass('filter-link-active');
                    }

                    // Lấy giá trị của data-color
                    var selectColor = $(this).data('color');

                    if (selectedFilters.maMauSac === selectColor) {
                        selectedFilters.maMauSac = '';
                    } else {
                        selectedFilters.maMauSac = selectColor;
                    }

                    sendFiltersToController(selectedFilters);
                });
            }

            function sendFiltersToController(filters) {
                $.ajax({
                    type: 'POST',
                    url: '/load-du-lieu/filter/loc-thuong-hieu-mau-sac-components-product-home',
                    data: filters,
                    success: function (response) {
                        displayProducts(response);
                    },
                    error: function (xhr, status, error) {
                        // Xử lý lỗi nếu có
                    }
                });
            }


            // lấy dữ liệu trong method filterComponentProductHome
            function loadFilterHienThi() {
                $.get('/load-du-lieu/hien-thi-danh-muc-components-product-home', function (data) {
                    displayFilterHienThi(data);
                });
            }

            function displayFilterHienThi(filters) {
                const container = $('#display-filter-hien-thi');
                container.empty();
                var productHTML = '<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*" onclick="loadData()">Tất cả sản phẩm</button>';
                container.append(productHTML);
                $.each(filters, function (index, filter) {
                    productHTML = '<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".' + filter + '" onclick="filterProducts(\'' + filter + '\')">' + filter + '</button>';
                    container.append(productHTML);
                });

                container.find('.stext-106').click(function () {
                    var isActive = $(this).hasClass('how-active1');

                    // Loại bỏ lớp filter-link-active từ tất cả các nút
                    container.find('.stext-106').removeClass('how-active1');

                    // Nếu nút hiện tại chưa có lớp filter-link-active, thêm lớp này vào
                    if (!isActive) {
                        $(this).addClass('how-active1');
                    }
                });
            }

            function filterProducts(filter) {
                // Gửi tên filter về controller
                $.get('/load-du-lieu/hien-thi-loc-components-product-home/filter', {tenDanhMuc: filter}, function (data) {
                    displayProducts(data);
                });
            }

            // Hàm hiển thị sản phẩm lên trang
            function displayProducts(products) {
                const container = $('#search-results');
                container.empty();

                $.each(products, function (index, product) {
                    var productHTML = '<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">';
                    productHTML += '<a class="block2" href="/sixdo-shop/product/' + product.id + '">';
                    productHTML += '<div class="block2-pic hov-img0">';
                    productHTML += '<img src="' + product.hinhAnh + '" alt="Product">';
                    productHTML += '<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1" data-id="' + product.id + '">Xem Nhanh</a>';
                    productHTML += '</div>';
                    productHTML += '<div class="block2-txt flex-w flex-t p-t-14">';
                    productHTML += '<div class="block2-txt-child1 flex-col-l ">';
                    productHTML += '<a href="product-detail.jsp" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6" style="font-size: 20px; color: #1d1d1d;">' + product.tenSanPham + '</a>';
                    productHTML += '<span class="stext-105 cl3" style="font-size: 15px">' + product.giaBan.toLocaleString() + ' đồng</span>';
                    productHTML += '</div>';
                    productHTML += '<div class="block2-txt-child2 flex-r p-t-3">';
                    productHTML += '<a class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 js-addedwish-b2" data-product-id="' + product.id + '" data-wishlist="false">';
                    productHTML += '<i class="bi bi-heart-fill bi-heart-fill-favorite"></i>';
                    productHTML += '</a></div>';
                    productHTML += '</div></a></div>';
                    container.append(productHTML);
                });
            }
        </script>

        <!-- Load more -->
        <div class="flex-c-m flex-w w-full p-t-45">
            <a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
                Load More
            </a>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/ban-hang-online/components/footer.jsp"/>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
</div>
<jsp:include page="/WEB-INF/views/ban-hang-online/components/quick_view.jsp"/>


<!--===============================================================================================-->
<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/animsition/4.0.2/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script>
    $(".js-select2").each(function () {
        $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
        });
    })
</script>
<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.js"></script>

<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

<%--<script type="text/javascript">--%>
<%--    <%@include file="../../../views/ban-hang-online/js/slick-custom.js" %>--%>

<%--</script>--%>
<!--===============================================================================================-->
<script src="https://cdn.jsdelivr.net/npm/parallax100@1.1.3/parallax100.js"></script>
<script>
    $('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<script>
    $('.gallery-lb').each(function () { // the containers for all your galleries
        $(this).magnificPopup({
            delegate: 'a', // the selector for gallery item
            type: 'image',
            gallery: {
                enabled: true
            },
            mainClass: 'mfp-fade'
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/isotope-layout@3.0.6/dist/isotope.pkgd.min.js"></script>

<!--===============================================================================================-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert.min.js"></script>

<!--===============================================================================================-->

<script>
    $('.js-addwish-b2').on('click', function (e) {
        e.preventDefault();
    });

    $('.js-addwish-b2').each(function () {
        var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
        $(this).on('click', function () {
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-b2');
            $(this).off('click');
        });
    });

    $('.js-addwish-detail').each(function () {
        var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

        $(this).on('click', function () {
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-detail');
            $(this).off('click');
        });
    });

    /*---------------------------------------------*/


</script>
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
s
<%--ffffff--%>

<script type="text/javascript">
    <%@include file="../../../views/ban-hang-online/js/main.js" %>

</script>

</body>
</html>
