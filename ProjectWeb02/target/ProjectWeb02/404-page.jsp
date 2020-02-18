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

</head>
<body>


<jsp:include page="parts/header.jsp"></jsp:include>


<div class="container" style="background: white;margin-bottom: 15px">
    <div class="error-session" style="padding: 24px;">
        <div class="row" style=" display: flex;justify-content: center; align-items: center;">
            <div class="img-error col-sm-6" style="text-align: center;">
                <img class="wmx100" src="img/404.svg" alt="Page not found">
            </div>
            <div class="text-error col-sm-6">
                <h1 class="fs-headline1 mb4" style="font-size: 27px;">Không tìm thấy trang</h1>
                <div class="fs-subheading mb24">
                    <p>Rất tiếc, chúng tôi không thể tìm thấy trang bạn yêu cầu.
                    </p>
                </div>
                <div class="fs-body2">
                    <p>Hãy thử tìm kiếm những câu hỏi tương tự</p>
                    <p>Nếu bạn cảm thấy thiếu một cái gì đó ở đây, <a href="<%=Util.fullPath("contact.jsp")%>">hãy liên hệ với chúng
                        tôi</a>.</p>
                </div>
            </div>
        </div>
    </div>
</div>

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

<jsp:include page="parts/scroll-top.jsp"></jsp:include>
</body>
</html>
