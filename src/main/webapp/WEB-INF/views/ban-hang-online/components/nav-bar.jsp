<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charshet="utf-8"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Platypi:ital,wght@0,300..800;1,300..800&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
    <style>
        .js-new-arrivals,
        .js-textCollectionTitle{
            font-family: "Playfair Display", serif;
            font-optical-sizing: auto;
            font-style: normal;
            font-weight: 600;
        }
    </style>
</head>
<body>
<section class="section-slide">
    <div class="wrap-slick1">
        <div class="slick1 js-banner-sixdo">
            <%--            <div class="item-slick1"--%>
            <%--                 style="background-image: url('${pageContext.request.contextPath}/../static/images/banner/banner1.jpg');">--%>
            <%--                <div class="container h-full">--%>
            <%--                    <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">--%>
            <%--                        <div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">--%>
            <%--								<span class="ltext-101 cl2 respon2 js-textCollectionTitle">--%>
            <%--									Bộ Sưu Tập Nữ 2018--%>
            <%--								</span>--%>
            <%--                        </div>--%>

            <%--                        <div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">--%>
            <%--                            <h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1 js-New Arrivals">--%>
            <%--                                TÚI CHÉO CAO CẤP--%>
            <%--                            </h2>--%>
            <%--                        </div>--%>

            <%--                        <div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">--%>
            <%--                            <a href=""--%>
            <%--                               class="flex-c-m flex-c-mm stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">--%>
            <%--                                Mua Ngay--%>
            <%--                            </a>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>
        </div>
    </div>
</section>


<!-- Banner -->
<div class="sec-banner bg0 p-t-80 p-b-50">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
                <!-- Block1 -->
                <div class="block1 wrap-pic-w">
                    <img src="../static/images/danh-muc/banner-04.jpg" alt="IMG-BANNER">

                    <a href="/sixdo-shop/product"
                       class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
                        <div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									TÚI NỮ
								</span>

                            <span class="block1-info stext-102 trans-04">
									Xuân 2024
								</span>
                        </div>

                        <div class="block1-txt-child2 p-b-4 trans-05">
                            <div class="block1-link stext-101 cl0 trans-09">
                                Vô ngay
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
                <!-- Block1 -->
                <div class="block1 wrap-pic-w">
                    <img src="../static/images/danh-muc/banner-05.jpg" alt="IMG-BANNER">

                    <a href="/sixdo-shop/product"
                       class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
                        <div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									TÚI NAM
								</span>

                            <span class="block1-info stext-102 trans-04">
									Xuân 2025
								</span>
                        </div>

                        <div class="block1-txt-child2 p-b-4 trans-05">
                            <div class="block1-link stext-101 cl0 trans-09">
                                Vô ngay
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
                <!-- Block1 -->
                <div class="block1 wrap-pic-w">
                    <img src="../static/images/danh-muc/banner-08.jpg" alt="IMG-BANNER">

                    <a href="/sixdo-shop/product"
                       class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
                        <div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
                                    BÁN CHẠY
								</span>

                            <span class="block1-info stext-102 trans-04">
									Xu Hướng Mới
								</span>
                        </div>

                        <div class="block1-txt-child2 p-b-4 trans-05">
                            <div class="block1-link stext-101 cl0 trans-09">
                                Vô ngay
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $.get('/sixdo-shop/slide-show/online', function (data) {
        const container = $('.js-banner-sixdo');
        container.empty();
        $.each(data, function (index, sls) {
            var backgroundImageUrl = '${pageContext.request.contextPath}/../' + sls.urlHinhAnh + ';'
            var itemSlick1HTML = '<div class="item-slick1" style="background-image: url(' + backgroundImageUrl + ');">' +
                '<div class="container h-full">' +
                '<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">' +
                '<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">' +
                '<span class="ltext-101 cl2 respon2 js-textCollectionTitle">' + sls.textCollectionTitle + '</span>' +
                '</div>' +
                '<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">' +
                '<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1 js-new-arrivals">' + sls.textNewArrivals + '</h2>' +
                '</div>' +
                '<div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">' +
                '<a href="' + sls.linkChuyenTrang + '" class="flex-c-m flex-c-mm stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">Mua Ngay</a>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';
            container.append(itemSlick1HTML);
        });
    })
</script>

</body>
</html>