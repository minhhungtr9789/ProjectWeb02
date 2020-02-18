<%@ page import="vn.nlu.fit.models.User" %>
<%@ page import="vn.nlu.fit.utils.Util" %>
<%@ page import="vn.nlu.fit.models.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.nlu.fit.models.OrderItem" %>
<%@ page import="vn.nlu.fit.models.Product" %>
<%@ page import="vn.nlu.fit.utils.DBUtils" %>
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
    <link rel="stylesheet" type="text/css" href="css/account.css">
</head>
<body>

<jsp:include page="parts/header.jsp"></jsp:include>

<%
    User u = (User) session.getAttribute("user");
    List<Order> list = (List<Order>) request.getAttribute("list");

%>
<!--Breadcrumb-->
<section class="breadcumb">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Thông tin tài khoản</li>
            </ol>
        </nav>
    </div>
</section><!--End breadcrumb-->

<!--Content account-->
<div class="content-account">
    <div class="container">
        <div class="row">
            <div class="left-content col-sm-3">
                <div class="profiles bg-white p-3">
                    <div class="title ">
                        <img src="img/avatar.png" alt="">
                        <div class="account-name"><%=u.getFullname()%></div>
                    </div>
                    <div class="one-line">
                        <a href="" >
                            <i class="fas fa-user"></i>
                            <span>Thông tin tài khoản</span>
                        </a>
                    </div>
                    <div class="one-line active">
                        <a href="">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>Quản lý đơn hàng</span>
                        </a>
                    </div>
                    <div class="one-line">
                        <a href="">
                            <i class="fas fa-file-invoice-dollar"></i>
                            <span>Địa chỉ</span>
                        </a>
                    </div>
                    <div class="menu"></div>
                </div>
            </div>
            <div class="right-content col-sm-9 ">
                <div class="account-profile ">
                    <h5 class="mb-0 bg-white p-3">Quản lý đơn hàng</h5>
                    <div>
                        <%
                            for (int i=0;i<list.size();i++){

                        %>
                        <div>Mã đơn hàng :<%=list.get(i).getId()%></div>
                        <div>Ngày đặt :<%=list.get(i).getDatecreate()%></div>
                        <div>Trạng thái đơn hàng :<select name="status">
                            <option value="1" <%=list.get(i).getStatus()==1?"selected":""%>>Chờ xác nhận</option>
                            <option value="2" <%=list.get(i).getStatus()==2?"selected":""%>>Đang giao</option>
                            <option value="3"<%=list.get(i).getStatus()==3?"selected":""%>>Đã giao</option>
                            <option value="4" <%=list.get(i).getStatus()==4?"selected":""%>>Đã hủy</option>
                        </select></div>

                        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                                <th>
                                    Tùy chọn
                                </th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr>
                                <%
                                    for (int j=0;j<list.get(i).getListItem().size();j++){
                                        OrderItem item = list.get(i).getListItem().get(j);
                                        Product p = DBUtils.findIdProduct(item.getId());
                                        String img = p.getListImg()[0];
                                %>
                                <td class="product-name-col">
                                    <img src="<%=img%>" width="100" height="100">
                                </td>
                                <td><%=p.getName()%>
                                </td>
                                <td><%=item.getQuantity()%>
                                </td>
                                <td><%=item.getPrice()%>
                                </td>
                                <td>
                                    <a href="ratingProduct.jsp?id=<%=item.getId()%>" class="btn-primary">Đánh giá sản phẩm</a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!--End content accoutn-->

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