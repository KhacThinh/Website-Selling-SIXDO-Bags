<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    body {
        background: rgb(99, 39, 120);
    }

    .form-control:focus {
        box-shadow: none;
        border-color: #ba68c8;
    }

    .profile-button {
        background: rgb(99, 39, 120);
        box-shadow: none;
        border: none;
    }

    .profile-button:hover {
        background: #682773;
    }

    .profile-button:focus {
        background: #682773;
        box-shadow: none;
    }

    .profile-button:active {
        background: #682773;
        box-shadow: none;
    }

    .back:hover {
        color: #682773;
        cursor: pointer;
    }

    .labels {
        font-size: 14px;
    }

    .labels-gioi-tinh {
        font-size: 14px;
        margin-top: 8px;
    }

    .add-experience:hover {
        background: #ba68c8;
        color: #fff;
        cursor: pointer;
        border: solid 1px #ba68c8;
    }

    .modal-profile-customer {
        margin-top: 60px;
    }


</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>

<!-- Modal -->
<div class="modal fade modal-profile-customer" id="exampleModalProfile" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-body">
                <div class="container rounded bg-white">
                    <div class="row">
                        <div class="col-md-3 border-right">
                            <div class="d-flex flex-column align-items-center text-center">
                                <img class="rounded-circle mt-5" width="150px" id="js-rounded-circle-avt"
                                     src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"/>
                                <span class="font-weight-bold mt-3" id="ten-profile-mac-dinh"></span>
                                <span class="text-black-50" id="email-profile-mac-dinh"></span>
                            </div>
                        </div>
                        <div class="col-md-5 border-right">
                            <div class="p-3" id="information-profile-show">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h3 class="text-right">Thông tin cá nhân</h3>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Họ và Tên <span style="color: red">*</span></label>
                                        <input type="text" class="form-control" placeholder="họ và tên"
                                               id="js-profile-ten"/>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels-gioi-tinh">Giới Tính</label>
                                        <div class="d-flex flex-row">
                                            <div class="form-check me-3">
                                                <input class="form-check-input" type="radio"
                                                       name="gender" id="nam"
                                                       value="1">
                                                <label class="labels" for="nam">Nam</label>
                                            </div>
                                            <div class="form-check me-3">
                                                <input class="form-check-input" type="radio"
                                                       name="gender"
                                                       id="nu" value="0">
                                                <label class="labels" for="nu">Nữ</label>
                                            </div>
                                            <div class="form-check me-3">
                                                <input class="form-check-input" type="radio"
                                                       name="gender"
                                                       id="khong-chon" value="2" checked>
                                                <label class="labels" for="khong-chon">Không chọn</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-6">
                                        <%--                                        <span style="color: red">*</span>--%>
                                        <label class="labels">Số điện thoại </label>
                                        <input type="text" class="form-control" placeholder="số điện thoại"
                                               id="js-profile-sdt"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="labels">Ngày sinh</label>
                                        <input type="date" class="form-control" id="js-profile-ngaySinh"
                                               placeholder="state"/>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Email <span style="color: red">*</span></label>
                                        <span class="form-control" id="js-profile-email"/>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels-gioi-tinh">Ảnh</label>
                                        <input type="file" class="form-control"
                                               id="js-profile-hinhAnh" multiple/>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels-gioi-tinh">Địa Chỉ</label>
                                        <input type="text" class="form-control" placeholder="Nhập địa chỉ"
                                               id="js-profile-diaChi">
                                    </div>
                                </div>
                                <div class="mt-5 text-center">
                                    <button class="btn btn-primary profile-button" type="button"
                                            id="save-form-profile">
                                        Lưu hồ sơ
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center experience">
                                    <span>Bảo mật</span>
                                    <button class="border px-3 p-1 add-experience" id="changePasswordBtn">
                                        <i class="bi bi-caret-down-fill"></i>&nbsp;Đổi mật khẩu</button>
                                </div>
                                <br/>
                                <div class="change-password ds-none" id="changePasswordSection">

                                    <div class="col-md-12">
                                        <label class="labels">Nhập mật khẩu hiện tại</label>
                                        <input type="password" class="form-control" placeholder="Mật khẩu hiện tại"
                                               id="js-pass-word-now-pro"/>
                                    </div>
                                    <br/>
                                    <div class="col-md-12">
                                        <label class="labels">Nhập mật khẩu mới</label>
                                        <input type="password" class="form-control" placeholder="Mật khẩu mới"
                                               id="js-pass-word-moi-pro"/>
                                    </div>
                                    <br/>
                                    <div class="col-md-12">
                                        <label class="labels">Nhập lại mật khẩu</label>
                                        <input type="password" class="form-control" placeholder="Nhập lại mật khẩu"
                                               id="js-pass-word-moi-cofig-pro" oninput="checkPasswordNewProfile()"/>
                                    </div>
                                    <div class="col-md-12">
                                        <span style="color: red" id="errorsCheckProfile"></span>
                                    </div>
                                    <br/>
                                    <div class="col-md-12">
                                        <button id="confirmPasswordBtn" class="btn btn-primary">Xác nhận</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Thoát
                </button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        loadInfomationProfileCustumer();
        inputInfomationProfileCustumer();
    });

    document.addEventListener("DOMContentLoaded", function () {
        const changePasswordBtn = document.getElementById("changePasswordBtn");
        const changePasswordSection = document.getElementById("changePasswordSection");
        const confirmPasswordBtn = document.getElementById("confirmPasswordBtn");

        changePasswordBtn.addEventListener("click", function () {
            if (changePasswordSection.classList.contains("ds-none")) {
                changePasswordSection.classList.remove("ds-none");
            } else {
                changePasswordSection.classList.add("ds-none");
            }
        });

        confirmPasswordBtn.addEventListener("click", function () {
            var passwordNow = $('#js-pass-word-now-pro').val().trim();
            var passwordNew = $('#js-pass-word-moi-pro').val().trim();
            var passwordNewCofig = $('#js-pass-word-moi-cofig-pro').val().trim();

            if (passwordNow === '' || passwordNew === '' || passwordNewCofig === '') {
                errorsMessage('Không được để trống!');
                return false;
            }

            if (passwordNew.length < 8 || passwordNewCofig.length < 8) {
                errorsMessage('Mật khẩu mới phải có ít nhất 8 kí tự!');
                return false;
            }

            Swal.fire({
                title: 'Xác nhận',
                text: 'Bạn có muốn đổi mật khẩu không?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Đồng ý',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.post('/sixdo-shop/buyer-forget/reset-password-profile', {
                        password: passwordNow,
                        passwordNew: passwordNew,
                        passwordNewConfig: passwordNewCofig
                    }, function (data) {
                        if (!data) {
                            errorsMessage('Đổi mật khẩu không thành công');
                        } else {
                            changePasswordSection.classList.add("ds-none");
                            Swal.fire({
                                icon: 'success',
                                title: 'Đổi mật khẩu thành công',
                                showConfirmButton: false,
                                timer: 1500
                            })
                        }
                    })
                }
            });
        });
    });

    function checkPasswordNewProfile() {
        var passwordNew = $('#js-pass-word-moi-pro').val().trim();
        var passwordNewCofig = $('#js-pass-word-moi-cofig-pro').val().trim();
        if (passwordNew != passwordNewCofig) {
            $('#errorsCheckProfile').text("Mật khẩu không trùng khớp");
            return false;
        } else {
            $('#errorsCheckProfile').text("");
        }
    }

    function errorsMessage(massger) {
        Swal.fire({
            title: 'Lỗi',
            text: massger,
            icon: 'error'
        });
    }


    function loadInfomationProfileCustumer() {
        $.get("/product-favorite/infomation-profile-header", function (khachHang) {
            $('#ten-profile-mac-dinh').text(khachHang.tenKhachHang);
            $('#email-profile-mac-dinh').text(khachHang.email);
            $('#js-profile-ten').val(khachHang.tenKhachHang);
            $('#js-profile-sdt').val(khachHang.sdt);
            $('#js-profile-ngaySinh').val(khachHang.ngaySinh);
            $('#js-profile-email').text(khachHang.email);
            $('#js-profile-diaChi').val(khachHang.diaChi);
            if (khachHang.hinhAnh == null || khachHang.hinhAnh === '') {
                var urlHinhAnh = 'https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg';
                $('#js-rounded-circle-avt').attr('src', urlHinhAnh);
                $('#js-rounded-circle-avt-hearder').attr('src', urlHinhAnh);
            } else {
                $('#js-rounded-circle-avt').attr('src', khachHang.hinhAnh);
                $('#js-rounded-circle-avt-hearder').attr('src', '${pageContext.request.contextPath}/../' + khachHang.hinhAnh);
            }

            if (khachHang.gioiTinh == 1) {
                $('#nam').prop('checked', true);
            } else if (khachHang.gioiTinh == 0) {
                $('#nu').prop('checked', true);
            } else {
                $('#khong-chon').prop('checked', true);
            }
        });
    }


    function inputInfomationProfileCustumer() {
        document.getElementById('save-form-profile').addEventListener('click', function () {
            var ten = document.getElementById('js-profile-ten').value.trim();
            var gioiTinh = document.querySelector('input[name="gender"]:checked').value;
            var sdt = document.getElementById('js-profile-sdt').value.trim();
            var ngaySinh = document.getElementById('js-profile-ngaySinh').value.trim();
            var diaChi = document.getElementById('js-profile-diaChi').value.trim();
            var file = $('#js-profile-hinhAnh')[0].files[0];

            Swal.fire({
                title: 'Xác nhận',
                text: 'Bạn có muốn lưu thông tin không?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Đồng ý',
                cancelButtonText: 'Hủy'
            }).then((result) => {
                if (result.isConfirmed) {
                    if (sdt !== '' && !sdt.match(/^0[0-9]{9}$/)) {
                        Swal.fire({
                            title: 'Lỗi',
                            text: 'Số điện thoại không hợp lệ.',
                            icon: 'error'
                        });
                        return false;
                    }
                    if (file && file.size > 1048576 * 4) {
                        Swal.fire({
                            title: 'Lỗi',
                            text: 'Vui lòng chọn ảnh có kích thước dưới 4MB',
                            icon: 'error'
                        });
                        return false;
                    }
                    if (ten === '') {
                        Swal.fire({
                            title: 'Lỗi',
                            text: 'Vui lòng điền đầy đủ thông tin tên.',
                            icon: 'error'
                        });
                        return false;
                    }

                    // Nếu không có lỗi, gửi yêu cầu AJAX
                    var data = new FormData();
                    data.append('ten', ten);
                    data.append('gioiTinh', gioiTinh);
                    data.append('sdt', sdt);
                    data.append('ngaySinh', ngaySinh);
                    data.append('diaChi', diaChi);
                    if (file) {
                        data.append('hinhAnh', file);
                    }

                    $.ajax({
                        url: '/product-favorite/input-infomation-profile-header',
                        data: data,
                        cache: false,
                        contentType: false,
                        processData: false,
                        method: 'POST',
                        success: function (data) {
                            if (data == 1) {
                                loadInfomationProfileCustumer();
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Lưu Thành Công',
                                    showConfirmButton: false,
                                    timer: 1500
                                }).then(function () {
                                    location.reload();
                                });

                            } else {
                                Swal.fire({
                                    icon: 'warning',
                                    title: 'Lưu Thất Bại',
                                    showConfirmButton: false,
                                    timer: 1500
                                });
                                console.error("Lỗi không sửa được thông tin khách hàng");
                            }
                        }
                    });
                }
            });
        });
    }

</script>