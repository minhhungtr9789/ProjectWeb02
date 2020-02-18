<%@ page import="vn.nlu.fit.models.Product" %>
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
    <link rel="stylesheet" href="css/slider.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>

<%--<jsp:include page="parts/header.jsp"></jsp:include>--%>
<%@include file="parts/header.jsp" %>
<%--<jsp:include page="/indexServlet"></jsp:include>--%>
<%
    ArrayList<Product> mobileList = (ArrayList<Product>) request.getAttribute("mobileList");
    ArrayList<Product> tabletList = (ArrayList<Product>) request.getAttribute("tabletList");
    ArrayList<Product> laptopList = (ArrayList<Product>) request.getAttribute("laptopList");
    ArrayList<Product> phukienList = (ArrayList<Product>) request.getAttribute("phukienList");
%>

<section class="main-content">

<div class="slider-area container">
    <!-- Slider -->
    <div class="homebanner">
        <div id="sync1" class="owl-carousel owl-theme" style="opacity: 1; display: block;">
            <div class="owl-wrapper-outer">
                <div class="owl-wrapper"
                     style="width: 12640px; left: 0; display: block; transition: all 800ms ease 0s; transform: translate3d(0px, 0px, 0px);">
                    <div class="owl-item" style="width: 790px;">
                        <div class="item">
                            <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                <img style="cursor:pointer"
                                     src="https://cdn.tgdd.vn/2020/01/banner/800-300-800x300-1.gif"
                                     alt="Big" width="800" height="300">
                            </a>
                        </div>
                    </div>
                    <div class="owl-item" style="width: 790px;">
                        <div class="item">
                            <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                <img
                                        style="cursor:pointer"
                                        src="https://cdn.tgdd.vn/2020/01/banner/800-300-800x300-13.png"
                                        alt="Samsung Tet" width="800" height="300"></a></div>
                    </div>
                    <div class="owl-item" style="width: 790px;">
                        <div class="item">
                            <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                <img
                                        style="cursor:pointer"
                                        src="https://cdn.tgdd.vn/2020/01/banner/800-300-800x300-12.png"
                                        alt="Big OPPO" width="800" height="300"></a></div>
                    </div>
                    <div class="owl-item" style="width: 790px;">
                        <div class="item">
                            <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                <img
                                        style="cursor:pointer"
                                        src="https://cdn.tgdd.vn/2020/01/banner/800-300-800x300-9.png"
                                        alt="A51" width="800" height="300"></a></div>
                    </div>
                    <div class="owl-item" style="width: 790px;">
                        <div class="item">
                            <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                <img
                                        style="cursor:pointer"
                                        src="https://cdn.tgdd.vn/2020/01/banner/big-iphone-800-300-800x300-3.png"
                                        alt="iphone"
                                        width="800" height="300"></a></div>
                    </div>
                    <div class="owl-item" style="width: 790px;">
                        <div class="item">
                            <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                <img
                                        style="cursor:pointer"
                                        src="https://cdn.tgdd.vn/2020/01/banner/dong-ho-thoi-trang-800-300-800x300-1.png"
                                        alt="dong ho thoi trang" width="800" height="300"></a></div>
                    </div>
                    <div class="owl-item" style="width: 790px;">
                        <div class="item">
                            <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                <img
                                        style="cursor:pointer"
                                        src="https://cdn.tgdd.vn/2020/01/banner/Apple-watch-tao-800-300-800x300.png"
                                        alt="Sắm Apple Watch" width="800" height="300"></a></div>
                    </div>
                    <div class="owl-item" style="width: 790px;">
                        <div class="item">
                            <a href="https://www.thegioididong.com/khuyen-mai-tet">
                                <img
                                        style="cursor:pointer"
                                        src="https://cdn.tgdd.vn/2019/12/banner/800-300-800x300-30.png"
                                        alt="phu kien" width="800" height="300"></a></div>
                    </div>
                </div>
            </div>


            <div class="owl-controls clickable">
                <div class="owl-buttons">
                    <div class="owl-prev">‹</div>
                    <div class="owl-next">›</div>
                </div>
            </div>
        </div>
        <div id="sync2" class="owl-carousel owl-theme" style="opacity: 1; display: block;">
            <div class="owl-wrapper-outer">
                <div class="owl-wrapper"
                     style="width: 2528px; left: 0; display: block; transition: all 200ms ease 0s; transform: translate3d(0px, 0px, 0px);">
                    <div class="owl-item synced" style="width: 158px;">
                        <div class="item">
                            <h3>Tết Sắm Smartphone<br>Trúng 2020 Chuột Vàng</h3>
                            <i class="arrowbar"></i>
                        </div>
                    </div>
                    <div class="owl-item" style="width: 158px;">
                        <div class="item">
                            <i class="arrowbarleft"></i>
                            <h3>Tết Sắm Samsung<br>Trúng 2020 Chuột Vàng</h3>
                            <i class="arrowbar"></i>
                        </div>
                    </div>
                    <div class="owl-item" style="width: 158px;">
                        <div class="item">
                            <i class="arrowbarleft"></i>
                            <h3>Tết Sắm OPPO<br>Lì Xì 1 Triệu</h3>
                            <i class="arrowbar"></i>
                        </div>
                    </div>
                    <div class="owl-item" style="width: 158px;">
                        <div class="item">
                            <i class="arrowbarleft"></i>
                            <h3>Tết Sắm Galaxy A51<br>Giảm Ngay 500 Ngàn</h3>
                            <i class="arrowbar"></i>
                        </div>
                    </div>
                    <div class="owl-item" style="width: 158px;">
                        <div class="item">
                            <i class="arrowbarleft"></i>
                            <h3>Tết Sắm iPhone Online<br>Lì Xì Đến 3 Triệu</h3>
                            <i class="arrowbar"></i>
                        </div>
                    </div>
                    <div class="owl-item" style="width: 158px;">
                        <div class="item">
                            <i class="arrowbarleft"></i>
                            <h3>Đồng Hồ Thời Trang<br>Giảm Đến 30%</h3>
                            <i class="arrowbar"></i>
                        </div>
                    </div>
                    <div class="owl-item" style="width: 158px;">
                        <div class="item">
                            <i class="arrowbarleft"></i>
                            <h3>Tết Sắm Apple Watch<br>Giảm Đến 2 Triệu</h3>
                            <i class="arrowbar"></i>
                        </div>
                    </div>
                    <div class="owl-item" style="width: 158px;">
                        <div class="item">
                            <i class="arrowbarleft"></i>
                            <h3>Phụ Kiện Online<br>Giảm Đến 49%</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ./Slider -->
    <div class="homenews">
        <figure>
            <h2><a href="#">Tin công nghệ</a></h2>
            <b></b>
        </figure>
        <ul>
            <li>
                <a href="#">
                    <img width="100" height="70"
                         src="https://cdn.tgdd.vn/Files/2020/01/20/1232330/thumb_800x450-100x100.jpg"
                         alt="Các bạn đã hay tin 'Thế Giới Di Động chuẩn bị mở bán Galaxy S10 Lite' chưa? Mau mau gom lúa chứ còn đợi gì nữa!">
                    <h3>Các bạn đã hay tin 'Thế Giới Di Động chuẩn bị mở bán Galaxy S10 Lite' chưa? Mau mau gom lúa chứ
                        còn đợi gì nữa!</h3>
                    <span>13 phút trước</span>
                </a>
            </li>
        </ul>
        <div class="twobanner">
            <a aria-label="slide" data-cate="0" data-place="1158"
               href="https://www.thegioididong.com/dtdd/samsung-galaxy-a20s"
            ><img
                    style="cursor:pointer" src="https://cdn.tgdd.vn/2020/01/banner/398-110-398x110-3.png" alt="A20s"
                    width="398" height="110"></a>
            <a aria-label="slide" data-cate="0" data-place="1158" href="/khuyen-mai-tet#apple"
            ><img
                    style="cursor:pointer" src="https://cdn.tgdd.vn/2020/01/banner/iphone-11-pro-398-110-398x110-1.png"
                    alt="iphone" width="398" height="110"></a></div>

    </div>
