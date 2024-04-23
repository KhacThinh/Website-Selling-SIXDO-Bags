(function ($) {
        "use strict";

        /*[ Load page ]
        ===========================================================*/
        $(".animsition").animsition({
            inClass: 'fade-in',
            outClass: 'fade-out',
            inDuration: 1500,
            outDuration: 800,
            linkElement: '.animsition-link',
            loading: true,
            loadingParentElement: 'html',
            loadingClass: 'animsition-loading-1',
            loadingInner: '<div class="loader05"></div>',
            timeout: false,
            timeoutCountdown: 5000,
            onLoadEvent: true,
            browser: ['animation-duration', '-webkit-animation-duration'],
            overlay: false,
            overlayClass: 'animsition-overlay-slide',
            overlayParentElement: 'html',
            transition: function (url) {
                window.location.href = url;
            }
        });

        /*==================================================================


        /*[ Back to top ]
        ===========================================================*/
        var windowH = $(window).height() / 2;

        $(window).on('scroll', function () {
            if ($(this).scrollTop() > windowH) {
                $("#myBtn").css('display', 'flex');
            } else {
                $("#myBtn").css('display', 'none');
            }
        });

        $('#myBtn').on("click", function () {
            $('html, body').animate({scrollTop: 0}, 300);
        });


        /*==================================================================
        [ Fixed Header ]*/
        var headerDesktop = $('.container-menu-desktop');
        var wrapMenu = $('.wrap-menu-desktop');

        if ($('.top-bar').length > 0) {
            var posWrapHeader = $('.top-bar').height();
        } else {
            var posWrapHeader = 0;
        }
        $('.quantity-add-product-down').on('click', function () {
            var numProduct = Number($(this).next().val());
            if (numProduct > 0) $(this).next().val(numProduct - 1);
        });

        $('.quantity-add-product-up').on('click', function () {
            var numProduct = Number($(this).prev().val());
            $(this).prev().val(numProduct + 1);
        });

        if ($(window).scrollTop() > posWrapHeader) {
            $(headerDesktop).addClass('fix-menu-desktop');
            $(wrapMenu).css('top', 0);
        } else {
            $(headerDesktop).removeClass('fix-menu-desktop');
            $(wrapMenu).css('top', posWrapHeader - $(this).scrollTop());
        }

        $(window).on('scroll', function () {
            if ($(this).scrollTop() > posWrapHeader) {
                $(headerDesktop).addClass('fix-menu-desktop');
                $(wrapMenu).css('top', 0);
            } else {
                $(headerDesktop).removeClass('fix-menu-desktop');
                $(wrapMenu).css('top', posWrapHeader - $(this).scrollTop());
            }
        });


        /*==================================================================
        [ Menu mobile ]*/
        $('.btn-show-menu-mobile').on('click', function () {
            $(this).toggleClass('is-active');
            $('.menu-mobile').slideToggle();
        });

        var arrowMainMenu = $('.arrow-main-menu-m');

        for (var i = 0; i < arrowMainMenu.length; i++) {
            $(arrowMainMenu[i]).on('click', function () {
                $(this).parent().find('.sub-menu-m').slideToggle();
                $(this).toggleClass('turn-arrow-main-menu-m');
            })
        }

        $(window).resize(function () {
            if ($(window).width() >= 992) {
                if ($('.menu-mobile').css('display') == 'block') {
                    $('.menu-mobile').css('display', 'none');
                    $('.btn-show-menu-mobile').toggleClass('is-active');
                }

                $('.sub-menu-m').each(function () {
                    if ($(this).css('display') == 'block') {
                        $(this).css('display', 'none');
                        $(arrowMainMenu).removeClass('turn-arrow-main-menu-m');
                    }
                });

            }
        });


        /*==================================================================
        [ Show / hide modal search ]*/
        // $('.js-show-modal-search').on('click', function () {
        //     $('.modal-search-header').addClass('show-modal-search');
        //     $(this).css('opacity', '0');
        // });
        //
        // $('.js-hide-modal-search').on('click', function () {
        //     $('.modal-search-header').removeClass('show-modal-search');
        //     $('.js-show-modal-search').css('opacity', '1');
        // });

        $('.container-search-header').on('click', function (e) {
            e.stopPropagation();
        });


        /*==================================================================
        [ Isotope ]*/
        var $topeContainer = $('.isotope-grid');
        var $filter = $('.filter-tope-group');

        // filter items on button click
        $filter.each(function () {
            $filter.on('click', 'button', function () {
                var filterValue = $(this).attr('data-filter');
                $topeContainer.isotope({filter: filterValue});
            });

        });

        // init Isotope
        $(window).on('load', function () {
            var $grid = $topeContainer.each(function () {
                $(this).isotope({
                    itemSelector: '.isotope-item',
                    layoutMode: 'fitRows',
                    percentPosition: true,
                    animationEngine: 'best-available',
                    masonry: {
                        columnWidth: '.isotope-item'
                    }
                });
            });
        });

        var isotopeButton = $('.filter-tope-group button');

        $(isotopeButton).each(function () {
            $(this).on('click', function () {
                for (var i = 0; i < isotopeButton.length; i++) {
                    $(isotopeButton[i]).removeClass('how-active1');
                }

                $(this).addClass('how-active1');
            });
        });

        /*==================================================================
        [ Filter / Search product ]*/
        $('.js-show-filter').on('click', function () {

            $(this).toggleClass('show-filter');
            $('.panel-filter').slideToggle(400);

            if ($('.js-show-search').hasClass('show-search')) {
                $('.js-show-search').removeClass('show-search');
                $('.panel-search').slideUp(400);
            }
        });

        $('.js-show-search').on('click', function () {
            $(this).toggleClass('show-search');
            $('.panel-search').slideToggle(400);

            if ($('.js-show-filter').hasClass('show-filter')) {
                $('.js-show-filter').removeClass('show-filter');
                $('.panel-filter').slideUp(400);
            }
        });
        function showAlertAddCart(mess,title,icon) {
            Swal.fire({
                position: 'center',
                icon: icon,
                title: title,
                text: mess,
                showConfirmButton: false,
                timer: 1000,
                customClass: {
                    container: 'swal-custom'
                }
            });
        }

        /*==================================================================
        [ Cart ]*/


        $('.js-hide-cart').on('click', function () {
            $('.js-panel-cart').removeClass('show-header-cart');
        });

        /*==================================================================
        [ Cart ]*/
        $('.js-show-sidebar').on('click', function () {
            $('.js-sidebar').addClass('show-sidebar');
        });

        $('.js-hide-sidebar').on('click', function () {
            $('.js-sidebar').removeClass('show-sidebar');
        });

        /*==================================================================
        [ +/- num product ]*/

        /*==================================================================
        [ Rating ]*/
        $('.wrap-rating').each(function () {
            var item = $(this).find('.item-rating');
            var rated = -1;
            var input = $(this).find('input');
            $(input).val(0);

            $(item).on('mouseenter', function () {
                var index = item.index(this);
                var i = 0;
                for (i = 0; i <= index; i++) {
                    $(item[i]).removeClass('zmdi-star-outline');
                    $(item[i]).addClass('zmdi-star');
                }

                for (var j = i; j < item.length; j++) {
                    $(item[j]).addClass('zmdi-star-outline');
                    $(item[j]).removeClass('zmdi-star');
                }
            });

            $(item).on('click', function () {
                var index = item.index(this);
                rated = index;
                $(input).val(index + 1);
            });

            $(this).on('mouseleave', function () {
                var i = 0;
                for (i = 0; i <= rated; i++) {
                    $(item[i]).removeClass('zmdi-star-outline');
                    $(item[i]).addClass('zmdi-star');
                }

                for (var j = i; j < item.length; j++) {
                    $(item[j]).addClass('zmdi-star-outline');
                    $(item[j]).removeClass('zmdi-star');
                }
            });
        });

        /*==================================================================
        [ Show modal1 ]*/

        var dataList = [];

        $('.js-show-modal1').on('click', function (e) {
            e.preventDefault();
            $('.js-modal1').addClass('show-modal1');
            var modal = document.querySelector('.js-modal1');
            modal.classList.add('show-modal1');
            var id = $(this).data('id')

            $.ajax({
                url: '/sixdo-shop/quick-view',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    idProduct: id

                }),
                success: function (response) {
                    var firstItem = response[0];
                    var gia = firstItem.giaBan;
                    var formattedGiaBan = gia.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                    var anh = firstItem.hinhAnh;
                    var contextPath = '${pageContext.request.contextPath}/';
                    var colorSelect = document.getElementById('quick-view-color');
                    colorSelect.innerHTML = '';
                    response.forEach(function (response) {
                        var ten = response.sanPham.tenSanPham;
                        var mauSac = response.mauSac.tenMauSac;
                        var nameTag = document.getElementById('name-product-quick-view');
                        var priceTag = document.getElementById('price-product-quick-view');
                        var id = response.id;
                        var gia = response.giaBan;
                        dataList.push({id: id, gia: gia, ten: ten, mau: mauSac, hinhAnh: anh});
                        nameTag.textContent = ten;
                        priceTag.textContent = formattedGiaBan;
                        var colorOption = document.createElement('option');
                        colorOption.textContent = response.mauSac.tenMauSac; // Giả sử màu sắc được lưu trữ trong trường mauSac của response
                        colorOption.value = response.id; // Giả sử màu sắc được lưu trữ trong trường mauSac của response
                        colorSelect.appendChild(colorOption);
                        document.getElementById('image-quick-view-detail').src = contextPath + anh;

                    });
                    console.log("Đã thanh toán thành công. Thông tin đơn hàng:", response);
                },
                error: function (error) {
                    console.error("Lỗi khi thanh toán:", error);
                }
            });

        });
        $('.js-hide-modal1').on('click', function () {
            $('.js-modal1').removeClass('show-modal1');
        });


        $('.select-color-quick-view').change(function () {
            var selectedId = $(this).val(); // Lấy giá trị của option được chọn

            $(this).find('option').each(function () {
                var optionValue = $(this).val();
                if (optionValue === selectedId) {
                    var formattedGiaBan = getPriceById(selectedId).toLocaleString('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    });
                    document.getElementById('price-product-quick-view').innerText = formattedGiaBan;
                    return;
                }

            });


        });

        function getPriceById(id) {
            var priceList = dataList;
            for (var i = 0; i < priceList.length; i++) {

                if (priceList[i].id == id) {
                    return priceList[i].gia;
                }
            }
            return null;
        }

        $('.js-addcart-detail-customer').on('click', function () {
            var selectedIdValue = document.getElementById('select-id-color').value;
            var quantityProduct = 0;
            quantityProduct = parseInt(document.getElementById('quantity-product-add-to-cart').value);
            console.log("day là idddddd " + selectedIdValue)
            console.log("day là soLuong" + quantityProduct)
            $.ajax({
                url: '/sixdo-shop/get-product-by-id',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    idProduct: selectedIdValue
                }),
                success: function (response) {
                    var anh = response.hinhAnh;
                    var existingProduct = cart.find((product) => product.id == response.id);
                    if (existingProduct) {
                        // Nếu đã có trong giỏ hàng, tăng số lượng
                        existingProduct.soLuong += quantityProduct;
                    } else {
                        var product = {
                            id: selectedIdValue,
                            idCtSanPham :selectedIdValue,
                            idSanPham: response.sanPham.id,
                            name: response.sanPham.tenSanPham,
                            gia: response.giaBan,
                            img: anh,
                            soLuong: quantityProduct,
                            colorProduct: response.mauSac.tenMauSac
                        };
                        cart.push(product);
                    }
                    saveCartToCookie();
                    countProductForCart();
                    updateCartCount();

                    for (var product2 of cart) {

                        console.log("id san pham " + product2.idProductForDetail)
                        console.log("số lượng " + product2.soLuong)

                    }
                },
                error: function (error) {
                    console.error("Lỗi khi thanh toán:", error);
                }
            });
        });

        var cart = getCartFromCookie() || [];


        function getCartFromCookie() {
            var name = 'cart=';
            var decodedCookie = decodeURIComponent(document.cookie);
            var cookieArray = decodedCookie.split(';');
            for (var i = 0; i < cookieArray.length; i++) {
                var cookie = cookieArray[i].trim();
                if (cookie.indexOf(name) === 0) {
                    var cookieValue = cookie.substring(name.length, cookie.length);
                    try {
                        return JSON.parse(decodeURIComponent(cookieValue));
                    } catch (error) {
                        console.error("Lỗi khi chuyển đổi cookie thành đối tượng JSON:", error);
                    }
                }
            }
            return null;
        }

        function saveCartToCookie() {
            // Tạo một đối tượng Date để đại diện cho thời điểm hiện tại
            var currentDate = new Date();

            // Thêm 14 ngày (2 tuần) vào thời điểm hiện tại
            currentDate.setDate(currentDate.getDate() + 14);

            // Sử dụng phương thức toUTCString() để định dạng thời điểm dưới dạng chuỗi UTC
            var expires = currentDate.toUTCString();

            // Tạo chuỗi cookie với thời gian sống là 2 tuần
            document.cookie = 'cart=' + JSON.stringify(cart) + ';path=/;expires=' + expires;
        }

        function countProductForCart() {
            const count = document.querySelector('.icon-count-cart');
            var totalCount = 0;
            for (var i = 0; i < cart.length; i++) {
                totalCount += cart[i].soLuong;
            }
            count.setAttribute('data-notify', totalCount);
            return totalCount;
        }

        function updateCartCount() {
            var cartCountElement = document.getElementById('totalCartValues');

            if (cartCountElement) {
                cartCountElement.innerHTML = countProductForCart();
            }
        }

        $('.js-show-cart').on('click', function () {
            $('.js-panel-cart').addClass('show-header-cart');
            var cartListElement = document.getElementById('cartProductList');
            cartListElement.innerHTML = ''; // Xóa các mục cũ
            var totalAmount = 0; // Biến để tính tổg giá trị đơn hàng
            if (cart.length === 0) {
                cartListElement.innerHTML = '<p>Cart is empty</p>';
            } else {
                var formatter = new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                });
                // Nếu có sản phẩm, hiển thị danh sách sản phẩm
                for (var product of cart) {
                    var imageProductForCart = '${pageContext.request.contextPath}/' + product.img;
                    var listItem = document.createElement('li');
                    listItem.className = 'cart-item';
                    var itemHTML = ' <li class="header-cart-item flex-w flex-t m-b-12">\n' +
                        '                    <div class="header-cart-item-img">\n' +
                        '                        <img style="width: 74px; height: 80px; margin-bottom: 16px ;" src="' + imageProductForCart + '" alt="IMG">\n' +
                        '                    </div>\n' +
                        '\n' +
                        '                    <div class="header-cart-item-txt p-t-8">\n' +
                        '                        <a href="/sixdo-shop/product-detail?id=' + product.idSanPham + '" class="header-cart-item-name m-b-5 hov-cl1 trans-04 font-weight-bold">' + product.name + ' \n' +
                        '                        </a> ' +
                        '                        <a href="/sixdo-shop/product-detail?id=' + product.idSanPham + '"class="header-cart-item-name m-b-12 hov-cl1 trans-04">' + product.colorProduct + '</a>\n' +
                        '\n' +
                        '                        <span class="header-cart-item-info" > ' + product.soLuong + '  x  ' + formatter.format(product.gia) + '</span> \n' +
                        '                    </div> \n' +
                        '                </li> '
                    ;

                    listItem.innerHTML = itemHTML;
                    cartListElement.appendChild(listItem);
                    totalAmount += product.gia * product.soLuong;
                }
                var formattedTotalAmount = formatter.format(totalAmount);
                var totalAmountElement = document.getElementById('totalCartValues');

                totalAmountElement.innerHTML = 'Tổng Cộng:  ' + formattedTotalAmount;

            }
        });

        window.onload = function () {
            // Thực hiện các công việc bạn muốn khi trang được tải
            cart = getCartFromCookie() || [];
            countProductForCart();

            updateCartOnPage(cart);
            updateCartCount();

        };

        //////go cart

        // function updateCartOnPage(cart) {
        //     var cartListTable = document.getElementById('cartTableBody');
        //     var imagePath = '${pageContext.request.contextPath}/';
        //     var sumCartTag = document.getElementById('sumCart');
        //     var lastPrice = document.getElementById('last-price');
        //     alert("+");
        //
        //     // Xóa nội dung hiện tại của tbody
        //     cartListTable.innerHTML = '';
        //
        //     // Thêm HTML cho mỗi sản phẩm trong giỏ hàng
        //     var sumCartValues = 0;
        //     cart.forEach(function (product) {
        //         // Tạo một hàng mới trong bảng
        //         var listItem = document.createElement('tr');
        //         listItem.className = 'table_row';
        //
        //         // Tạo các ô dữ liệu cho sản phẩm
        //         var imageCell = document.createElement('td');
        //         imageCell.className = 'column-1';
        //         var imageDiv = document.createElement('div');
        //         imageDiv.className = 'how-itemcart1';
        //         var productImage = document.createElement('img');
        //         productImage.src = imagePath + product.img;
        //         productImage.alt = 'IMG';
        //         productImage.style.width = '76px';
        //         productImage.style.borderRadius = '4px';
        //         imageDiv.appendChild(productImage);
        //         imageCell.appendChild(imageDiv);
        //
        //         var nameCell = document.createElement('td');
        //         var colorCell = document.createElement('p');
        //         colorCell.className = 'color-product-cart';
        //
        //         nameCell.className = 'column-2';
        //         nameCell.textContent = product.name;
        //         colorCell.textContent = product.colorProduct;
        //         nameCell.appendChild(colorCell);
        //
        //         var priceCell = document.createElement('td');
        //         priceCell.className = 'column-3';
        //         priceCell.textContent = tempNumberForVnd(product.gia);
        //
        //         var quantityCell = document.createElement('td');
        //         quantityCell.className = 'column-4';
        //         var quantityDiv = document.createElement('div');
        //         quantityDiv.className = 'wrap-num-product flex-w m-l-auto m-r-0';
        //         var decreaseButton = document.createElement('div');
        //         decreaseButton.className = 'btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m';
        //         decreaseButton.innerHTML = '<i class="fs-16 zmdi zmdi-minus"></i>';
        //         decreaseButton.onclick = function () {
        //             // Giảm số lượng khi click vào nút trừ
        //             decreaseProductQuantity(product);
        //         };
        //         var quantityInput = document.createElement('input');
        //         quantityInput.className = 'mtext-104 cl3 txt-center num-product';
        //         quantityInput.type = 'number';
        //         quantityInput.name = 'num-product1';
        //         quantityInput.value = product.soLuong;
        //         var increaseButton = document.createElement('div');
        //         increaseButton.className = 'btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m';
        //         increaseButton.innerHTML = '<i class="fs-16 zmdi zmdi-plus"></i>';
        //         increaseButton.onclick = function () {
        //             // Tăng số lượng khi click vào nút cộng
        //             increaseProductQuantity(product);
        //         };
        //         quantityDiv.appendChild(decreaseButton);
        //         quantityDiv.appendChild(quantityInput);
        //         quantityDiv.appendChild(increaseButton);
        //         quantityCell.appendChild(quantityDiv);
        //         var deleteIcon = document.createElement('i');
        //         deleteIcon.className = 'fs-16 zmdi zmdi-delete';
        //
        //         var totalCell = document.createElement('td');
        //         totalCell.className = 'column-5';
        //         totalCell.textContent = tempNumberForVnd(product.soLuong * product.gia);
        //         sumCartValues += (product.soLuong * product.gia)
        //         sumCartTag.innerText = tempNumberForVnd(sumCartValues);
        //         lastPrice.innerText = tempNumberForVnd(sumCartValues)
        //         // Thêm các ô vào hàng mới
        //         listItem.appendChild(imageCell);
        //         listItem.appendChild(nameCell);
        //         listItem.appendChild(priceCell);
        //         listItem.appendChild(quantityCell);
        //         listItem.appendChild(totalCell);
        //
        //         // Thêm hàng mới vào tbody
        //         cartListTable.appendChild(listItem);
        //     });
        //     countProductForCart();
        // }


        var citis = document.getElementById("city");
        var districts = document.getElementById("district");
        var wards = document.getElementById("ward");
        var Parameter = {
            url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
            method: "GET",
            responseType: "application/json",
        };

        var promise = axios(Parameter);
        promise.then(function (result) {
            renderCity(result.data);
        });

        function renderCity(data) {
            for (const city of data) {
                citis.options[citis.options.length] = new Option(city.Name, city.Name);
            }

            citis.onchange = function () {
                district.length = 1;
                ward.length = 1;

                if (this.value !== "") {
                    const selectedCity = data.find((n) => n.Name === this.value);

                    for (const district of selectedCity.Districts) {
                        districts.options[districts.options.length] = new Option(district.Name, district.Name);
                    }
                }
            };
            districts.onchange = function () {
                ward.length = 1;
                if (this.value !== "") {
                    const selectedCity = data.find((n) => n.Name === citis.value);
                    const selectedDistrict = selectedCity.Districts.find((n) => n.Name === this.value);

                    for (const ward of selectedDistrict.Wards) {
                        wards.options[wards.options.length] = new Option(ward.Name, ward.Name);
                    }
                }
            };
        }

        function increaseProductQuantity(product) {
            product.soLuong++;
            updateCartOnPage(cart);
            saveCartToCookie();
            countProductForCart();
            updateCartCount();
        }

        function decreaseProductQuantity(product) {
            if (product.soLuong > 0) {
                product.soLuong--;
                if (product.soLuong === 0) {
                    // Nếu số lượng giảm xuống 0, xóa sản phẩm khỏi giỏ hàng
                    cart.splice(cart.indexOf(product), 1);
                }
            }

            updateCartOnPage(cart);
            saveCartToCookie();
            updateCartCount();
        }

        function tempNumberForVnd(totalAmount) {
            var formatter = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            });
            var formattedTotalAmount = formatter.format(totalAmount);
            return formattedTotalAmount;

        }

        ///////////////đặt hàng


        $('.submit-oder-by-cart').on('click', function () {
            var orderData = createOrderData();

            // Gửi dữ liệu giỏ hàng lên máy chủ
            $.ajax({
                url: '/sixdo-shop/placeOrder',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(orderData),
                success: function(response) {
                    $.ajax({
                        url: '/sixdo-shop/sendMail',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(orderData),
                        success: function(response) {
                        },
                        error: function(error) {
                            // Xử lý lỗi nếu có
                            console.error(error);
                            showAlertAddCart('Order error.','','error');
                        }
                    });

                    // Xử lý phản hồi từ máy chủ nếu cần
                    console.log(response);
                    document.cookie = "cart=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                    showAlertAddCart('Order Success!','The order has been placed','success');
                   document.getElementById('sumCart').innerText='0 đ';
                  document.getElementById('last-price').innerText='0 đ';
                    updateCartOnPage(getCartFromCookie());
                    saveCartToCookie();
                    updateCartCount();

                },
                error: function(error) {
                    // Xử lý lỗi nếu có
                    console.error(error);
                    showAlertAddCart('Order error.','','error');
                }
            });





        });

        function createOrderData() {
            var name = document.querySelector('input[name="name-for-cart"]').value;
            var phone = document.querySelector('input[name="phone-for-cart"]').value;
            var email = document.querySelector('input[name="email-for-cart"]').value;
            var city = document.getElementById('city').value;
            var district = document.getElementById('district').value;
            var ward = document.getElementById('ward').value;
            var village = document.getElementById('village').value;
            var lastPrice = document.getElementById('last-price').textContent;
            var lastPriceCleaned = lastPrice.replace(/,/g, '').replace(/\./g, '');

            console.log("kkkkkkkss "+ parseFloat(lastPriceCleaned))


            var orderData = {
                cart: getCartFromCookie() || [],
                hoadon: {
                    tenNguoiNhan: name,
                    sdtNguoiNhan: phone,
                    emailNguoiNhan : email,
                    diaChiNguoiNhan : village + ', ' + ward + ',' + district + ', ' + city,
                    tongTien :parseFloat(lastPriceCleaned)

                }
            };

            return orderData;
        }


    }

)(jQuery);


