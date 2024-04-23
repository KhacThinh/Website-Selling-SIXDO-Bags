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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">


    <style>
        /* Style the header */

        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            max-height: 400px;
        }
        .loader {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            display: inline-block;
            border-top: 4px solid #413aa7;
            border-right: 4px solid transparent;
            box-sizing: border-box;
            animation: rotation 0.5s linear infinite;
            justify-content: center;
            text-align: center;
        }
        .loader::after {
            content: '';
            box-sizing: border-box;
            position: absolute;
            left: 0;
            top: 0;
            width: 48px;
            height: 48px;
            border-radius: 50%;
            border-left: 4px solid #FF3D00;
            border-bottom: 4px solid transparent;
            animation: rotation 0.25s linear infinite reverse;
        }
        @keyframes rotation {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }
        .center-content {
            background-image: url("/src/main/resources/static/images/icon/cost.png");
            background-size: cover; /* Hiển thị hình ảnh với kích thước bằng với kích thước của class "center-content" */
            background-position: center; /* Canh giữa hình ảnh */
            padding: 20px; /* Thêm padding để nội dung không sát vào cạnh */
            text-align: center; /* Căn giữa nội dung */
            color: black; /* Màu chữ */
        }


        .alert {
            margin-bottom: 20px;
        }

        #searchResults {
            position: absolute;
            padding: 10px;
            z-index: 999; /* Đảm bảo form hiển thị trên các phần tử khác */
        }

        .cartCustomer {
            position: relative; /* Đảm bảo vị trí tương đối của form cartCustomer */
            /* Thêm các thuộc tính CSS khác tùy thuộc vào thiết kế của bạn */
        }


        #resultsTable {
            width: 100%;
            border-collapse: collapse;
            border: 2px solid #ddd; /* Kẻ khung cho bảng */
        }


        #resultsTable th,
        #resultsTable td {
            padding: 10px;
            text-align: left;
        }


        #resultsTable th {
            background-color: #f2f2f2;
            font-weight: bold;
        }


        #resultsTable tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        #resultsTable tbody tr:hover {
            background-color: #e5e5e5;
        }

        #resultsTable tbody tr:last-child td {
            border-bottom: none; /* Loại bỏ đường kẻ dưới của hàng cuối cùng */
        }

        #resultsTable tbody tr:first-child td,
        #resultsTable tbody tr:last-child td {
            border-top: none; /* Loại bỏ đường kẻ trên của hàng đầu tiên và cuối cùng */
        }

        #resultsTable tbody tr:not(:first-child) td {
            border-top: 2px solid #ddd; /* Kẻ đường ngang giữa các hàng trừ hàng đầu tiên */
        }

        #resultsTable tbody tr:not(:last-child) td {
            border-bottom: 2px solid #ddd; /* Kẻ đường ngang giữa các hàng trừ hàng cuối cùng */
        }

        .codeAndColor {
            display: flex;
            flex-direction: column;
        }

        .code,
        .color {
            padding: 5px;
        }


        .position-relative {
            position: relative;
        }

        .clear-input-icon {
            position: absolute;
            right: 8px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            opacity: 0.5;
        }

        .clear-input-icon:hover {
            opacity: 0.7;
        }

        .clear-input-icon:active {
            opacity: 1;
        }


        .returnCart {
            margin-top: 20px;
        }

        .returnCart table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 8px; /* Khoảng cách giữa các hàng */
        }

        .returnCart th, .returnCart td {
            padding: 12px;
            text-align: left;
            border: none; /* Loại bỏ viền cho các ô */
        }

        .returnCart th {
            background-color: #f5f5f5;
            color: #333;
            font-size: 16px; /* Kích thước chữ tiêu đề */
        }

        .returnCart tbody tr {
            background-color: #fff; /* Màu nền cho các hàng */
        }

        .returnCart tbody tr:nth-child(even) {
            background-color: #f9f9f9; /* Màu nền cho các hàng chẵn */
        }

        .returnCart tbody tr:hover {
            background-color: #f0f0f0; /* Màu nền khi di chuột qua */
        }

        .returnCart tbody td {
            vertical-align: middle;
            font-size: 14px; /* Kích thước chữ trong các ô */
        }

        .returnCart tbody tr:last-child td {
            border-bottom: none; /* Loại bỏ viền dưới cho hàng cuối cùng */
        }

        .close {
            position: absolute;
            top: 2px;
            right: 10px;
            font-size: 24px;
            cursor: pointer;
        }

        /* Phần tiêu đề "Giỏ Hàng" */
        .gioHang h2 {
            font-size: 36px; /* Kích thước chữ lớn hơn */
            color: #333; /* Màu chữ */
            font-weight: bold; /* Chữ đậm */
            text-transform: uppercase; /* Chữ in hoa */
            margin-bottom: 20px; /* Khoảng cách dưới */
            text-align: center; /* Canh giữa */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* Hiệu ứng đổ bóng */
        }

        /* Nút "Tìm Kiếm" */
        .buttonTimKiemSp {
            text-align: right;
            margin-bottom: 20px;
        }

        .buttonTimKiemSp button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .buttonTimKiemSp button:hover {
            background-color: #0056b3;
        }

        /* Danh sách các mục trong giỏ hàng */
        /* Style cho container chứa danh sách sản phẩm */
        /* Style cho mỗi mục sản phẩm */
        .item {
            display: flex;
            flex-direction: row; /* Đảm bảo các phần tử con nằm hàng ngang */
            align-items: center; /* Căn phần tử con theo chiều dọc */
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;


            justify-content: space-between; /* Các phần tử được căn đều với khoảng cách giữa chúng */
            padding: 10px;
            align-items: center;
            gap: 10px; /* Khoảng cách giữa các phần tử */
            padding: 10px; /* Khoảng cách bên trong */
        }


        /* Style cho hình ảnh sản phẩm */
        .item img {
            width: 100px; /* Chiều rộng của hình ảnh */
            height: auto;
            border-radius: 5px;
            margin-right: 20px; /* Khoảng cách giữa hình ảnh và thông tin sản phẩm */
        }

        /* Style cho thông tin sản phẩm */
        .info {
            flex-grow: 1; /* Đảm bảo thông tin sản phẩm mở rộng để điền vào phần còn trống */
        }

        /* Style cho tên sản phẩm */
        .name {
            font-weight: bold;
        }

        /* Style cho giá sản phẩm */
        .price {
            color: black;
            font-size: 14px;
        }

        /* Style cho container chứa input số lượng */
        .quantity {
            flex: 1;
            display: inline-block;
            position: relative;
        }

        /* Style cho input số lượng */
        .quantityInput {
            width: 50px;
            padding: 10px;
            border: none;
            border-bottom: 2px solid #ff0000; /* Dấu gạch chân màu đỏ */
            text-align: center;
            font-size: 16px;
            outline: none;

            box-shadow: 0 0.5px 0.5px rgba(260, 0, 0, 1); /* Box-shadow cho viền màu đỏ */
            transition: border-color 0.3s ease, box-shadow 0.3s ease; /* Hiệu ứng khi focus */
            position: relative; /* Đảm bảo độ z-index */
        }

        .returnPriceCart {
            font-family: Arial, sans-serif; /* Thay thế "Arial" bằng bất kỳ phông chữ nào bạn muốn sử dụng */
            font-size: 14px; /* Kích thước phông chữ */
            font-weight: bold; /* Độ đậm của phông chữ */
            color: #333; /* Màu chữ */
            /* Thêm bất kỳ quy tắc CSS nào khác mà bạn muốn áp dụng */
        }


        /* Style cho nút xóa */
        .deleteButton {
            background-color: transparent;
            border: none;
            cursor: pointer;
            outline: none;
        }

        /* Style cho giá trị trả lại trong giỏ hàng */
        .returnPriceCart {
            margin-top: 10px;
            font-weight: bold;
            color: red;
        }


        .info-panel.cartCustomer {
            display: flex;
            flex-direction: column; /* Xếp theo chiều dọc */
            height: 92vh; /* Chiều cao 100% của màn hình */
        }

        .gioHang {
            flex: 1; /* Phần này sẽ mở rộng để lấp đầy khoảng trống còn lại */
            overflow-y: auto; /* Cho phép cuộn nếu nội dung vượt quá chiều cao */
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
            margin-left: 20px;
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
            grid-template-columns: 3fr 1fr;
            /* 2/5, 1/5, 1/5 */
            gap: 20px;
            margin-top: 25px;
            /* Height of the header */
            /*height: 621px;*/
        }

        .info-panel {
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 8px;
            position: relative;
            height: 639px;
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
            margin-left: 10px;
            /* Khoảng cách giữa nút Add và thông tin sản phẩm */
        }

        #resultsTable tbody tr {
            background-color: #ffffff; /* Màu nền cho các hàng trong bảng */
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
            box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px 0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
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
            width: 450px;
        }

        .checkout {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
        }

        .cartCustomer {
            overflow-y: auto;

        }

        .closeButtonTab {
            float: right;
            /* Đặt phần tử vào góc phải của button */
            margin-left: 10px;
            /* Tạo khoảng cách giữa nút và dấu x */
            cursor: pointer;
            /* Biến con trỏ thành dấu nhấp chuột khi di chuột qua */
            padding: 0px 4px;
            border-radius: 18px;
            font-size: 15px;
        }

        .closeButtonTab:hover {
            /*background-color: #d8d8da;*/
            color: #242526;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        /* modal tìm kiếm */

        .modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 80%;
            /* Adjust the width as needed */
            max-width: 800px;
            /* Set a maximum width if necessary */
            height: 80%;
            /* Adjust the height as needed */
            max-height: 600px;
            /* Set a maximum height if necessary */
            overflow-y: auto;
            /* Enable vertical scrolling if content exceeds the height */
            background-color: #fff;
            /* Set the background color */
            padding: 20px;
            /* Add padding for better appearance */
            border-radius: 8px;
            /* Add rounded corners */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            /* Add a subtle shadow */
            z-index: 1000;


        /* Set a high z-index to overlay other elements *
    }
    /* Style for the overlay */

        /* Style for the close button in the modal */
        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
        }

        /* Style for the search form */
        .search-form {
            margin-top: 20px;
            text-align: center;
        }

        .search-form input[type="text"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .search-form button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        /* Style for the filter options */
        .filter-options {
            margin-top: 20px;
            text-align: center;
        }

        /* Style for the table */
        .data-table {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        .data-table th,
        .data-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .data-table th {
            background-color: #4CAF50;
            color: white;
        }

        /* Flex Container for Filter Bar */
        .filter-bar {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        /* Filter Form */
        .filter-form {
            display: flex;
            align-items: center;
        }

        /* Style for Filter Selects */
        .filter-group {
            margin-right: 10px;
        }

        .filter-select {
            padding: 8px;
            width: 200px; /* Adjust the width as needed */
        }

        .filter-btn {
            padding: 8px 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .filter-btn:hover {
            background-color: #45a049;
        }


        .buttonTimKiem {
            text-align: justify; /* Canh lề nút tìm kiếm */
            margin-top: 70px; /* Khoảng cách từ đỉnh trang */
        }

        .info-panel cartCustomer {
            position: fixed; /* Đặt vị trí cố định */
            top: 0; /* Hiển thị ở đỉnh trang */
            left: 0; /* Hiển thị ở bên trái của trang */
            width: 100%; /* Chiều rộng 100% */
            background-color: #f2f2f2; /* Màu nền của header */
            padding: 10px; /* Padding tùy chỉnh */
            z-index: 1000; /* Đảm bảo hiển thị trên cùng */

        }


        .btnAdd {
            background: none;
            border: none;
            padding: 0;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .btnAdd svg {
            width: 24px;
            height: 24px;
            fill: #007bff; /* Màu của biểu tượng */
        }

        .btnAdd:hover svg {
            fill: #0056b3; /* Màu khi di chuột qua */
        }

        #searchResults {
            position: absolute;
            background-color: white;
            border: 1px solid #ccc;
            padding: 10px;
            z-index: 999; /* Đảm bảo form hiển thị trên các phần tử khác */
        }

        .productInCart {
            /* Thêm bóng nhẹ với độ mờ là 0.2 */
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            /* Đảm bảo nền của sản phẩm là màu trắng */
            background-color: white;
            /* Bo tròn viền của sản phẩm */
            border-radius: 5px;
            /* Căn lề và padding cho sản phẩm */
            margin: 30px 0;
            padding: 20px;

        }

        .cartCustomer {
            position: relative; /* Đảm bảo vị trí tương đối của form cartCustomer */
            /* Thêm các thuộc tính CSS khác tùy thuộc vào thiết kế của bạn */
        }

        #searchInput {
            border-radius: 5px; /* Điều chỉnh giá trị này để thay đổi độ cong */
        }


    </style>
</head>
<body>
<div id="loading-spinner" class="spinner-container loader" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 100">
    <div class="spinner"></div>
</div>
<div class="header">
    <div class="search-bar">

        <div class="position-relative">
            <input type="text" id="searchInput" class="form-control form-control-sm me-2"
                   placeholder="Tìm kiếm mã, tên, màu">
            <span class="clear-input-icon">&#10006;</span>

        </div>

        <%-- Search sản phẩm chi tiết--%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                // Xóa dữ liệu khi click vào icon
                $('.clear-input-icon').on('click', function () {
                    $('#searchInput').val(''); // Xóa dữ liệu trong input
                    $('#resultsTable tbody').empty(); // Xóa cả dữ liệu trong ô hiển thị
                });

                $('#searchInput').keyup(function () {
                    var query = $(this).val();
                    if (query === '') {
                        $('#resultsTable tbody').empty();
                        return;
                    }
                    $.ajax({
                        url: '/ban-tai-quay/searchModal',
                        method: 'POST',
                        data: {keyword: query},
                        success: function (response) {
                            // Xóa nội dung kết quả cũ
                            $('#resultsTable tbody').empty();
                            if (response.length === 0) {
                                var noResultRow = "<tr id='noResultRow' style='font-size: 16px; color: #333;'>";
                                noResultRow += "<td colspan='4'>Sản phẩm bạn muốn tìm không có...</td>";
                                noResultRow += "</tr>";
                                $('#resultsTable tbody').append(noResultRow);
                            } else {
                                // Thêm hàng tiêu đề
                                var headerRow = "<tr><th>Tên sản phẩm</th><th>Mã sản phẩm</th><th>Số lượng</th><th>Giá</th></tr>";
                                $("#resultsTable").append(headerRow);
                                $.each(response, function (index, item) {
                                    var productName = item.sanPham.tenSanPham;
                                    var maxLength = 26; // Số kí tự tối đa hiển thị

                                    // Kiểm tra độ dài của tên sản phẩm
                                    if (productName.length > maxLength) {
                                        productName = productName.substring(0, maxLength) + '...';
                                    }

                                    var formattedPrice = item.giaBan.toLocaleString('vi-VN', {style: 'decimal'}); // Định dạng giá tiền

                                    var row = "<tr class='searchSp' onclick='addToCart(this, " + item.giaBan + ")' data-product-id='" + item.id + "' data-product-price='" + item.giaBan + "'>";
                                    row += "<td>";
                                    row += "<div class='codeAndColor'>";
                                    row += "<div class='code'>" + productName + "</div>";
                                    row += "<div class='color'>" + item.mauSac.tenMauSac + "</div>";
                                    row += "</div>";
                                    row += "</td>";
                                    row += "<td title='" + item.sanPham.tenSanPham + "'>" + item.ma + "</td>"; // Hiển thị tên sản phẩm với title
                                    row += "<td>" + item.soLuong + "</td>";
                                    row += "<td>" + formattedPrice + "</td>"; // Sử dụng giá tiền đã định dạng
                                    row += "</tr>";
                                    $("#resultsTable").append(row);

                                });

                            }

                        }
                    });

                });


                $('#resultsTable').click(function (event) {
                    formClicked = true;
                    event.stopPropagation(); // Cái này dường như là lỗi chính tả, có lẽ bạn muốn xoá nó đi
                });

            });
        </script>


        <!-- Nút quét mã -->
        <button class="scan-button" onclick="toggleQRContainer()" style="background: transparent; border: none;">
            <i class="bi bi-qr-code-scan" style="font-size: 24px; color: white;"></i>
        </button>

        <%--        thêm sản phẩm--%>
        <button style="margin-right: 10px" onclick="openModal()"><i class="bi bi-funnel-fill"></i> Thêm Sản Phẩm
        </button>

        <!-- Tạo hoá đơn -->
        <div class="tab">
            <c:forEach var="o" items="${tabs}" varStatus="loop">
                <button class="tablinks active tab1" style="padding-right: 8px" id="${o.maHoaDon}"
                        onclick="openTab(event,'${o.maHoaDon}')">
                        ${o.maHoaDon}
                    <span onclick="closeTabs('${o.maHoaDon}')"><i class="bi bi-x-circle closeButtonTab"></i></span>
                </button>
            </c:forEach>

            <button class="tablinks add" onclick="addTab()">+</button>

        </div>

    </div>


</div>


<!-- Information Panel -->
<div class="notifications">
</div>

<!--  Quét Mã QR  -->
<div class="container" id="qrContainer"
     style="display: none; position: fixed; top: 20px; left: 20px; z-index: 1000; background-color: #fff; padding: 20px; border-radius: 19px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);">
    <button type="button" onclick="toggleQRContainer()" style="background: transparent; border: none;">
        <i class="bi bi-x-circle" style="font-size: 24px; color: #000;"></i>
    </button>

    <div class="section">
        <h1>Scan QR Codes</h1>
        <div id="my-qr-reader"></div>
        <p id="scanned-data"></p>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/html5-qrcode"></script>
<script>
    function toggleQRContainer() {
        var qrContainer = document.getElementById("qrContainer");
        qrContainer.style.display = (qrContainer.style.display === "block") ? "none" : "block";
    }

    function domReady(fn) {
        if (document.readyState === "complete" || document.readyState === "interactive") {
            setTimeout(fn, 1000);
        } else {
            document.addEventListener("DOMContentLoaded", fn);
        }
    }

    domReady(function () {
        function onScanSuccess(qrData) {
            document.getElementById("scanned-data").innerHTML = "Scanned QR Data: " + qrData;
            addToCartQR(qrData);
        }

        function addToCartQR(maSanPham) {
            if (tabActive === "") {
                Swal.fire({
                    title: "Giỏ hàng chưa được tạo?",
                    text: "Vui lòng chọn giỏ hàng trước thì mới có thể thêm sản phẩm vào giỏ hàng.",
                    icon: "error",
                });
                return;
            }

            $.ajax({
                url: '/chi-tiet-san-pham/ctsp',
                type: 'GET',
                success: function (response) {
                    if (response) {
                        var idSanPham = 0;
                        var foundProduct = false;

                        response.forEach(function (product) {

                            if (maSanPham === product.ma) {
                                idSanPham = product.id;
                                foundProduct = true;
                            }
                        });

                        if (foundProduct) {
                            if (checkExistingProductQR(idSanPham)) {
                                Swal.fire({
                                    icon: "error",
                                    title: "Oops...",
                                    text: "Sản phẩm này đã có trong giỏ hàng!"
                                });
                                return;
                            }

                            $.ajax({
                                url: '/ban-tai-quay/them-gio-hang-qr',
                                type: 'POST',
                                contentType: 'application/json',
                                data: JSON.stringify({
                                    maSanPham: maSanPham,
                                    tabActive: tabActive,
                                }),
                                success: function (response) {
                                    $.ajax({
                                        url: '/ban-tai-quay/get-gio-hang',
                                        type: 'POST',
                                        contentType: 'application/json',
                                        data: JSON.stringify({
                                            maHoaDon: tabActive
                                        }),
                                        success: function (ok) {
                                            updateProductList(ok);
                                            updateTotalPrice();
                                            fillSoLuong();
                                            console.log("Danh sách sản phẩm của tab " + tabActive + ":", ok);
                                        },
                                        error: function (error) {
                                            console.error("Lỗi khi gửi yêu cầu lấy sản phẩm:", error);
                                        }
                                    });
                                    console.log("Sản phẩm đã được thêm vào giỏ hàng." + response);
                                },
                                error: function (error) {
                                    console.error("Lỗi khi thêm sản phẩm vào giỏ hàng:", error);
                                }
                            });
                        } else {
                            Swal.fire({
                                icon: "error",
                                title: "Oops...",
                                text: "Không tìm thấy sản phẩm."
                            });
                        }
                    } else {
                        console.error("Không có dữ liệu phản hồi.");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error("Error:", textStatus, errorThrown);
                }
            });
        }

        let htmlScanner = new Html5QrcodeScanner("my-qr-reader", {fps: 10, qrbos: 250});
        htmlScanner.render(onScanSuccess);
    });

    function checkExistingProductQR(productId) {
        var listItemsArray = Array.from(document.querySelectorAll('.item'));
        for (var i = 0; i < listItemsArray.length; i++) {
            var idCtspElement = listItemsArray[i].querySelector('.idCtsp');
            var idCtspValue = idCtspElement.textContent;
            if (idCtspValue === productId.toString()) {
                return true;
            }
        }
        return false;
    }

</script>


<div class="container">
    <!-- Middle column -->
    <div class="info-panel cartCustomer">
        <div id="searchResults" class="position-absolute start-0">
            <table id="resultsTable" class="table">
                <tbody>
                <!-- Bảng kết quả sẽ được cập nhật ở đây -->
                </tbody>
            </table>
        </div>


        <!-- Modal -->
        <div class="modal" id="myModal">
            <div class="modal-content">
                <span class="close"></span>
                <h2>Tìm Kiếm Sản Phẩm</h2>

                <div class="search-form" id="searchForm">
                    <input type="text" name="name" id="searchMaTenMau" value="${nameSearch}" class="form-control"
                           placeholder="Tìm kiếm mã, tên, màu">
                    <button type="button" id="searchButton" class="btn btn-primary">Tìm Kiếm</button>
                </div>

                <div class="filter-bar">
                    <form action="/ban-tai-quay/filter" method="post" class="filter-form">
                        <div class="filter-group">
                            <select name="chatLieu" class="filter-select">
                                <option value="">Chọn chất liệu</option>
                                <c:forEach var="chatLieuItem" items="${chatLieus}">
                                    <option value="${chatLieuItem}" ${chatLieu eq chatLieuItem ? 'selected' : ''}>${chatLieuItem}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="filter-group">
                            <select name="doiTuongSuDung" class="filter-select">
                                <option value="">Chọn đối tượng sử dụng</option>
                                <c:forEach var="doiTuongSuDungItem" items="${doiTuongSuDungs}">
                                    <option value="${doiTuongSuDungItem}" ${doiTuongSuDung eq doiTuongSuDungItem ? 'selected' : ''}>${doiTuongSuDungItem}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="filter-group">
                            <select name="mauSac" class="filter-select">
                                <option value="">Chọn màu sắc</option>
                                <c:forEach var="mauSacItem" items="${mauSacs}">
                                    <option value="${mauSacItem}" ${mauSac eq mauSacItem ? 'selected' : ''}>${mauSacItem}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="filter-btn">Lọc</button>
                    </form>
                </div>

                <div class="returnCart">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Màu Sắc</th>
                            <th>Số lượng</th>
                            <th>Giá Bán</th>
                        </tr>
                        </thead>
                        <tbody id="cartBody">
                        <!-- Dữ liệu từ Ajax sẽ được hiển thị ở đây -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


        <!-- Overlay -->
        <div id="overlay" class="overlay"></div>

        <script>
            // JavaScript functions to open and close the modal
            function openModal() {
                document.getElementById('myModal').style.display = 'block';
                document.getElementById('overlay').style.display = 'block';
            }


            function closeModal() {
                document.getElementById('myModal').style.display = 'none';
                document.getElementById('overlay').style.display = 'none';
            }

            // Close the modal if the overlay is clicked
            document.getElementById('overlay').addEventListener('click', closeModal);

            // Function to handle the search form submission
            function submitSearch() {
                // Add your search logic here
                // For now, you can simply alert the search query
                var searchQuery = document.querySelector('.search-form input').value;
                alert('Search query: ' + searchQuery);
            }

            // Function to handle filter application
            function applyFilters() {
//              Add your filter logic here
//              For now, you can simply alert the selected category
                var selectedCategory = document.getElementById('filterCategory').value;
                alert('Filter applied for category: ' + selectedCategory);
            }
        </script>

        <!--Giỏ Hàng-->
        <div class="gioHang">
            <div class="list gioHangTaiQuay" style="margin-top: 30px">
                <div class="center-content"
                     style="text-align: center; margin: 20px; padding: 10px; background-color: #f7f7f7; border-radius: 5px;">
                    <img src="../static/images/icon/cart.png" alt="Cost Icon"
                         style="width: 300px; height: 300px; margin-bottom: 20px; margin-top: 20px">
                    <div class="alert alert-warning" role="alert"
                         style="background-color: #F5F5F5; color: #696969; padding: 10px; margin-bottom: 10px; font-size: 18px; border-radius: 5px;">
                        Bạn chưa tạo giỏ hàng, tạo ngày thôi nào!
                    </div>
                    <button class="btn btn-primary"
                            style="background-color: transparent; color: #666666; padding: 15px 30px; border: solid 1px #ccc; border-radius: 10px; cursor: pointer; font-size: 16px;"
                            onmouseover="this.style.backgroundColor='#ccc'"
                            onmouseout="this.style.backgroundColor='transparent'" onclick="addTab()">Thêm giỏ hàng ngay
                    </button>
                </div>
            </div>
        </div>
    </div>


    <!-- Right column -->
    <div class="info-panel thanh-toan">
        <p>Tên nhân viên : ${nhanVien.hoTen}</p>
        <p style="font-size: 19px; font-weight: bold; margin: 30px 0px 10px 1px;background-color: #d3ead9 ; padding: 5px;border-radius: 5px ">
            Thông Tin Đơn Hàng</p>        <div>
            <input type="text" id="soDienThoai" placeholder="Số điện thoại">
            <span id="soDienThoaiError" class="error" style="color: red;font-size: small"></span><br>
            <input type="text" id="tenKhachHang" placeholder="Tên khách hàng">
            <span id="tenKhachHangError" style="color: red;font-size: small" class="error"></span><br>
            <button id="addCustomerBtn">Thêm</button>
        </div>

        <style>
            #addCustomerBtn {
                background-color: #007bff; /* Màu nền */
                color: #fff; /* Màu chữ */
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                margin-bottom: 15px;
            }

            #addCustomerBtn:hover {
                background-color: #0056b3; /* Màu nền khi di chuột qua */
            }
        </style>

        <%--         validate and add KH--%>
        <script>
            $(document).ready(function () {
                $("#addCustomerBtn").click(function () {
                    // Lấy giá trị của số điện thoại và tên khách hàng từ input
                    var soDienThoai = $("#soDienThoai").val().trim();
                    var tenKhachHang = $("#tenKhachHang").val().trim();

                    // Xóa các thông báo lỗi trước đó
                    $("#soDienThoaiError").text("");
                    $("#tenKhachHangError").text("");

                    // Kiểm tra xem các trường có rỗng không
                    if (soDienThoai === "") {
                        $("#soDienThoaiError").text("Vui lòng nhập số điện thoại.").addClass("error-message");
                        return;
                    }

                    if (tenKhachHang === "") {
                        $("#tenKhachHangError").text("Vui lòng nhập tên khách hàng.").addClass("error-message");
                        return;
                    }

                    // Kiểm tra xem số điện thoại có đúng định dạng không (chỉ chứa số và có đúng 10 kí tự không)
                    var phoneNumberPattern = /^\d{10}$/;
                    if (!phoneNumberPattern.test(soDienThoai)) {
                        $("#soDienThoaiError").text("Số điện thoại phải có 10 chữ số và chỉ chứa số.").addClass("error-message");
                        return;
                    }

                    // Nếu tất cả các điều kiện đều được thỏa mãn, thực hiện thêm khách hàng
                    $.ajax({
                        type: "POST",
                        url: "/ban-tai-quay/themKhachHang",
                        data: {
                            soDienThoai: soDienThoai,
                            tenKhachHang: tenKhachHang
                        },
                        success: function (response) {
                            if (response === "success") {
                                alert("Thêm khách hàng thành công!");

                            } else {
                                alert("Khách hàng đã tồn tại!");
                            }
                        },
                        error: function (xhr, status, error) {
                            alert("Đã xảy ra lỗi: " + error);
                            console.log(xhr.responseText);
                        }
                    });
                });
            });
        </script>


        <%--  tìm Kiếm Kh--%>
        <script>
            $(document).ready(function () {
                $('#soDienThoai').on('change', function () {
                    var soDienThoai = $(this).val();
                    $.ajax({
                        type: 'GET',
                        url: '/ban-tai-quay/kiemTraKhachHang',
                        data: {soDienThoai: soDienThoai},
                        success: function (response) {
                            $('#tenKhachHang').val(response);
                        },
                        error: function (xhr, status, error) {
                            console.log(xhr.responseText);
                        }
                    });
                });
            });

        </script>


        <div>
            <p>Số lượng sản phẩm: <span id="totalQuantity"></span></p>
        </div>

        <%--        fill số lượng--%>
        <script>
            function fillSoLuong() {
                var totalQuantity = 0;
                var listItemsArray = Array.from(document.querySelectorAll('.item'));

                listItemsArray.forEach(function (item) {
                    var quantityInput = item.querySelector('.quantityInput');
                    totalQuantity += parseInt(quantityInput.value);
                });

                document.getElementById('totalQuantity').innerText = totalQuantity;
            }
        </script>

        <div>
            <p>Tổng Tiền Hàng : <span id="totalOrder" class="total_order"></span></p>
        </div>

        <button class="custom-btn btn-2 checkout" onclick="checkout()">THANH TOÁN</button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var tabActive = "";
    var listDataGioHang;

    function closeTabs(idTabs) {
        Swal.fire({
            title: "Bạn có chắc chắn muốn xóa hóa đơn này?",
            text: "Bạn sẽ không thể khôi phục hoá đơn này!",
            icon: "warning",
            showCancelButton: true,
            reverseButtons: true,
            confirmButtonColor: "#2d8826",
            cancelButtonColor: "#d33",
            confirmButtonText: "Vâng, xoá nó.",
            cancelButtonText: "Huỷ"
        }).then((result) => {
            if (result.isConfirmed) {
                console.log("idhoadonnnnnnnnnn " + idTabs);
                $.ajax({
                    url: '/ban-tai-quay/xoa-hoa-don',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        maHoaDon: idTabs
                    }),
                    success: function (response) {
                        Swal.fire({
                            icon: "success",
                            title: "Giỏ Hàng đã được xoá",
                            showConfirmButton: false,
                            timer: 1000
                        });
                        tabActive = "";
                        $('.gioHangTaiQuay').empty();
                        $('.tab button.tablinks').remove();
                        response.forEach(function (hoaDon) {
                            var temp = hoaDon.maHoaDon;
                            var newTabHTML = '<button class="tablinks active tab1"  style="padding-right: 7px ;height: 37.6px" id="' + hoaDon.maHoaDon + '" onclick="openTab(event, \'' + hoaDon.maHoaDon + '\')">' + hoaDon.maHoaDon + '' +
                                '<span style="margin-left: 0px; padding-left: 0px" class="closeButtonTab" onclick="closeTabs(\'' + temp + '\')"><i class="bi bi-x-circle closeButtonTab"></i></span>';
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
        });
    }

    function addToCart(button, giaBan) {
        // Lấy id sản phẩm từ thuộc tính dữ liệu
        var productId = button.getAttribute("data-product-id");
        if (tabActive == "") {
            // errorAdd('Vui lòng chọn hóa đơn trước');
            Swal.fire({
                title: "Giỏ hàng chưa được tạo?",
                text: "Vui lòng chọn giỏ hàng trước thì mới có thể sản phẩm vô được?",
                icon: "error",
            });
        } else {
            if (checkExistingProduct(productId)) {
                // Nếu sản phẩm đã tồn tại trong giỏ hàng, hiển thị alert và không thêm vào giỏ hàng
                Swal.fire({
                    icon: "error",
                    title: "Oops...",
                    text: "Sản phẩm này đã có trong giỏ hàng!"
                    // footer: '<a href="#">Why do I have this issue?</a>'
                });
                return;
            }
            var quantity = prompt("Nhập số lượng sản phẩm:");
            if (quantity === null || quantity === "" || isNaN(quantity) || quantity <= 0) {
                quantity = 1; // Đặt giá trị mặc định thành 1 nếu không hợp lệ
            }
            $.ajax({
                url: 'ban-tai-quay/kiem-tra-so-luong-trong-kho',
                type: 'POST',

                data:{
                    productId: productId,
                    quantity: parseInt(quantity)
                },
                success: function (response) {
                    if (response=== "ok") {
                        $.ajax({
                            url: '/ban-tai-quay/them-gio-hang',
                            type: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify({
                                productId: productId,
                                tabActive: tabActive,
                                giaBan: giaBan,
                                quantity: quantity
                            }),
                            success: function (response) {
                                // Xử lý phản hồi từ backend nếu cần
                                $.ajax({
                                    url: '/ban-tai-quay/get-gio-hang',
                                    type: 'POST',
                                    contentType: 'application/json',
                                    data: JSON.stringify({
                                        maHoaDon: tabActive
                                    }), // Gửi maHoaDon của tab
                                    success: function (ok) {
                                        updateProductList(ok);
                                        updateTotalPrice();

                                        fillSoLuong();
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
                    } else {
                        // Số lượng yêu cầu lớn hơn số lượng hiện có trong kho
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Số lượng sản phẩm trong kho không đủ!"
                        });
                    }
                },
                error: function (error) {
                    console.error("Lỗi khi kiểm tra số lượng trong kho:", error);
                }
            });
        }
    }


    // check sp trong giỏ hàng

    function checkExistingProduct(productId) {
        var listItemsArray = Array.from(document.querySelectorAll('.item'));
        console.log(listItemsArray);
        for (var i = 0; i < listItemsArray.length; i++) {
            // Lấy id sản phẩm của từng sản phẩm trong danh sách
            var idCtspElement = listItemsArray[i].querySelector('.idCtsp');
            var idCtspValue = idCtspElement.textContent;
            console.log(idCtspValue);
            console.log(productId);

            if (idCtspValue === productId) {
                return true;
            }
        }
        return false;
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
                data: JSON.stringify({
                    maHoaDon: tabName
                }), // Gửi maHoaDon của tab
                success: function (response) {
                    updateProductList(response);
                    updateTotalPrice();
                    fillSoLuong();
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

        // check GioHang Null
        if (products.length === 0) {
            gioHangTaiQuayElement.innerHTML =
                '<div class="center-content" style="text-align: center; margin: 20px; padding: 10px; background-color: #f7f7f7; border-radius: 5px;">' +
                '<img src="../static/images/icon/cost.png" alt="Cost Icon" style="width: 200px; height: 200px; margin-bottom: 20px; margin-top: 20px ">' +
                '<div class="alert alert-warning" role="alert" style="background-color: #F5F5F5; color: #696969; padding: 10px; margin-bottom: 10px;font-size: 18px; border-radius: 5px;">Đơn hàng của bạn chưa có sản phẩm nào.</div>' +
                '<button class="btn btn-primary" style="background-color: transparent; color: #666666; padding: 15px 30px; border: solid 1px #ccc; border-radius: 10px; cursor: pointer; font-size: 16px;" onmouseover="this.style.backgroundColor=\'#ccc\'" onmouseout="this.style.backgroundColor=\'transparent\'" onclick="openModal()">Thêm sản phẩm ngay</button>'
            '</div>';
            return; // Thoát khỏi hàm nếu giỏ hàng rỗng
        }
        // Thêm danh sách sản phẩm mới vào giao diện người dùng
        var count = 1; // Biến đếm số thứ tự

        products.forEach(function (product) {
            const price = product.chiTietSanPham.giaBan * product.soLuong;
            var formattedPrice = price.toLocaleString('vi-VN', {style: 'decimal'});
            var productHTML = '<div class="item productInCart" style="margin-bottom: 6px ; border: 1px solid #CCD1D1;border-radius: 10px;height: 37px" >' +
                '<div class= "idCtsp" hidden>' + product.chiTietSanPham.id + '</div>' +
                '<div class="orderNumber" style="margin-right: 10px;width: 10px">' + count++ + '</div>' + // Hiển thị số thứ tự với khoảng cách 20px
                '<button class="deleteButton" style="margin: 0px;" onclick="deleteProduct(' + product.chiTietSanPham.id + ', event)"><i class="bi bi-trash3" style="font-size: 22px;"></i></button>' + // Thêm margin-left cho nút giỏ hàng
                '<div class="orderNumber" style="margin-right: 45px;width: 40px">' + product.chiTietSanPham.ma + '</div>' +
                '<div class="info" style="width: 400px; max-width: 400px">' +
                '<div class="name" >' + '<i class="bi bi-shield-check" style="color: #1d9bf0"></i>' + product.chiTietSanPham.sanPham.tenSanPham + '</div>' +
                '<div class="price">' + product.chiTietSanPham.mauSac.tenMauSac + '</div>' +
                '</div>' +
                '<div style="color: black; font-size: 16px; margin-right: 70px;width: 50px">' + product.chiTietSanPham.giaBan.toLocaleString('vi-VN', {style: 'decimal'}) + '</div>' +
                '<div class="quantity" style="display: flex; align-items: center;">' + // Sử dụng flexbox để căn chỉnh hàng số lượng
                '<button class="btn btn-sm btn-outline-secondary" style="background: transparent; border: none; margin-right: 5px; height: 20px;" onclick="decreaseQuantity(' + product.chiTietSanPham.id + ',' + product.chiTietSanPham.giaBan + ',' + product.chiTietSanPham.soLuong + ')"><i style="font-size: 18px" class="bi bi-dash-circle"></i></button>' +
                '<input type="text" style="border: none; font-size: 15px; background-color: #f9f9f9; text-align: center; height: 25px;width: 20px" class="quantityInput" id="quantities' + product.chiTietSanPham.id + '"  onchange="updateSoLuong(' + product.chiTietSanPham.id + ',this.value,' + product.chiTietSanPham.giaBan + ',' + product.chiTietSanPham.soLuong + ')" value="' + product.soLuong + '" min="1">' +
                '<button class="btn btn-sm btn-outline-secondary" style="background: transparent; border: none; margin-left: 5px; height: 20px;" onclick="increaseQuantity(' + product.chiTietSanPham.id + ',' + product.chiTietSanPham.giaBan + ',' + product.chiTietSanPham.soLuong + ')"><i style="font-size: 18px" class="bi bi-plus-circle"></i></button>' +
                '</div>' +
                '<div class="returnPriceCart returnPriceCart' + product.chiTietSanPham.id + '" style="color: black; font-size: 16px; width: 80px">' + formattedPrice + '</div>' +
                '<div>' +
                '</div>' +
                '</div>';

            gioHangTaiQuayElement.insertAdjacentHTML('beforeend', productHTML);

        });

    }

    function checkQuantityInput(input) {
        // Chuyển đổi giá trị nhập vào thành một số nguyên
        var quantity = parseInt(input.value);

        // Kiểm tra nếu giá trị không phải là một số hoặc là một số âm
        if (isNaN(quantity) || quantity < 0) {
            // Nếu giá trị không hợp lệ, đặt giá trị của input thành 1
            input.value = 1;
        }
    }


    // tăng số lượng
    function increaseQuantity(productId, giaBan, soLuongSanPhamKho) {
        var quantityInput = document.getElementById('quantities' + productId).value;
        var soLuongMoi = Number(quantityInput) + 1;
        updateSoLuong(productId, soLuongMoi, giaBan, soLuongSanPhamKho);
    }

    // giảm số lượng
    function decreaseQuantity(productId, giaBan, soLuongSanPhamKho) {
        var quantityInput = document.getElementById('quantities' + productId).value;
        var soLuongMoi = Math.max(1, Number(quantityInput) - 1);
        updateSoLuong(productId, soLuongMoi, giaBan, soLuongSanPhamKho);
    }


    // sửa số lượng
    // function updateSoLuong(id, soLuong, giaBan, soLuongSanPhamKho) {
    //     var idTemp = id;
    //     var updateGiaSanPham = document.querySelector('.returnPriceCart' + idTemp);
    //
    //
    //     if (soLuong > soLuongSanPhamKho) {
    //         updateGiaSanPham.textContent = giaBan.toLocaleString('vi-VN', {style: 'decimal'});
    //         ;
    //         updateTotalPrice();
    //         errorAdd('Số lượng sản phẩm không đủ');
    //         $('.quantityInput').val(1);
    //         return;
    //     } else {
    //         $.ajax({
    //             url: '/ban-tai-quay/update-so-luong-san-pham',
    //             type: 'POST',
    //             contentType: 'application/json',
    //             data: JSON.stringify({
    //                 maHoaDon: tabActive,
    //                 idChiTietSanPham: id,
    //                 soLuong: soLuong,
    //                 giaSanPham: giaBan * soLuong
    //             }),
    //
    //             success: function (ok) {
    //                 let sum = giaBan * soLuong;
    //                 document.getElementById('quantities' + id).value = soLuong;
    //                 updateGiaSanPham.textContent = sum.toLocaleString('vi-VN', {style: 'decimal'}); // Định dạng giá tiền sau khi cập nhật
    //                 updateTotalPrice();
    //                 fillSoLuong();
    //             },
    //             error: function (error) {
    //                 console.error("Lỗi khi gửi yêu cầu lấy sản phẩm:", error);
    //             }
    //         });
    //     }
    // }
    function updateSoLuong(id, soLuong, giaBan, soLuongSanPhamKho) {
        var idTemp = id;
        var updateGiaSanPham = document.querySelector('.returnPriceCart' + idTemp);

        // Kiểm tra nếu số lượng không hợp lệ (âm hoặc không phải số), đặt giá trị thành 1
        if (isNaN(soLuong) || soLuong <= 0) {
            soLuong = 1;
            document.getElementById('quantities' + id).value = soLuong;
        }

        if (soLuong > soLuongSanPhamKho) {
            updateGiaSanPham.textContent = giaBan.toLocaleString('vi-VN', {style: 'decimal'});
            updateTotalPrice();
            errorAdd('Số lượng sản phẩm không đủ');
            document.getElementById('quantities' + id).value = soLuongSanPhamKho;
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
                    document.getElementById('quantities' + id).value = soLuong;
                    updateGiaSanPham.textContent = sum.toLocaleString('vi-VN', {style: 'decimal'}); // Định dạng giá tiền sau khi cập nhật
                    updateTotalPrice();
                    fillSoLuong();
                },
                error: function (error) {
                    console.error("Lỗi khi gửi yêu cầu lấy sản phẩm:", error);
                }
            });
        }
    }



    // Xóa Sp trong giỏ hàng
    function deleteProduct(productId, event) {
        // Ngăn chặn hành vi mặc định của nút xóa (chẳng hạn chuyển trang)
        event.stopPropagation();

        $.ajax({
            url: '/ban-tai-quay/xoa-san-pham-gio-hang',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                maHoaDon: tabActive, // Gửi mã hóa đơn hiện tại
                id: productId // Gửi ID sản phẩm cần xóa
            }),
            success: function (response) {
                // Xóa sản phẩm khỏi danh sách sản phẩm trong giao diện người dùng
                var productElement = event.target.closest('.item');
                productElement.remove();

                updateTotalPrice();
                fillSoLuong();

                console.log("Đã xóa sản phẩm khỏi giỏ hàng:", productId);
                Swal.fire({
                    title: "Đã xóa sản phẩm khỏi giỏ hàng",
                    icon: "success",
                    timer: 500, // Thời gian đợi tính bằng mili giây (200ms = 0.2 giây)
                    showConfirmButton: false // Ẩn nút "OK"
                });

            },
            error: function (error) {
                console.error("Lỗi khi xóa sản phẩm khỏi giỏ hàng:", error);
            }
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
                        var newTabHTML = '<button class="tablinks active tab1" style="padding-right: 8px"   id="' + hoaDon.maHoaDon + '" onclick="openTab(event, \'' + hoaDon.maHoaDon + '\')">' + hoaDon.maHoaDon + '' +
                            '<span  onclick="closeTabs(\'' + temp + '\')"><i class="bi bi-x-circle closeButtonTab"></i></span>';
                        '</button>';
                        $('.tab').append(newTabHTML);
                    });


                    var newAddTabs = '<button class="tablinks add" onclick="addTab()">+</button>';
                    $('.tab').append(newAddTabs);

                    // Khôi phục trạng thái của tab đang chọn sau khi thêm tab mới
                    openTab({
                        currentTarget: document.getElementById(activeTabId)
                    }, activeTabId);

                    // // Tự động click vào nút mới tạo và thêm lớp active
                    // var newTabButton = document.querySelector('.tablinks.add');
                    // newTabButton.click();
                    // newTabButton.classList.add('active');
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
            // Loại bỏ dấu chấm trong giá tiền trước khi chuyển đổi thành số
            var price = parseFloat(returnPriceElement.textContent.replace(/\./g, '').replace(/[^\d.-]/g, ''));
            totalPrice += price;
        });

        var totalPriceInput = document.querySelector('.total_order');
        totalPriceInput.innerHTML = totalPrice.toLocaleString('vi-VN', {style: 'decimal'});
        return totalPrice;
    }

    function formatCurrency(number) {
        return new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(number);
    }


    function checkout() {
        // var tenKhachHang = document.querySelector(".thanh-toan input:nth-child(1)").value;
        // var soDienThoai = document.querySelector(".thanh-toan input:nth-child(2)").value;
        var soDienThoai = document.querySelector("#soDienThoai").value;
        var tenKhachHang = document.querySelector("#tenKhachHang").value;

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

                    soDienThoai: soDienThoai,
                    tenKhachHang: tenKhachHang,
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
                        var newTabHTML = '<button class="tablinks active tab1"  style="padding-right: 8px; width: 117px"  id="' + hoaDon.maHoaDon + '" onclick="openTab(event, \'' + hoaDon.maHoaDon + '\')">' + hoaDon.maHoaDon + '' +
                            '<span onclick="closeTabs(\'' + temp + '\')"><i class="bi bi-x-circle closeButtonTab"></i></span>';
                        '</button>';
                        $('.tab').append(newTabHTML);

                    });
                    var newAddTabs = '<button class="tablinks add" onclick="addTab()">+</button>';
                    $('.tab').append(newAddTabs);

                    console.log("Đã thanh toán thành công. Thông tin đơn hàng:", response);
                    successMessage('Thanh Toán Thành Công');

                    Swal.fire({
                        title: "Bạn có muốn in hoá đơn không?",
                        icon: "success",
                        showCancelButton: true,
                        confirmButtonText: "In hóa đơn",
                        cancelButtonText: "Đóng",
                    }).then((result) => {
                        if (result.isConfirmed) {
                            var form = document.createElement('form');
                            form.setAttribute('action', '/ban-tai-quay/export');
                            form.setAttribute('method', 'get');
                            form.style.display = 'none'; // Ẩn form đi để tránh hiển thị trên giao diện

                            var input = document.createElement('input');
                            input.setAttribute('type', 'hidden');
                            input.setAttribute('name', 'maHoaDon');
                            input.setAttribute('value', tabActive); // Truyền giá trị tabActive vào biến maHoaDon

                            form.appendChild(input);
                            document.body.appendChild(form);

                            form.submit();
                            // Redirect();
                        }
                    });
                },
                error: function (error) {
                    console.error("Lỗi khi thanh toán:", error);
                }
            });
        }
    }

    function Redirect() {
        window.location = "/ban-tai-quay";
    }