</div> <!-- End slider area -->

<div class="promo-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <a href="#" target="_blank">
                <img src="http://localhost:8080/ProjectWeb02/img/ckfinder/images/promotion2.jpg">
            </a>
        </div>
    </div>
</div> <!-- End promo area -->

<!-- Mobile noi bat -->
<% if (mobileList != null) {%>
<!-- Dien thoai noi bat -->
<section id="section_1" class="products">
    <div class="container bg_white">
        <div class="sectionTitle">
            <a href="#"><h2>Điện thoại nổi bật nhất</h2></a>

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
                    <% for (Product p : mobileList) { %>
                    <div class="product col-sm-3 col-12">
                        <a href="<%= Util.fullPath("DetailProduct?id="+p.getCode())%>">
                            <img src="<% if (p.getListImg().length>0){%><%=p.getListImg()[0]%><%}%>"
                                 alt="">
                            <div class="content">
                                <h3>
                                    <%= p.getName()%>
                                </h3>
                                <div class="price">
                                    <strong>
                                        <%= Util.convertToVndCurrency(p.getPromotionPrice())%>
                                    </strong>
                                    <span>
                                        <%= Util.convertToVndCurrency(p.getPrice())%>
                                    </span>
                                </div>
                                <div class="rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                    <i class="far fa-star"></i>
                                    <span>50 Đánh giá</span>
                                </div>
                                <lablel class="discount">
                                    GIẢM <%= Util.convertToVndCurrency(p.getPrice() - p.getPromotionPrice())%>
                                </lablel>
                                <div class="promo">
                                    <p> Phiếu mua hàng trị giá 1 triệu</p>
                                </div>
                            </div>
                        </a>
                    </div><!-- Kết thúc một sản phẩm -->
                    <% }%>
                </div>
            </div>
        </div>
    </div>
</section> <!-- End dien thoai noi bat -->
<%}%>

