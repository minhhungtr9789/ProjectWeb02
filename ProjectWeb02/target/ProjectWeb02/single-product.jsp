<%@ page import="vn.nlu.fit.models.Product" %>
<%@ page import="vn.nlu.fit.utils.Util" %>
<%@ page import="vn.nlu.fit.models.User" %>
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

    <!--    <link rel="stylesheet" href="custom_bootrap.css">-->
    <!-- CSS tao chinh xiu
    .carousel-control-prev-icon{
    width: 40px;
    height: 40px;
    background-color: #52bc8c;
}
.carousel-control-next-icon{
    width: 40px;
    height: 40px;
    background-color: #52bc8c;
}
.carousel-indicators li {
    background-color: #31b0d5;
    width: 20px;
    height: 20px;
    border-radius: 100%;
}
.carousel-item .img-responsive{
    max-width: 100%;
    height: 340px;
}
    -->
    <!-- Viewer -->
    <link rel="stylesheet" href="viewer/css/lc_lightbox.css"/>
    <!-- SKINS -->
    <link rel="stylesheet" href="viewer/skins/minimal.css"/>
    <!-- ASSETS -->
    <script src="viewer/lib/AlloyFinger/alloy_finger.min.js" type="text/javascript"></script>
    <!-- Viewer -->
    <link rel="stylesheet" href="css/single-product.css"/>
</head>
<body>

<jsp:include page="parts/header.jsp"></jsp:include>
<% Product p = (Product) request.getAttribute("product");%>

<!--Breadcrumb-->
<section class="breadcumb">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Điện thoại</li>
            </ol>
        </nav>
    </div>
