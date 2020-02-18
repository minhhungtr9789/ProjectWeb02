<%@ page import="vn.nlu.fit.models.User" %>
<%@ page import="vn.nlu.fit.utils.Util" %>
<%--
  Created by IntelliJ IDEA.
  User: Minh Hung Tran
  Date: 15/11/2019
  Time: 7:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!--Sign in-->
<div class="sign">
    <div class="modal fade" id="sign-in-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
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
<!--End sign in-->

<!--Forgot pass-->
<div class="sign">
    <div class="modal fade" id="forgot-pass-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="forgot-pass">Đặt Lại Mật Khẩu</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="email-phone" class="col-form-label">Vui lòng nhập địa chỉ email hoặc số điện
                                thoại bạn đã đăng ký</label>
                            <input type="text" class="form-control" id="email-phone" placeholder="Email/ Số điện thoại">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-toggle="modal"
                            data-target="#sign-in-model" data-dismiss="modal">Trở lại
                    </button>
                    <button type="button" class="btn btn-primary">Tiếp tục</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End forgot pass-->

<!--Sign up-->
<div class="sign">
    <div class="modal fade" id="sign-up-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="sign-up">Đăng ký</h5>
                    <button data-toggle="modal" data-dismiss="modal" data-target="#sign-in-model"
                            class="btn btn btn-outline-primary text-right">Đăng nhập
                    </button>
                </div>
                <form id="signUpForm" action="<%= Util.fullPath("signUp")%>" method="post">
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="text" name="userName" class="form-control"
                                   id="user-name" placeholder="Tên đăng nhập">
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" class="form-control"
                                   id="user-email" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <input type="text" name="fullName" class="form-control"
                                   id="full-name" placeholder="Tên của bạn">
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" class="form-control"
                                   id="pass" placeholder="Mật khẩu">
                        </div>
                        <div class="form-group">
                            <input type="password" name="rePassword" class="form-control" id="rePass"
                                   placeholder="Xác nhận mật khẩu">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-primary"
                                    data-toggle="modal" data-dismiss="modal"
                                    data-target="#sign-in-model">Trở lại
                            </button>
                            <button type="submit" onclick="submitLogup(event)" class="btn btn-primary">Đăng ký</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--End sign up-->

<div class="header-area">

    <div class="container">
        <div class="row">
            <div class="col-md-12 text-right">
                <div class="user-menu">
                    <ul>
                        <%
                            User user = (User) session.getAttribute("user");
                            if (user != null) {
                        %>
                        <li><a href="account.jsp"><i class="fa fa-user"></i>Tài khoản: <%=user.getUsername()%>
                        </a></li>
                        <li><a href="" onclick="submitLogout()"><i class="fas fa-user-plus"></i>
                            Đăng xuất</a></li>
                        <%} else {%>

                        <li><a href="" data-toggle="modal"
                               data-target="#sign-in-model"><i class="fa fa-user"></i>Đăng
                            nhập</a></li>

                        <li><a href="" data-toggle="modal"
                               data-target="#sign-up-model"><i class="fas fa-user-plus"></i>
                            Đăng ký</a></li>
                        <%}%>

                        <li><a href="<%=Util.fullPath("CartServlet?action=view")%>"><i class="fa fa-shopping-cart"></i>Giỏ
                            hàng</a></li>

                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- End header area -->

<div class="site-branding-area">
    <div class="container">
        <div class="row">
            <div class="col-sm-2">
                <div class="logo">
                    <h1><a href="<%=Util.fullPath("")%>"><img src="img/logo.png" alt="Trang chủ"></a></h1>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="searchBar">
                    <form class="form-inline" action="SearchPageServlet" method="get">
                        <input required name="keys" class="form-control mr-sm-2 searchInput" type="text"
                               placeholder="Bạn tìm gì..." oninput="this.setCustomValidity('')"
                               aria-label="Search" onkeyup="showResult()"
                               oninvalid="this.setCustomValidity('Bạn chưa nhập từ khóa tìm kiếm') ">
                        <button class="btn btn-primary my-2 my-sm-0" type="submit"><i
                                class="fa fa-search"></i></button>

                        <!--Search result-->
                        <div class="fs-sresult" style="display: none">
                            <div class="fs-sremain">
                                <ul style="display: block;">
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-2">
                <div class="shopping-item">
                    <a href="<%=Util.fullPath("CartServlet?action=view")%>"> <i
                            class="fa fa-shopping-cart"></i>
                        <%
                            int count;
                            if (user != null) {
                                count = user.getCart().totalItems();%>
                        <span class="product-count">
                                    <%=count%>
                                </span>
                        <%}%>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End site branding area -->

