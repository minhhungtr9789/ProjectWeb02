<%@ page import="vn.nlu.fit.models.Product" %>
<%@ page import="vn.nlu.fit.utils.Util" %>
<%@ page import="vn.nlu.fit.models.Brand" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="vn.nlu.fit.models.KeyValueOfPrices" %>
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

    <!-- Filter product noi bat -->
    <section class="products">
        <div class="container">
            <div class="row">
                <div class=" pr-0 pl-0">
                    <div class="filter">
                        <div class="title">
                            Bộ lọc tìm kiếm
                        </div>
                        <div id="filters">
                            <div class="card">
                                <div class="card-header" data-toggle="collapse"
                                     data-target="#collapseOne">Hãng sản xuất
                                    <i class="fas fa-chevron-down"></i>
                                </div>
                                <div id="collapseOne" class="collapse show">
                                    <div class="card-body">
                                        <div class="filter-checkbox" id="group-check01">
                                            <div class="checkbox-wrap check-all">
                                                <label class="label-wrap">
                                                    <input type="checkbox" class="check-box" onclick=""
                                                           data-id="group-check01">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    Tất cả
                                                </label>
                                            </div>
                                            <%
                                                if (brandList.size() != 0) {
                                                    for (Brand item : brandList) {%>
                                            <div class="checkbox-wrap checkbox ">
                                                <label class="label-wrap">
                                                    <input type="checkbox" class="check-box brand"
                                                           value="<%=item.getBrandId()%>" data-id="group-check01">
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
                            <div class="card">
                                <div class="card-header" data-toggle="collapse"
                                     data-target="#collapseTwo">Giá sản phẩm
                                    <i class="fas fa-chevron-down"></i>
                                </div>
                                <div id="collapseTwo" class="collapse show">
                                    <div class="card-body">
                                        <div class="filter-checkbox" id="group-check02">
                                            <div class="checkbox-wrap check-all">
                                                <label class="label-wrap">
                                                    <input type="checkbox" class="check-box" data-id="group-check02">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    Tất cả
                                                </label>
                                            </div>
                                            <%
                                                ArrayList<KeyValueOfPrices> prices = new ArrayList<>();
                                                prices.add(new KeyValueOfPrices("0-2000000", "Dưới 2 triệu"));
                                                prices.add(new KeyValueOfPrices("2000000-4000000", "Từ 2 - 4 triệu"));
                                                prices.add(new KeyValueOfPrices("4000000-7000000", "Từ 4 - 7 triệu"));
                                                prices.add(new KeyValueOfPrices("7000000-13000000", "Từ 7 - 13 triệu"));
                                                prices.add(new KeyValueOfPrices("13000000-200000000", "Trên 13 triệu"));
                                            %>
                                            <%
                                                for (KeyValueOfPrices st : prices) {
                                            %>
                                            <div class="checkbox-wrap checkbox">
                                                <label class="label-wrap">
                                                    <input type="checkbox" class="check-box price"
                                                           value="<%=st.getKey()%>"
                                                           data-id="group-check02">
                                                    <span class="checkmark"><i class="fas fa-check"></i></span>
                                                    <%=st.getValue()%>
                                                </label>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" data-toggle="collapse"
                                     data-target="#collapseThree">Bộ nhớ Ram
                                    <i class="fas fa-chevron-down"></i>
                                </div>
                                <div id="collapseThree" class="collapse">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">First item</li>
                                        <li class="list-group-item">Second item</li>
                                        <li class="list-group-item">Third item</li>
                                        <li class="list-group-item">Fourth item</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="resultFilter">
                    <div class="resultFilter-swrap">
                        <div class="sectionTitle">
                            <a href="#"><h2><%=catalogName%> nổi bật nhất</h2></a>
                            <div id="sort" class="dropdown ">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton"
                                        data-toggle="dropdown" data-value="noi-bat-nhat" aria-haspopup="true" aria-expanded="false">
                                    Sắp xếp theo: <span class="sortText">Nổi bật nhất</span> <i class="icdt"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" data-value="noi-bat-nhat" href="javascript:;">
                                        <i class="fas fa-check"></i>Nổi bật nhất</a>
                                    <a class="dropdown-item" data-value="gia-cao-den-thap" href="javascript:;">Giá cao đến thấp</a>
                                    <a class="dropdown-item" data-value="gia-thap-den-cao" href="javascript:;">
                                        Giá thấp đến cao
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="choosedfilter">
                            <div class="content">
                                <strong>LỌC THEO: </strong>
                                <span class="btn btn-primary">Từ 2 - 4 triệu
                                    <i class="fas fa-times"></i>
                                </span>
                                <span class="btn btn-danger">Xóa tất cả
                                    <i class="fas fa-times"></i>
                                </span>
                            </div>
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
                        <!-- Phân trang  -->
                        <div id="pagination" class="pagination">
                            <div class="container bg_white">
                                <nav aria-label="Page navigation example">
                                    <ul class="list-page pagination  justify-content-center">
                                        <%if (numberOfPages == 1) {%>
                                        <li class="page-item active"><a class="page-link" onclick="items(this)" href="javascript:;">1</a></li>
                                        <%} else {%>
                                        <li id="btn_prev" class="page-item<%=pageProduct==1?" disabled":""%>">
                                            <a class="page-link" onclick="prevPage()"  href="javascript:;"
                                               aria-label="Previous">
                                                <span aria-hidden="true">Trước</span>
                                            </a>
                                        </li>
                                        <%
                                            for (int i = 0; i < numberOfPages; i++) {%>
                                        <li class="page-item item <%=pageProduct==i+1?" active":""%>">
                                            <a class="page-link" onclick="items(this)" href="javascript:;"><%=i + 1%>
                                            </a>
                                        </li>
                                        <% }%>
                                        <li id="btn_next" class="page-item<%=pageProduct==numberOfPages?" disabled":""%>">
                                            <a class="page-link" onclick="nextPage()"  href="javascript:;"
                                               aria-label="Next">
                                                <span aria-hidden="true">Tiếp</span>
                                            </a>
                                        </li>
                                        <%}%>
                                    </ul>
                                </nav>
                            </div>
                        </div><!-- End phân trang  -->
                        <div class="loaderWrap" style="display: none">
                            <div class="loader"></div>
                        </div>
                        <div class="nullResult" style="display: none">
                            <div class="container" style="padding: 50px;text-align: center;">
                                <img src="img/noti-search.png" alt="">
                                <p class="fs-senull-l2">Rất tiếc chúng tôi không tìm thấy kết quả theo yêu cầu của bạn
                                    Vui lòng thử lại .</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> <!-- End dien thoai noi bat -->


    <%
    } else {
    %>
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
<%--<script src="js/owl.carousel.min.js"></script>--%>
<%--<script src="js/jquery.sticky.js"></script>--%>

<!-- jQuery easing -->
<script src="js/jquery.easing.1.3.min.js"></script>

<!-- Main Script -->
<%--<script src="js/main.js"></script>--%>

<!-- Slider -->
<script type="text/javascript" src="js/bxslider.min.js"></script>
<script type="text/javascript" src="js/script.slider.js"></script>

<script type="text/javascript" src="js/mymain.js"></script>
<script type="text/javascript" src="<%=Util.fullPath("js/utils.js")%>"></script>

<script>
    var groupCheckListID, groupCheckList;
    // check/ uncheck all check box
    $(".check-all").click(function () {
        groupCheckListID = $(this).find('input').data('id');
        groupCheckList = $('#' + groupCheckListID).find('.checkbox');
        groupCheckList.find('input').prop("checked", false);
        if ($(this).find('input').is(':checked')) {
            $('#' + groupCheckListID).find(".check-all").find('input').click(false);
        } else {
            $('#' + groupCheckListID).find(".check-all").find('input').prop("checked", true);
        }
    });

    $(".checkbox").click(function () {
        groupCheckListID = $(this).find('input').data('id');
        groupCheckList = $('#' + groupCheckListID).find('.checkbox');
        if (allChecked(groupCheckList)) {
            $('#' + groupCheckListID).find(".check-all").find('input').prop("checked", true);
            groupCheckList.find('input').prop("checked", false);
        } else {
            $('#' + groupCheckListID).find(".check-all").find('input').prop("checked", false);
        }
        if (allUnChecked(groupCheckList)) {
            $('#' + groupCheckListID).find(".check-all").find('input').prop("checked", true);
        } else {
            $('#' + groupCheckListID).find(".check-all").find('input').prop("checked", false);
        }
    });

    $(".card").each(function () {
        var groupCheckListID = $(this).find(".check-all").find('input').data('id');
        var groupCheckList = $('#' + groupCheckListID).find('.checkbox');
        if (allUnChecked(groupCheckList)) {
            $('#' + groupCheckListID).find(".check-all").find('input').prop("checked", true);
        } else {

        }
    });


    function allChecked(groupCheckList) {
        var check = true;
        var checkboxes = groupCheckList;
        for (var i = 0; i < checkboxes.size(); i++) {
            if (!checkboxes[i].getElementsByTagName('input')[0].checked) {
                check = false;
            }
        }
        // console.log(check);
        return check;
    }

    function allUnChecked(groupCheckList) {
        var check = true;
        var checkboxes = groupCheckList;
        for (var i = 0; i < checkboxes.size(); i++) {
            if (checkboxes[i].getElementsByTagName('input')[0].checked) {
                check = false;
            }
        }
        // console.log(check);
        return check;
    }
</script>
<jsp:include page="parts/scroll-top.jsp"></jsp:include>
</body>
