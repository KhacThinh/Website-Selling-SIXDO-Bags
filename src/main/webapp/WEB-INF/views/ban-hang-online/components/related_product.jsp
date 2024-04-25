<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:if test="${checkThuongHieuTuongUng}">
    <div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
        <h5 class="ltext-106 cl5 txt-center">
            Sản Phẩm Tương Tự Theo Thương Hiệu
        </h5>
    </div>
    <section class="sec-relate-product bg0 p-t-45 p-b-105">
        <div class="container">
            <!-- Slide2 -->
            <div class="wrap-slick2">
                <div class="slick2">
                    <c:forEach var="o" items="${listSp}" varStatus="loop">

                        <div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
                            <!-- Block2 -->
                            <a class="block2" href="/sixdo-shop/product-detail?id=${o.id}">
                                <div class="block2-pic hov-img0">
                                    <img src="${pageContext.request.contextPath}/${o.hinhAnh}"
                                         alt="IMG-PRODUCT">

                                    <a href="/sixdo-shop/product-detail?id=${o.id}"
                                       class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04"
                                       data-id="${o.id}">
                                        Xem Nhanh
                                    </a>
                                </div>

                                <div class="block2-txt flex-w flex-t p-t-14">
                                    <div class="block2-txt-child1 flex-col-l ">
                                        <a href="product-detail.jsp"
                                           class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6" style="height: 48px;">
                                                ${o.tenSanPham}
                                        </a>

                                        <span class="stext-105 cl3">
                                        <fmt:formatNumber value="${o.giaBan}" pattern="#,###" var="giaBansptt"/>
                                        ${giaBansptt} đồng	<span style="margin-left: 115px; position: absolute;">Bán: ${o.soLuongBan} cái</span></span>
                                    </div>

                                    <div class="block2-txt-child2 flex-r p-t-3">
                                        <a class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 js-addedwish-b2"
                                           data-product-id="${o.id}" data-wishlist="false">
                                            <i class="bi bi-heart"></i>
                                            <i class="bi bi-heart-fill"></i>
                                        </a>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </section>
</c:if>

<c:if test="${checkDanhMucTuongTu}">
    <div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
        <h5 class="ltext-106 cl5 txt-center">
            Sản Phẩm Tương Tự Theo Danh Mục
        </h5>
    </div>
    <section class="sec-relate-product bg0 p-t-45 p-b-105">
        <div class="container">
            <!-- Slide2 -->
            <div class="wrap-slick2">
                <div class="slick2">
                    <c:forEach var="o" items="${productHomeDanhMuc}" varStatus="loop">

                        <div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
                            <!-- Block2 -->
                            <a class="block2" href="/sixdo-shop/product-detail?id=${o.id}">
                                <div class="block2-pic hov-img0">
                                    <img src="${pageContext.request.contextPath}/${o.hinhAnh}"
                                         alt="IMG-PRODUCT">

                                    <a href="/sixdo-shop/product-detail?id=${o.id}"
                                       class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04"
                                       data-id="${o.id}">
                                        Xem Nhanh
                                    </a>
                                </div>

                                <div class="block2-txt flex-w flex-t p-t-14">
                                    <div class="block2-txt-child1 flex-col-l ">
                                        <a href="product-detail.jsp"
                                           class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6" style="height: 48px;">
                                                ${o.tenSanPham}
                                        </a>

                                        <span class="stext-105 cl3">
                                        <fmt:formatNumber value="${o.giaBan}" pattern="#,###" var="giaBansptt"/>
                                        ${giaBansptt} đồng <span style="margin-left: 115px; position: absolute;">Bán: ${o.soLuongBan} cái</span></span>
                                    </div>

                                    <div class="block2-txt-child2 flex-r p-t-3">
                                        <a class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 js-addedwish-b2"
                                           data-product-id="${o.id}" data-wishlist="false">
                                            <i class="bi bi-heart"></i>
                                            <i class="bi bi-heart-fill"></i>
                                        </a>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </section>
</c:if>

<c:if test="${checkSoTienTuongUng}">
    <div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
        <h5 class="ltext-106 cl5 txt-center">
            Sản Phẩm Cùng Tầm Giá
        </h5>
    </div>
    <section class="sec-relate-product bg0 p-t-45 p-b-105">
        <div class="container">

            <!-- Slide2 -->
            <div class="wrap-slick2">
                <div class="slick2">

                    <c:forEach var="o" items="${productHomeGiaTienTuongUng}" varStatus="loop">

                        <div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
                            <!-- Block2 -->
                            <a class="block2" href="/sixdo-shop/product-detail?id=${o.id}">
                                <div class="block2-pic hov-img0">
                                    <img src="${pageContext.request.contextPath}/${o.hinhAnh}"
                                         alt="IMG-PRODUCT">

                                    <a href="/sixdo-shop/product-detail?id=${o.id}"
                                       class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04"
                                       data-id="${o.id}">
                                        Xem Nhanh
                                    </a>
                                </div>

                                <div class="block2-txt flex-w flex-t p-t-14">
                                    <div class="block2-txt-child1 flex-col-l ">
                                        <a href="product-detail.jsp"
                                           class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6" style="height: 48px;">
                                                ${o.tenSanPham}
                                        </a>

                                        <span class="stext-105 cl3">
                                        <fmt:formatNumber value="${o.giaBan}" pattern="#,###" var="giaBansptt"/>
                                        ${giaBansptt} đồng	<span style="margin-left: 115px; position: absolute;">Bán: ${o.soLuongBan} cái</span></span>
                                    </div>

                                    <div class="block2-txt-child2 flex-r p-t-3">
                                        <a class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 js-addedwish-b2"
                                           data-product-id="${o.id}" data-wishlist="false">
                                            <i class="bi bi-heart"></i>
                                            <i class="bi bi-heart-fill"></i>
                                        </a>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </section>
</c:if>
</body>
</html>