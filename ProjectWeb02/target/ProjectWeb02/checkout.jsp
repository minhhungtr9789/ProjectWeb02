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
    <link rel="stylesheet" type="text/css" href="css/checkout.css">

</head>
<body>


<jsp:include page="parts/header.jsp"></jsp:include>

<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
%>

<!--Breadcrumb-->
<section class="breadcumb">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Thanh toán</li>
            </ol>
        </nav>
    </div>
</section><!--End breadcrumb-->

<!--Content cart-->
<div id="content-cart">
    <div class="container">
        <div class="row">
            <div id="left-content" class="col-sm-8">
                <div id="header-list">
                    <h4>Chọn phương thức thanh toán</h4>
                </div>
                <div class="payment">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home"
                               role="tab" aria-controls="nav-home" aria-selected="true"><img
                                    src="img/img_icon/TB1utb_r8jTBKNjSZFwXXcG4XXa-80-80.png" alt="">Thanh toán khi nhận
                                hàng</a>
                            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
                               role="tab" aria-controls="nav-profile" aria-selected="false"><img
                                    src="img/img_icon/TB1qIthr67nBKNjSZLeXXbxCFXa-80-80.png" alt="">Thẻ tín dụng/Thẻ ghi
                                nợ</a>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                             aria-labelledby="nav-home-tab">
                            <p>Bạn chỉ có thể mở hộp sản phẩm sau khi đã hoàn tất thanh toán. Bạn chỉ nên nhận hàng khi
                                trạng thái "Đang giao hàng" đã được cập nhật cho đơn hàng.</p>
                            <button type="button" class="btn btn-primary">Xác nhận đơn hàng</button>
                        </div>
                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                            <div class="row visa">
                                <div class="col-sm-8">
                                    <div class="icon-payment"></div>
                                    <label for="id-card"><span>*</span>Số thẻ</label>
                                    <input type="text" name="" id="id-card" placeholder="Số thẻ">
                                    <label for="id-name"><span>*</span>Tên trên thẻ</label>
                                    <input type="text" name="" id="id-name" placeholder="Tên trên thẻ">
                                    <div class="row">
                                        <div class="col-sm-7">
                                            <label for="id-date"><span>*</span>Ngày hết hạn</label>
                                            <input type="text" name="" id="id-date" placeholder="MM/YY">
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-4 cvv-label">
                                            <label for="id-cvv"><span>*</span>CVV</label>
                                            <input type="text" name="" id="id-cvv" placeholder="CVV">
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-primary">Thanh toán ngay</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="right-content" class="col-sm-4">
                <div id="sumary-order">
                    <div class="title">
                        Thông tin đơn hàng
                    </div>
                    <div class="total-price-products">
                        <div class="total-products">Tạm tính (<%=user.getCart().totalItemsCheckout()%> sản phẩm)</div>
                        <div class="total-price float-right"> <%=Util.convertToVndCurrency(user.getCart().totalPriceItemsCheckout())%></div>
                    </div>
                    <div class="sum-price">
                        <div class="checkout-order-total-row">
                            <div class="checkout-order-total-title">Tổng tiền</div>
                            <div class="checkout-order-total-fee">
                                <%=Util.convertToVndCurrency(user.getCart().totalPriceItemsCheckout())%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End content cart-->

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
                <div class="modal-body">
                    Bạn có đồng ý loại bỏ sản phẩm này khỏi đơn hàng?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">HỦY</button>
                    <button type="button" class="btn btn-primary">ĐỒNG Ý</button>
                </div>
            </div>
        </div>
    </div>
</div><!--End Delete product-->
<%
    }else{%>
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
<!--<script type="text/javascript" src="js/cart.js"></script>-->
<!--End cart-js-->

<jsp:include page="parts/scroll-top.jsp"></jsp:include>
</body>
</html>
