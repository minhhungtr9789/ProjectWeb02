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
    <link rel="stylesheet" type="text/css" href="css/contact.css">
</head>
<body>


<jsp:include page="parts/header.jsp"></jsp:include>


<!--Breadcrumb-->
<section class="breadcumb">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Liên hệ</li>
            </ol>
        </nav>
    </div>
</section><!--End breadcrumb-->


<!--Content-->
<div class="content-contact">
    <div class="container contact"><h1 class="contact-title">Công ty cổ phần Vinpro</h1>
        <div class="row">
            <div class="col-12 headquarter"><span>Trụ sở chính:</span><span> Số 07, đường Bằng Lăng 1, Khu đô thị sinh thái Vinhomes Riverside, phường Việt Hưng, quận Long Biên, Hà Nội.</span>
            </div>
            <div class="col-sm-5 col-xs-12 contact-inner"><span>Hỗ trợ khách hàng</span><a href="tel:18006988">Hotline:
                1800 6988</a></div>
            <div class="col-sm-5 col-xs-12 contact-inner"><span>Hợp tác doanh nghiệp</span><a href="tel:18006988">Hotline:
                1800 6988</a></div>
        </div>
        <a class="vinpro-store-list btn btn-outline-primary" href="#">danh sách cửa hàng vinpro</a></div>

    <div class="container contact-form"><h2 class="contact-form-title">Gửi thông tin liên hệ</h2>
        <form id="contact-form" method="post" action="/contact-submit" class="row fv-form fv-form-bootstrap4"
              novalidate="novalidate">
            <button type="submit" class="fv-hidden-submit" style="display: none; width: 0px; height: 0px;"></button>
            <input name="token" type="hidden"> <input type="hidden" class="tk" value="bFZsazA0VHhTVUp0WUpQZUVyV0VDQT09"
                                                      name="ZDlHMFlheTNUUEdySjRINzRFemxDUT09">
            <div class="col-12"><small class="sendinfo-success" style="display: none">Gửi thành công</small> <small
                    class="sendinfo-error" style="display: none">Gửi thất bại</small></div>
            <div class="col-md-5 col-12">
                <div class="form-group"><label>Tên *</label> <input class="form-control" maxlength="150"
                                                                    name="last_name" type="text" placeholder=""
                                                                    data-fv-notempty="true"
                                                                    data-fv-notempty-message="Vui lòng nhập đầy đủ họ tên."
                                                                    data-fv-stringlength="true"
                                                                    data-fv-stringlength-max="150"
                                                                    data-fv-stringlength-message="Họ tên không vượt quá 150 ký tự."
                                                                    data-fv-field="last_name"> <small
                        class="form-control-feedback" data-fv-validator="notEmpty" data-fv-for="last_name"
                        data-fv-result="NOT_VALIDATED" style="display: none;">Vui lòng nhập đầy đủ họ tên.</small><small
                        class="form-control-feedback" data-fv-validator="stringLength" data-fv-for="last_name"
                        data-fv-result="NOT_VALIDATED" style="display: none;">Họ tên không vượt quá 150 ký tự.</small>
                </div>
                <div class="form-group"><label>Số điện thoại *</label> <input class="form-control" name="phone"
                                                                              maxlength="11" type="text" placeholder=""
                                                                              data-fv-notempty="true"
                                                                              data-fv-notempty-message="Vui lòng nhập số điện thoại. "
                                                                              data-fv-regexp="true" pattern="^(0)\d*$"
                                                                              data-fv-regexp-message="Vui lòng nhập đúng định dạng số điện thoại. "
                                                                              data-fv-stringlength="true"
                                                                              data-fv-stringlength-max="11"
                                                                              data-fv-stringlength-min="10"
                                                                              data-fv-stringlength-message="Số điện thoại lớn hơn 10 và không vượt quá 11 ký tự"
                                                                              data-fv-field="phone"> <small
                        class="form-control-feedback" data-fv-validator="notEmpty" data-fv-for="phone"
                        data-fv-result="NOT_VALIDATED" style="display: none;">Vui lòng nhập số điện
                    thoại. </small><small class="form-control-feedback" data-fv-validator="regexp" data-fv-for="phone"
                                          data-fv-result="NOT_VALIDATED" style="display: none;">Vui lòng nhập đúng định
                    dạng số điện thoại. </small><small class="form-control-feedback" data-fv-validator="stringLength"
                                                       data-fv-for="phone" data-fv-result="NOT_VALIDATED"
                                                       style="display: none;">Số điện thoại lớn hơn 10 và không vượt quá
                    11 ký tự</small></div>
                <div class="form-group"><label>Email *</label> <input class="form-control" maxlength="150" name="email"
                                                                      type="text" placeholder="" data-fv-notempty="true"
                                                                      data-fv-notempty-message="Vui lòng nhập địa chỉ email. "
                                                                      pattern="^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"
                                                                      data-fv-regexp-message=" Email không hợp lệ. "
                                                                      data-fv-emailaddress-message="Vui lòng nhập đúng định dạng Email. "
                                                                      data-fv-field="email"> <small
                        class="form-control-feedback" data-fv-validator="notEmpty" data-fv-for="email"
                        data-fv-result="NOT_VALIDATED" style="display: none;">Vui lòng nhập địa chỉ
                    email. </small><small class="form-control-feedback" data-fv-validator="regexp" data-fv-for="email"
                                          data-fv-result="NOT_VALIDATED" style="display: none;"> Email không hợp
                    lệ. </small><small class="form-control-feedback" data-fv-validator="stringLength"
                                       data-fv-for="email" data-fv-result="NOT_VALIDATED" style="display: none;">Please
                    enter a value with valid length</small></div>
            </div>
            <div class="col-md-5 col-12">
                <div class="form-group"><label>Tiêu đề</label> <input class="form-control" maxlength="150" name="title"
                                                                      type="text" placeholder="" data-fv-field="title">
                    <small class="form-control-feedback" data-fv-validator="stringLength" data-fv-for="title"
                           data-fv-result="NOT_VALIDATED" style="display: none;">Please enter a value with valid
                        length</small></div>
                <div class="form-group"><label>Nội dung</label> <textarea maxlength="1000" name="content"
                                                                          class="form-control"
                                                                          data-fv-stringlength="true"
                                                                          data-fv-stringlength-max="1000"
                                                                          data-fv-stringlength-message="Nội dung không vượt quá 1000 ký tự."
                                                                          data-fv-field="content"></textarea> <small
                        class="form-control-feedback" data-fv-validator="stringLength" data-fv-for="content"
                        data-fv-result="NOT_VALIDATED" style="display: none;">Nội dung không vượt quá 1000 ký
                    tự.</small></div>
            </div>
            <div class="col-12">
                <button type="button" class="btn btn-sendinfo">Gửi thông tin</button>
            </div>
        </form>
    </div>
</div>
</div>
<!--End content-->

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