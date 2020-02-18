<%@ page import="vn.nlu.fit.models.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.nlu.fit.utils.Util" %>
<%@ page import="vn.nlu.fit.models.Brand" %>
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

<%
    //  Product List
    ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");
//  Brand List
    ArrayList<Brand> brandList = (ArrayList<Brand>) request.getAttribute("brandList");

//  Tên servlet
    String servletPath = (String) request.getAttribute("servletPath");
    servletPath = servletPath.substring(1);

//    System.out.println(request.getParameter("sort"));
    String brand = request.getParameter("brand");
    String price = request.getParameter("price");

    String queryString = "?";

    if (brand != null) {
        queryString += "brand=" + brand;
        if (price != null) {
            queryString += "&price=" + price;
        }
    } else {
        if (price != null) {
            queryString += "price=" + price;
        }
    }


    if ("?".equals(queryString)) {
        queryString = "";
    }

    String id = (String) request.getAttribute("catalog");
//  Số lượng phân trang
    int numberOfPages = (Integer) request.getAttribute("numberOfPages");
//  Số trang
    int pageProduct = (Integer) request.getAttribute("page");

    String catalogName = "";
    if ("1".equals(id)) catalogName = "Điện thoại";
    if ("2".equals(id)) catalogName = "Laptop";
    if ("3".equals(id)) catalogName = "Tablet";
    if ("4".equals(id)) catalogName = "Phụ kiện";
%>

