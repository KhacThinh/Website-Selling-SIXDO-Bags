<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Login Page | AsmrProg</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Import jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>

        .button:hover {
            background-color: #0056b3;
            cursor: pointer;
        }

        .button:hover {
            cursor: pointer;
        }

        .button:hover {
            cursor: pointer;
        }

        .button:hover {
            cursor: pointer;
        }

        body {
            margin: 0;
            color: #6a6f8c;
            background: #ced4da;
            font: 600 16px/18px 'Open Sans', sans-serif;

        }

        *, :after, :before {
            box-sizing: border-box
        }

        .clearfix:after, .clearfix:before {
            content: '';
            display: table
        }

        .clearfix:after {
            clear: both;
            display: block
        }

        a {
            color: lemonchiffon;
            text-decoration: none
        }

        .login-wrap {

            width: 100%;
            margin: auto;
            border-radius:  10px;
            max-width: 525px;
            min-height: 670px;
            position: relative;

            background: url(https://images.squarespace-cdn.com/content/v1/53883795e4b016c956b8d243/1554883509375-28LTBL987ZMPIC0VBG5J/image-asset.jpeg) no-repeat center;
            box-shadow: 0 12px 15px 0 rgba(0, 0, 0, .24), 0 17px 50px 0 rgba(0, 0, 0, .19);
        }

        .login-html {
            width: 100%;
            height: 100%;
            position: absolute;
            padding: 90px 70px 50px 70px;
            background: rgba(40, 57, 101, .55);
            border-radius: 10px;


        }

        .login-html .sign-in-htm,
        .login-html .sign-up-htm {
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            position: absolute;
            transform: rotateY(180deg);
            backface-visibility: hidden;
            transition: all .4s linear;
        }

        .login-html .sign-in,
        .login-html .sign-up,
        .login-form .group .check {
            display: none;
        }

        .login-html .tab,
        .login-form .group .label,
        .login-form .group .button {
            text-transform: uppercase;
        }

        .login-html .tab {
            font-size: 22px;
            margin-right: 15px;
            padding-bottom: 5px;
            margin: 0 15px 10px 0;
            display: inline-block;
            border-bottom: 2px solid transparent;
        }

        .login-html .sign-in:checked + .tab,
        .login-html .sign-up:checked + .tab {
            color: #fff;
            border-color: #1161ee;
        }

        .login-form {
            min-height: 345px;
            position: relative;
            perspective: 1000px;
            transform-style: preserve-3d;
        }

        .login-form .group {
            margin-bottom: 15px;
        }

        .login-form .group .label,
        .login-form .group .input,
        .login-form .group .button {
            width: 100%;
            color: #fff;
            display: block;
        }

        .login-form .group .input,
        .login-form .group .button {
            border: none;
            padding: 15px 20px;
            border-radius: 25px;
            background: rgba(255, 255, 255, .1);

        }

        .login-form .group input[data-type="password"] {
            text-security: circle;
            -webkit-text-security: circle;
        }

        .login-form .group .label {
            color: white;
            font-size: 12px;
        }

        .login-form .group .button {
            background: #1161ee;
        }

        .login-form .group label .icon {
            width: 15px;
            height: 15px;
            border-radius: 2px;
            position: relative;
            display: inline-block;
            background: rgba(255, 255, 255, .1);
        }

        .login-form .group label .icon:before,
        .login-form .group label .icon:after {
            content: '';
            width: 10px;
            height: 2px;
            background: #fff;
            position: absolute;
            transition: all .2s ease-in-out 0s;
        }

        .login-form .group label .icon:before {
            left: 3px;
            width: 5px;
            bottom: 6px;
            transform: scale(0) rotate(0);
        }

        .login-form .group label .icon:after {
            top: 6px;
            right: 0;
            transform: scale(0) rotate(0);
        }

        .login-form .group .check:checked + label {
            color: #fff;
        }

        .login-form .group .check:checked + label .icon {
            background: #1161ee;
        }

        .login-form .group .check:checked + label .icon:before {
            transform: scale(1) rotate(45deg);
        }

        .login-form .group .check:checked + label .icon:after {
            transform: scale(1) rotate(-45deg);
        }

        .login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm {
            transform: rotate(0);
        }

        .login-html .sign-up:checked + .tab + .login-form .sign-up-htm {
            transform: rotate(0);
        }

        .hr {
            height: 2px;
            margin: 60px 0 50px 0;
            background: rgba(255, 255, 255, .2);
        }

        .foot-lnk {
            text-align: center;
        }

        .error-message {
            font-size: small;

        }

        .small-icon {
            position: absolute;
            top: 50%;
            right: 10px; /* Adjust this value as needed */
            transform: translateY(-50%);
            cursor: pointer;
            margin-top: -50px;
            margin-right: 10px;
            color: #1d1d1d;
        }

        .login-wrap {
            margin-top: 30px;

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
            background-color: rgba(40, 57, 101, 0.9); /* Màu nền trong suốt */
            opacity: 0.9; /* Độ trong suốt */
        }
        .input::placeholder {
            color: silver; /* Thiết lập màu cho placeholder là trắng */
        }



    </style>
</head>
<body>
<img class="background-image"
     src="https://images.squarespace-cdn.com/content/v1/53883795e4b016c956b8d243/1551171355307-M56B4RQW3Z9UFFWV31JY/chup-anh-tui-xach-5.jpg">

<div class="login-wrap">
    <div class="login-html">
        <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Đăng Nhập</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
        <div class="login-form">
            <div class="sign-in-htm">
                <form id="login-form" method="post">
                    <div class="group">
                        <label for="email" class="label">Email</label>
                        <input id="email" type="text" name="email" placeholder="Email" class="input">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Mật khẩu</label>
                        <input id="pass" type="password" name="mat_khau" placeholder="Mật khẩu" class="input"
                               data-type="text">
                        <i class="toggle-password fa fa-eye-slash small-icon" aria-hidden="true"
                           onclick="togglePasswordVisibility()"></i>
                    </div>

                    <div id="error-message" class="error-message" style="color: darkorange;"></div>
                    <!-- Placeholder for error message -->

                    <div class="group">
                        <input type="submit" class="button" value="Đăng Nhập" id="btn-login-nv">
                    </div>
                    <div class="hr"></div>
                    <div class="foot-lnk">
                        <a href="/lay-mk">Quên Mật Khẩu ?</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
    $(document).ready(function () {
        $('#login-form').submit(function (event) {
            event.preventDefault(); // Ngăn chặn hành vi mặc định của form

            var email = $('#email').val();
            var password = $('#pass').val();
            var errorMessage = $('#error-message');

            var hasError = false;

            if (email.trim() === '' || password.trim() === '') {
                errorMessage.text('Vui lòng điền đầy đủ thông tin email và mật khẩu.');
                hasError = true;
            } else {
                var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailPattern.test(email)) {
                    errorMessage.text('Vui lòng nhập đúng định dạng email.');
                    hasError = true;
                }
            }

            if (!hasError) {
                $.post('/mmployee-login/check', {email: email, mat_khau: password})
                    .done(function (response) {
                        if (response == 2) {
                            window.location.href = "http://localhost:8080/hoa-don/nv-lich-su";
                        } else if (response == 4) {
                            window.location.href = "http://localhost:8080/thong-ke";
                        } else {
                            errorMessage.text('Đăng nhập thất bại. Email hoặc mật khẩu không chính xác');
                        }
                    })
                    .fail(function () {
                        errorMessage.text('Có lỗi xảy ra. Vui lòng thử lại sau.');
                    });
            }
        });
    });

    function togglePasswordVisibility() {
        var passField = document.getElementById("pass");
        var passIcon = document.querySelector(".toggle-password");

        if (passField.type === "password") {
            passField.type = "text";
            passIcon.classList.remove("fa-eye-slash");
            passIcon.classList.add("fa-eye");
        } else {
            passField.type = "password";
            passIcon.classList.remove("fa-eye");
            passIcon.classList.add("fa-eye-slash");
        }
    }
</script>
</body>
</html>