</section><!--End breadcrumb-->
<%if (p != null) {%>
<div class="container ">
    <div class="detail-product ">
        <div class="row mb-2">
            <div class="col-md-6">
                <div class="content_pictures">
                    <%
                        if (p.getListImg() != null && p.getListImg().length > 1) {
                    %>
                    <a class="elem" id="present-picture"
                       href="<%= p.getListImg()[1]%>"
                       data-lcl-thumb="<%= p.getListImg()[1]%>">
                        <img src="<%= p.getListImg()[1]%>" alt="">
                    </a>
                    <a class="elem active"
                       href="<%= p.getListImg()[1]%>"
                       data-lcl-thumb="<%= p.getListImg()[1]%>">
                        <img src="<%= p.getListImg()[1]%>" alt="">
                        <span class="rect"></span>
                    </a>
                    <%
                        for (int i = 2; i < p.getListImg().length; i++) {%>
                    <a class="elem "
                       href="<%= p.getListImg()[i]%>"
                       data-lcl-thumb="<%= p.getListImg()[i]%>">
                        <img src="<%= p.getListImg()[i]%>" alt="">
                    </a>
                    <%}%>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="col-md-6 ">
                <div class="info-price">
                    <div class="card flex-md-row mb-4 h-md-250 title">
                        <div class="card-body d-flex flex-column align-items-start">
                            <strong class="d-inline-block mb-2 "><%=p.getName()%>
                            </strong>
                        </div>
                    </div>
                    <div class="card flex-md-row mb-4 h-md-250 price">
                        <div class="card-body d-flex flex-column align-items-start">
                            <div><strong class="d-inline-block mb-2 "
                                         style="font-size: 20px; color: #5A88C9"><%= Util.convertToVndCurrency(p.getPromotionPrice())%>
                            </strong>
                                <p><%= Util.convertToVndCurrency(p.getPrice())%>
                                </p></div>

                            <div class="color">
                                <div class="mb-1 text-muted">Chọn màu</div>
                                <button type="button" class="btn btn-primary">Xanh</button>
                                <button type="button" class="btn btn-danger" style="border-radius: unset">Đỏ</button>
                                <button type="button" class="btn btn-warning" style="border-radius: unset">Vàng</button>
                            </div>
                            <div class="quantity-row">
                                <div class="mb-1 text-muted">Số lượng</div>
                                <div class="quantity">
                                    <a class="btn btn-outline-primary trash minus"
                                       href="http://localhost:8080/ProjectWeb02/CartServlet?action=quantity_Down&amp;id=IP1164">
                                        <i class="fas fa-minus"></i>
                                    </a>
                                    <input type="number" class="quantity enter_Quantity"
                                           onkeyup="enter_Quantity('IP1164', this)" value="1">
                                    <a class="btn btn-outline-primary trash plus"
                                       href="http://localhost:8080/ProjectWeb02/CartServlet?action=quantity_Up&amp;id=IP1164">
                                        <i class="fas fa-plus"></i>
                                    </a></div>
                            </div>
                            <div class="container">
                                <div class="row">
                                    <a href="proceed-to-checkout.jsp"
                                       class="btn btn-outline-primary btn-lg text-center col-sm-6">Mua ngay
                                    </a>
                                    <%
                                        User user = (User) session.getAttribute("user");
                                        if (user != null) {
                                    %>
                                    <a href="<%= Util.fullPath("CartServlet?action=add&id="+p.getCode())%>"
                                       class="btn btn-primary btn-lg text-center col-sm-6">Thêm vào giỏ hàng
                                    </a>
                                    <%} else {%>
                                    <a href="" data-toggle="modal" data-target="#sign-in-model" class="btn btn-primary btn-lg
                                text-center col-sm-6">Thêm vào giỏ hàng
                                    </a>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%if ((!p.getDescription().equals("") && p.getDescription() != null) && (!p.getSettingInfo().equals("") && p.getSettingInfo() != null)) { %>
<div class="details-description" style="margin: 0px 0px 15px 0px">
    <div class="container">
        <div class="row">
            <%if (!p.getDescription().equals("") && p.getDescription() != null) { %>
            <div class="col-sm-8" style="background: white;padding: 15px">
                <%=p.getDescription()%>
            </div>
            <%}%>
            <%if (!p.getSettingInfo().equals("") && p.getSettingInfo() != null) { %>
            <div class="col-sm-4" style="background: white; border-left: 1px solid rgb(227, 227, 227);
        height: fit-content;">
                <%=p.getSettingInfo()%>
            </div>
            <%}%>
        </div>
    </div>
</div>
<%}%>
<!--suggestions product-->
<div class="suggestions">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home"
                           role="tab" aria-controls="nav-home" aria-selected="true">Điện thoại đồng giá</a>
                        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
                           role="tab" aria-controls="nav-profile" aria-selected="false">Điện thoại cùng hàng</a>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <!-- Dien thoai noi bat -->
                        <section class="products">
                            <!--                            <div class="container">-->
                            <div class="sectionTitle">
                            </div>
                            <div class="list-product">
                                <div class="product-item">
                                    <div class="row">
                                        <div class="product col-sm-3 col-12">
                                            <a href="single-product.jsp">
                                                <img src="https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg"
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
                                        <!-- Một sản phẩm -->
                                        <div class="product col-sm-3 col-12">
                                            <a href="single-product.jsp">
                                                <img src="https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg"
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
                                        <div class="product col-sm-3 col-12">
                                            <a href="single-product.jsp">
                                                <img src="https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg"
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
                                        <div class="product col-sm-3 col-12">
                                            <a href="single-product.jsp">
                                                <img src="https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg"
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
                            <!--                            </div>-->
                        </section> <!-- End dien thoai noi bat --></div>
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                        <!-- Dien thoai noi bat -->
                        <!-- Laptop noi bat -->
                        <section class="products">
                            <!--                            <div class="container">-->
                            <!--                                <div class="sectionTitle">-->
                            <!--&lt;!&ndash;                                    <a href="#"><h2>Laptop nổi bật nhất</h2></a>&ndash;&gt;-->

                            <!--                                    <div class="section-menu">-->
                            <!--                                        <ol class="breadcrumb">-->
                            <!--                                            <li><a href="#"><h2>Apple</h2></a></li>-->
                            <!--                                            <li><a href="#"><h2>Samsung</h2></a></li>-->
                            <!--                                            <li><a href="#"><h2>Nokia</h2></a></li>-->
                            <!--                                            <li><a href="#"><h2>OPPO</h2></a></li>-->
                            <!--                                        </ol>-->
                            <!--                                    </div>-->
                            <!--                                </div>-->
                            <div class="list-product">
                                <div class="product-item">
                                    <div class="row">
                                        <!-- Một sản phẩm -->
                                        <div class="product col-sm-3 col-12">
                                            <a href="single-product.jsp">
                                                <img src="img/products/laptop/dell/dellxps/637092404005701912_dell-xps-15-7590-bac-dd.jpg"
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
                                        <!-- Một sản phẩm -->
                                        <div class="product col-sm-3 col-12">
                                            <a href="single-product.jsp">
                                                <img src="img/products/laptop/dell/dellxps/637092404005701912_dell-xps-15-7590-bac-dd.jpg"
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
                                        <!-- Một sản phẩm -->
                                        <div class="product col-sm-3 col-12">
                                            <a href="single-product.jsp">
                                                <img src="img/products/laptop/dell/dellxps/637092404005701912_dell-xps-15-7590-bac-dd.jpg"
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
                                        </div><!-- Kết thúc một sản phẩm --><!-- Một sản phẩm -->
                                        <div class="product col-sm-3 col-12">
                                            <a href="single-product.jsp">
                                                <img src="img/products/laptop/dell/dellxps/637092404005701912_dell-xps-15-7590-bac-dd.jpg"
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
                                        </div><!-- Kết thúc một sản phẩm --><!-- Một sản phẩm -->
                                    </div>
                                </div>
                            </div>
                            <!--                            </div>-->
                        </section> <!-- End Laptop noi bat -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--end suggestions product-->
<%} else {%>
<div class="container">
    <div class="row">
        <div class="col-sm-12" style="padding: 100px;text-align: center;">
            <h3>Xin lỗi quý khách, sản phẩm không tồn tại hoặc đã ngừng kinh doanh!</h3>
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

<!-- Viewer -->
<script src="viewer/lib/jquery.js" type="text/javascript"></script>
<script src="viewer/js/lc_lightbox.lite.js" type="text/javascript"></script>
<!-- LIGHTBOX INITIALIZATION -->
<script type="text/javascript">
    $(document).ready(function (e) {
        // live handler
        lc_lightbox('.elem', {
            wrap_class: 'lcl_fade_oc',
            gallery: true,
            thumb_attr: 'data-lcl-thumb',

            skin: 'minimal',
            radius: 0,
            padding: 0,
            border_w: 0,
        });
    });

    <!-- HOVER PICTURE -->
    $('.elem').hover(function () {
        $('.elem').removeClass("active");
        $(this).addClass("active");
        $('#present-picture').removeClass("active");
        $('#present-picture').children("img").attr("src", $(this).children("img").attr("src"));
        $('#present-picture').attr("href", $(this).attr("href"));
        $('#present-picture').attr("data-lcl-thumb", $(this).attr("data-lcl-thumb"));
    });
</script>
<!-- Viewer -->
<jsp:include page="parts/scroll-top.jsp"></jsp:include>

</body>
</html>
