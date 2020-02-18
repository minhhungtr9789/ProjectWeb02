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
    <link rel="stylesheet" type="text/css" href="css/account.css">
</head>
<body>

<jsp:include page="parts/header.jsp"></jsp:include>


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
                        <div class="account-name">Minh Hùng Trần</div>
                    </div>
                    <div class="one-line active">
                        <a href="" >
                            <i class="fas fa-user"></i>
                            <span>Thông tin tài khoản</span>
                        </a>
                    </div>
                    <div class="one-line">
                        <a href="<%=Util.fullPath("order")%>">
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
                    <h5 class="mb-0 bg-white p-3">Thông tin tài khoản</h5>
                    <div class="profile bg-white mt-3">
                        <div class="col-sm-8">
                            <form action="" class="p-3">
                                <div>
                                    <label for="name">Họ tên</label>
                                    <div class="d-inline-block"><input type="text" name="" id="name" value="Minh Hùng Trần"></div>
                                </div>
                                <div>
                                    <label for="phone">Số điện thoại</label>
                                    <div class="d-inline-block"><input type="text" name="" id="phone" value="0123456789"></div>
                                </div>
                                <div>
                                    <label for="email-user">Email</label>
                                    <div class="d-inline-block"><input type="text" name="" id="email-user" value="123456@gmail.com"></div>
                                </div>
                                <div>
                                    <label for="gender">Giới tính</label>
                                    <div  id="gender" class="btn-group d-inline-block" role="group" aria-label="Basic example">
                                        <button type="button" class="btn btn-outline-primary">Nam</button>
                                        <button type="button" class="btn btn-outline-primary">Nữ</button>
                                        <button type="button" class="btn btn-outline-primary">Khác</button>
                                    </div>
                                </div>

                                <div>
                                    <label for="pass-1">Mật khẩu cũ</label>
                                    <div class="d-inline-block"><input type="text" name="" id="pass-1" placeholder="Nhập mật khẩu cũ"></div>
                                </div>
                                <div>
                                    <label for="pass-2">Mật khẩu mới</label>
                                    <div class="d-inline-block"><input type="text" name="" id="pass-2" placeholder="Mật khẩu lớn hơn 8 ký tự"></div>
                                </div>
                                <div>
                                    <label for="pass-3">Nhập lại</label>
                                    <div class="d-inline-block"><input type="text" name="" id="pass-3" placeholder="Nhập lại mật khẩu mới"></div>
                                </div>
                                <button type="submit" class="btn btn-primary btnUd">Cập nhật</button>
                            </form>
                        </div>
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