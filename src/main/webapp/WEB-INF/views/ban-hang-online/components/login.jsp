<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<!-- Font Icon -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">

<link rel="stylesheet" type="text/css" href="/static/css/login-regester-onl/style.css">

<div class="main-login-six-do" style="background: #f8f8f8;">

    <!-- Sing in  Form -->
    <section class="sign-in">
        <div class="container">
            <div class="signin-content">
                <div class="signin-image">
                    <figure>
                        <img src="/static/css/login-regester-onl/images/signin-image.jpg" alt="sing up image"/>
                    </figure>
                    <a href="/sixdo-shop/register-customer" class="signup-image-link" style="font-size: 17px">Tạo tài khoản</a>
                </div>

                <div class="signin-form">
                    <h2 class="form-title">Đăng Nhập</h2>
                    <form method="POST" class="register-form" id="login-form">
                        <div class="form-group">
                            <label for="js-email-login-onl"><i
                                    class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="your_name" id="js-email-login-onl" placeholder="Nhập Email"/>
                        </div>
                        <div class="form-group">
                            <label for="js-pass-login-onl"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="your_pass" id="js-pass-login-onl" placeholder="Mật khẩu"/>
                        </div>
                        <div id="error-message" style="color: red; margin-bottom: 10px"></div>
                        <div class="form-group form-button">
                            <input type="submit" id="btn-login-customer" class="form-submit" value="Đăng nhập"/>
                        </div>
                    </form>
                    <div class="social-login">
                        <span class="social-label">Hoặc đăng nhập với</span>
                        <ul class="socials">
                            <li>
                                <a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $("#logo-header").hide();
        $(".js-show-modal-search").hide();
        checkLogin();
    });



    function checkLogin() {
        $('#login-form').submit(function (event) {
            event.preventDefault(); // Ngăn chặn sự kiện mặc định của form

            var email = $('#js-email-login-onl').val();
            var password = $('#js-pass-login-onl').val();
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
                $.post('/buyer-login/check', {email: email, password: password})
                    .done(function (response) {
                        if (response) {
                            console.log('Đăng nhập thành công');
                            window.location.href = "http://localhost:8080/sixdo-shop";
                        } else {
                            $('#js-email-login-onl').val(email);
                            errorMessage.text('Đăng nhập thất bại. Vui lòng kiểm tra lại thông tin.');
                        }
                    })
                    .fail(function () {
                        errorMessage.text('Có lỗi xảy ra. Vui lòng thử lại sau.');
                    });
            }
        });
    }
</script>