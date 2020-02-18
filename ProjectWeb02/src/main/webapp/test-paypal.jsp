<%--
  Created by IntelliJ IDEA.
  User: Minh Hung Tran
  Date: 12/12/2019
  Time: 10:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <title>PayPal Payment Example</title>
</head>
<body>
<fieldset>
    <legend>PayPal Payment Sandbox</legend>
    <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

        <!-- Enter seller's email address -->
        <input type="hidden" name="business" value="your_email@gmail.com">

        <!-- Variable cmd shows PayPal that this is a payment button -->
        <input type="hidden" name="cmd" value="_xclick">

        <!-- Bill information -->
        <input type="hidden" name="item_name" value="bill_name">
        <!--Total cost ($)-->
        Total bill : <input type="number" name="amount" placeholder="Total bill" value="">

        <!--Type of Currency-->
        <input type="hidden" name="currency_code" value="USD">
        <!--Redirect to this link if payment is successfully transfered-->
        <input type="hidden" name="return" value="http://localhost/success.html">
        <!--Redirect to this link if fail-->
        <input type="hidden" name="cancel_return" value="http://localhost/error.html">
        <!-- Custom button -->
        <input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
        <img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
    </form>
</fieldset>
</body>
</html>
