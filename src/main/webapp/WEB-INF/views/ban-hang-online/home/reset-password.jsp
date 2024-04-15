<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Đặt lại mật khẩu | SIXDO</title>
    <link rel="Website Icon" type="png" href="../static/images/icon/LOGOSIXDO.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!====================================-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">

    <!-- Linearicons CSS -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hamburgers/1.1.3/hamburgers.min.css">

    <!-- Animsition CSS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animsition/3.2.1/js/animsition.min.js"></script>

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css">

    <!-- DateRangePicker CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker@3.0.3/daterangepicker.css">

    <!-- Slick Carousel CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Perfect Scrollbar CSS -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/1.5.0/css/perfect-scrollbar.min.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Animsition -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animsition/4.0.2/js/animsition.min.js"></script>

    <!-- Bootstrap Popper.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.1/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Select2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>


    <style>

        <%@include file="../../../views/ban-hang-online/css/main.css" %>
        <%@include file="../../../views/ban-hang-online/css/util.css" %>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container-qmk {
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            box-sizing: border-box;
        }

        h2 {
            margin-top: 0;
            color: #333;
            text-align: center;
        }

        .input-field {
            width: 100%;
            padding: 12px;
            margin: 11px 0 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        .input-field:focus {
            border-color: #4CAF50;
        }

        .submit-btn {
            margin-top: 14px;
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: block;
            text-align: center;
            text-decoration: none;
        }

        .submit-btn:hover {
            background-color: #45a049;
        }

        .message {
            text-align: center;
            color: #777;
            margin-bottom: 20px;
        }

        .email-info {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .login-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
            text-decoration: none;
        }

        .login-link:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            font-size: 0.8em;
        }
    </style>
</head>


<body class="animsition">
<%--header--%>
<jsp:include page="/WEB-INF/views/ban-hang-online/components/hd.jsp"/>
<%--header--%>

<!-- Cart -->
<jsp:include page="/WEB-INF/views/ban-hang-online/components/cart.jsp"/>

<div class="container-qmk">
    <h2>Đặt lại mật khẩu - Email</h2>
    <%--    <p class="email-info">Địa chỉ email: <strong id="email-placeholder"></strong></p>--%>
    <p class="message">Vui lòng nhập mật khẩu mới để đặt lại mật khẩu cho tài khoản của bạn</p>
    <form id="reset-password-form">
        <input type="password" id="new-password-qmk" class="input-field" name="new-password"
               placeholder="Nhập mật khẩu mới">
        <div id="new-password-error" class="error-message"></div>
        <input type="password" id="confirm-password-qmk" class="input-field" name="confirm-password"
               placeholder="Xác nhận mật khẩu mới" oninput="checkPasswordMatch()">
        <div id="confirm-password-error" class="error-message"></div>
        <button type="button" class="submit-btn" id="btn-submit-qmk">Đặt lại mật khẩu</button>
    </form>
    <a href="http://localhost:8080/sixdo-shop/login-customer" class="login-link">Trở về đăng nhập</a>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

    function thongBaoVideo() {
        var emailPlaceholder = document.querySelector('#email-placeholder');
        var email = $('#email-token-send').val();
        var maskedEmail = email.replace(/(.{6})(.*)(?=@)/, function (match, p1, p2) {
            console.log(maskedEmail);
            console.log(email);
            return p1 + p2.replace(/./g, '*');
        });
        emailPlaceholder.textContent = maskedEmail;
    }


    function checkPasswordMatch() {
        var newPassword = document.getElementById('new-password-qmk').value;
        var confirmPassword = document.getElementById('confirm-password-qmk').value;
        var confirmPasswordError = document.getElementById('confirm-password-error');
        var newPasswordError = document.getElementById('new-password-error');
        if (newPassword.trim() === '') {
            newPasswordError.textContent = 'Mật khẩu mới không được để trống';
        } else {
            newPasswordError.textContent = '';
        }


        if (newPassword !== confirmPassword) {
            confirmPasswordError.textContent = 'Mật khẩu xác nhận không khớp';
        } else {
            confirmPasswordError.textContent = '';
        }
    }

    $('#btn-submit-qmk').click(function (event) {
        var newPassword = document.getElementById('new-password-qmk').value;
        var confirmPassword = document.getElementById('confirm-password-qmk').value;
        var newPasswordError = document.getElementById('new-password-error');
        var confirmPasswordError = document.getElementById('confirm-password-error');

        if (newPassword.trim() === '' || confirmPassword.trim() === '') {
            if (newPassword.trim() === '') {
                newPasswordError.textContent = 'Mật khẩu mới không được để trống';
            } else {
                newPasswordError.textContent = '';
            }

            if (confirmPassword.trim() === '') {
                confirmPasswordError.textContent = 'Mật khẩu xác nhận không được để trống';
            } else {
                confirmPasswordError.textContent = '';
            }
            return;
        }

        if (newPassword !== confirmPassword) {
            confirmPasswordError.textContent = 'Mật khẩu xác nhận không khớp';
            return;
        }

        const urlParams = new URLSearchParams(window.location.search);
        const token = urlParams.get('token');
        editPassword(token, newPassword);


    });

    function editPassword(token, password) {
        Swal.fire({
            title: "Bạn chắc chắn với mật khẩu này chưa?",
            text: "Mật khẩu của bạn sẽ được thay đổi!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Đổi mật khẩu",
            cancelButtonText: "Hủy",
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            reverseButtons: true,
        }).then((willChange) => {
            if (willChange.isConfirmed) {
                $.ajax({
                    type: 'POST',
                    url: '/sixdo-shop/buyer-forget/reset-password',
                    data: {
                        token: token,
                        password: password
                    },
                    success: function (data) {
                        if (data) {
                            Swal.fire({
                                title: "Đổi mật khẩu thành công",
                                icon: "success",
                                timer: 3000,
                                buttons: false
                            }).then(() => {
                                window.location.href = 'http://localhost:8080/sixdo-shop/login-customer';
                            });
                        } else {
                            Swal.fire({
                                title: "Đổi mật khẩu thất bại",
                                text: "Vui lòng thử lại sau.",
                                icon: "error"
                            });
                        }
                    },
                    error: function () {
                        console.log('Có lỗi xảy ra. Vui lòng thử lại sau.');
                    }
                });
            } else if (willChange.dismiss === Swal.DismissReason.cancel) {
                Swal.fire({
                    title: "Hủy thay đổi mật khẩu",
                    text: "Mật khẩu của bạn không thay đổi!",
                    icon: "info"
                });
            }
        });
    }
