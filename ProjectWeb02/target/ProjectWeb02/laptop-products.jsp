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
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>


<jsp:include page="parts/header.jsp"></jsp:include>
<jsp:include page="/laptopList"></jsp:include>
<%
    ArrayList<Product> firstLaptopList = (ArrayList<Product>) request.getAttribute("firstLaptopList");
    ArrayList<Product> laptopList = (ArrayList<Product>) request.getAttribute("laptopList");
%>

<!--Breadcrumb-->
<section class="breadcumb">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Laptop</li>
            </ol>
        </nav>
    </div>
</section><!--End breadcrumb-->

<!--Search bar-->
<div class="search-bar">
    <div class="container">
        <div class="content">
            <!-- One dropdown -->
            <div class="btn-group">
                <button type="button" class="btn btn-outline-primary  dropdown-toggle" data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false">
                    Thương hiệu
                </button>

                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Separated link</a>
                </div>
            </div><!-- End one dropdown -->
            <!-- One dropdown -->
            <div class="btn-group">
                <button type="button" class="btn btn-outline-primary  dropdown-toggle" data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false">
                    Giá sản phẩm
                </button>

                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Separated link</a>
                </div>
            </div><!-- End one dropdown -->
            <!-- One dropdown -->
            <div class="btn-group">
                <button type="button" class="btn btn-outline-primary  dropdown-toggle" data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false">
                    Kích thước màn hình
                </button>

                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Separated link</a>
                </div>
            </div><!-- End one dropdown -->
            <!-- One dropdown -->
            <div class="btn-group">
                <button type="button" class="btn btn-outline-primary  dropdown-toggle" data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false">
                    Bộ vi xử lý
                </button>

                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Separated link</a>
                </div>
            </div><!-- End one dropdown -->
            <!-- One dropdown -->
            <div class="btn-group">
                <button type="button" class="btn btn-outline-primary  dropdown-toggle" data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false">
                    Card đồ họa
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Separated link</a>
                </div>
            </div><!-- End one dropdown -->
            <!-- One dropdown -->
            <div class="btn-group">
                <button type="button" class="btn btn-outline-primary  dropdown-toggle" data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false">
                    Bộ nhớ RAM
                </button>

                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Separated link</a>
                </div>
            </div><!-- End one dropdown -->
            <!-- One dropdown -->
            <div class="btn-group float-right">
                <button type="button" class="btn btn-outline-primary  dropdown-toggle" data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false">
                    Sắp xếp
                </button>

                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#">Bán chạy nhất</a>
                    <a class="dropdown-item" href="#">Giá thấp đến cao</a>
                    <a class="dropdown-item" href="#">Giá cao đến thấp</a>
                </div>
            </div><!-- End one dropdown -->
        </div>
    </div>
</div>
<!--End search bar-->
<!-- Tablet noi bat -->
<section class="products">
    <div class="container">
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
                    <% for (Product p : firstLaptopList) { %>
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
                    <!-- Một sản phẩm -->
                    <% for (Product p : laptopList) { %>
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
</section> <!-- End Tablet noi bat -->

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

<jsp:include page="parts/scroll-top.jsp"></jsp:include>
</body>
</html>