<!-- Tablet noi bat -->
<% if (tabletList != null) {%>
<section id="section_2" class="products">
    <div class="container bg_white">
        <div class="sectionTitle">
            <a href="#"><h2>Tablet nổi bật nhất</h2></a>

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
                    <% for
                    (
                            Product
                                    p
                            :
                            tabletList
                    ) { %>
                    <div class="product col-sm-3 col-12">
                        <a href="<%= Util.fullPath("DetailProduct?id="+p.getCode())%>">
                            <img src="<% if (p.getListImg().length>0){%><%=p.getListImg()[0]%><%}%>"
                                 alt="">
                            <div class="content">
                                <h3>
                                    <%= p
                                            .
                                                    getName
                                                            (
                                                            )%>
                                </h3>
                                <div class="price">
                                    <strong>
                                        <%= Util
                                                .
                                                        convertToVndCurrency
                                                                (
                                                                        p
                                                                                .
                                                                                        getPromotionPrice
                                                                                                (
                                                                                                )
                                                                )%>
                                    </strong>
                                    <span>
                                        <%= Util
                                                .
                                                        convertToVndCurrency
                                                                (
                                                                        p
                                                                                .
                                                                                        getPrice
                                                                                                (
                                                                                                )
                                                                )%>
                                    </span>
                                </div>
                                <div class="rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                    <i class="far fa-star"></i>
                                    <span>50 Đánh giá</span>
                                </div>
                                <lablel class="discount">
                                    GIẢM <%= Util
                                        .
                                                convertToVndCurrency
                                                        (
                                                                p
                                                                        .
                                                                                getPrice
                                                                                        (
                                                                                        )
                                                                        -
                                                                        p
                                                                                .
                                                                                        getPromotionPrice
                                                                                                (
                                                                                                )
                                                        )%>
                                </lablel>
                                <div class="promo">
                                    <p> Phiếu mua hàng trị giá 1 triệu</p>
                                </div>
                            </div>
                        </a>
                    </div><!-- Kết thúc một sản phẩm -->
                    <% }%>
                </div>
            </div>
        </div>
    </div>
</section> <!-- End Tablet noi bat -->
<%}%>

<!-- Laptop noi bat -->
<% if (laptopList != null) {%>
<section id="section_3" class="products">
    <div class="container bg_white">
        <div class="sectionTitle">
            <a href="#"><h2>Laptop nổi bật nhất</h2></a>

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
                    <% for
                    (
                            Product
                                    p
                            :
                            laptopList
                    ) { %>
                    <div class="product col-sm-3 col-12">
                        <a href="<%= Util.fullPath("DetailProduct?id="+p.getCode())%>">
                            <img src="<% if (p.getListImg().length>0){%><%=p.getListImg()[0]%><%}%>"
                                 alt="">
                            <div class="content">
                                <h3>
                                    <%= p
                                            .
                                                    getName
                                                            (
                                                            )%>
                                </h3>
                                <div class="price">
                                    <strong>
                                        <%= Util
                                                .
                                                        convertToVndCurrency
                                                                (
                                                                        p
                                                                                .
                                                                                        getPromotionPrice
                                                                                                (
                                                                                                )
                                                                )%>
                                    </strong>
                                    <span>
                                        <%= Util
                                                .
                                                        convertToVndCurrency
                                                                (
                                                                        p
                                                                                .
                                                                                        getPrice
                                                                                                (
                                                                                                )
                                                                )%>
                                    </span>
                                </div>
                                <div class="rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                    <i class="far fa-star"></i>
                                    <span>50 Đánh giá</span>
                                </div>
                                <lablel class="discount">
                                    GIẢM <%= Util
                                        .
                                                convertToVndCurrency
                                                        (
                                                                p
                                                                        .
                                                                                getPrice
                                                                                        (
                                                                                        )
                                                                        -
                                                                        p
                                                                                .
                                                                                        getPromotionPrice
                                                                                                (
                                                                                                )
                                                        )%>
                                </lablel>
                                <div class="promo">
                                    <p> Phiếu mua hàng trị giá 1 triệu</p>
                                </div>
                            </div>
                        </a>
                    </div><!-- Kết thúc một sản phẩm -->
                    <% }%>
                </div>
            </div>
        </div>
    </div>
</section> <!-- End Laptop noi bat -->
<% }%>

