<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Font Icon -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">

<link rel="stylesheet" type="text/css" href="/static/css/login-regester-onl/style.css">

<div class="main-login-six-do" style="background: #f8f8f8;">
    <!-- Sign up form -->
    <section class="signup">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">Đăng ký</h2>
                    <form class="register-form" id="register-form">
                        <div class="error-message" id="error-name" style="color: red;"></div>
                        <div class="form-group">
                            <label for="js-name-dk"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="name" id="js-name-dk" placeholder="Nhập họ tên của bạn"/>
                        </div>
                        <div class="error-message" id="error-email" style="color: red;"></div>
                        <div class="form-group">
                            <label for="js-email-dk"><i class="zmdi zmdi-email"></i></label>
                            <input type="text" name="email" id="js-email-dk" placeholder="abc@gmail.com"/>
                        </div>
<%--                        <div class="form-group">--%>
<%--                            <label for="js-sdt-dk"><i class="fa fa-phone"></i></label>--%>
<%--                            <input type="text" name="email" id="js-sdt-dk" placeholder="Nhập số điện thoại"/>--%>
<%--                        </div>--%>
                        <div class="error-message" id="error-pass" style="color: red;"></div>
                        <div class="form-group">
                            <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="pass" id="pass" placeholder="Mật khẩu"/>
                        </div>
                        <div class="form-group">
                            <label for="re_pass"><i class="zmdi zmdi-lock-outline"></i></label>
                            <input type="password" name="re_pass" id="re_pass" oninput="checkPassword()"
                                   placeholder="Lặp lại mật khẩu"/>
                        </div>
                        <div class="error-message" id="error-repass" style="color: red;"></div>
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term"/>
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>Tôi đồng ý tất cả
                                các tuyên bố trong
                                <a href="https://policies.google.com/terms?hl=vi" class="term-service">Điều khoản dịch vụ</a></label>
                            <span class="error-message" id="error-agree-term" style="color: red;"></span>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" class="form-submit" value="Đăng ký"/>
                        </div>
                    </form>
                </div>
                <div class="signup-image">
                    <figure>
                        <img src="/static/css/login-regester-onl/images/signup-image.jpg" alt="sing up image"/>
                    </figure>
                    <a href="/sixdo-shop/login-customer" class="signup-image-link" id="back-to-login" style="font-size: 17px">Quay trở lại trang Login</a>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Thêm thư viện SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    $(document).ready(function () {
        $("#logo-header").hide();
        $(".js-show-modal-search").hide();
        createRegister();
    });

    function createRegister() {
        $('#register-form').submit(function (event) {
            event.preventDefault(); // Ngăn chặn hành động mặc định của sự kiện submit form

            var name = $('#js-name-dk').val();
            var email = $('#js-email-dk').val();
            var password = $('#pass').val();
            var rePassword = $('#re_pass').val();
            var nameError = $('#error-name');
            var emailError = $('#error-email');
            var passwordError = $('#error-pass');
            var rePasswordError = $('#error-repass');
            var agreeTerm = $('#agree-term');
            var agreeTermError = $('#error-agree-term');

            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            var check = false;

            if (!name.trim()) {
                nameError.text('Tên không được để trống hoặc chứa ký tự trắng.');
                check = true;
            } else {
                nameError.text('');
            }

            if (!email.trim()) {
                emailError.text('Email không được để trống.');
                check = true;
            } else if (!emailPattern.test(email)) {
                emailError.text('Email không hợp lệ.');
                check = true;
            } else {
                emailError.text('');
            }

            if (!password.trim() || !rePassword.trim()) {
                passwordError.text('Mật khẩu không được để trống hoặc chỉ chứa khoảng trắng.');
                check = true;
            } else if (password.length < 6) {
                passwordError.text('Mật khẩu phải có ít nhất 6 ký tự.');
                check = true;
            } else {
                passwordError.text('');
            }

            if (!agreeTerm.prop('checked')) {
                agreeTermError.text('Bạn cần đồng ý với các điều khoản và điều kiện.');
                check = true;
            } else {
                agreeTermError.text('');
            }

            if (!check) {
                $.ajax({
                    type: 'POST',
                    url: '/buyer-register/check',
                    data: { tenKhachHang: name, email: email, password: password },
                    success: function (data) {
                        if (data) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Đăng ký tài khoản thành công!',
                                showConfirmButton: false,
                                timer: 1500
                            });
                            window.location.href = 'http://localhost:8080/sixdo-shop/login-customer';
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Đăng ký tài khoản thất bại!',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }
                    },
                    error: function () {
                        console.log('Có lỗi xảy ra. Vui lòng thử lại sau.');
                    }
                });
            }
        });
    }


    function checkPassword() {
        var password = document.getElementById('pass').value;
        var rePassword = document.getElementById('re_pass').value;
        var passwordError = document.getElementById('error-repass');

        if (password !== rePassword) {
            passwordError.textContent = 'Mật khẩu không khớp.';
        } else {
            passwordError.textContent = '';
        }
    }

</script>