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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<div class="main-login-six-do" style="background: #f8f8f8;">

    <!-- Sing in  Form -->
    <section class="sign-in">
        <div class="container">
            <div class="signin-content">
                <div class="signin-image">
                    <figure>
                        <img src="/static/css/login-regester-onl/images/signin-image.jpg" alt="sing up image"/>
                    </figure>
                    <a href="/sixdo-shop/register-customer" class="signup-image-link" style="font-size: 17px">Tạo tài
                        khoản</a>
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
                        <a href="#" data-toggle="modal" data-target="#forgotPasswordModal"
                           class="forgot-password-link" style=".forgot-password-link:hover{color: red}">Quên mật
                            khẩu?</a>
                    </form>
<%--                    <div class="social-login">--%>
<%--                        <span class="social-label">Hoặc đăng nhập với</span>--%>
<%--                        <ul class="socials">--%>
<%--                            <li>--%>
<%--                                <a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Modal -->
<div class="modal fade" id="forgotPasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Quên mật khẩu</h5>
                <button type="button" id="closeModalSendMail" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Nhập email của bạn để lấy lại mật khẩu.</p>
                <form>
                    <div class="form-group">
                        <input type="email" class="form-control" id="js-email-qmk" placeholder="Nhập email của bạn">
                    </div>
                    <div id="email-error-message" style="color: red; margin-bottom: 10px;margin-left: 3px;"></div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <div class="d-grid gap-2 col-6 mx-auto">
                    <%--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>--%>
                    <button type="button" class="btn btn-primary" id="btn-modal-quen-mat-khau"><i
                            class="bi bi-send"></i>
                        Gửi
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>
    $(document).ready(function () {
        $("#logo-header").hide();
        $(".js-show-modal-search").hide();
        checkLogin();
        quenMatKhau();
    });


    function quenMatKhau() {
        $('#btn-modal-quen-mat-khau').click(function (event) {
            var email = $('#js-email-qmk').val();
            var errorMessage = $('#email-error-message');
            var hasError = true;
            if (email.trim() === '') {
                errorMessage.text('Email không được để trống!');
                hasError = false;
                return false;
            } else {
                errorMessage.text('');
            }
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                errorMessage.text('Vui lòng nhập đúng định dạng email.');
                hasError = false;
                return false;
            } else {
                errorMessage.text('');
            }

            if (hasError) {
                $.ajax({
                    type: 'POST',
                    url: '/buyer-register/checkMail',
                    data: {email: email},
                    success: function (data) {
                        if (!data) {
                            errorMessage.text('Email không tồn tại trong hệ thống.');
                            hasError = false;
                            return false;
                        } else {
                            errorMessage.text('');
                        }
                        sendMailToCusstomer(email, hasError);
                    },
                    error: function () {
                        console.log('Có lỗi xảy ra. Vui lòng thử lại sau.');
                    }
                });
            }
        });
    }

    function sendMailToCusstomer(email, hasError) {
        if (hasError) {
            Swal.fire({
                title: 'Bạn muốn gửi email để đặt lại mật khẩu không?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Gửi',
                cancelButtonText: 'Hủy',
            }).then((result) => {
                if (result.isConfirmed) {
                    // Hiển thị loading indicator
                    Swal.fire({
                        title: 'Đang gửi email...',
                        text: 'Vui lòng chờ đợi',
                        allowOutsideClick: false,
                        showConfirmButton: false,
                        onBeforeOpen: () => {
                            Swal.showLoading();
                        }
                    });

                    $('#closeModalSendMail').trigger('click');
                    $.ajax({
                        type: 'POST',
                        url: '/buyer-forget/sendMailForgetPassword',
                        data: {email: email},
                        success: function (data) {
                            // Đóng loading indicator
                            Swal.close();

                            Swal.fire('Thành công', 'Vui lòng kiểm tra email để nhận hướng dẫn', 'success');
                        },
                        error: function () {
                            // Đóng loading indicator
                            Swal.close();

                            Swal.fire('Lỗi', 'Có lỗi xảy ra. Vui lòng thử lại sau.', 'error');
                        }
                    });
                }
            });
        }
    }

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