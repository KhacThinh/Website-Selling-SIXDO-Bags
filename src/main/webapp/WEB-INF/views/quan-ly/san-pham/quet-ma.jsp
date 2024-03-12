<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Index.html file -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>QR Code Scanner / Reader
    </title>
    <style>
        /* style.css file*/
        body {
            display: flex;
            justify-content: center;
            margin: 0;
            padding: 0;
            height: 100vh;
            box-sizing: border-box;
            text-align: center;
            background: rgb(128 0 0 / 66%);
        }

        .container {
            width: 100%;
            max-width: 500px;
            margin: 5px;
        }

        .container h1 {
            color: #ffffff;
        }

        .section {
            background-color: #ffffff;
            padding: 50px 30px;
            border: 1.5px solid #b2b2b2;
            border-radius: 0.25em;
            box-shadow: 0 20px 25px rgba(0, 0, 0, 0.25);
        }

        #my-qr-reader {
            padding: 20px !important;
            border: 1.5px solid #b2b2b2 !important;
            border-radius: 8px;
        }

        #my-qr-reader img[alt="Info icon"] {
            display: none;
        }

        #my-qr-reader img[alt="Camera based scan"] {
            width: 100px !important;
            height: 100px !important;
        }

        button {
            padding: 10px 20px;
            border: 1px solid #b2b2b2;
            outline: none;
            border-radius: 0.25em;
            color: white;
            font-size: 15px;
            cursor: pointer;
            margin-top: 15px;
            margin-bottom: 10px;
            background-color: #008000ad;
            transition: 0.3s background-color;
        }

        button:hover {
            background-color: #008000;
        }

        #html5-qrcode-anchor-scan-type-change {
            text-decoration: none !important;
            color: #1d9bf0;
        }

        video {
            width: 100% !important;
            border: 1px solid #b2b2b2 !important;
            border-radius: 0.25em;
        }

    </style>

    <style>
        /* style.css file*/
        /*body {*/
        /*    display: flex;*/
        /*    justify-content: center;*/
        /*    margin: 0;*/
        /*    padding: 0;*/
        /*    height: 100vh;*/
        /*    box-sizing: border-box;*/
        /*    text-align: center;*/
        /*    background: rgb(128 0 0 / 66%);*/
        /*}*/

        .container-qr {
            width: 100%;
            max-width: 300px;
            margin: 5px;
        }

        .container-qr h1 {
            color: #ffffff;
        }

        .section {
            padding: 50px 30px;
            background-color: #ffffff;
            border-radius: 0.25em;
        }

        #my-qr-reader {
            padding: 20px !important;
            border: 1.5px solid #b2b2b2 !important;
            border-radius: 8px;
        }

        #my-qr-reader img[alt="Info icon"] {
            display: none;
        }

        #my-qr-reader img[alt="Camera based scan"] {
            width: 100px !important;
            height: 100px !important;
        }

        button {
            padding: 10px 20px;
            border: 1px solid #b2b2b2;
            outline: none;
            border-radius: 0.25em;
            color: white;
            font-size: 15px;
            cursor: pointer;
            margin-top: 15px;
            /*margin-bottom: 10px;*/
            background-color: #008000ad;
            transition: 0.3s background-color;
        }

        /*button:hover {*/
        /*    background-color: #008000;*/
        /*}*/

        #html5-qrcode-anchor-scan-type-change {
            text-decoration: none !important;
            color: #1d9bf0;
        }

        /*video {*/
        /*    width: 100% !important;*/
        /*    border: 1px solid #b2b2b2 !important;*/
        /*    border-radius: 0.25em;*/
        /*}*/

    </style>
</head>

<body>
<div class="container">
    <h1>Scan QR Codes</h1>
    <div class="section">
        <div id="my-qr-reader"></div>
        <p id="scanned-data"></p> </div>
</div>