<!-- Phu kien noi bat -->
<% if (tabletList != null) {%>
<section id="section_4" class="products">
    <div class="container bg_white">
        <div class="sectionTitle">
            <a href="#"><h2>Phụ kiện nổi bật nhất</h2></a>

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
                    <% for
                    (
                            Product
                                    p
                            :
                            phukienList
                    ) { %>
                    <div class="product col-sm-3 col-12">
                        <a href="<%= Util.fullPath("DetailProduct?id="+p.getCode())%>">
                            <img src="<% if (p.getListImg().length>0){%><%=p.getListImg()[0]%><%}%>"
                                 alt="">
                            <div class="content">
                                <h3>
                                    <%= p
                                            .
                                                    getName
                                                            (
                                                            )%>
                                </h3>
                                <div class="price">
                                    <strong>
                                        <%= Util
                                                .
                                                        convertToVndCurrency
                                                                (
                                                                        p
                                                                                .
                                                                                        getPromotionPrice
                                                                                                (
                                                                                                )
                                                                )%>
                                    </strong>
                                    <span>
                                        <%= Util
                                                .
                                                        convertToVndCurrency
                                                                (
                                                                        p
                                                                                .
                                                                                        getPrice
                                                                                                (
                                                                                                )
                                                                )%>
                                    </span>
                                </div>
                                <div class="rating">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                    <i class="far fa-star"></i>
                                    <span>50 Đánh giá</span>
                                </div>
                                <lablel class="discount">
                                    GIẢM <%= Util
                                        .
                                                convertToVndCurrency
                                                        (
                                                                p
                                                                        .
                                                                                getPrice
                                                                                        (
                                                                                        )
                                                                        -
                                                                        p
                                                                                .
                                                                                        getPromotionPrice
                                                                                                (
                                                                                                )
                                                        )%>
                                </lablel>
                                <div class="promo">
                                    <p> Phiếu mua hàng trị giá 1 triệu</p>
                                </div>
                            </div>
                        </a>
                    </div><!-- Kết thúc một sản phẩm -->
                    <% }%>
                </div>
            </div>
        </div>
    </div>
</section> <!-- End phu kien -->
<% }%>

</section>

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
<%--<script type="text/javascript" src="js/script.slider.js"></script>--%>
<script type="text/javascript" src="js/slider.js"></script>

<jsp:include page="parts/scroll-top.jsp"></jsp:include>

<div id="category_icon_floor" style="display: none">
    <ul>
        <li class="color-scroll1 scroll-section active ">
            <a data-spy="scroll" href="#section_1">
                <i class="fas fa-mobile-alt"></i>
                <span class="scroll_tooltip_1">Điện thoại</span>
            </a>
        </li>


        <li class="color-scroll2 scroll-section">
            <a data-spy="scroll" href="#section_2">
                <i class="fas fa-tablet-alt"></i>
                <span class="scroll_tooltip_2">Tablet</span>
            </a>
        </li>


        <li class="color-scroll3 scroll-section">
            <a data-spy="scroll" href="#section_3">
                <i class="fas fa-laptop"></i>
                <span class="scroll_tooltip_3">Laptop</span>
            </a>
        </li>
        <li class="color-scroll4 scroll-section">
            <a data-spy="scroll" href="#section_4">
                <i class="fas fa-headphones-alt"></i>
                <span class="scroll_tooltip_4">Phụ kiện</span>
            </a>
        </li>
    </ul>
</div>

<script>
    $(document).ready(function () {
        // Lấy danh sách các nút
        var idElements = $(".scroll-section");
        var maxHeight = $($(idElements).last().find('a').attr("href")).offset().top + 300;
        $(window).scroll(function () {
            if ($(window).scrollTop() > 650 && $(window).scrollTop() < maxHeight) {
                $('#category_icon_floor').fadeIn();
                // console.log($($(idElements).last().attr("href")).offset().top);
                console.log();
                for (var i = 0; i < idElements.length; i++) {
                    if ($(window).scrollTop() >= ($($(idElements[i]).children().attr("href")).offset().top - ($($(idElements[i]).children().attr("href")).offset().top / 4))) {
                        // Xóa hết class active
                        for (var j = 0; j < idElements.length; j++) {
                            $(idElements[j]).removeClass('active');
                        }
                        $(idElements[i]).addClass('active');
                    }
                }
            } else {
                $('#category_icon_floor').fadeOut();
            }
        });
        // scroll body to 0px on click
        $(".scroll-section").click(function () {
            $('body,html').animate({
                scrollTop: $($(this).children().attr("href")).offset().top
            }, 400);
            return false;
        });
    });</script>
</body>
</html>