<!-- jQuery -->
<script src="js/jquery.js"></script>
<div class="mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="<%=Util.fullPath("")%>">Trang chủ</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li><a href="<%=Util.fullPath("mobileList")%>">
                                <i class="fas fa-mobile-alt"></i>
                                Điện thoại</a>

                                <!-- Sub menu -->
                                <ul class="mn-sub">
                                    <li class="phone-bg">
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Apple</a></li>
                                            <li><a href="">Samsung</a></li>
                                            <li><a href="">Oppo</a></li>
                                            <li><a href="">Xiaomi</a></li>
                                        </ul>
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Vivo</a></li>
                                            <li><a href="">Realme</a></li>
                                            <li><a href="">Huawei</a></li>
                                            <li><a href="">Nokia</a></li>
                                        </ul>
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Mobell</a></li>
                                        </ul>
                                    </li>
                                    <li class="phone-bg" class="hangCC">
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Hàng cao cấp</a></li>
                                            <li><a href="">Hàng trung cấp</a></li>
                                            <li><a href="">Hàng phổ thông</a></li>
                                        </ul>
                                    </li>
                                </ul> <!-- End sub menu -->

                            </li>
                            <li><a href="<%=Util.fullPath("tabletList")%>">
                                <i class="fas fa-tablet-alt"></i>
                                Tablet</a>

                                <!-- Sub menu -->
                                <ul class="mn-sub tablet">
                                    <li class="phone-bg">
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Apple</a></li>
                                            <li><a href="">Samsung</a></li>
                                            <li><a href="">Oppo</a></li>
                                            <li><a href="">Xiaomi</a></li>
                                        </ul>
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Vivo</a></li>
                                            <li><a href="">Realme</a></li>
                                            <li><a href="">Huawei</a></li>
                                            <li><a href="">Nokia</a></li>
                                        </ul>
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Mobell</a></li>
                                        </ul>
                                    </li>
                                    <li class="phone-bg" class="hangCC">
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Hàng cao cấp</a></li>
                                            <li><a href="">Hàng trung cấp</a></li>
                                            <li><a href="">Hàng phổ thông</a></li>
                                        </ul>
                                    </li>
                                </ul> <!-- End sub menu -->

                            </li>
                            <li><a href="<%=Util.fullPath("laptopList")%>">
                                <i class="fas fa-laptop"></i>
                                Laptop</a>
                                <!-- Sub menu -->
                                <ul class="mn-sub laptop">
                                    <li class="phone-bg">
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Apple</a></li>
                                            <li><a href="">Samsung</a></li>
                                            <li><a href="">Oppo</a></li>
                                            <li><a href="">Xiaomi</a></li>
                                        </ul>
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Vivo</a></li>
                                            <li><a href="">Realme</a></li>
                                            <li><a href="">Huawei</a></li>
                                            <li><a href="">Nokia</a></li>
                                        </ul>
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Mobell</a></li>
                                        </ul>
                                    </li>
                                    <li class="phone-bg" class="hangCC">
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Hàng cao cấp</a></li>
                                            <li><a href="">Hàng trung cấp</a></li>
                                            <li><a href="">Hàng phổ thông</a></li>
                                        </ul>
                                    </li>
                                </ul> <!-- End sub menu -->

                            </li>
                            <li><a href="<%=Util.fullPath("phuKienList")%>">
                                <i class="fas fa-headphones-alt"></i>
                                Phụ kiện</a>
                                <!-- Sub menu -->
                                <ul class="mn-sub phuKien">
                                    <li class="phone-bg">
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Apple</a></li>
                                            <li><a href="">Samsung</a></li>
                                            <li><a href="">Oppo</a></li>
                                            <li><a href="">Xiaomi</a></li>
                                        </ul>
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Vivo</a></li>
                                            <li><a href="">Realme</a></li>
                                            <li><a href="">Huawei</a></li>
                                            <li><a href="">Nokia</a></li>
                                        </ul>
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Mobell</a></li>
                                        </ul>
                                    </li>
                                    <li class="phone-bg" class="hangCC">
                                        <ul class="clearlist menu-dt">
                                            <li><a href="">Hàng cao cấp</a></li>
                                            <li><a href="">Hàng trung cấp</a></li>
                                            <li><a href="">Hàng phổ thông</a></li>
                                        </ul>
                                    </li>
                                </ul> <!-- End sub menu -->

                            </li>
                            <li><a href="about.jsp">
                                Giới thiệu</a></li>
                            <li><a href="contact.jsp">
                                Liên hệ</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- End mainmenu area -->

