<%--
  Created by IntelliJ IDEA.
  User: Minh Hung Tran
  Date: 15/11/2019
  Time: 8:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--Scroll back top-->
<a id="back-to-top" href="#" title="Về Đầu Trang" style="position: fixed;
    bottom: 25px;
    /*right: -100px;*/
    padding: 9px 11px;
    background: rgb(90, 136, 202);
    color: white;
    border: 1px solid rgb(90, 136, 202);
    border-radius: unset;
    display: none;
    font-size: 30px;"
   class="btn btn-primary back-to-top" role="button"><i class="fas fa-chevron-up"></i></a><!--End scroll back top-->


<script>
    $(document).ready(function () {
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) {
                $('#back-to-top').fadeIn();
                $('#back-to-top').css("right", "25px");
            } else {
                $('#back-to-top').fadeOut();
                $('#back-to-top').css("right", "-100px");
            }
        });
        // scroll body to 0px on click
        $('#back-to-top').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 400);
            return false;
        });
    });</script>

