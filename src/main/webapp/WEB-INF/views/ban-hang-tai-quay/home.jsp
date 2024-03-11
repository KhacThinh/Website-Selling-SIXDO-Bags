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
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap');


        body {
            font-family: 'Poppins', sans-serif;
            max-height: 400px;
        }

        .notifications {
            position: fixed;
            top: 60px;
            right: 6px;
            z-index: 10000;

        }

        .toast {
            position: relative;
            padding: 10px;
            color: #fff;
            margin-bottom: 10px;
            width: 400px;
            display: grid;
            grid-template-columns: 70px 1fr 70px;
            border-radius: 5px;
            --color: #0abf30;
            background-image: linear-gradient(to right, #0abf3055, #22242f 30%);
            animation: show 0.3s ease 1 forwards

        }

        .toast i {
            color: var(--color);
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: x-large;
        }

        .toast .title {
            font-size: x-large;
            font-weight: bold;
        }

        .toast span,
        .toast i:nth-child(3) {
            color: #fff;
            opacity: 0.6;
        }

        @keyframes show {
            0% {
                transform: translateX(100%);
            }

            40% {
                transform: translateX(-5%);
            }

            80% {
                transform: translateX(0%);
            }

            100% {
                transform: translateX(-10%);
            }
        }

        .toast::before {
            position: absolute;
            bottom: 0;
            left: 0;
            background-color: var(--color);
            width: 100%;
            height: 3px;
            content: '';
            box-shadow: 0 0 10px var(--color);
            animation: timeOut 3s linear 1 forwards
        }

        @keyframes timeOut {
            to {
                width: 0;
            }
        }

        .toast.error {
            --color: #f24d4c;
            background-image: linear-gradient(to right, #f24d4c55, #22242F 60%);
            z-index: 10000;
        }

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
            height: 621px;

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
            padding: 14px;
            overflow-y: auto;
            /* Enable vertical scrollbar */
            max-height: 621px;
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
            font-size: 14px;
            font-weight: bold;
        }

        .price {
            font-size: 13px;
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

        /* Khi hover vào tab */
        .tab button:hover {
            background-color: #4584c0;
        }

        /* Khi tab active và hover */
        .tab button.active:hover {
            background-color: #4584c0;
        }

        .custom-btn {
            width: 340px;
            height: 51px;
            color: #fff;
            border-radius: 8px;
            padding: 10px 25px;
            font-family: 'Lato', sans-serif;
            font-weight: bold;
            font-size: 18px;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
            7px 7px 20px 0px rgba(0, 0, 0, .1),
            4px 4px 5px 0px rgba(0, 0, 0, .1);
            outline: none;
        }

        .btn-2 {
            background: rgb(22, 9, 240);
            background: linear-gradient(0deg, rgba(22, 9, 240, 1) 0%, rgba(49, 110, 244, 1) 100%);
            border: none;

        }

        .btn-2:before {
            height: 0%;
            width: 2px;
        }

        .btn-2:hover {
            background: rgb(0, 172, 238);
            background: linear-gradient(0deg, rgba(0, 172, 238, 1) 0%, rgba(2, 126, 251, 1) 100%);
        }

        .thanh-toan {
            position: relative;
        }

        .checkout {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
        }

        .cartCustomer {
            overflow-y: auto;
            /* Enable vertical scrollbar */
            max-height: 621px;
        }

        .closeButtonTab {
            float: right; /* Đặt phần tử vào góc phải của button */
            margin-left: 10px; /* Tạo khoảng cách giữa nút và dấu x */
            cursor: pointer; /* Biến con trỏ thành dấu nhấp chuột khi di chuột qua */
            padding: 0px 4px;
            border-radius: 18px;
            font-size: 15px;
        }

        .closeButtonTab:hover {
            background-color: #d8d8da;
        }

    </style>
</head>

<body>

<div class="header">
    <div class="search-bar">

        <form action="/ban-tai-quay" method="get" class="d-flex">
            <input type="text" name="name" value="${nameSearch}" class="form-control form-control-sm me-2"
                   placeholder="Tìm kiếm mã, tên, màu">
            <button type="submit" class="btn btn-primary" style="height: 36px;  padding: 5px 8px; margin-right: 35px">
                Search
            </button>

        </form>
        <div class="tab">
            <c:forEach var="o" items="${tabs}" varStatus="loop">
                <button class="tablinks active tab1" style="padding-right: 8px" id="${o.maHoaDon}"
                        onclick="openTab(event,'${o.maHoaDon}')">
                        ${o.maHoaDon}
                    <span class="closeButtonTab" onclick="closeTabs('${o.maHoaDon}')">x</span>
                </button>
            </c:forEach>

            <button class="tablinks add" onclick="addTab()">+</button>
        </div>
    </div>


</div>


<!-- Information Panel -->

<div class="notifications"></div>

<div class="container">
    <!-- Left column -->
    <div class="info-panel cart">
        <div class="filter-bar" style="z-index: 100 ; display: flex ; margin-bottom: 20px ">
            <form action="/ban-tai-quay/filter" method="post">
                <select name="chatLieu" style="width: 127px ; font-weight: bold ">
                    <option value="">Chọn chất liệu</option>
                    <c:forEach var="chatLieuItem" items="${chatLieus}">
                        <option value="${chatLieuItem}" ${chatLieu eq chatLieuItem ? 'selected' : ''}>${chatLieuItem}</option>
                    </c:forEach>
                </select>
                <select name="doiTuongSuDung" style="width: 190px;font-weight: bold ">
                    <option value="">Chọn đối tượng sử dụng</option>
                    <c:forEach var="doiTuongSuDungItem" items="${doiTuongSuDungs}">
                        <option value="${doiTuongSuDungItem}" ${doiTuongSuDung eq doiTuongSuDungItem ? 'selected' : ''}>${doiTuongSuDungItem}</option>
                    </c:forEach>
                </select>
                <select name="mauSac" style="width: 127px;font-weight: bold ">
                    <option value="">Chọn màu sắc</option>
                    <c:forEach var="mauSacItem" items="${mauSacs}">
                        <option value="${mauSacItem}" ${mauSac eq mauSacItem ? 'selected' : ''}>${mauSacItem}</option>
                    </c:forEach>
                </select>

                <button type="submit" style="height: 25px; padding: 5px 9px ; margin-left: 23px">Lọc</button>
            </form>
        </div>
        <div class="returnCart">

            <div class="list">
                <c:forEach var="o" items="${listSp}" varStatus="loop">
                    <div class="item" style="width: 515px">
                        <span class="idChiTietSanPham" style="display: none">${o.id}</span>
                        <img src="img/ok.jpg">
                        <div class="info">
                            <div class="name"> ${o.sanPham.tenSanPham} </div>
                            <div class="price"> ${o.mauSac.tenMauSac}</div>
                        </div>
                        <div class="quantity"> ${o.soLuong}</div>
                        <div class="returnPrice"> ${o.giaBan} </div>
                        <button class="btnAdd" onclick="addToCart(this,${o.giaBan} )" data-product-id="${o.id}">Add
                        </button>

                    </div>

                </c:forEach>

            </div>
        </div>
    </div>
<%--    xoa-hoa-don--%>
    <!-- Middle column -->
    <div class="info-panel cartCustomer">
        <div class="returnCart">
            <div class="list gioHangTaiQuay">
                <c:forEach var="o" items="${listGioHang}" varStatus="loop">
                    <div class="item">
                        <img src="img/ok.jpg">
                        <div class="info">
                            <div class="name">${o.chiTietSanPham.sanPham.tenSanPham}</div>
                            <div class="price">${o.chiTietSanPham.mauSac.tenMauSac}</div>
                        </div>
                        <div class="quantity">
                            <input type="number" class="quantityInput" value="${o.soLuong}"
                                   min="1">
                        </div>
                        <div class="returnPriceCart">${o.chiTietSanPham.giaBan * o.soLuong}</div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>


    <!-- Right column -->
    <div class="info-panel thanh-toan">
        <h2>Thông tin đơn hàng</h2>
        <div>
            <input type="text" id="tenKhachHang" placeholder="Tên khách hàng">
            <input type="text" id="soDienThoai" placeholder="Số điện thoại">
        </div>
        <div>
            <p>Tổng Tiền Hàng : <span id="totalOrder" class="total_order"></span></p>
        </div>
        <div>
            <select name="discountCode" id="discountCode">
                <option value="">Chọn mã giảm giá</option>
                <option value="code1">Mã giảm giá 1</option>
                <option value="code2">Mã giảm giá 2</option>
                <option value="code3">Mã giảm giá 3</option>
            </select>
        </div>
        <button class="custom-btn btn-2 checkout" onclick="checkout()">THANH TOÁN</button>
    </div>
</div>

<script>
    var tabActive = "";
    var listDataGioHang;



    function closeTabs(idTabs) {
        var confirmation = confirm("Bạn có chắc chắn muốn xóa hóa đơn này?");
        if (confirmation) {
            console.log("idhoadonnnnnnnnnn " + idTabs);
            $.ajax({
                url: '/ban-tai-quay/xoa-hoa-don',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({maHoaDon: idTabs}), // Gửi maHoaDon của tab
                success: function (response) {
                    tabActive = "";
                    $('.gioHangTaiQuay').empty();
                    $('.tab button.tablinks').remove();
                    response.forEach(function (hoaDon) {
                        var temp = hoaDon.maHoaDon;
                        var newTabHTML = '<button class="tablinks active tab1"  style="padding-right: 8px" id="' + hoaDon.maHoaDon + '" onclick="openTab(event, \'' + hoaDon.maHoaDon + '\')">' + hoaDon.maHoaDon + '' +
                            '<span class="closeButtonTab" onclick="closeTabs(\'' + temp + '\')">x</span>';
                        '</button>';
                        $('.tab').append(newTabHTML);
                    });
                    var newAddTabs = '<button class="tablinks add" onclick="addTab()">+</button>';
                    $('.tab').append(newAddTabs);
                },
                error: function (error) {
                    console.error("Lỗi khi xóa hóa đơn:", error);
                }
            });
        }
    }

    function updateSoLuong(id, soLuong, giaBan, soLuongSanPhamKho) {
        var idTemp = id;
        var updateGiaSanPham = document.querySelector('.returnPriceCart' + idTemp);

        if (soLuong > soLuongSanPhamKho) {
            updateGiaSanPham.textContent = giaBan;
            updateTotalPrice();

            errorAdd('Số lượng sản phẩm không đủ');

            $('.quantityInput').val(1);
            return;
        } else {
            $.ajax({
                url: '/ban-tai-quay/update-so-luong-san-pham',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    maHoaDon: tabActive,
                    idChiTietSanPham: id,
                    soLuong: soLuong,
                    giaSanPham: giaBan * soLuong
                }),

                success: function (ok) {
                    let sum = giaBan * soLuong;
                    updateGiaSanPham.textContent = sum;
                    var sumTotal = document.querySelector('.total_order');
                    updateTotalPrice();
                },
                error: function (error) {
                    console.error("Lỗi khi gửi yêu cầu lấy sản phẩm:", error);
                }
            });
        }
    }

    function addToCart(button, giaBan) {
        // Lấy id sản phẩm từ thuộc tính dữ liệu
        var productId = button.getAttribute("data-product-id");
        if (tabActive == "") {
            errorAdd('Vui lòng chọn hóa đơn trước');
        } else {

            // Gửi id sản phẩm lên backend thông qua AJAX
            $.ajax({
                url: '/ban-tai-quay/them-gio-hang',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    productId: productId,
                    tabActive: tabActive,
                    giaBan: giaBan
                }),
                success: function (response) {
                    // Xử lý phản hồi từ backend nếu cần
                    $.ajax({
                        url: '/ban-tai-quay/get-gio-hang',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({maHoaDon: tabActive}), // Gửi maHoaDon của tab
                        success: function (ok) {
                            updateProductList(ok);
                            updateTotalPrice();

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
                    updateTotalPrice();
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
                '<div class="price">' + product.chiTietSanPham.mauSac.tenMauSac + '</div>' +
                '</div>' +
                '<div class="quantity">' +
                '<input type="number" style="width: 35px ; border: none ; font-size: 15px;background-color: #f9f9f9" class="quantityInput"  onchange="updateSoLuong(' + product.chiTietSanPham.id + ',this.value,' + product.chiTietSanPham.giaBan + ',' + product.chiTietSanPham.soLuong + ')" value="' + product.soLuong + '" min="1">' +
                '</div>' +

                '<div class="returnPriceCart returnPriceCart' + product.chiTietSanPham.id + '">' + product.chiTietSanPham.giaBan * product.soLuong + '</div>' +
                '</div>';
            gioHangTaiQuayElement.insertAdjacentHTML('beforeend', productHTML);
        });

    }


    function addTab() {
        var tabs = document.querySelectorAll('.tablinks');
        if (tabs.length > 5) {
            errorAdd('Tối đa 5 hóa đơn chờ');
            return;
        } else {
            // Lưu trạng thái của tab đang chọn
            var activeTabId = tabActive;
            $.ajax({
                url: '/ban-tai-quay/them-hoa-don',
                type: 'POST',
                contentType: 'application/json',
                success: function (response) {
                    $('.tab button.tablinks').remove();
                    response.forEach(function (hoaDon) {
                        var temp = hoaDon.maHoaDon;
                        var newTabHTML = '<button class="tablinks active tab1"  style="padding-right: 8px" id="' + hoaDon.maHoaDon + '" onclick="openTab(event, \'' + hoaDon.maHoaDon + '\')">' + hoaDon.maHoaDon + '' +
                            '<span class="closeButtonTab" onclick="closeTabs(\'' + temp + '\')">x</span>';
                        '</button>';
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
    }





    let notifications = document.querySelector('.notifications');
    let error = document.getElementById('error');


    function errorAdd(errorMessage) {
        let newToast = document.createElement('div');
        newToast.innerHTML = `
            <div class="toast error">
                <i class="fa-solid fa-circle-exclamation"></i>
                <div class="content">
                    <div class="title">Error</div>
                    <span style="color: white">` + errorMessage + ` </span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>`;
        notifications.appendChild(newToast);
        newToast.timeOut = setTimeout(
            () => newToast.remove(), 3000
        )
    }

    function successMessage(successMessage) {
        let newToast = document.createElement('div');
        newToast.innerHTML = `
            <div class="toast success">
                <i class="fa-solid fa-circle-check"></i>
                <div class="content">
                    <div class="title">Success</div>
                    <span style="color: white">` + successMessage + ` </span>
                </div>
                <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
            </div>`;
        notifications.appendChild(newToast);
        newToast.timeOut = setTimeout(
            () => newToast.remove(), 3000
        )
    }


    function updateTotalPrice() {
        var totalPrice = 0;
        var returnPrices = document.querySelectorAll('.returnPriceCart');

        returnPrices.forEach(function (returnPriceElement) {
            totalPrice += parseFloat(returnPriceElement.textContent);
        });

        var totalPriceInput = document.querySelector('.total_order');
        totalPriceInput.innerHTML = formatCurrency(totalPrice);
        return totalPrice;
    }

    function formatCurrency(number) {
        return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(number);
    }


    function checkout() {
        var tenKhachHang = document.querySelector(".thanh-toan input:nth-child(1)").value;
        var soDienThoai = document.querySelector(".thanh-toan input:nth-child(2)").value;

        var tongGiaTri = updateTotalPrice();
        console.log("tong " + tongGiaTri)
        if (tabActive == "") {
            errorAdd("Chọn Hóa Đơn Để Thanh Toán");
            return;
        } else {
            $.ajax({
                url: '/ban-tai-quay/thanh-toan',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    tenKhachHang: tenKhachHang,
                    soDienThoai: soDienThoai,
                    tongGiaTri: tongGiaTri,
                    maHoaDon: tabActive
                }),
                success: function (response) {
                    var tenKhachHangInput = document.getElementById('tenKhachHang');
                    var soDienThoaiInput = document.getElementById('soDienThoai');
                    var totalOrderSpan = document.getElementById('totalOrder');
                    //////////
                    tenKhachHangInput.value = '';
                    soDienThoaiInput.value = '';
                    totalOrderSpan.textContent = '0';
                    $('.gioHangTaiQuay').empty();
                    $('.tab button.tablinks').remove();
                    response.forEach(function (hoaDon) {
                        var temp = hoaDon.maHoaDon;
                        var newTabHTML = '<button class="tablinks active tab1"  style="padding-right: 8px" id="' + hoaDon.maHoaDon + '" onclick="openTab(event, \'' + hoaDon.maHoaDon + '\')">' + hoaDon.maHoaDon + '' +
                            '<span class="closeButtonTab" onclick="closeTabs(\'' + temp + '\')">x</span>';
                        '</button>';
                        $('.tab').append(newTabHTML);

                    });
                    var newAddTabs = '<button class="tablinks add" onclick="addTab()">+</button>';
                    $('.tab').append(newAddTabs);

                    successMessage('Thanh Toán Thành Công');
                    console.log("Đã thanh toán thành công. Thông tin đơn hàng:", response);
                },
                error: function (error) {
                    console.error("Lỗi khi thanh toán:", error);
                }
            });
        }
    }


</script>

</body>

</html>