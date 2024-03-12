<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>

    document.addEventListener('DOMContentLoaded', function () {
        var editButtons = document.querySelectorAll('.btn-modal-xoa');
        editButtons.forEach(function (button) {
            button.addEventListener('click', function () {
                Swal.fire({
                    title: "Bạn có chắc chắn không?",
                    // text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    reverseButtons: true,
                    confirmButtonColor: "#377907",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Vâng, xoá nó.",
                    cancelButtonText: "Huỷ"
                }).then((result) => {
                    if (result.isConfirmed) {
                        var id = this.getAttribute('data-id-xoa');
                        $.ajax({
                            type: "POST",
                            url: '/san-pham/delete',
                            data: {idSanPham: id},
                            success: function (response) {
                                Swal.fire({
                                    icon: "success",
                                    title: "Sản phẩm của bạn đã được xoá",
                                    showConfirmButton: false,
                                    timer: 1500
                                });
                                window.location.href = '/san-pham';
                            },
                            error: function (xhr, status, error) {
                                console.error("Error:", error);
                            }
                        });
                    }
                });
            });
        });
    });

</script>