<%--Search product--%>
<script type="text/javascript">
    var dataJon = "[]";

    $(document).mouseup(function (e) {
        if ($(e.target).closest(".fs-sresult").length === 0) {
            $(".fs-sresult").hide();
        }
    });
    $(".searchInput").click(function () {
        $(".fs-sresult").show();
    });

    function showResult() {
        var keys = $(".searchInput").val();
        if (keys == "") {
            $(".fs-sresult").hide();
        }
        if (keys != "") {
            $(".fs-sresult").show();
            // $(".fs-sresult").find("li.black>a>b>i").html(keys);
        }

        $.ajax({
            type: "GET",
            url: 'SearchServlet?keys=' + keys,
            // dataType: return
            // dataType: "application/json",
            headers: {
                Accept: "application/json; charset=utf-8",
                "Content-Type": "application/json; charset=utf-8"
            },
            error: function () {
                // $('#info').html('<p>An error has occurred</p>');
            },
            success: function (data) {
                dataJon = data;
                var obj = $.parseJSON(data);
                $(".fs-sresult").find("ul>li").remove();
                var length = obj.length;
                if (length >= 6) length = 6;
                for (var i = 0; i < length; i++) {
                    $(".fs-sresult").find("ul").append("<li><a href=\"DetailProduct?id=" + obj[i].code + "\">" +
                        "                                            <p>" +
                        "                                                <img src=\"" + obj[i].listImg[0] + " \"" +
                        "                                                     alt=\"" + obj[i].listImg[0] + " \">" +
                        "                                            </p>" +
                        "                                            <div>" +
                        "                                               <h3>" + obj[i].name + "</h3>" +
                        "                                               <p class=\"fshop-search-prodprice\">" + formatNumber(obj[i].promotionPrice, ',', '.') + "₫</p></div>" +
                        "                                 </a></li>");
                    // obj[i].name;
                }
                $(".fs-sresult").find("ul").append("" +
                    "<li class=\"black\">\n" +
                    "   <a \" href=\"SearchPageServlet?keys=" + keys + "\">Hiển thị kết quả cho\n" +
                    "         <b><i>" + keys + "</i></b>\n" +
                    "   </a>\n" +
                    "</li>");
            }
        });
    }

    // Định dạng tiền tệ
    function formatNumber(nStr, decSeperate, groupSeperate) {
        nStr += '';
        x = nStr.split(decSeperate);
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + groupSeperate + '$2');
        }
        return x1 + x2;
    }
</script>

<!-- jQuery -->
<script src="<%=Util.fullPathAdmin("assets/js/jquery-2.1.4.min.js")%>"></script>
<script src="<%=Util.fullPathAdmin("assets/js/bootstrap.min.js")%>"></script>

<%--SIGN IN--%>
<script>

    function submitLogin(event) {
        var formSe = $('form[id="signInForm"]');
        event.preventDefault(); //prevent default action
        console.log('submit sign in');
        var post_url = formSe.attr("action"); //get form action url
        var request_method = formSe.attr("method"); //get form GET/POST method
        var form_data = formSe.serialize();
        $.ajax({
            url: post_url,
            type: request_method,
            data: form_data,
            datatype: 'json',
            headers: {
                Accept: "application/json; charset=utf-8",
            },
            error: function () {
                alert("error");
            },
            success: function (data) {
                // alert("success");
                var myObj = JSON.parse(data);
                var resultValid = myObj.resultValid;
                if (resultValid == 'success') {
                    var resultSign = myObj.resultSign;
                    if (resultSign == 'success') {
                        console.log(resultSign);
                        $('.modal-body').find('.errorSign').remove();
                        // $('#signInForm').modal('hide');
                        $("[data-dismiss=modal]").trigger({type: "click"});

                        // refesh fage
                        location.reload();
                    } else {
                        console.log(resultSign);
                        $('.modal-body').find('.errorSign').remove();
                        $('.modal-body').prepend('<div class="errorSign" style="color:red">' + myObj.resultSign + '</div>');
                    }
                }
                if (resultValid == 'error') {
                    if (myObj.username != '') {
                        console.log(myObj.username);
                        $('#email').parent().find('.error').remove();
                        $('#email').parent().append('<div class="error" style="color:red">' + myObj.username + '</div>');
                    }
                    if (myObj.password != '') {
                        console.log(myObj.password);
                        $('#password').parent().find('.error').remove();
                        $('#password').parent().append('<div class="error" style="color:red">' + myObj.password + '</div>');
                    }
                }
            }
        });
    }

    // remove div error on click input IN signin
    $('#email').keyup(function () {
        $(this).parent().find('.error').remove();
        $(this).parent().parent().find('.errorSign').remove();
    });
    $('#password').keyup(function () {
        $(this).parent().find('.error').remove();
        $(this).parent().parent().find('.errorSign').remove();
    });
