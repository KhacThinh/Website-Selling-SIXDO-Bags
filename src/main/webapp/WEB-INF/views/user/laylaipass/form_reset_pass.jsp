<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
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
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input[type="password"] {
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
            margin-top: 8px;
        }
    </style>
</head>

<body>
<div class="container">
    <h2>Thay Đổi Mật Khẩu</h2>

    <form action="/lay-mk/config" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="email">Email của bạn</label>
            <input type="email" id="email" name="email" value="${email}" required placeholder="" readonly>
        </div>
        <div class="form-group">
            <label for="new-password">Mật Khẩu Mới</label>
            <input type="password" id="new-password" name="pass" required placeholder="Enter New Password">
        </div>
        <div class="form-group">
            <label for="confirm-password">Nhập Lại Mật Khẩu</label>
            <input type="password" id="confirm-password" name="confirm" required
                   placeholder="Confirm Password">
        </div>
        <div class="form-group">
            <input type="submit" value="Thay Đổi">
        </div>
        <div id="error-message" class="error-message" style="display: none;"></div>
    </form>
</div>

<script>
    function validateForm() {
        var newPassword = document.getElementById("new-password").value;
        var confirmPassword = document.getElementById("confirm-password").value;

        if (newPassword.length < 6 || !/\d/.test(newPassword) || !/[a-zA-Z]/.test(newPassword)) {
            document.getElementById("error-message").innerText = "Mật Khẩu phải nhiều hơn 6 ký tự và phải bao gồm cả chữ và số.";
            document.getElementById("error-message").style.display = "block";
            return false;
        }

        if (newPassword !== confirmPassword) {
            document.getElementById("error-message").innerText = "Mật Khẩu không khớp.";
            document.getElementById("error-message").style.display = "block";
            return false;
        }

        return true;
    }
</script>
</body>

</html>