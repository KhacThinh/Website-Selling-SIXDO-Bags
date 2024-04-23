// (function ($) {
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

        function showAlertAddCart(mess, title, icon) {
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


        // $('.js-show-cart').on('click', function () {
        //
        //     $.get('/product-favorite/check-thong-tin-khach-hang', function (response) {
        //         if (response !== 0) {
        //
        //
        //             $('.js-panel-cart').addClass('show-header-cart');
        //             var cartListElement = document.getElementById('cartProductList');
        //             cartListElement.innerHTML = ''; // Xóa các mục cũ
        //             var totalAmount = 0; // Biến để tính tổg giá trị đơn hàng
        //
        //             var idKhachHang = document.getElementById('id-khach-hang').value;
        //             console.log("l" + idKhachHang)
        //             $.ajax({
        //                 url: '/sixdo-shop/get-cart-by-buyer',
        //                 type: 'POST',
        //                 contentType: 'application/json',
        //                 data: JSON.stringify({
        //                     idKhachHang2: idKhachHang
        //                 }),
        //                 success: function (response) {
        //                     if (response.length == 0) {
        //                         cartListElement.innerHTML = '<p>Cart is empty</p>';
        //                     } else {
        //                         var formatter = new Intl.NumberFormat('vi-VN', {
        //                             style: 'currency',
        //                             currency: 'VND'
        //                         });
        //
        //                         response.forEach(function (product) {
        //                             var imageProductForCart = '${pageContext.request.contextPath}/' + product.chiTietSanPham.hinhAnh;
        //                             var listItem = document.createElement('li');
        //                             listItem.className = 'cart-item';
        //
        //                             if (product.chiTietSanPham.trangThai === 1) {
        //                                 // Sản phẩm có sẵn
        //                                 var itemHTML = '<li class="header-cart-item flex-w flex-t m-b-12">' +
        //                                     '<div class="header-cart-item-img">' +
        //                                     '<img style="width: 74px; height: 80px; margin-bottom: 16px;" src="' + imageProductForCart + '" alt="IMG">' +
        //                                     '</div>' +
        //                                     '<div class="header-cart-item-txt p-t-8">' +
        //                                     '<a href="/sixdo-shop/product/' + product.chiTietSanPham.id + '" class="header-cart-item-name m-b-5 hov-cl1 trans-04 font-weight-bold">' + product.chiTietSanPham.sanPham.tenSanPham + '</a>' +
        //                                     '<a href="/sixdo-shop/product/' + product.chiTietSanPham.id + '" class="header-cart-item-name m-b-12 hov-cl1 trans-04">' + product.chiTietSanPham.mauSac.tenMauSac + '</a>' +
        //                                     '<span class="header-cart-item-info">' + product.soLuong + ' x ' + formatter.format(product.chiTietSanPham.giaBan) + '</span>' +
        //                                     '</div>' +
        //                                     '<div class="header-cart-item-remove">' +
        //                                     '<button class="btn-remove-item" onclick="deleteProductToCart(' + product.chiTietSanPham.id + ', this); return false;"><i class="zmdi zmdi-close"></i></button>' +
        //                                     '</div>' +
        //                                     '</li>';
        //                                 listItem.innerHTML = itemHTML;
        //                                 cartListElement.appendChild(listItem);
        //                                 totalAmount += product.chiTietSanPham.giaBan * product.soLuong;
        //                             } else {
        //                                 var trangThaiText;
        //                                 if (product.chiTietSanPham.trangThai === 0) {
        //                                     trangThaiText = 'Ngung Ban';
        //                                 } else if (product.chiTietSanPham.trangThai === 2) {
        //                                     trangThaiText = 'Het Hang';
        //                                 } else {
        //                                     trangThaiText = '';
        //                                 }
        //                                 // Sản phẩm không có sẵn
        //                                 var itemHTML = '<li class="header-cart-item flex-w flex-t m-b-12" style="filter: brightness(50%);">' +
        //                                     '<div class="header-cart-item-img">' +
        //                                     '<img style="width: 74px; height: 80px; margin-bottom: 16px;" src="' + imageProductForCart + '" alt="IMG">' +
        //                                     '</div>' +
        //                                     '<div class="header-cart-item-txt p-t-8">' +
        //                                     '<span class="header-cart-item-name m-b-5 hov-cl1 trans-04 font-weight-bold"> ' + product.chiTietSanPham.sanPham.tenSanPham + '</span>' +
        //                                     '<span class="header-cart-item-info">' + formatter.format(product.chiTietSanPham.giaBan) + '</span>' +
        //                                     '<span class="header-cart-item-info" style="color: red" >' + trangThaiText + '</span>' +
        //
        //                                     '</div>' +
        //                                     '<div class="header-cart-item-remove">' +
        //                                     '<button class="btn-remove-item" onclick="deleteProductToCart(' + product.chiTietSanPham.id + ', this); return false;"><i class="zmdi zmdi-close"></i></button>' +
        //                                     '</div>' +
        //                                     '</li>';
        //                                 listItem.innerHTML = itemHTML;
        //                                 cartListElement.appendChild(listItem);
        //
        //
        //                             }
        //                         });
        //
        //                         var formattedTotalAmount = formatter.format(totalAmount);
        //                         var totalAmountElement = document.getElementById('totalCartValues');
        //                         totalAmountElement.innerHTML = 'TOTAL:  ' + formattedTotalAmount;
        //                     }
        //                 },
        //
        //
        //                 error: function (error) {
        //                     console.error(error);
        //                 }
        //             });
        //             return;
        //
        //
        //             var formattedTotalAmount = formatter.format(totalAmount);
        //             var totalAmountElement = document.getElementById('totalCartValues');
        //
        //             totalAmountElement.innerHTML = 'TOTAL:  ' + formattedTotalAmount;
        //         } else {
        //             showLoginPrompt();
        //         }
        //     });
        //
        // });

        window.onload = function () {
            // Thực hiện các công việc bạn muốn khi trang được tải

        };
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


        function tempNumberForVnd(totalAmount) {
            var formatter = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            });
            var formattedTotalAmount = formatter.format(totalAmount);
            return formattedTotalAmount;

        }

        ///////////////đặt hàng


    // })(jQuery);
