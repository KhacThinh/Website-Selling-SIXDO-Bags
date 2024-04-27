<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Sent Confirmation</title>
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
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 320px;
        }

        h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #0E4BF1;
        }

        p {
            text-align: center;
        }

        .btn-back {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            color: #ffffff;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-back:hover {
            background-color: #0056b3;
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
    <h2>Thư đã được gửi đến Email của bạn!</h2>
    <p>Vui lòng kiểm tra email và làm tiếp các bước.</p>
    <a href="#" class="btn-back">OK</a>
</div>
</body>
</html>