</script>

<%--Lọc Modal--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $(".filter-form").submit(function (event) {
            // Ngăn chặn hành vi mặc định của biểu mẫu
            event.preventDefault();

            // Lấy dữ liệu từ các trường lọc
            var formData = {
                chatLieu: $("select[name='chatLieu']").val(),
                doiTuongSuDung: $("select[name='doiTuongSuDung']").val(),
                mauSac: $("select[name='mauSac']").val()
            };

            // Gửi yêu cầu AJAX POST đến URL /ban-tai-quay/filter
            $.ajax({
                type: "POST",
                url: "/ban-tai-quay/filter",
                data: formData,
                success: function (response) {
                    console.log(response);
                    $("#cartBody").empty();
                    $.each(response, function (index, item) {
                        var row = "<tr>";
                        row += "<td>" + item.ma + "</td>";
                        row += "<td>" + item.sanPham.tenSanPham + "</td>";
                        row += "<td>" + item.mauSac.tenMauSac + "</td>";
                        row += "<td>" + item.soLuong + "</td>";
                        row += "<td>" + item.giaBan + "</td>";

                        // Thêm button vào cột cuối cùng của hàng
                        row += "<td><button class='btnAdd' onclick='addToCart(this, " + item.giaBan + ")' data-product-id='" + item.id + "'>";
                        row += "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-plus-circle' viewBox='0 0 16 16'>";
                        row += "<path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm.5-9a.5.5 0 0 1 0 1H11a.5.5 0 0 1 0 1H8.5v2a.5.5 0 0 1-1 0V8H5a.5.5 0 0 1 0-1h2.5V5a.5.5 0 0 1 1 0v2h2.5z'/>";
                        row += "</svg>";
                        row += "</button></td>";

                        row += "</tr>";
                        $("#cartBody").append(row);
                    });
                },

                error: function (xhr, status, error) {
                    alert("Đã xảy ra lỗi: " + error);
                    console.log(xhr.responseText);
                }
            });

        });
    });


