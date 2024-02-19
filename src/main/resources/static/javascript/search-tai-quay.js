// document.addEventListener('DOMContentLoaded', function() {
//     document.getElementById('searchInput').addEventListener('input', function() {
//         var searchTerm = this.value.toLowerCase();
//         var rows = document.querySelectorAll('.info');
//         rows.forEach(function(row) {
//             var productName = row.querySelector('.price').textContent.toLowerCase();
//             if (productName.includes(searchTerm)) {
//                 row.style.display = 'table-row';
//             } else {
//                 row.style.display = 'none';
//             }
//         });
//     });
// });

// function searchProduct() {
//     var keyword = document.getElementById("searchInput").value;
//     // Gửi yêu cầu tìm kiếm bằng Ajax
//     $.ajax({
//         url: 'http://localhost:8080/ban-tai-quay/search',
//         type: 'POST',
//         data: {
//             name: keyword
//         },
//         success: function (data) {
//             // Xử lý kết quả tìm kiếm
//             // Ví dụ: cập nhật danh sách sản phẩm tìm kiếm trên giao diện
//             updateProductList(data);
//         },
//         error: function (xhr, status, error) {
//             console.error(error);
//             // Xử lý lỗi nếu có
//         }
//     });
// }
//
// // Hàm cập nhật danh sách sản phẩm tìm kiếm trên giao diện
// function updateProductList(products) {
//     var productList = document.querySelector('.list');
//     productList.innerHTML = '';
//
//     products.forEach(function (product) {
//         var productHTML = '<div class="item">' +
//             '<img src="img/ok.jpg">' +
//             '<div class="info">' +
//             '<div class="name">' + product.sanPham.tenSanPham + '</div>' +
//             '<div class="price">' + product.mauSac.tenMauSac + '</div>' +
//             '</div>' +
//             '<div class="quantity">' + product.soLuong + '</div>' +
//             '<div class="returnPrice">' + product.giaBan + '</div>' +
//             '<button class="btnAdd" onclick="addToCart(this)" data-product-id="' + product.id + '">Add</button>' +
//             '</div>';
//         productList.insertAdjacentHTML('beforeend', productHTML);
//     });
// }



