<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BÁN TẠI QUẦY</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* Style the header */
        .header {
            background-color: #3498db;
            height: 50px;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 10px;
        }

        /* Style the search bar */
        .search-bar {
            display: flex;
            align-items: center;
        }

        .search-bar input[type="text"] {
            padding: 10px;
            border-radius: 5px;
            border: none;
            width: 240px;
        }

        .search-bar button {
            padding: 10px;
            border-radius: 5px;
            border: none;
            background-color: #ffffff;
            color: #333333;
            cursor: pointer;
        }

        /* Style the tab buttons */
        .tab {
            display: flex;
            align-items: center;
        }

        .tab button {
            background-color: #3498db;
            outline: none;
            cursor: pointer;
            padding: 10px 18px;
            transition: 0.3s;
            margin-left: 10px;
            color: white;
            font-size: 15px;
        }


        .tab button:not(.active) {
            background-color: #3498db;
            color: white;
        }

        /* Style the information panel */
        .container {
            display: grid;
            grid-template-columns: 1.5fr 1.2fr 1.1fr;
            /* 2/5, 1/5, 1/5 */
            gap: 20px;
            margin-top: 50px;
            /* Height of the header */
            padding: 10px;

        }


        .info-panel {
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 8px;

        }

        .info-panel input[type="text"] {
            margin-bottom: 10px;
            padding: 5px;
            width: calc(100% - 10px);
            border-radius: 5px;
            border: none;
            /* Remove border */
            border: none;
            border-bottom: 1px solid #ccc;
            /* Add bottom border */
            outline: none;
            /* Remove outline */
        }

        .info-panel select {
            padding: 5px;
            width: calc(100% - 10px);
            border-radius: 5px;
            border: none;
            /* Remove border */
            border-bottom: 1px solid #ccc;
            /* Add bottom border */
            outline: none;
            /* Remove outline */
        }

        /* Style the shopping cart */
        .cart {
            background-color: #f9f9f9;
            padding: 20px;
            overflow-y: auto;
            /* Enable vertical scrollbar */
            max-height: 550px;
            /* Set max height */
        }

        .cart table {
            width: 100%;
            border-collapse: collapse;
        }

        .cart th,
        .cart td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .cart th {
            background-color: #3498db;
            color: white;
        }

        .cart button {
            padding: 8px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .returnCart .list .item img {
            height: 60px;
        }

        .item img {
            width: 70px;
            padding: 8px;
            border-radius: 12px;

        }

        .returnCart .list .item {
            display: grid;
            grid-template-columns: 80px 1fr 30px 70px 40px;
            align-items: center;
            gap: 20px;
            margin-bottom: 7px;
            padding: 5px;
            box-shadow: 0 10px 20px #5555;
            border-radius: 8px;
        }

        .returnCart .list .item .name,
        .returnCart .list .item .returnPrice {
            font-size: 17px;
            font-weight: bold;
        }

        .addButton {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px; /* Khoảng cách giữa nút Add và thông tin sản phẩm */
        }

        /* Định dạng cho filter-bar */
        .filter-bar {
            background-color: #f9f9f9;
            padding: 10px;
        }

        /* Định dạng cho container của filter-bar */
        .filter-bar .container {
            display: flex;
            align-items: center;
        }

        /* Định dạng cho select */
        .filter-bar select {
            margin-right: 10px; /* Khoảng cách giữa các select */
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        /* Định dạng cho nút lọc */
        .filter-bar button {
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #3498db;
            color: white;
            cursor: pointer;
        }

        /* nút add khi thêm sản phẩm vào hoá đơn*/
        .item {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .item img {
            width: 70px;
            padding: 8px;
            border-radius: 12px;
        }

        .info {
            flex: 1;
            overflow: hidden;
        }

        .name, .price {
            max-width: 150px; /* Đặt chiều dài tối đa */
            overflow: hidden;
            text-overflow: ellipsis; /* Xử lý tràn nội dung */
            white-space: nowrap;
        }

        .quantity, .returnPrice {
            width: 60px; /* Đặt chiều rộng cố định */
        }

        .btnAdd {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }


    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body>

<div class="header">
    <div class="search-bar">
        <form action="/ban-tai-quay/search-san-pham" method="get">
            <input type="text" name="name" placeholder="Search...">
            <button type="submit" style="border: none; background: none; cursor: pointer;">
                <img src="path_to_search_icon.png" alt="Search" style="width: 20px; height: 20px;">
            </button>
        </form>

        <div class="tab">

    <div class="search-bar d-flex align-items-center">
        <form action="/ban-tai-quay" method="get" class="d-flex">
            <input type="text" name="name" value="${nameSearch}" class="form-control form-control-sm me-2"
                   placeholder="Tìm kiếm mã, tên, màu">
            <button type="submit" class="btn btn-primary" style="height: 38px; padding: 5px 15px;">
                <span class="bi bi-search" style="font-size: 20px;"></span> <!-- Thêm biểu tượng search -->
                Search
            </button>

        </form>
        <!-- Ô tìm kiếm sản phẩm -->
        <div class="tab ms-3">

            <c:forEach var="o" items="${tabs}" varStatus="loop">
                <button class="tablinks active tab1 btn btn-outline-secondary me-2" id="${o.maHoaDon}"
                        onclick="openTab(event,'${o.maHoaDon}')">${o.maHoaDon}</button>
            </c:forEach>

            <button class="tablinks add btn btn-outline-secondary" onclick="addTab()">+</button>
        </div>
    </div>
</div>


<div class="filter-bar">
    <div class="container">
        <form action="/ban-tai-quay/filter" method="post">
            <select name="chatLieu">
                <option value="">Chọn chất liệu</option>
                <c:forEach var="chatLieuItem" items="${chatLieus}">
                    <option value="${chatLieuItem}" ${chatLieu eq chatLieuItem ? 'selected' : ''}>${chatLieuItem}</option>
                </c:forEach>
            </select>
            <select name="doiTuongSuDung">
                <option value="">Chọn đối tượng sử dụng</option>
                <c:forEach var="doiTuongSuDungItem" items="${doiTuongSuDungs}">
                    <option value="${doiTuongSuDungItem}" ${doiTuongSuDung eq doiTuongSuDungItem ? 'selected' : ''}>${doiTuongSuDungItem}</option>
                </c:forEach>
            </select>
            <select name="mauSac">
                <option value="">Chọn màu sắc</option>
                <c:forEach var="mauSacItem" items="${mauSacs}">
                    <option value="${mauSacItem}" ${mauSac eq mauSacItem ? 'selected' : ''}>${mauSacItem}</option>
                </c:forEach>
            </select>

            <button type="submit">Lọc</button>
        </form>
    </div>
</div>


<!-- Information Panel -->
<div class="container">
    <!-- Left column -->
    <div class="info-panel cart">
        <div class="returnCart">

            <div class="list">
                <c:forEach var="o" items="${listSp}" varStatus="loop">
                    <div class="item">
                        <img src="img/ok.jpg">
                        <div class="info">
                            <div class="name"> ${o.sanPham.tenSanPham} </div>
                            <div class="price"> ${o.mauSac.tenMauSac}</div>
                            <div class="chatLieu"> ${o.sanPham.chatLieu}</div>
                        </div>
                        <div class="quantity"> ${o.soLuong}</div>
                        <div class="returnPrice"> ${o.giaBan} </div>
                        <button class="btnAdd" onclick="addToCart(this)" data-product-id="${o.id}">Add</button>

                    </div>

                </c:forEach>

            </div>
        </div>
    </div>

    <!-- Middle column -->
    <div class="info-panel">
        <div class="returnCart">
            <div class="list gioHangTaiQuay">
                <c:forEach var="o" items="${listGioHang}" varStatus="loop">
                    <div class="item">
                        <img src="img/ok.jpg">
                        <div class="info">
                            <div class="name"> ${o.chiTietSanPham.sanPham.tenSanPham} </div>
                            <div class="price"> ${o.chiTietSanPham.mauSac.tenMauSac}</div>
                        </div>
                        <div class="quantity">
                            <button onclick="decreaseQuantity(this)">-</button>
                                ${o.soLuong}
                            <button onclick="increaseQuantity(this)">+</button>
                        </div>
                        <div class="returnPrice"> ${o.chiTietSanPham.giaBan * o.soLuong} </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>


    <!-- Right column -->
    <div class="info-panel thanh-toan">
        <h2>Thông tin đơn hàng</h2>
        <div class="mb-3">
            <label for="customerName" class="form-label">Tên khách hàng</label>
            <input type="text" class="form-control" id="customerName" placeholder="Nhập tên khách hàng">
        </div>
        <div class="mb-3">
            <label for="phoneNumber" class="form-label">Số điện thoại</label>
            <input type="text" class="form-control" id="phoneNumber" placeholder="Nhập số điện thoại">
        </div>
        <div class="mb-3">
            <label for="totalAmount" class="form-label">Tổng giá trị đơn hàng</label>
            <input type="text" class="form-control" id="totalAmount" placeholder="Nhập tổng giá trị đơn hàng">
        </div>
        <div class="mb-3">
            <label for="discountCode" class="form-label">Chọn mã giảm giá</label>
            <select class="form-select" id="discountCode">
                <option value="">Chọn mã giảm giá</option>
                <option value="code1">Mã giảm giá 1</option>
                <option value="code2">Mã giảm giá 2</option>
                <option value="code3">Mã giảm giá 3</option>
            </select>
        </div>
        <button class="btn btn-primary" onclick="checkout()">Thanh toán</button>
    </div>

</div>

<!-- Đường dẫn đến file JavaScript Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<!-- JavaScript để xử lý chức năng tìm kiếm -->
<script src="${pageContext.request.contextPath}/static/javascript/search-tai-quay.js"></script>


<script>
    var tabActive = "";
    var listDataGioHang;

    function addToCart(button) {
        // Lấy id sản phẩm từ thuộc tính dữ liệu
        var productId = button.getAttribute("data-product-id");

        // Gửi id sản phẩm lên backend thông qua AJAX
        $.ajax({
            url: '/ban-tai-quay/them-gio-hang',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({productId: productId, tabActive: tabActive}),
            success: function (response) {
                // Xử lý phản hồi từ backend nếu cần
                $.ajax({
                    url: '/ban-tai-quay/get-gio-hang',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({maHoaDon: tabActive}), // Gửi maHoaDon của tab
                    success: function (ok) {
                        updateProductList(ok);

                        // Xử lý kết quả trả về (danh sách sản phẩm)
                        console.log("Danh sách sản phẩm của tab " + tabActive + ":", ok);
                        // Cập nhật giao diện người dùng với danh sách sản phẩm mới
                        // listDataGioHang = response;
                    },
                    error: function (error) {
                        console.error("Lỗi khi gửi yêu cầu lấy sản phẩm:", error);
                    }
                });
                console.log("Sản phẩm đã được thêm vào giỏ hàng." + response);

            },
            error: function (error) {
                // Xử lý lỗi nếu có
                console.error("Lỗi khi thêm sản phẩm vào giỏ hàng:", error);
            }
        });


    }

    function openTab(evt, tabName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].style.backgroundColor = "#3498db";
            tablinks[i].style.color = "white";
        }
        var selectedTab = document.getElementById(tabName);
        if (selectedTab) {
            tabActive = tabName; // Lưu trữ id của tab đang chọn
            console.log("Tìm thấy tab có id:", tabName);
            selectedTab.style.display = "block";
            evt.currentTarget.style.backgroundColor = "white";
            evt.currentTarget.style.color = "black";

            // Gửi maHoaDon của tab đang chọn đến máy chủ
            $.ajax({
                url: '/ban-tai-quay/get-gio-hang',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({maHoaDon: tabName}), // Gửi maHoaDon của tab
                success: function (response) {
                    updateProductList(response);
                    +
                        // Xử lý kết quả trả về (danh sách sản phẩm)
                        console.log("Danh sách sản phẩm của tab " + tabName + ":", response);
                    // Cập nhật giao diện người dùng với danh sách sản phẩm mới
                    // listDataGioHang = response;
                },
                error: function (error) {
                    console.error("Lỗi khi gửi yêu cầu lấy sản phẩm:", error);
                }
            });
        } else {
            console.error("Không tìm thấy tab có id:", tabName);
        }
    }

    function updateProductList(products) {
        // Xóa danh sách sản phẩm hiện tại
        // $('.tab button.tablinks').remove();

        $('.gioHangTaiQuay').empty();
        var gioHangTaiQuayElement = document.querySelector('.gioHangTaiQuay');
        gioHangTaiQuayElement.innerHTML = '';

        // Thêm danh sách sản phẩm mới vào giao diện người dùng
        products.forEach(function (product) {
            var productHTML = '<div class="item">' +
                '<img src="ok">' +
                '<div class="info">' +
                '<div class="name">' + product.chiTietSanPham.sanPham.tenSanPham + '</div>' +
                '<div class="price">' + product.chiTietSanPham.giaBan + '</div>' +
                '</div>' +
                '<div class="quantity">' + product.soLuong + '</div>' +
                '<div class="returnPrice">' + product.chiTietSanPham.giaBan * product.soLuong + '</div>' +
                '</div>';
            gioHangTaiQuayElement.insertAdjacentHTML('beforeend', productHTML);
        });
    }


    function addTab() {
        // Lưu trạng thái của tab đang chọn
        var activeTabId = tabActive;
        $.ajax({
            url: '/ban-tai-quay/them-hoa-don',
            type: 'POST',
            contentType: 'application/json',
            success: function (response) {
                $('.tab button.tablinks').remove();
                response.forEach(function (hoaDon) {
                    var newTabHTML = '<button class="tablinks active tab1" id="' + hoaDon.maHoaDon + '" onclick="openTab(event, \'' + hoaDon.maHoaDon + '\')">' + hoaDon.maHoaDon + '</button>';
                    $('.tab').append(newTabHTML);
                });
                var newAddTabs = '<button class="tablinks add" onclick="addTab()">+</button>';
                $('.tab').append(newAddTabs);

                // Khôi phục trạng thái của tab đang chọn sau khi thêm tab mới
                openTab({currentTarget: document.getElementById(activeTabId)}, activeTabId);
            },
            error: function (error) {
                console.error(error);
                console.log("Có lỗi khi thêm tab mới");
            }
        });

    }


    //
    // function openTab(evt, tabName) {
    //     var i, tabcontent, tablinks;
    //
    //     // Ẩn tất cả nội dung của tab
    //     tabcontent = document.getElementsByClassName("tabcontent");
    //     for (i = 0; i < tabcontent.length; i++) {
    //         tabcontent[i].style.display = "none";
    //     }
    //
    //     // Đặt màu xanh cho tất cả các tab
    //     tablinks = document.getElementsByClassName("tablinks");
    //     for (i = 0; i < tablinks.length; i++) {
    //         tablinks[i].style.backgroundColor = "#3498db"; // Màu xanh
    //         tablinks[i].style.color = "white"; // Màu chữ trắng cho tất cả các tab
    //     }
    //
    //     // Hiển thị nội dung của tab được chọn và thêm class "active" cho tab button
    //     var selectedTab = document.getElementById(tabName);
    //     console.log("tabssddangchon " + selectedTab);
    //     if (selectedTab) {
    //         tabActive = tabName;
    //         console.log(" tìm thấy tab có id:", tabName);
    //         selectedTab.style.display = "block";
    //         evt.currentTarget.style.backgroundColor = "white"; // Màu trắng cho tab được chọn
    //         evt.currentTarget.style.color = "black"; // Màu chữ đen cho tab được chọn
    //     } else {
    //         console.error("Không tìm thấy tab có id:", tabName);
    //     }
    //
    //
    // }


</script>

</body>

</html>