<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Product Detail</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!====================================-->
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Perfect Scrollbar CSS -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/1.5.0/css/perfect-scrollbar.min.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Animsition -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animsition/4.0.2/js/animsition.min.js"></script>

    <!-- Bootstrap Popper.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.1/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Select2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>


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


<!-- breadcrumb -->
<div class="container">
    <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
        <a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
            Home
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>

        <a href="product.html" class="stext-109 cl8 hov-cl1 trans-04">
            Men
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>

        <span class="stext-109 cl4">
				Lightweight Jacket
		</span>
    </div>
</div>


<!-- Product Detail -->
<jsp:include page="/WEB-INF/views/ban-hang-online/components/product-customer.jsp"/>


<!-- Related Products -->
<jsp:include page="/WEB-INF/views/ban-hang-online/components/related_product.jsp"/>



<!-- Footer -->
<jsp:include page="/WEB-INF/views/ban-hang-online/components/footer.jsp"/>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
</div>

<!-- QuickView -->
<jsp:include page="/WEB-INF/views/ban-hang-online/components/quick_view.jsp"/>


<!--===============================================================================================-->
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
<script type="text/javascript">
    <%@include file="../../../views/ban-hang-online/js/slick-custom.js" %>
</script>
<!--===============================================================================================-->
<script src="https://cdn.jsdelivr.net/npm/parallax100@1.1.3/parallax100.js"></script>
<script>
    $('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<!-- Sử dụng đường dẫn CDN cho jQuery Magnific Popup -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
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
<!--===============================================================================================-->
<script src="https://cdn.jsdelivr.net/npm/isotope-layout@3.0.6/dist/isotope.pkgd.min.js"></script>

<!--===============================================================================================-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.min.js"></script>


<script>
    // var cart = getCartFromCookie() || [];
    //
    //
    // function addToCartDetail(productId ,productMa, productName, productPrice,productImg,sl) {
    //     var existingProduct = cart.find((product) => product.ma === productMa);
    //
    //     if (existingProduct) {
    //         // Nếu đã có trong giỏ hàng, tăng số lượng
    //         existingProduct.sl += sl;
    //     } else {
    //         // Nếu chưa có trong giỏ hàng, thêm vào giỏ hàng
    //         var product = {
    //             id: productId,
    //             ma: productMa,
    //             name: productName,
    //             price: productPrice,
    //             img: productImg,
    //             sl: sl,
    //         };
    //         cart.push(product);
    //
    //     }
    //
    //     updateCartCount();
    //     saveCartToCookie();
    //     countProduct();
    // }
    //
    // function getCartFromCookie() {
    //     var name = 'cart=';
    //     var decodedCookie = decodeURIComponent(document.cookie);
    //     var cookieArray = decodedCookie.split(';');
    //     for (var i = 0; i < cookieArray.length; i++) {
    //         var cookie = cookieArray[i].trim();
    //         if (cookie.indexOf(name) === 0) {
    //             var cookieValue = cookie.substring(name.length, cookie.length);
    //             try {
    //                 return JSON.parse(decodeURIComponent(cookieValue));
    //             } catch (error) {
    //                 console.error("Lỗi khi chuyển đổi cookie thành đối tượng JSON:", error);
    //             }
    //         }
    //     }
    //     return null;
    // }


    // Dữ liệu sản phẩm được đẩy từ Spring Boot
    var products ; // Giả sử product là một List hoặc Array chứa dữ liệu sản phẩm


    function updatePriceQuickView(selectElement) {
        var selectedId = selectElement.value;
        var colorSelectQuickView = selectElement;

        for (var i = 0; i < colorSelectQuickView.options.length; i++) {
            if (selectedId===colorSelectQuickView.options[i].value){
                $.ajax({
                    url: '/sixdo-shop/quick-view?',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        idProduct: selectedId
                    }),
                    success: function (response) {
                        var formattedGiaBan = gia.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                            if (selectedId===colorSelectQuickView.options[i].value){
                                console.log("hhhhhhhhhhhhhh")
                                document.getElementById('price-product-quick-view').innerText = '<fmt:formatNumber value="${o.giaBan}" type="currency"/>';
                                return;
                            }


                    },
                    error: function (error) {
                        console.error("Lỗi khi thanh toán:", error);
                    }
                });



            }

        }


    }

    function updatePrice(selectElement) {
        var selectedId = selectElement.value;
        console.log("idddddđ"+selectedId)

       <c:forEach var="o" items="${product}" varStatus="loop">
        if (selectedId == ${o.id}) {
            console.log("day roi "+${o.giaBan})
            document.getElementById('product-price').innerText = '<fmt:formatNumber value="${o.giaBan}" type="currency"/>';
            var newImagePath = "${pageContext.request.contextPath}/" + "${o.hinhAnh}";
            document.getElementById('product-image').src = newImagePath;


            return;
        }

       </c:forEach>


    }


    function showAlertAddCart(mess) {
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '',
            text: mess,
            showConfirmButton: false,
            timer: 1000,
            customClass: {
                container: 'swal-custom'
            }
        });
    }






    //////////
    $('.js-addwish-b2, .js-addwish-detail').on('click', function (e) {
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
<!--===============================================================================================-->
<script type="text/javascript">
    <%@include file="../../../views/ban-hang-online/js/main.js" %>
</script>

</body>
</html>