</script>

<%--SIGN OUT--%>
<script>
    function submitLogout(event) {
        console.log('sign out');
        $.ajax({
            url: "Logout",
            type: "GET",
            datatype: 'json',
            headers: {
                Accept: "application/json; charset=utf-8",
            },
            error: function () {
                alert("error");
            },
            success: function (data) {
                // refesh fage
                // location.reload();
            }
        });
    }
</script>

<%--SIGN UP--%>
<script>

    function submitLogup(event) {
        var formSe = $('form[id="signUpForm"]');
        event.preventDefault(); //prevent default action
        console.log('submit sign up');
        var post_url = formSe.attr("action"); //get form action url
        var request_method = formSe.attr("method"); //get form GET/POST method
        var form_data = formSe.serialize();
        $.ajax({
            url: post_url,
            type: request_method,
            data: form_data,
            datatype: 'json',
            headers: {
                Accept: "application/json; charset=utf-8",
            },
            error: function () {
                alert("error");
            },
            success: function (data) {
                // alert("success");
                var myObj = JSON.parse(data);
                var resultValid = myObj.resultValid;
                if (resultValid == 'success') {
                    // var resultSign = myObj.resultSign;
                    if (myObj.resultDulicate == 'success') {
                        console.log(myObj.resultDulicate);
                        // $('.modal-body').find('.errorSign').remove();
                        // $('#signInForm').modal('hide');
                        // $("[data-dismiss=modal]").trigger({type: "click"});

                        // refesh fage
                        location.reload();
                    } else {
                        console.log(myObj.resultDulicate);
                        $('#user-name').parent().find('.error').remove();
                        $('#user-name').parent().append('<div class="error" style="color:red">' + myObj.resultDulicate + '</div>');
                    }
                }
                if (resultValid == 'error') {
                    if (myObj.userName != '') {
                        console.log(myObj.userName);
                        $('#user-name').parent().find('.error').remove();
                        $('#user-name').parent().append('<div class="error" style="color:red">' + myObj.userName + '</div>');
                    }
                    if (myObj.email != '') {
                        console.log(myObj.email);
                        $('#user-email').parent().find('.error').remove();
                        $('#user-email').parent().append('<div class="error" style="color:red">' + myObj.email + '</div>');
                    }
                    if (myObj.fullName != '') {
                        console.log(myObj.fullName);
                        $('#full-name').parent().find('.error').remove();
                        $('#full-name').parent().append('<div class="error" style="color:red">' + myObj.fullName + '</div>');
                    }
                    if (myObj.password != '') {
                        console.log(myObj.password);
                        $('#pass').parent().find('.error').remove();
                        $('#pass').parent().append('<div class="error" style="color:red">' + myObj.password + '</div>');
                    }
                    if (myObj.rePassword != '') {
                        console.log(myObj.rePassword);
                        $('#rePass').parent().find('.error').remove();
                        $('#rePass').parent().append('<div class="error" style="color:red">' + myObj.rePassword + '</div>');
                    }
                }
            }
        });
    }

    // remove div error on click input IN signin
    $('#user-name').keyup(function () {
        $(this).parent().find('.error').remove();
        $(this).parent().parent().find('.errorSign').remove();
    });
    $('#user-email').keyup(function () {
        $(this).parent().find('.error').remove();
        $(this).parent().parent().find('.errorSign').remove();
    });
    $('#full-name').keyup(function () {
        $(this).parent().find('.error').remove();
        $(this).parent().parent().find('.errorSign').remove();
    });
    $('#pass').keyup(function () {
        $(this).parent().find('.error').remove();
        $(this).parent().parent().find('.errorSign').remove();
    });
    $('#rePass').keyup(function () {
        $(this).parent().find('.error').remove();
        $(this).parent().parent().find('.errorSign').remove();
    });
</script>