</script>


<!-- Footer -->
<jsp:include page="/WEB-INF/views/ban-hang-online/components/footer.jsp"/>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
</div>

<!-- QuickView -->
<jsp:include page="/WEB-INF/views/ban-hang-online/components/quick_view.jsp"/>


<!--===============================================================================================-->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/animsition/4.0.2/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script>
    $(".js-select2").each(function () {
        $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
        });
    })
</script>
<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.js"></script>

<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script type="text/javascript">
    <%@include file="../../../views/ban-hang-online/js/slick-custom.js" %>
</script>
<!--===============================================================================================-->
<script src="https://cdn.jsdelivr.net/npm/parallax100@1.1.3/parallax100.js"></script>
<script>
    $('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<!-- Sử dụng đường dẫn CDN cho jQuery Magnific Popup -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
<script>
    $('.gallery-lb').each(function () { // the containers for all your galleries
        $(this).magnificPopup({
            delegate: 'a', // the selector for gallery item
            type: 'image',
            gallery: {
                enabled: true
            },
            mainClass: 'mfp-fade'
        });
    });
</script>
<!--===============================================================================================-->
<script src="https://cdn.jsdelivr.net/npm/isotope-layout@3.0.6/dist/isotope.pkgd.min.js"></script>

<!--===============================================================================================-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.min.js"></script>


<script>

    var products; // Giả sử product là một List hoặc Array chứa dữ liệu sản phẩm


    function updatePriceQuickView(selectElement) {
        var selectedId = selectElement.value;
        var colorSelectQuickView = selectElement;

        for (var i = 0; i < colorSelectQuickView.options.length; i++) {
            if (selectedId === colorSelectQuickView.options[i].value) {
                $.ajax({
                    url: '/sixdo-shop/quick-view?',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        idProduct: selectedId
                    }),
                    success: function (response) {
                        var formattedGiaBan = gia.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                        if (selectedId === colorSelectQuickView.options[i].value) {
                            document.getElementById('price-product-quick-view').innerText = '<fmt:formatNumber value="${o.giaBan}" type="currency"/>';
                            return;
                        }


                    },
                    error: function (error) {
                        console.error("Lỗi khi thanh toán:", error);
                    }
                });


            }

        }


    }

    function updatePrice(selectElement) {
        var selectedId = selectElement.value;
        console.log("idddddđ" + selectedId)

        <c:forEach var="o" items="${product}" varStatus="loop">
        if (selectedId == ${o.id}) {
            console.log("day roi " +${o.giaBan})
            document.getElementById('product-price').innerText = '<fmt:formatNumber value="${o.giaBan}" type="currency"/>';
            var newImagePath = "${pageContext.request.contextPath}/" + "${o.hinhAnh}";
            document.getElementById('product-image').src = newImagePath;


            return;
        }

        </c:forEach>


    }


    function showAlertAddCart(mess) {
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '',
            text: mess,
            showConfirmButton: false,
            timer: 1000,
            customClass: {
                container: 'swal-custom'
            }
        });
    }


    //////////
    $('.js-addwish-b2, .js-addwish-detail').on('click', function (e) {
        e.preventDefault();
    });

    $('.js-addwish-b2').each(function () {
        var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
        $(this).on('click', function () {
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-b2');
            $(this).off('click');
        });
    });

    $('.js-addwish-detail').each(function () {
        var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

        $(this).on('click', function () {
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-detail');
            $(this).off('click');
        });
    });

    /*---------------------------------------------*/


</script>
<!--===============================================================================================-->
<script src="https://cdn.jsdelivr.net/npm/perfect-scrollbar@1.5.0/dist/perfect-scrollbar.min.js"></script>
<script>
    $('.js-pscroll').each(function () {
        $(this).css('position', 'relative');
        $(this).css('overflow', 'hidden');
        var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
        });

        $(window).on('resize', function () {
            ps.update();
        })
    });


</script>
<!--===============================================================================================-->
<script type="text/javascript">
    <%@include file="../../../views/ban-hang-online/js/main.js" %>
</script>

</body>
</html>