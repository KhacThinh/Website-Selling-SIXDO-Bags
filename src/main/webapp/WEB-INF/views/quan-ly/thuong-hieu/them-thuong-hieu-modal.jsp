<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Modal -->
<div class="modal modal-xl" id="addModelThuongHieu" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Thông Tin Sản Phẩm</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form:form method="POST" action="${ action }" id="myForm" modelAttribute="TH"
                           enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6">

                        <div class="form-group">

                            <label for="">Mã</label>
                            <form:input path="ma" id="ma" class="form-control"/>
                        </div>

                    </div>
                    <div class="col-md-6">

                        <div class="form-group">
                            <label for="">Tên</label>
                            <form:input path="ten" id="ten" class="form-control"/>
                        </div>

                    </div>

                </div>


                </div>

            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>

                <button type="submit" class="btn btn-primary" id="them"  value="Submit"  >Lưu</button>
            </div>
            </form:form>
        </div>
    </div>

</div>
<%--modal bao them that bai--%>
<div class="modal fade" id="errorModal" style="color: #0abf30">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                Thêm thất bại
                <div id="error-message"></div>
            </div>

        </div>
    </div>
</div>

<script>
    document.getElementById("myForm").addEventListener("submit", function(event) {
        event.preventDefault(); // Prevent form submission

        var ma = document.getElementById("ma").value.trim();
        var ten = document.getElementById("ten").value.trim();
        var errorMessage = "Yêu cầu nhập:";

        if (ma === "") {
            errorMessage += "<span style='color: red;'> Mã, </span> ";
        }
        if (ten === "") {
            errorMessage += "<span style='color: red;'> Tên </span> ";
        }
        var errorDiv = document.getElementById("error-message");
        errorDiv.innerHTML = errorMessage;
        if (errorMessage !== "Yêu cầu nhập:") {
            $('#errorModal').modal('show');

            return false;
        } else {
            this.submit();
        }
    });



</script>
