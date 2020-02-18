<%@ page import="vn.nlu.fit.models.Cart" %>
<%@ page import="vn.nlu.fit.models.CartItem" %>
<%@ page import="vn.nlu.fit.models.User" %>
<%@ page import="vn.nlu.fit.utils.Util" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ustora Demo</title>

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet'
          type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/fontawesome/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/cart.css">

</head>
<body>


<jsp:include page="parts/header.jsp"></jsp:include>
<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
        Cart c = user.getCart();
        ArrayList<CartItem> list = null;
        if (c != null) {
            list = new ArrayList<>(c.list());
        }
        String code = "";
%>


<!--Breadcrumb-->
<section class="breadcumb">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
            </ol>
        </nav>
    </div>
</section><!--End breadcrumb-->

<%if (!(list.size() == 0)) {%>
<!--Content cart-->
<div id="content-cart">
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <div id="left-content">
                    <div id="header-list">
                        <div class="checkbox-wrap">
                            <label class="label-wrap">
                                <input type="checkbox" class="check-all check-box"
                                       onclick="proceed2CheckoutServlet(-1)">
                                <span class="checkmark"><i class="fas fa-check"></i></span>
                                <%int count = c == null ? 0 : c.totalItems();%>
                                <span class="total">CHỌN TẤT CẢ (<%=count%> SẢN PHẨM)</span>
                            </label>
                        </div>
                        <div class="list-header-operations">
                            <button class="btn btn-outline-primary trash float-right" data-toggle="modal"
                                    data-productmul-id="-1"
                                    data-target="#exampleModal">
                                <i class="far fa-trash-alt"></i>
                                <span>Xóa</span>
                            </button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="products">
                                <%

                                    if (list != null) {
                                        for (CartItem i : list) {
                                %>
                                <div class="one-product">
                                    <div class="row">
                                        <div class="col-sm-7 cart-item">
                                            <div class="checkbox-wrap ">
                                                <label class="label-wrap">
                                                    <%
                                                        String check = "";
                                                        if (i.getStatus() == 1) {
                                                            check = "checked";
                                                        }
                                                    %>
                                                    <input type="checkbox" class="check-box checkbox" <%=check%>
                                                           onclick="proceed2CheckoutServlet(<%=i.getProduct().getId()%>)"
                                                           data-id="<%=i.getProduct().getCode()%>"
                                                    >
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                </label>
                                            </div>
                                            <%
                                                code = i.getProduct().getCode();
                                            %>
                                            <a href="<%= Util.fullPath("DetailProduct?id="+code)%>">
                                                <div class="img-wrap">
                                                    <img src="<% if (i.getProduct().getListImg().length>0){%><%=i.getProduct().getListImg()[0]%><%}%>"
                                                         alt="">
                                                </div>
                                                <div class="content">
                                                    <div class="title"><%=i.getProduct().getName()%>
                                                    </div>
                                                    <div class="describe">Sang trọng lĩnh lãm</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-2 cart-item-price">
                                            <div class="current-price"><%= Util.convertToVndCurrency(i.getProduct().getPromotionPrice())%>
                                            </div>
                                            <div class="origin-price"><%= Util.convertToVndCurrency(i.getProduct().getPrice())%>
                                            </div>
                                            <div class="promotion-ration">
                                                -<%= Util.convertToVndCurrency(i.getProduct().getPrice() - i.getProduct().getPromotionPrice())%>
                                            </div>
                                        </div>
                                        <div class="col-sm-3 quantity-trash">
                                            <a class="btn btn-outline-primary trash minus"
                                               href="<%= Util.fullPath("CartServlet?action=quantity_Down&id="+code)%>">
                                                <i class="fas fa-minus"></i>
                                            </a>
                                            <%int value = i.getQuantity();%>
                                            <input type="number" class="quantity enter_Quantity"
                                                   onkeyup="enter_Quantity('<%=code%>', this)" value="<%= value%>">
                                            <a class="btn btn-outline-primary trash plus"
                                               href="<%= Util.fullPath("CartServlet?action=quantity_Up&id="+code)%>">
                                                <i class="fas fa-plus"></i>
                                            </a>
                                            <button class="btn btn-outline-primary trash float-right trash-item"
                                                    data-toggle="modal" data-product-id="<%=code%>"
                                                    data-target="#exampleModal">
                                                <i class="far fa-trash-alt"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="right-content" class="col-sm-4">
                <div id="address">
                    <div class="title">Địa điểm</div>
                    <div class="user-address">
                        <i class="fas fa-map-marker-alt"></i>
                        <span><%=user.getAddress()%></span>
                    </div>
                </div>
                <div id="sumary-order">
                    <div class="title">
                        Thông tin đơn hàng
                    </div>
                    <div class="total-price-products">
                        <div class="total-products">Tạm tính (<%=user.getCart().totalItemsCheckout()%> sản phẩm)</div>
                        <div class="total-price float-right"><%=Util.convertToVndCurrency(user.getCart().totalPriceItemsCheckout())%>
                        </div>
                    </div>
                    <div class="delivery-fee">
                        <div class="delivery-label">Phí giao hàng</div>
                        <div class="fee float-right">0 ₫</div>
                    </div>
                    <div class="discount">
                        <input class="col-sm-7" type="text" placeholder="Nhập mã giảm giá">
                        <button type="button" class="btn btn-outline-primary col-sm-4">Áp dụng</button>
                    </div>
                    <div class="sum-price">
                        <div class="checkout-order-total-row">
                            <div class="checkout-order-total-title">Tổng cộng</div>
                            <div class="checkout-order-total-fee"><%=Util.convertToVndCurrency(user.getCart().totalPriceItemsCheckout())%>
                                <small>Đã bao gồm VAT (nếu có)</small>
                            </div>
                        </div>
                        <a class="btn btn-primary col-sm-12" href="proceed-to-checkout.jsp">Xác nhận giỏ hàng</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End content cart-->
<%} else {%>
<div class="container" style="padding: 100px;text-align: center;">
    <div class="cart-empty-text">Không có sản phẩm nào trong giỏ hàng</div>
    <br>
    <a href="<%=Util.fullPath("")%>" class="btn btn-outline-primary btn-lg">TIẾP TỤC MUA SẮM</a>
</div>
<%}%>
<!--Delete product-->
<div class="delete-product">
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa khỏi giỏ hàng</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">HỦY</button>
                    <a class="btn btn-primary"
                       href="<%= Util.fullPath("CartServlet?action=remove&id=")%>">ĐỒNG Ý</a>
                </div>

            </div>
        </div>
    </div>
</div><!--End Delete product-->

<!-- Dành riêng cho bạn -->
<section class="products">
    <div class="container">
        <div class="sectionTitle">
            <a href="#"><h2>Dành riêng cho bạn</h2></a>

            <div class="section-menu">
                <ol class="breadcrumb">
                    <li><a href="#"><h2>Apple</h2></a></li>
                    <li><a href="#"><h2>Samsung</h2></a></li>
                    <li><a href="#"><h2>Nokia</h2></a></li>
                    <li><a href="#"><h2>OPPO</h2></a></li>
                </ol>
            </div>
        </div>
        <div class="list-product">
            <div class="product-item">
                <div class="row">
                    <!-- Một sản phẩm -->
                    <div class="product col-sm-3 col-12">
                        <a href="single-product.jsp">
                            <img src="img/products/mobile/iphone/iphoneX/iphone-11-pro-max-256gb-black-600x600.jpg"
                                 alt="">
                            <div class="content">
                                <h3>iPhone 11 Pro Max 256GB</h3>
                                <div class="price">
                                    <strong>37.999.000₫</strong>
                                    <span>32.999.000₫</span>
                                </div>
                                <div class="rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                    <i class="far fa-star"></i>
                                    <span>50 Đánh giá</span>
                                </div>
                                <lablel class="discount">GIẢM 2.000.000₫</lablel>
                                <div class="promo">
                                    <p> Phiếu mua hàng trị giá 1 triệu</p>
                                </div>
                            </div>
                        </a>
                    </div><!-- Kết thúc một sản phẩm -->
                </div>
            </div>
        </div>
    </div>
</section> <!-- End dien thoai noi bat -->
<%} else {%>
<div class="container">
    <div class="sign">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="sign-in">Đăng nhập</h5>
                    <button data-dismiss="modal" data-toggle="modal" data-target="#sign-up-model"
                            class="btn btn btn-outline-primary text-right">Đăng ký
                    </button>
                </div>
                <div class="modal-body">
                    <form method="post" action="XuLyDangNhap">
                        <div class="form-group">
                            <input type="text" class="form-control" id="email"
                                   name="username" placeholder="Tên đăng nhập">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="password"
                                   name="password" placeholder="Mật khẩu"> <a
                                class="float-right p-2" href="#" data-toggle="modal"
                                data-target="#forgot-pass-model" data-dismiss="modal">Quên
                            mật khẩu</a>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-primary"
                                    data-dismiss="modal">Trở lại
                            </button>
                            <button type="submit" class="btn btn-primary">Đăng nhập</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%}%>
<jsp:include page="parts/footer.jsp"></jsp:include>

<!--  jQuery  -->
<script src="js/jquery.js"></script>

<!-- Bootstrap-->
<script src="js/bootstrap4/popper.min.js"></script>
<!--<script src="js/bootstrap4/jquery-3.3.1.slim.min.js"></script>-->
<script src="js/bootstrap4/bootstrap.min.js"></script>

<!-- jQuery sticky menu -->
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="js/jquery.easing.1.3.min.js"></script>

<!-- Main Script -->
<script src="js/main.js"></script>

<!-- Slider -->
<script type="text/javascript" src="js/bxslider.min.js"></script>
<script type="text/javascript" src="js/script.slider.js"></script>

<!--Cart-js-->
<%--<script type="text/javascript" src="js/cart.js"></script>--%>
<!--End cart-js-->

<script>
    function enter_Quantity(code, ab) {
        var xhttp = new XMLHttpRequest();
        var values = document.getElementsByClassName("enter_Quantity");

        xhttp.onreadystatechange = function (data) {
            if (this.readyState == 4 && this.status == 200) {
                // location.reload();
                // window.location.href = (xhttp.responseText);
                location.reload();
            }
        };
        var value = ab.value;
        if (value < 1) value = 1;
        xhttp.open("GET", "CartServlet?action=enter_Quantity&id=" + code + "&value=" + value, true);
        xhttp.send();

    }

    // check/ uncheck all check box
    $(".check-all").click(function () {
        $(".checkbox").prop("checked", $(this).is(':checked'));
    });

    $(".checkbox").click(function () {
        if (allChecked()) {
            $(".check-all").prop("checked", true);
        } else {
            $(".check-all").prop("checked", false);
        }
    });

    if (allChecked()) {
        $(".check-all").prop("checked", true);
    } else {
        $(".check-all").prop("checked", false);
    }

    function allChecked() {
        var check = true;
        var checkboxes = document.getElementsByClassName("checkbox");
        for (var i = 0; i < checkboxes.length; i++) {
            if (!checkboxes[i].checked) {
                check = false;
            }
        }
        console.log(check);
        return check;
    }

    // call proceed2CheckoutServlet
    function proceed2CheckoutServlet(item) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                location.reload();
            }
        };
        xhttp.open("GET", "CartServlet?action=proceed2Checkout&id=" + item, true);
        // console.log("vô rồi ");
        xhttp.send();
    }

    // get id from modal, send request delete to server
    //triggered when modal is about to be shown
    var href = $('#exampleModal').find('.modal-footer').find('a').attr("href");
    $('#exampleModal').on('show.bs.modal', function (e) {
        $('.modal-body').html("Bạn có đồng ý loại bỏ sản phẩm này khỏi đơn hàng?");
        var hrefFix = href;
        var productId = $(e.relatedTarget).data('product-id');
        if (productId != undefined) {
            // console.log(href);
            $('#exampleModal').find('.modal-footer').find('a').attr("href", hrefFix + productId);
        }

        // process select multi
        var productMulId = $(e.relatedTarget).data('productmul-id');
        if (productMulId != undefined) {
            $('.modal-body').html("Bạn có chắc chắn muốn xóa các mục này không?");
            var st = "";
            var checkboxes = document.getElementsByClassName("checkbox");
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    st += checkboxes[i].getAttribute('data-id') + ":";
                }
            }

            // console.log(href);
            $('#exampleModal').find('.modal-footer').find('a').attr("href", hrefFix + st);
        }
    });
</script>
<jsp:include page="parts/scroll-top.jsp"></jsp:include>
</body>
</html>
