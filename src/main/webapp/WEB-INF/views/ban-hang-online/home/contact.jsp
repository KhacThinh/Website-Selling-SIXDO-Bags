<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Liên Hệ</title>
    <link rel="Website Icon" type="png" href="../static/images/icon/LOGOSIXDO.png">
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

    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="/static/css/util.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>


<body class="animsition">
<%--header--%>
<jsp:include page="/WEB-INF/views/ban-hang-online/components/hd.jsp"/>
<%--header--%>

<!-- Cart -->
<jsp:include page="/WEB-INF/views/ban-hang-online/components/cart.jsp"/>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92"
         style="background-image: url('<c:url value="../static/images/banner/bg-01.jpg"/>');">
    <h2 class="ltext-105 cl0 txt-center">
        Liên hệ
    </h2>
</section>

<!-- Content page -->
<section class="bg0 p-t-104 p-b-116">
    <div class="container">
        <div class="flex-w flex-tr">
            <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
                <form>
                    <h4 class="mtext-105 cl2 txt-center p-b-30">
                        Gửi tin nhắn cho chúng tôi
                    </h4>

                    <div class="bor8 m-b-20 how-pos4-parent">
                        <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="email-contact"
                               placeholder="Địa chỉ email của bạn">
                        <i class="bi bi-envelope how-pos4 pointer-none"></i>
                    </div>

                    <div class="bor8 m-b-30">
                        <textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="msg-contact"
                                  placeholder="Chúng tôi có thể giúp đỡ bạn bằng cách nào?"></textarea>
                    </div>

                    <button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer btn-gui-kho-khan-lh">
                        Gửi
                    </button>
                </form>
            </div>

            <div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md">
                <div class="flex-w w-full p-b-42">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-map-marker"></span>
						</span>

                    <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Địa chỉ
							</span>

                        <p class="stext-115 cl6 size-213 p-t-18" id="js-dia-chi-lh">
                            Coza Store Center 8th floor, 379 Hudson St, New York, NY 10018 US
                        </p>
                    </div>
                </div>

                <div class="flex-w w-full p-b-42">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-phone-handset"></span>
						</span>

                    <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Số điện thoại
							</span>

                        <p class="stext-115 cl1 size-213 p-t-18" id="js-sdt-lh">
                        </p>
                    </div>
                </div>

                <div class="flex-w w-full">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-envelope"></span>
						</span>

                    <div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Hỗ trợ bán hàng
							</span>

                        <p class="stext-115 cl1 size-213 p-t-18" id="js-email-lh">
                            contact@example.com
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Map -->
<div class="map">
    <div class="size-303" id="google_map"
         data-map-x="21.0285"
         data-map-y="105.8542"
         data-pin="../static/images/logo1.jpg"
         data-scrollwhell="0"
         data-draggable="1"
         data-zoom="18">
    </div>

</div>

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

