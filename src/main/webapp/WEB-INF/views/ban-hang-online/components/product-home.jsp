<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- Product -->
<section class="bg0 p-t-23 p-b-140">
    <div class="container">
        <div class="p-b-10">
            <h3 class="ltext-103 cl5">
                BỘ SƯU TẬP
            </h3>
        </div>
        <div class="flex-w flex-sb-m p-b-52">
            <div id="display-filter-hien-thi" class="flex-w flex-l-m filter-tope-group m-tb-10">
                <%-- Hiển thị Fillter đối tượng--%>
            </div>

            <div class="flex-w flex-c-m m-tb-10">
                <div
                        class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
                    <i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
                    <i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                    Lọc
                </div>

                <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
                    <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
                    <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                    Tìm Kiếm
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

            <!-- Filter -->
            <div class="dis-none panel-filter w-full p-t-10">
                <div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
                    <div class="filter-col1 p-r-15 p-b-27" id="display-sort">
                        <div class="mtext-102 cl2 p-b-15">
                            Sắp xếp
                        </div>

                        <ul class="p-0">
                            <li class="p-b-6">
                                <button data-sort="1" class="filter-link stext-106 trans-04 filter-link-active">
                                    Mặc định
                                </button>
                            </li>
                            <li class="p-b-6">
                                <button data-sort="2" class="filter-link stext-106 trans-04">
                                    Sắp xếp số lượng mua
                                </button>
                            </li>

                            <li class="p-b-6">
                                <button data-sort="3" class="filter-link stext-106 trans-04">
                                    Giá: Thấp đến Cao
                                </button>
                            </li>

                            <li class="p-b-6">
                                <button data-sort="4" class="filter-link stext-106 trans-04">
                                    Giá: Cao đến Thấp
                                </button>
                            </li>
                        </ul>
                    </div>

                    <div id="display-filter-thuong-hieu-hien-thi" class="filter-col2 p-r-15 p-b-27">
                        <%--  filter thuong hiệu hiển thị ở đây --%>
                    </div>

                    <div id="display-filter-mau-sac-hien-thi" class="filter-col3 p-r-15 p-b-27">
                        <%--  filter màu sắc hiển thị ở đây --%>
                    </div>

                    <div class="filter-col4 p-b-27">
                    </div>
                </div>
            </div>
        </div>

        <div id="search-results" class="row">
            <%--            Hiển thị project--%>
        </div>

        <!-- Load more -->
        <div class="flex-c-m flex-w w-full p-t-45" id="check-btn-xem-them-home">
            <button type="button"
                    class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04 btn-xem-them-sp">
                Xem Thêm
            </button>
        </div>
    </div>
    <%--JavaScript Search--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.6.15/sweetalert2.min.js"
            integrity="sha512-yOZAw8NpGZyqxokHrsFrJDdNIlzJzya9qxPD4GyranfFCr0jCyYaq5/ShcwP8YT5SNtrbtlDbAKlDmNt6bS5Vw=="
            crossorigin="anonymous"></script>
    <%--            <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>--%>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        let valueLimit = sessionStorage.getItem("limitItem");
        $(document).ready(function () {
            if (valueLimit === null) {
                valueLimit = 1;
                sessionStorage.setItem("limitItem", valueLimit);
            } else {
                valueLimit = parseInt(valueLimit);
            }

            loadData();

            loadFilterThuongHieu();
            loadFilterHienThi();
            loadFilterMauSac();
            displaySort();

            // yêu thích
            checkSanPhamYeuThichTrangChu();
            capNhapSoLuongSanPhamYeuThichHearder();
            themSanPhamYeuThich();
            pageXemThemSanPham();

            // Sự kiện khi form tìm kiếm được submit
            $('#search-form').submit(function (event) {
                event.preventDefault();
                var searchTerm = $('#search-input-product-home').val();
                searchProducts(searchTerm);
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
                        if (heartFill.css('display') === 'none') {
                            $.post('/product-favorite/them-san-pham-yeu-thich', {idSanPham: productId}, function (sanPhamCheck) {
                                if (sanPhamCheck != 0) {
                                    heartFill.css('display', 'inline');
                                    heartOutline.css('display', 'none');
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Đã thêm vào danh sách yêu thích!',
                                        showConfirmButton: false,
                                        timer: 1500
                                    });
                                    capNhapSoLuongSanPhamYeuThichHearder();
                                } else {
                                    console.log("không thêm được vô sản phẩm yêu thích");
                                }
                            })
                        } else {
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
                                    capNhapSoLuongSanPhamYeuThichHearder();
                                } else {
                                    console.log("không xoá được sản phẩm yêu thích");
                                    alert("Lỗi");
                                }
                            });
                        }
                    } else {
                        Swal.fire({
                            title: 'Vui lòng đăng nhập để thêm sản phẩm này vào danh sách yêu thích',
                            text: 'Bằng cách đăng nhập, bạn có thể quản lý danh sách sản phẩm yêu thích cá nhân.',
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonText: 'Đăng nhập',
                            cancelButtonText: 'Để sau',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = "/sixdo-shop/login-customer";
                            }
                        });
                    }
                }).fail(function (xhr, status, error) {
                    console.error('Lỗi khi gửi yêu cầu kiểm tra thông tin khách hàng:', error);
                });
            });
        }

        function capNhapSoLuongSanPhamYeuThichHearder() {
            $.get('/product-favorite/hien-thi-so-luong-product-favorite', function (data) {
                displaySoLuongSanPhamFavorite(data);
            });
        }

        function pageXemThemSanPham() {
            $('.btn-xem-them-sp').on('click', function (event) {
                event.preventDefault();
                valueLimit += 1;
                sessionStorage.setItem("limitItem", valueLimit);
                loadData();
            })
        }

        // tải tự động dữ liệu lên từ product controller
        function loadData() {
            $.get('/load-du-lieu/product-home', {limit: valueLimit}, function (data) {
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
            sortBy: 1,
            maMauSac: '',
            tenThuongHieu: ''
        };

        function displaySort() {
            const container = $('#display-sort');

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
                var selectedSort = $(this).data('sort');

                if (selectedFilters.sortBy === selectedSort) {
                    selectedFilters.sortBy = 1;
                    $(this).addClass('filter-link-active');
                } else {
                    selectedFilters.sortBy = selectedSort;
                }
                sendFiltersToController(selectedFilters);
            });
        }

        function displayFilterThuongHieuHienThi(thuongHieus) {
            const container = $('#display-filter-thuong-hieu-hien-thi');
            container.empty();
            var productHTML = '<div class="mtext-102 cl2 p-b-15">Thương hiệu </div>';
            productHTML += '<ul class="p-0">';
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
            productHTML += '<ul class="p-0">';

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
            var productHTML = '<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*" onclick="loadData(valueLimit)">Tất cả sản phẩm</button>';
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
            let countLimitItem = 0;
            $.each(products, function (index, product) {
                countLimitItem += 1;
                var productHTML = '<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">';
                productHTML += '<a class="block2" href="/sixdo-shop/product-detail?id=' + product.id + '">';
                productHTML += '<div class="block2-pic hov-img0">';
                productHTML += '<img style="height: 300px ; width: 300px" src="' + product.hinhAnh + '" alt="Product">';
                productHTML += '<a href="/sixdo-shop/product-detail?id=' + product.id + '" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1" data-id="' + product.id + '">Xem Nhanh</a>';
                productHTML += '</div>';
                productHTML += '<div class="block2-txt flex-w flex-t p-t-14">';
                productHTML += '<div class="block2-txt-child1 flex-col-l ">';
                productHTML += '<a href="product-detail.jsp" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6" style="font-size: 20px; color: #1d1d1d;">' + product.tenSanPham + '</a>';
                productHTML += '<span class="stext-105 cl3" style="font-size: 15px">' + product.giaBan.toLocaleString() + ' đồng <span style="margin-left: 115px;    position: absolute;">Bán: ' + product.soLuongBan + ' cái</span></span>';
                productHTML += '</div>';
                productHTML += '<div class="block2-txt-child2 flex-r p-t-3">';
                productHTML += '<a class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 js-addedwish-b2" data-product-id="' + product.id + '" data-wishlist="false">';
                productHTML += '<i class="bi bi-heart"></i>';
                productHTML += '<i class="bi bi-heart-fill"></i>';
                productHTML += '</a></div>';
                productHTML += '</div></a></div>';
                container.append(productHTML);
            });

            $.get('/load-du-lieu/so-luong-san-pham', function (data) {
                console.log('countLimitItem: ' + countLimitItem);
                console.log('data: ' + data);
                let count = Number(countLimitItem);
                const reasonCancel = $('#check-btn-xem-them-home');
                if (count < 8) {
                    console.log('count < 8');
                    reasonCancel.hide();
                } else if (data === count) {
                    console.log('data === count');
                    reasonCancel.hide();
                } else if (count <= data) {
                    console.log('block');
                    reasonCancel.show();
                }
                checkSanPhamYeuThichTrangChu();
            })
        }

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

        window.addEventListener("load", function () {
            checkSanPhamYeuThichTrangChu();
        });

        document.addEventListener("DOMContentLoaded", function() {
            checkSanPhamYeuThichTrangChu();
        });
    </script>
</section>
</body>
</html>