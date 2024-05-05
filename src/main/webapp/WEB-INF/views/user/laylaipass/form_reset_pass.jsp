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
            background-color: #ced4da;
            border-radius: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 320px;


        }

        h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #007bff;
        }

        .form-group {
            width: 305px;
            margin-bottom: 20px;
            color: #3A3B3C;
            font-size: 14px;
            font-family: 'Montserrat', sans-serif;
        }

        .form-group1 {
            margin-bottom: 20px;
            color: #4D4C4C;
            font-size: 20px;
            font-family: 'Lato', sans-serif;
            width: 325px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        /*input[type="password"] {*/
        /*    width: 100%;*/
        /*    padding: 10px;*/
        /*    border: 1px solid #ccc;*/
        /*    border-radius: 4px;*/
        /*}*/
        .password1 {
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

        input[type="email"] {
            margin-left: 35px;
            background-color: #ced4da;
            color: #0b3cc1;
            width: 240px;
            padding: 10px;
            font-family: "Barlow Condensed SemiBold";
            font-size: 20px;
            text-decoration: underline;
            border: none;

        }

        .error-message {
            color: red;
            font-size: 13px;
            margin-top: -2px;
            margin-bottom: 10px;
            font-family: Arial, sans-serif;
        }


        /*///////////*/
        .eye {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            max-width: 14px;
            margin-right: 600px;
            margin-top: -13px;

        }

        .eye1 {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            max-width: 14px;
            margin-right: 600px;
            margin-top: 73px;

        }

        .hidden {
            display: none;
        }

        .hidden1 {
            display: none;
        }
    </style>
</head>

<body>
<img class="background-image"
     src="https://png.pngtree.com/thumb_back/fh260/background/20230523/pngtree-cyan-blue-light-effect-abstract-vector-stock-photos-image-guardian-bright-image_2806077.jpg">

<div class="container">
    <h2>Thay Đổi Mật Khẩu</h2>

    <form action="/lay-mk/config" method="post" onsubmit="return validateForm()">
        <div class="form-group3">
            <input type="email" id="email" name="email" value="${email}" required placeholder="" readonly>


        </div>



        <div class="form-group">
            <label for="new-password">Mật Khẩu Mới</label>
            <input class="password1" type="password" id="new-password" name="pass" placeholder="Mật Khẩu mới">

            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                 stroke="currentColor" class="eye eye-close ">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M3.98 8.223A10.477 10.477 0 0 0 1.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.451 10.451 0 0 1 12 4.5c4.756 0 8.773 3.162 10.065 7.498a10.522 10.522 0 0 1-4.293 5.774M6.228 6.228 3 3m3.228 3.228 3.65 3.65m7.894 7.894L21 21m-3.228-3.228-3.65-3.65m0 0a3 3 0 1 0-4.243-4.243m4.242 4.242L9.88 9.88"/>
            </svg>
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                 stroke="currentColor" class="eye eye-open hidden">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z"/>
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
            </svg>
        </div>
        <div class="form-group">
            <label for="confirm-password">Nhập lại mật khẩu mới</label>
            <input class="password1" type="password" id="confirm-password" name="confirm"
                   placeholder="Nhập lại mật khẩu mới">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                 stroke="currentColor" class="eye1 eye-close1 ">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M3.98 8.223A10.477 10.477 0 0 0 1.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.451 10.451 0 0 1 12 4.5c4.756 0 8.773 3.162 10.065 7.498a10.522 10.522 0 0 1-4.293 5.774M6.228 6.228 3 3m3.228 3.228 3.65 3.65m7.894 7.894L21 21m-3.228-3.228-3.65-3.65m0 0a3 3 0 1 0-4.243-4.243m4.242 4.242L9.88 9.88"/>
            </svg>
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                 stroke="currentColor" class="eye1 eye-open1 hidden1">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z"/>
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
            </svg>
        </div>


        <div id="error-message" class="error-message" style="display: none;"></div>

        <div class="form-group1">
            <input type="submit" value="Tiếp Theo">
        </div>

    </form>
</div>

<script>
    function validateForm() {
        var newPassword = document.getElementById("new-password").value;
        var confirmPassword = document.getElementById("confirm-password").value;


        if (newPassword.trim() === "" || confirmPassword.trim() === "") {
            document.getElementById("error-message").innerText = "Vui lòng nhập đầy đủ thông tin";
            document.getElementById("error-message").style.display = "block";
            return false;
        }


        if (newPassword.length < 6 || !/\d/.test(newPassword) || !/[a-zA-Z]/.test(newPassword)) {
            document.getElementById("error-message").innerText = "Mật khẩu phải nhiều hơn 6 ký tự và bao gồm chữ và số";
            document.getElementById("error-message").style.display = "block";
            return false;
        }

        if (newPassword !== confirmPassword) {
            document.getElementById("error-message").innerText = "Mật khẩu không khớp.";
            document.getElementById("error-message").style.display = "block";
            return false;
        }

        return true;
    }

    document.addEventListener("DOMContentLoaded", function () {
        const eyeCloseIcon = document.querySelector('.eye-close');
        const eyeOpenIcon = document.querySelector('.eye-open');
        const eyeCloseIcon1 = document.querySelector('.eye-close1');
        const eyeOpenIcon1 = document.querySelector('.eye-open1');
        const passwordInput = document.getElementById('new-password');
        const passwordInput1 = document.getElementById('confirm-password');


        eyeCloseIcon.addEventListener('click', function () {
            passwordInput.setAttribute('type', 'text');
            eyeCloseIcon.classList.add('hidden');
            eyeOpenIcon.classList.remove('hidden');
        });

        eyeOpenIcon.addEventListener('click', function () {
            passwordInput.setAttribute('type', 'password');
            eyeOpenIcon.classList.add('hidden');
            eyeCloseIcon.classList.remove('hidden');
        });


        eyeCloseIcon1.addEventListener('click', function () {
            passwordInput1.setAttribute('type', 'text');
            eyeCloseIcon1.classList.add('hidden1');
            eyeOpenIcon1.classList.remove('hidden1');
        });

        eyeOpenIcon1.addEventListener('click', function () {
            passwordInput1.setAttribute('type', 'password');
            eyeOpenIcon1.classList.add('hidden1');
            eyeCloseIcon1.classList.remove('hidden1');
        });

    });


</script>

</body>

</html>