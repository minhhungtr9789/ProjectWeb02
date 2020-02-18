<%@ page import="vn.nlu.fit.models.User" %>
<%@ page import="vn.nlu.fit.models.Cart" %>
<%@ page import="vn.nlu.fit.models.CartItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.nlu.fit.utils.Util" %>
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
    <link rel="stylesheet" type="text/css" href="css/proceed-to-check.css">

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
                <li class="breadcrumb-item active" aria-current="page">Kiểm tra đơn hàng</li>
            </ol>
        </nav>
    </div>
</section><!--End breadcrumb-->

<%if (!(list.size() == 0)) {%>
<!--Content cart-->
<div id="content-cart">
    <div class="container">
        <div class="row">
            <div id="left-content" class="col-sm-8">
                <div id="products">
                    <%

                        if (list != null) {
                            for (CartItem i : list) {
                                if (i.getStatus() == 1) {

                    %>
                    <div class="one-product">
                        <div class="row">
                            <div class="col-sm-6 cart-item">
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
                            <div class="col-sm-4 quantity-trash">
                                <div class="quantity-products">
                                    Số lượng:
                                    <span class="font-weight-bolder"><%=i.getQuantity()%></span>
                                </div>
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
                        }
                    %>
                </div>
            </div>
            <div id="right-content" class="col-sm-4">
                <div class="sum-price">
                    <a class="btn btn-primary col-sm-12" href="checkout.jsp">Thanh toán</a>
                </div>
                <div id="address">
                    <div class="title">
                        Thanh toán vận chuyển
                    </div>
                    <div class="user-address">
                        <div class="user-name"><i class="fas fa-map-marker-alt colorBlue"></i>
                            <span class="user-name"><%=user.getFullname() == null ? "" : user.getFullname() %></span>
                            <a class="edit float-right colorBlue" href="#">Chỉnh sửa</a>
                        </div>
                        <div class="address">
                            <span><%=user.getAddress() == null ? "" : user.getAddress()%></span>
                        </div>
                    </div>
                    <div class="user-phone user">
                        <i class="fas fa-phone-alt colorBlue"></i>
                        <span><%=user.getPhone() == null ? "" : user.getPhone()%></span>
                        <a class="edit float-right colorBlue" href="#">Chỉnh sửa</a>
                    </div>
                    <div class="user-email user">
                        <i class="fas fa-envelope colorBlue"></i>
                        <span><%=user.getEmail() == null ? "" : user.getEmail()%></span>
                        <a class="edit float-right colorBlue" href="#">Chỉnh sửa</a>
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
                        <a class="btn btn-primary col-sm-12" href="checkout.jsp">Thanh toán</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End content cart-->
<%} else {%>
<div class="container" style="padding: 100px;text-align: center;">
    <div class="cart-empty-text">Không có sản phẩm để thanh toán</div>
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
                       href="<%= Util.fullPath("CartServlet?action=removeFormCheckOut&id=")%>">ĐỒNG Ý</a>
                </div>

            </div>
        </div>
    </div>
</div><!--End Delete product-->

<%} else {%>
<div class="container">
    <div class="sign">
        <div id="sign-in-model">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="sign-in">Đăng nhập</h5>
                        <button data-dismiss="modal" data-toggle="modal" data-target="#sign-up-model"
                                class="btn btn btn-outline-primary text-right">Đăng ký
                        </button>
                    </div>
                    <form id="signInForm" method="post" action="<%= Util.fullPath("Login")%>">
                        <div class="modal-body">
                            <%--                    <form method="post" action="<%=Util.fullPathAdmin("product/create-edit")%>">--%>
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
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-primary"
                                    data-dismiss="modal">Trở lại
                            </button>
                            <button type="submit" onclick="submitLogin(event)" class="btn btn-primary">Đăng nhập
                            </button>
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
<script type="text/javascript" src="js/cart.js"></script>
<!--End cart-js-->

<script>

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
