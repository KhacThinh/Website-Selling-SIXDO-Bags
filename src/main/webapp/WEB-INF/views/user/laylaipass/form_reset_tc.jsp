<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password Success</title>
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

        .container {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        h2 {
            color: #333;
        }

        .message {
            color: green;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
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

    </style>
</head>
<body>
<img class="background-image"
     src="https://png.pngtree.com/thumb_back/fh260/background/20230523/pngtree-cyan-blue-light-effect-abstract-vector-stock-photos-image-guardian-bright-image_2806077.jpg">

<div class="container">
    <h2>Đã đổi mật khẩu thành công!</h2>
    <p class="message">Mật khẩu của bạn đã được thay đổi thành công...</p>
    <a href="/login/hien-thi">Đi tới Đăng Nhập</a>
</div>
</body>
</html>
