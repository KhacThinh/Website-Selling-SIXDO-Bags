<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<%--    <link rel="stylesheet" href="style.css">--%>
    <title>Modern Login Page | AsmrProg</title>
</head>

<script>
    function showAlert() {
        var message = "${not empty tbtb}";

        if (message.trim() !== "") {
            alert("email này đã tồn tại!");
        }
    }


</script>


<body  >


<div class="container" id="container">
    <div class="form-container sign-up">
        <form action="/user" method="post" onsubmit="return validateForm()" >
            <h1>Tạo tài khoản</h1>
            <div class="social-icons">
                <!-- social icons here -->
            </div>
            <span>Hãy sử dụng email của bạn để đăng ký</span>
            <input type="text" id="fullName" name="ten" value="${ten}" placeholder="Full Name">
            <span id="nameError" style="color: red; display: none;">Tên chỉ được chứa các ký tự chữ cái!</span>
            <input type="email" id="email" name="email" value="${email}"  placeholder="Email">
            <c:if test="${not empty tbtb}">
                <script>
                    showAlert();
                </script>
                <span style="color: red">${tbtb}</span>
            </c:if>
            <span id="emailError" style="color: red; display: none;">Email không được trống hoặc không hợp lệ!</span>
            <input type="text" id="address" name="diaChi" value="${diaChi}"placeholder="Address">
            <span id="addressError" style="color: red; display: none;">Địa chỉ không được để trống!</span>
            <input type="password" id="pass" name="pass" value="${pass}" placeholder="Password">
            <span id="passError" style="color: red; display: none;">Mật khẩu ít nhất 6 kí tự và phải chứa cả chữ và số!</span>
            <input type="password" id="confirm" name="confirm" value="${confirm}" placeholder="Confirm Password">
            <span id="confirmError" style="color: red; display: none;">Xác nhận mật khẩu không khớp!</span>
            <button type="submit">Đăng ký</button>
<%--            <c:if test="${not empty tb}">--%>
<%--                <script>--%>
<%--                    showAlert1();--%>
<%--                </script>--%>
<%--            </c:if>--%>

            <c:if test="${not empty tb}">
                <script>
                    // JavaScript function to display custom alert
                    function showAlert1() {
                        var message = "${tb}"; // Lấy giá trị từ biến "tb" và gán vào biến message

                        if (message.trim() !== "") {
                            var alertBox = document.createElement("div"); // Tạo một div mới
                            alertBox.classList.add("custom-alert", "red-text"); // Thêm class cho div (ở đây là class red-text để chỉ định màu đỏ)
                            alertBox.innerHTML = "<p>&nbsp;</p><p>" + message + "</p>"; // Thiết lập nội dung của div

                            document.body.appendChild(alertBox); // Thêm div vào trang

                            setTimeout(function(){ alertBox.style.display = "none"; }, 5000); // Ẩn sau 3 giây
                        }
                    }

                    // Gọi hàm showAlert1() khi cần hiển thị alert
                    showAlert1();
                </script>
            </c:if>



        </form>

        <script>
            function validateForm() {
                var fullName = document.getElementById("fullName").value.trim();
                var email = document.getElementById("email").value.trim();
                var address = document.getElementById("address").value.trim();
                var pass = document.getElementById("pass").value.trim();
                var confirmPass = document.getElementById("confirm").value.trim();
                var nameErrorSpan = document.getElementById("nameError");
                var emailErrorSpan = document.getElementById("emailError");
                var addressErrorSpan = document.getElementById("addressError");
                var passErrorSpan = document.getElementById("passError");
                var confirmErrorSpan = document.getElementById("confirmError");
                var namePattern = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚÝàáâãèéêìíòóôõùúýĂăĐđĨĩŨũƠơƯưẠạẢảẤấẦầẨẩẪẫẬậẮắẰằẲẳẴẵẶặẸẹẺẻẼẽẾếỀềỂểỄễỆệỈỉỊịỌọỎỏỐốỒồỔổỖỗỘộỚớỜờỞởỠỡỢợỤụỦủỨứỪừỬửỮữỰựỲỳỴỵỶỷỸỹ ~]+$/;
                var passPattern = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;

                if (!fullName || !fullName.match(namePattern)) {
                    nameErrorSpan.style.display = "block";
                    return false;
                } else {
                    nameErrorSpan.style.display = "none";
                }

                if (!email || !validateEmail(email)) {
                    emailErrorSpan.style.display = "block";
                    return false;
                } else {
                    emailErrorSpan.style.display = "none";
                }

                if (!address) {
                    addressErrorSpan.style.display = "block";
                    return false;
                } else {
                    addressErrorSpan.style.display = "none";
                }

                if (!pass || !pass.match(passPattern)) {
                    passErrorSpan.style.display = "block";
                    return false;
                } else {
                    passErrorSpan.style.display = "none";
                }

                if (!confirmPass) {
                    confirmErrorSpan.style.display = "block";
                    return false;
                } else if (pass !== confirmPass) {
                    confirmErrorSpan.style.display = "block";
                    return false;
                } else {
                    confirmErrorSpan.style.display = "none";
                }

                // Thực hiện các kiểm tra khác nếu cần

                return true; // Submit form nếu tất cả điều kiện đều đúng
            }

            function validateEmail(email) {
                var re = /\S+@\S+\.\S+/;
                return re.test(email);
            }



        </script>





    </div>
    <div class="form-container sign-in">
        <form>
            <h1>Đăng nhập</h1>
            <div class="social-icons">
                <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
            </div>
            <span>hoặc sử dụng mật khẩu email của bạn</span>
            <input type="email" placeholder="Email">
            <input type="password" placeholder="Password">
            <a href="/lay-mk">Quên mật khẩu?</a>
            <button>Đăng Nhập</button>
        </form>
    </div>
    <div class="toggle-container">
        <div class="toggle">
            <div class="toggle-panel toggle-left">
                <h1>Xin chào đến với SIXDO!</h1>
                <p>Nhập thông tin cá nhân của bạn để sử dụng tất cả các tính năng của trang web</p>
                <button class="hidden" id="login">Đăng Nhập</button>
            </div>
            <div class="toggle-panel toggle-right">
                <h1>Xin chào bạn!</h1>
                <p>Đăng ký với thông tin cá nhân của bạn để sử dụng tất cả các tính năng của trang web</p>
                <button class="hidden" id="register">Đăng ký</button>
            </div>
        </div>
    </div>