</script>

<%--Search Modal--%>

<script>

    document.addEventListener("DOMContentLoaded", function() {
        // Hiển thị spinner

        document.getElementById("loading-spinner").style.display = "block";

        // Ẩn spinner sau 3 giây
        setTimeout(function() {
            document.getElementById("loading-spinner").style.display = "none";
        }, 150);


    });
    $(document).ready(function () {
        $('#searchButton').click(function () {
            var searchData = $('#searchMaTenMau').val();
            $.ajax({
                type: 'post',
                url: '/ban-tai-quay/search',
                data: {name: searchData},
                success: function (response) {
                    console.log(response);
                    $("#cartBody").empty();

                    // Duyệt qua dữ liệu trả về và thêm vào bảng
                    $.each(response, function (index, item) {
                        var row = "<tr>";
                        row += "<td>" + item.ma + "</td>";
                        row += "<td>" + item.sanPham.tenSanPham + "</td>";
                        row += "<td>" + item.mauSac.tenMauSac + "</td>";
                        row += "<td>" + item.soLuong + "</td>";
                        row += "<td>" + item.giaBan + "</td>";

                        // Thêm button vào cột cuối cùng của hàng
                        row += "<td><button class='btnAdd' onclick='addToCart(this, " + item.giaBan + ")' data-product-id='" + item.id + "'>";
                        row += "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-plus-circle' viewBox='0 0 16 16'>";
                        row += "<path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm.5-9a.5.5 0 0 1 0 1H11a.5.5 0 0 1 0 1H8.5v2a.5.5 0 0 1-1 0V8H5a.5.5 0 0 1 0-1h2.5V5a.5.5 0 0 1 1 0v2h2.5z'/>";
                        row += "</svg>";
                        row += "</button></td>";

                        row += "</tr>";
                        $("#cartBody").append(row);
                    });

                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        });
    });
</script>


</body>


</html>