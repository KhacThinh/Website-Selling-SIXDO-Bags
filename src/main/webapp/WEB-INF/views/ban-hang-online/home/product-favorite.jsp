<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sản phẩm yêu thích</title>
    <link rel="Website Icon" type="png" href="../static/images/icon/LOGOSIXDO.png">
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

    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="/static/css/util.css">
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
        <div class="flex-w flex-sb-m p-b-52">
            <div class="flex-w flex-l-m filter-tope-group m-tb-10">
                <h3>
                    SẢN PHẨM YÊU THÍCH
                </h3>
            </div>

            <div class="flex-w flex-c-m m-tb-10">
                <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
                    <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
                    <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                    Tìm kiếm
                </div>
            </div>

            <!-- Search product -->
            <div class="dis-none panel-search w-full p-t-10 p-b-15">
                <form id="search-form" class="bor8 dis-flex p-l-15">
                    <button type="submit" class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
                        <i class="zmdi zmdi-search"></i>
                    </button>
                    <input id="search-input-product-home"
                           class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="name"
                           placeholder="Tìm Tên Sản Phẩm">
                </form>
            </div>
        </div>

        <div id="search-results" class="row">

        </div>

        <%--JavaScript Search--%>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.6.15/sweetalert2.min.js"
                integrity="sha512-yOZAw8NpGZyqxokHrsFrJDdNIlzJzya9qxPD4GyranfFCr0jCyYaq5/ShcwP8YT5SNtrbtlDbAKlDmNt6bS5Vw=="
                crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script>
            $(document).ready(function () {
                loadData();
                xoaSanPhamYeuThich();
                checkSanPhamYeuThichTrangChu();

                $('#search-form').submit(function (event) {
                    event.preventDefault();
                    var searchTerm = $('#search-input-product-home').val();
                    searchProducts(searchTerm);
                });
            });

            // check xem sản phẩm đã được yêu thích chưa
            function checkSanPhamYeuThichTrangChu() {
                $.get('/product-favorite/check-san-pham-yeu-thich-home', function (data) {
                    var productIDs = data;
                    $(".js-addwish-b2").each(function () {
                        var productID = $(this).data("product-id");
                        if (productIDs.includes(productID)) {
                            $(this).find('.bi-heart').hide();
                            $(this).find('.bi-heart-fill').show();
                        }
                    });
                });
            }

            function capNhapSoLuongSanPhamYeuThichHearder() {
                $.get('/product-favorite/hien-thi-so-luong-product-favorite', function (data) {
                    displaySoLuongSanPhamFavorite(data);
                });
            }


            // sản phẩm yêu thích product favorites
            function xoaSanPhamYeuThich() {
                $(document).on('click', '.js-addwish-b2', function () {
                    var heartFill = $(this).find('.bi-heart-fill');
                    var heartOutline = $(this).find('.bi-heart');
                    var productId = $(this).data('product-id');

                    $.get('/product-favorite/check-thong-tin-khach-hang', function (response) {
                        if (response !== 0) {
                            console.log('Khách hàng đã đăng nhập với ID:', response);
                            if (heartFill.css('display') !== 'none') {
                                $.get('/product-favorite/xoa-san-pham-yeu-thich', {idSanPham: productId}, function (sanPhamCheck) {
                                    if (sanPhamCheck != 0) {
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
                                    } else {
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

            function loadData() {
                $.get('/product-favorite/load-data', function (data) {
                    displayProducts(data);
                });
            }

            function searchProducts(searchTerm) {
                $.get('/product-favorite/search', {name: searchTerm}, function (data) {
                    if (data) {
                        displayProducts(data);
                    } else {
                        console.error("Không tìm thấy kết quả cho từ khóa: " + searchTerm);
                    }
                });
            }

            // Hàm hiển thị sản phẩm lên trang
            function displayProducts(products) {
                const container = $('#search-results');
                container.empty();

                $.each(products, function (index, product) {
                    var productHTML = '<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">';
                    productHTML += '<a class="block2" href="/sixdo-shop/product-detail?id=' + product.id + '">';
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
