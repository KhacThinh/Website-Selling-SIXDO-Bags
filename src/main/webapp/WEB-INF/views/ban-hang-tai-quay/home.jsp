<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header with Search Bar and Tabs</title>
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

    </style>
</head>

<body>

<div class="header">
    <div class="search-bar">
        <input type="text" placeholder="Search...">
        <div class="tab">
            <c:forEach var="o" items="${tabs}" varStatus="loop">
                <button class="tablinks active tab1 " id="${o.maHoaDon}"
                        onclick="openTab(event,'${o.maHoaDon}')">${o.maHoaDon}</button>
            </c:forEach>

            <button class="tablinks add" onclick="addTab()">+</button>
        </div>
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
                        <div class="quantity"> ${o.soLuong}</div>
                        <div class="returnPrice"> ${o.chiTietSanPham.giaBan * o.soLuong} </div>
                    </div>

                </c:forEach>

            </div>
        </div>
    </div>

    <!-- Right column -->
    <div class="info-panel thanh-toan">
        <h2>Thông tin đơn hàng</h2>
        <div>
            <input type="text" placeholder="Tên khách hàng">
            <input type="text" placeholder="Số điện thoại">
        </div>
        <div>
            <input type="text" placeholder="Tổng giá trị đơn hàng">
        </div>
        <div>
            <select name="discountCode" id="discountCode">
                <option value="">Chọn mã giảm giá</option>
                <option value="code1">Mã giảm giá 1</option>
                <option value="code2">Mã giảm giá 2</option>
                <option value="code3">Mã giảm giá 3</option>
            </select>
        </div>
        <button onclick="checkout()">Thanh toán</button>
    </div>
</div>

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