</div>


<script>
    const container = document.getElementById('container');
    const registerBtn = document.getElementById('register');
    const loginBtn = document.getElementById('login');

    registerBtn.addEventListener('click', () => {
        container.classList.add("active");
    });

    loginBtn.addEventListener('click', () => {
        container.classList.remove("active");
    });
</script>
</body>

<style>
*{
margin: 0;
padding: 0;
box-sizing: border-box;
font-family: 'Montserrat', sans-serif;
}

body{
background-color: #c9d6ff;
background: linear-gradient(to right, #e2e2e2, #c9d6ff);
display: flex;
align-items: center;
justify-content: center;
flex-direction: column;
height: 100vh;
}

.container{
background-color: #fff;
border-radius: 30px;
box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
position: relative;
overflow: hidden;
width: 768px;
max-width: 100%;
min-height: 480px;
}

.container p{
font-size: 14px;
line-height: 20px;
letter-spacing: 0.3px;
margin: 20px 0;
}
.red-text {
    color: red;
}


.container span{
font-size: 12px;
}

.container a{
color: #333;
font-size: 13px;
text-decoration: none;
margin: 15px 0 10px;
}

.container button{
background-color: #512da8;
color: #fff;
font-size: 12px;
padding: 10px 45px;
border: 1px solid transparent;
border-radius: 8px;
font-weight: 600;
letter-spacing: 0.5px;
text-transform: uppercase;
margin-top: 10px;
cursor: pointer;
}

.container button.hidden{
background-color: transparent;
border-color: #fff;
}

.container form{
background-color: #fff;
display: flex;
align-items: center;
justify-content: center;
flex-direction: column;
padding: 0 40px;
height: 100%;
}

.container input{
background-color: #eee;
border: none;
margin: 8px 0;
padding: 10px 15px;
font-size: 13px;
border-radius: 8px;
width: 100%;
outline: none;
}

.form-container{
position: absolute;
top: 0;
height: 100%;
transition: all 0.6s ease-in-out;
}

.sign-in{
left: 0;
width: 50%;
z-index: 2;
}

.container.active .sign-in{
transform: translateX(100%);
}

.sign-up{
left: 0;
width: 50%;
opacity: 0;
z-index: 1;
}

.container.active .sign-up{
transform: translateX(100%);
opacity: 1;
z-index: 5;
animation: move 0.6s;
}

@keyframes move{
0%, 49.99%{
opacity: 0;
z-index: 1;
}
50%, 100%{
opacity: 1;
z-index: 5;
}
}

.social-icons{
margin: 20px 0;
}

.social-icons a{
border: 1px solid #ccc;
border-radius: 20%;
display: inline-flex;
justify-content: center;
align-items: center;
margin: 0 3px;
width: 40px;
height: 40px;
}

.toggle-container{
position: absolute;
top: 0;
left: 50%;
width: 50%;
height: 100%;
overflow: hidden;
transition: all 0.6s ease-in-out;
border-radius: 150px 0 0 100px;
z-index: 1000;
}

.container.active .toggle-container{
transform: translateX(-100%);
border-radius: 0 150px 100px 0;
}

.toggle{
background-color: #512da8;
height: 100%;
background: linear-gradient(to right, #5c6bc0, #512da8);
color: #fff;
position: relative;
left: -100%;
height: 100%;
width: 200%;
transform: translateX(0);
transition: all 0.6s ease-in-out;
}

.container.active .toggle{
transform: translateX(50%);
}

.toggle-panel{
position: absolute;
width: 50%;
height: 100%;
display: flex;
align-items: center;
justify-content: center;
flex-direction: column;
padding: 0 30px;
text-align: center;
top: 0;
transform: translateX(0);
transition: all 0.6s ease-in-out;
}

.toggle-left{
transform: translateX(-200%);
}

.container.active .toggle-left{
transform: translateX(0);
}

.toggle-right{
right: 0;
transform: translateX(0);
}

.container.active .toggle-right{
transform: translateX(200%);
}

/* ... các quy tắc CSS giữ nguyên ... */

.container form .row {
margin-bottom: 15px;
}







</style>

</html>