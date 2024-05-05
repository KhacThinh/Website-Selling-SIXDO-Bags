<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .background-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1; /* Đảm bảo hình ảnh làm nền ở phía sau */
            filter: blur(5px); /* Áp dụng hiệu ứng làm mờ */
            object-fit: cover;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9); /* Sử dụng màu nền trong suốt */
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 320px;
            position: relative; /* Đảm bảo phần nội dung nằm trên hình ảnh */
        }

        h2 {
            margin-bottom: 20px;
            text-align: center;
            font-size: 30px;
            color: #0b3cc1;
        }

        .form-group {
            margin-bottom: 20px;


        }

        .form-group1 {
            margin-bottom: 20px;
            width: 340px;

        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            color: #ffffff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 20px; /* Khoảng cách trên */
            margin-bottom: 20px; /* Khoảng cách dưới */
            text-align: center; /* Căn giữa nội dung */
            display: block; /* Hiển thị như một khối */
        }

        .background-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            filter: blur(5px); /* Đây là phần làm mờ */
            object-fit: cover;
        }


    </style>
</head>
<body>
<img class="background-image"
     src="https://png.pngtree.com/thumb_back/fh260/background/20230523/pngtree-cyan-blue-light-effect-abstract-vector-stock-photos-image-guardian-bright-image_2806077.jpg">
<div class="container">
    <h2>Đổi Mật Khẩu </h2>
    <form id="passwordResetForm" action="/send-email" method="post">
        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" id="email" name="email" value="${email}"  placeholder="Nhập Email">
        </div>
        <c:if test="${not empty tb}">
            <span class="error-message">${tb}</span>
        </c:if>
        <div class="form-group1">
            <input type="submit" value="NEXT">
        </div>
    </form>
</div>


<script>
    function validateForm() {
        var email = document.getElementById("email").value;
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email.trim() === "") {
            alert("Vui lòng nhập địa chỉ email");
            return false;
        } else if (!emailRegex.test(email)) {
            alert("Vui lòng nhập địa chỉ email hợp lệ.");
            return false;
        }
        return true;
    }

    document.getElementById("passwordResetForm").onsubmit = function() {
        return validateForm();
    };
</script>
</body>
</html>
