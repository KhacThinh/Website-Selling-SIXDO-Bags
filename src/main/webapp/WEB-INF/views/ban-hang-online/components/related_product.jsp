<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<section class="sec-relate-product bg0 p-t-45 p-b-105">
    <div class="container">
        <div class="p-b-45">
            <h3 class="ltext-106 cl5 txt-center">
                Sản Phẩm Tương Tự
            </h3>
        </div>

        <!-- Slide2 -->
        <div class="wrap-slick2">
            <div class="slick2">


                <c:forEach var="o" items="${listSp}" varStatus="loop">

                    <div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
                        <!-- Block2 -->
                        <a class="block2" href="/sixdo-shop/product/${o.id}">
                            <div class="block2-pic hov-img0">
                                <img src="${pageContext.request.contextPath}/${o.hinhAnh}"
                                     alt="IMG-PRODUCT">

                                <a href="#"
                                   class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1" data-id="${o.id}" >
                                    Xem Nhanh
                                </a>
                            </div>

                            <div class="block2-txt flex-w flex-t p-t-14">
                                <div class="block2-txt-child1 flex-col-l ">
                                    <a href="product-detail.jsp"
                                       class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                            ${o.tenSanPham}
                                    </a>

                                    <span class="stext-105 cl3">
<fmt:formatNumber value="${o.giaBan}"
                  type="currency"/>									</span>
                                </div>

                                <div class="block2-txt-child2 flex-r p-t-3">
                                    <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                                        <img class="icon-heart1 dis-block trans-04"
                                             src="${pageContext.request.contextPath}/../static/images/icon/icon-heart-01.png"
                                             alt="ICON">
                                        <img class="icon-heart2 dis-block trans-04 ab-t-l"
                                             src="${pageContext.request.contextPath}/../static/images/icon/icon-heart-02.png"
                                             alt="ICON">
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
</body>
</html>