<script>

    function domReady(fn) {
        if (
            document.readyState === "complete" ||
            document.readyState === "interactive"
        ) {
            setTimeout(fn, 1000);
        } else {
            document.addEventListener("DOMContentLoaded", fn);
        }
    }

    domReady(function () {

        // If found you qr code
        function onScanSuccess(qrData) {
            // Update scanned data element
            document.getElementById("scanned-data").innerHTML = "Scanned QR Data: " + qrData;

            // Send AJAX request to /processQR
            // sendQRDataToController(qrData);
            sendDecodeText(qrData);
        }

        function sendDecodeText(decodeText) {
            $.ajax({
                type: "POST",
                url: "/test/processQR",
                data: { qrData: decodeText },
                success: function(response) {
                    // Hiển thị decodeText trên màn hình quét mã
                    document.getElementById("decodedText").innerHTML = response;
                    // Tự động quay về trang quét mã
                    window.location.href = "/test/quet-ma";
                },
                error: function(xhr, status, error) {
                    console.error("Error:", error);
                }
            });
        }

        function sendQRDataToController(qrData) {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "/test/processQR", true); // Specify full URL with context path
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); // Set header

            xhr.onload = function () {
                if (xhr.status === 200) { // Check if request was successful
                    // Handle server response (if needed)
                } else {
                    console.error("Error sending data:", xhr.statusText);
                }
            };

            const data = `qrData=${qrData}`; // Encode data in URL-encoded format
            xhr.send(data);
        }

        let htmlScanner = new Html5QrcodeScanner("my-qr-reader", { fps: 10, qrbos: 250 });
        htmlScanner.render(onScanSuccess);
    });
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/html5-qrcode"></script>
</body>

</html>


<%--<script>--%>
<%--    function domReady(fn) {--%>
<%--        if (--%>
<%--            document.readyState === "complete" ||--%>
<%--            document.readyState === "interactive"--%>
<%--        ) {--%>
<%--            setTimeout(fn, 1000);--%>
<%--        } else {--%>
<%--            document.addEventListener("DOMContentLoaded", fn);--%>
<%--        }--%>
<%--    }--%>

<%--    domReady(function () {--%>
<%--        function onScanSuccess(qrData) {--%>
<%--            // Update scanned data element--%>
<%--            document.getElementById("scanned-data").innerHTML = "Scanned QR Data: " + qrData;--%>

<%--            // Gọi hàm addToCart để thêm sản phẩm vào giỏ hàng từ mã QR--%>
<%--            addToCartFromQR(qrData);--%>
<%--        }--%>

<%--        // Hàm để xử lý dữ liệu từ mã QR và thêm sản phẩm vào giỏ hàng--%>
<%--        function addToCartFromQR(qrData) {--%>
<%--            // Giả sử qrData chứa mã sản phẩm--%>
<%--            var productId = qrData;--%>

<%--            // Kiểm tra xem hóa đơn nào đang được chọn--%>
<%--            if (tabActive == "") {--%>
<%--                errorAdd('Vui lòng chọn hóa đơn trước');--%>
<%--                return;--%>
<%--            }--%>

<%--            // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa--%>
<%--            if (checkExistingProduct(productId)) {--%>
<%--                // alert('Sản phẩm đã có trong giỏ hàng.');--%>
<%--                Swal.fire({--%>
<%--                    icon: "error",--%>
<%--                    title: "Oops...",--%>
<%--                    text: "Something went wrong!",--%>
<%--                    footer: '<a href="#">Why do I have this issue?</a>'--%>
<%--                });--%>
<%--                return;--%>
<%--            }--%>

<%--            // Gửi yêu cầu thêm sản phẩm vào giỏ hàng thông qua AJAX--%>
<%--            $.ajax({--%>
<%--                url: '/ban-tai-quay/them-gio-hang',--%>
<%--                type: 'POST',--%>
<%--                contentType: 'application/json',--%>
<%--                data: JSON.stringify({--%>
<%--                    productId: productId,--%>
<%--                    tabActive: tabActive,--%>
<%--                    giaBan: giaBan, // Nếu cần truyền giá sản phẩm vào đây--%>
<%--                }),--%>
<%--                success: function (response) {--%>
<%--                    // Xử lý phản hồi từ backend nếu cần--%>
<%--                    $.ajax({--%>
<%--                        url: '/ban-tai-quay/get-gio-hang',--%>
<%--                        type: 'POST',--%>
<%--                        contentType: 'application/json',--%>
<%--                        data: JSON.stringify({--%>
<%--                            maHoaDon: tabActive--%>
<%--                        }),--%>
<%--                        success: function (ok) {--%>
<%--                            updateProductList(ok);--%>
<%--                            updateTotalPrice();--%>
<%--                            fillSoLuong();--%>
<%--                            console.log("Danh sách sản phẩm của tab " + tabActive + ":", ok);--%>
<%--                        },--%>
<%--                        error: function (error) {--%>
<%--                            console.error("Lỗi khi gửi yêu cầu lấy sản phẩm:", error);--%>
<%--                        }--%>
<%--                    });--%>
<%--                    console.log("Sản phẩm đã được thêm vào giỏ hàng." + response);--%>
<%--                },--%>
<%--                error: function (error) {--%>
<%--                    console.error("Lỗi khi thêm sản phẩm vào giỏ hàng:", error);--%>
<%--                }--%>
<%--            });--%>
<%--        }--%>
<%--    });--%>

<%--</script>--%>