<!--=====================================================================-->
<%--    Google Map--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
<script>
    let viDo = '';
    let kinhDo = '';
    let hinhAnhLogo = ''

    $(document).ready(function () {
        thongTinCuaHang();

        $('.btn-gui-kho-khan-lh').on('click', function (event) {
            event.preventDefault();
            const email = $('input[name="email-contact"]').val();
            const message = $('textarea[name="msg-contact"]').val();

            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!email || !message) {
                Swal.fire({
                    title: "Lỗi",
                    text: "Vui lòng điền đầy đủ thông tin.",
                    icon: "error",
                    showConfirmButton: true
                });
                return;
            }

            if (!emailPattern.test(email)) {
                Swal.fire({
                    title: "Lỗi",
                    text: "Định dạng email không hợp lệ.",
                    icon: "error",
                    showConfirmButton: true
                });
                return;
            }

            Swal.fire({
                title: "Cảm ơn các bạn đã nhận xét và góp ý!",
                text: "Chúng tôi sẽ trả lời lại nhận xét và góp ý của bạn sớm nhất có thể",
                icon: "success",
                showConfirmButton: false,
                timer: 2500
            });

            $('textarea[name="msg-contact"]').val("");
            $('input[name="email-contact"]').val("");

        });
    })

    function thongTinCuaHang() {
        $.get('/lien-he/thong-tin-cua-hang', function (data) {
            viDo = data.toaDoMapX;
            kinhDo = data.toaDoMapY;
            hinhAnhLogo = data.hinhAnhLogo;
            $('#js-email-lh').text(data.email);
            $('#js-logo-header').attr('src', data.hinhAnhLogo);
            $('#js-dia-chi-lh').text(data.diaChi);
            $('#js-sdt-lh').text(data.sdt);
            hienThiBanDo();
        })
    }

    function hienThiBanDo() {
        var selector_map = $('#google_map');
        var img_pin = selector_map.attr('data-pin');
        var scrollwhell = selector_map.attr('data-scrollwhell');
        var draggable = selector_map.attr('data-draggable');
        var map_zoom = selector_map.attr('data-zoom');

        if (img_pin == null) {
            img_pin = hinhAnhLogo;
        }
        if (scrollwhell == null) {
            scrollwhell = 0;
        }
        if (draggable == null) {
            draggable = 0;
        }
        if (map_zoom == null) {
            map_zoom = 5;
        }

        var style = [
            {
                "featureType": "water",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#e9e9e9"
                    },
                    {
                        "lightness": 17
                    }
                ]
            },
            {
                "featureType": "landscape",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#f5f5f5"
                    },
                    {
                        "lightness": 20
                    }
                ]
            },
            {
                "featureType": "road.highway",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#ffffff"
                    },
                    {
                        "lightness": 17
                    }
                ]
            },
            {
                "featureType": "road.highway",
                "elementType": "geometry.stroke",
                "stylers": [
                    {
                        "color": "#ffffff"
                    },
                    {
                        "lightness": 29
                    },
                    {
                        "weight": 0.2
                    }
                ]
            },
            {
                "featureType": "road.arterial",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#ffffff"
                    },
                    {
                        "lightness": 18
                    }
                ]
            },
            {
                "featureType": "road.local",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#ffffff"
                    },
                    {
                        "lightness": 16
                    }
                ]
            },
            {
                "featureType": "poi",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#f5f5f5"
                    },
                    {
                        "lightness": 21
                    }
                ]
            },
            {
                "featureType": "poi.park",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#dedede"
                    },
                    {
                        "lightness": 21
                    }
                ]
            },
            {
                "elementType": "labels.text.stroke",
                "stylers": [
                    {
                        "visibility": "on"
                    },
                    {
                        "color": "#ffffff"
                    },
                    {
                        "lightness": 16
                    }
                ]
            },
            {
                "elementType": "labels.text.fill",
                "stylers": [
                    {
                        "saturation": 36
                    },
                    {
                        "color": "#333333"
                    },
                    {
                        "lightness": 40
                    }
                ]
            },
            {
                "elementType": "labels.icon",
                "stylers": [
                    {
                        "visibility": "off"
                    }
                ]
            },
            {
                "featureType": "transit",
                "elementType": "geometry",
                "stylers": [
                    {
                        "color": "#f2f2f2"
                    },
                    {
                        "lightness": 19
                    }
                ]
            },
            {
                "featureType": "administrative",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#fefefe"
                    },
                    {
                        "lightness": 20
                    }
                ]
            },
            {
                "featureType": "administrative",
                "elementType": "geometry.stroke",
                "stylers": [
                    {
                        "color": "#fefefe"
                    },
                    {
                        "lightness": 17
                    },
                    {
                        "weight": 1.2
                    }
                ]
            }
        ];

        var latitude = viDo;
        var longitude = kinhDo;

        var locations = [
            ['<div class="infobox"><h4>Xin chào</h4><p>Đây là cửa hàng túi xách cao cấp xịn' +
            ' <br>xò nhất việt nam bạn đã biết chưa</p></div>'
                , latitude, longitude, 2]
        ];

        if (selector_map !== undefined) {
            var map = new google.maps.Map(document.getElementById('google_map'), {
                zoom: Number(map_zoom),
                zoomControl: false,
                disableDoubleClickZoom: true,
                scrollwheel: scrollwhell,
                navigationControl: true,
                mapTypeControl: false,
                scaleControl: false,
                draggable: draggable,
                styles: style,
                center: new google.maps.LatLng(latitude, longitude),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });

            var infowindow = new google.maps.InfoWindow();

            for (var i = 0; i < locations.length; i++) {
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                    map: map,
                    icon: {
                        url: img_pin,
                        scaledSize: new google.maps.Size(30, 30),
                        origin: new google.maps.Point(0, 0),
                        anchor: new google.maps.Point(20, 40)
                    }
                });

                google.maps.event.addListener(marker, 'click', (function (marker, i) {
                    return function () {
                        infowindow.setContent(locations[i][0]);
                        infowindow.open(map, marker);
                    }
                })(marker, i));
            }
        }
    }
</script>
<!--=====================================================================-->


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

    var products; // Giả sử product là một List hoặc Array chứa dữ liệu sản phẩm


    function updatePriceQuickView(selectElement) {
        var selectedId = selectElement.value;
        var colorSelectQuickView = selectElement;

        for (var i = 0; i < colorSelectQuickView.options.length; i++) {
            if (selectedId === colorSelectQuickView.options[i].value) {
                $.ajax({
                    url: '/sixdo-shop/quick-view?',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        idProduct: selectedId
                    }),
                    success: function (response) {
                        var formattedGiaBan = gia.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                        if (selectedId === colorSelectQuickView.options[i].value) {
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
        console.log("idddddđ" + selectedId)

        <c:forEach var="o" items="${product}" varStatus="loop">
        if (selectedId == ${o.id}) {
            console.log("day roi " +${o.giaBan})
            document.getElementById('product-price').innerText = '<fmt:formatNumber
                                           pattern="#,###"
                                           var="tongTam"
                                           value="${o.giaBan}"></fmt:formatNumber> ${tongTam}đ';
            var newImagePath = "${pageContext.request.contextPath}/" + "${o.hinhAnh}";
            document.getElementById('product-image').src = newImagePath;
            document.getElementById('so-luong-kho-detail').innerText = "${o.soLuong}"
            soLuongMuaDetail(${o.id})
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