<section class="main-content">

    <!--Breadcrumb-->
    <section class="breadcumb">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%=Util.fullPath("")%>">Trang chủ</a></li>

                    <li class="breadcrumb-item active" aria-current="page"><%=catalogName%>
                    </li>
                </ol>
            </nav>
        </div>
    </section><!--End breadcrumb-->

    <%if (list.size() != 0) {%>
    <!--Search bar-->
    <div class="search-bar">
        <div class="container">
            <div class="content">
                <!-- One dropdown -->
                <div class="btn-group">
                    <button type="button" class="btn btn-outline-primary  dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                            onclick="filterProduct()"
                    >
                        Thương hiệu
                    </button>

                    <div class="dropdown-menu">
                        <%
                            if (brandList.size() != 0) {
                                for (Brand item : brandList) {
                                    if ("".equals(queryString)) { %>
                        <a class="dropdown-item" href="<%=Util.fullPath(servletPath+"?brand="+item.getBrandName())%>">
                            <%=item.getBrandName()%>
                        </a>
                        <% } else {%>
                        <a class="dropdown-item"
                           href="<%=Util.fullPath(servletPath+queryString+"&brand="+item.getBrandName())%>">
                            <%=item.getBrandName()%>
                        </a>
                        <%
                                    }
                                }
                            }
                        %>
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
                        <%if ("".equals(queryString)) {%>

                        <a class="dropdown-item" href="<%=Util.fullPath(servletPath+"?price=duoi-2-trieu")%>">Dưới 2
                            triệu</a>
                        <a class="dropdown-item" href="<%=Util.fullPath(servletPath+"?price=tu-2-4-trieu")%>">Từ 2 - 4
                            triệu</a>
                        <a class="dropdown-item" href="<%=Util.fullPath(servletPath+"?price=tu-4-7-trieu")%>">Từ 4 - 7
                            triệu</a>
                        <a class="dropdown-item" href="<%=Util.fullPath(servletPath+"?price=tu-7-13-trieu")%>">Từ 7 - 13
                            triệu</a>
                        <a class="dropdown-item" href="<%=Util.fullPath(servletPath+"?price=tren-13-trieu")%>">Trên 13
                            triệu</a>
                        <%} else {%>
                        <a class="dropdown-item"
                           href="<%=Util.fullPath(servletPath+queryString+"&price=duoi-2-trieu")%>">Dưới 2
                            triệu</a>
                        <a class="dropdown-item"
                           href="<%=Util.fullPath(servletPath+queryString+"&price=tu-2-4-trieu")%>">Từ 2 - 4
                            triệu</a>
                        <a class="dropdown-item"
                           href="<%=Util.fullPath(servletPath+queryString+"&price=tu-4-7-trieu")%>">Từ 4 - 7
                            triệu</a>
                        <a class="dropdown-item"
                           href="<%=Util.fullPath(servletPath+queryString+"&price=tu-7-13-trieu")%>">Từ 7 - 13
                            triệu</a>
                        <a class="dropdown-item"
                           href="<%=Util.fullPath(servletPath+queryString+"&price=tren-13-trieu")%>">Trên 13
                            triệu</a>
                        <%}%>
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
                <div class="btn-group">
                    <button type="button" class="btn btn-outline-primary  dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false">
                        Camera
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
                        Tính năng khác
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
                        <a class="dropdown-item" href="#">Nổi bật nhất</a>

                        <a class="dropdown-item" href="<%=Util.fullPath(servletPath+"&sort=gia-thap-den-cao")%>">Giá
                            thấp
                            đến cao</a>
                        <a class="dropdown-item" href="#">Giá cao đến thấp</a>
                    </div>
                </div><!-- End one dropdown -->
            </div>
        </div>
    </div>
    <!--End search bar-->

    <!--Choosed filter-->
    <div class="choosedfilter">
        <div class="container">
            <div class="content">
                <strong>LỌC THEO: </strong>
                <a href="#" class="btn btn-primary">Từ 2 - 4 triệu
                    <i class="fas fa-times"></i>
                </a>
                <a href="#" class="btn btn-danger">Xóa tất cả
                    <i class="fas fa-times"></i>
                </a>
            </div>
        </div>
    </div><!--End Choosed filter-->

    <!-- Tablet noi bat -->
    <section class="products">
        <div class="container">
            <div class="row">
                <div class=" pr-0 pl-0">
                    <div class="filter">
                        BỘ LỌC
                        <div class="brand-filter">
                            <h4>Hãng sản xuất</h4>
                            <div class="filter-checkbox">
                                <div class="checkbox-wrap check-all">
                                    <label class="label-wrap">
                                        <input type="checkbox" class="check-box" onclick="" data-id="SSGN10">
                                        <span class="checkmark"><i class="fas fa-check"></i></span>
                                        Tất cả
                                    </label>
                                </div>
                                <%
                                    if (brandList.size() != 0) {
                                        for (Brand item : brandList) {%>
                                <div class="checkbox-wrap checkbox ">
                                    <label class="label-wrap">
                                        <input type="checkbox" class="check-box brand" value="<%=item.getBrandId()%>">
                                        <span class="checkmark"><i class="fas fa-check"></i></span>
                                        <%=item.getBrandName()%>
                                    </label>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="resultFilter  ">
                    <div class="sectionTitle">
                        <a href="#"><h2><%=catalogName%> nổi bật nhất</h2></a>

                        <%--            <div class="section-menu">--%>
                        <%--                <ol class="breadcrumb">--%>
                        <%--                    <li><a href="#"><h2>Apple</h2></a></li>--%>
                        <%--                    <li><a href="#"><h2>Samsung</h2></a></li>--%>
                        <%--                    <li><a href="#"><h2>Nokia</h2></a></li>--%>
                        <%--                    <li><a href="#"><h2>OPPO</h2></a></li>--%>
                        <%--                </ol>--%>
                        <%--            </div>--%>
                    </div>
                    <div class="list-product">
                        <div class="product-item">
                            <div class="row">
                                <!-- Một sản phẩm -->
                                <% for (Product p : list) { %>
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
            </div>
        </div>
    </section> <!-- End dien thoai noi bat -->

    <!-- Phân trang  -->
    <section class="pagination">
        <div class="container bg_white">
            <nav aria-label="Page navigation example">
                <ul class="pagination  justify-content-end">
                    <%if (numberOfPages == 1) {%>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <%} else {%>
                    <li class="page-item <%=pageProduct==1?"disabled":""%>">
                        <a class="page-link" href="<%=Util.fullPath(servletPath+"?page="+( pageProduct - 1))%>"
                           aria-label="Previous">
                            <span aria-hidden="true">Trước</span>
                        </a>
                    </li>
                    <%
                        for (int i = 0; i < numberOfPages; i++) {%>
                    <li class="page-item <%=pageProduct==i+1?"active":""%>">
                        <a class="page-link" href="<%=Util.fullPath(servletPath+"?page="+(i+1))%>"><%=i + 1%>
                        </a>
                    </li>
                    <% }%>
                    <li class="page-item <%=pageProduct==numberOfPages?"disabled":""%>">
                        <a class="page-link" href="<%=Util.fullPath(servletPath+"?page="+(pageProduct + 1))%>"
                           aria-label="Next">
                            <span aria-hidden="true">Tiếp</span>
                        </a>
                    </li>
                    <%}%>
                </ul>
            </nav>
        </div>
    </section><!-- End phân trang  -->

    <%} else {%>
    <div class="container" style="padding: 50px;text-align: center;">
        <img src="img/noti-search.png" alt="">
        <p class="fs-senull-l2"><strong>
            Xin lỗi, chúng tôi không thể tìm được kết quả hợp với tìm kiếm của bạn
        </strong></p>
        <div class="fs-senullbob">
            <h4>Để tìm được kết quả chính xác hơn, xin vui lòng:</h4>
            <ul>
                <li>Kiểm tra lỗi chính tả của từ khóa đã nhập</li>
                <li>Thử lại bằng từ khóa khác</li>
                <li>Thử lại bằng những từ khóa tổng quát hơn</li>
                <li>Thử lại bằng những từ khóa ngắn gọn hơn</li>
            </ul>
        </div>
    </div>
    <%}%>

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
<script type="text/javascript" src="js/script.slider.js"></script>

<script>
    function filterProduct() {


    }

    $('input[type=checkbox]').click(function () {
        var brand = JSON.stringify(get_filter_text('brand'));
        var price = 'data price';
        console.log(brand);
        $.ajax({
            url: 'mobileList',
            type: 'post',
            data: { // Danh sách các thuộc tính sẽ gửi đi
                brand, price
            },
            datatype: 'json',
            headers: {
                Accept: "application/json; charset=utf-8",
            },
            error: function () {
                alert("error");
            },
            success: function (data) {
                // alert("success");
                // var myObj = JSON.parse(data);
                // id = myObj.id;
                // var catalogName = myObj.name;
                // var catalogParentId = myObj.parentId;
                // $('#catalog-name').val(catalogName);
                // $('#catalog-select').find('option').each(function () {
                //     var selected = $(this);
                //
                //     if (selected.val() == catalogParentId) {
                //         console.log(selected);
                //         console.log(selected.val());
                //         selected.attr('selected', true);
                //     } else {
                //         selected.attr("selected", false);
                //     }
                // })
                // if (catalogParentId)
            }
        });
    });

    function get_filter_text(text_class) {
        var filter_data = [];
        $('.' + text_class + ':checked').each(function () {
            filter_data.push($(this).val());
        });
        // console.log(filter_data);
        return filter_data
    }
</script>

<script>
    // check/ uncheck all check box
    $(".check-all").click(function () {
        $(".checkbox").find('input').prop("checked", $(this).find('input').is(':checked'));
    });

    $(".checkbox").click(function () {
        if (allChecked()) {
            $(".check-all").find('input').prop("checked", true);
        } else {
            $(".check-all").find('input').prop("checked", false);
        }
    });

    if (allChecked()) {
        $(".check-all").find('input').prop("checked", true);
    } else {
        $(".check-all").find('input').prop("checked", false);
    }

    function allChecked() {
        var check = true;
        var checkboxes = document.getElementsByClassName("checkbox");
        for (var i = 0; i < checkboxes.length; i++) {
            if (!checkboxes[i].getElementsByTagName('input')[0].checked) {
                check = false;
            }
        }
        // console.log(check);
        return check;
    }
</script>
<jsp:include page="parts/scroll-top.jsp"></jsp:include>
</body>
