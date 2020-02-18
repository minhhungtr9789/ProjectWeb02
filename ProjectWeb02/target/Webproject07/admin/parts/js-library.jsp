<%@ page import="vn.nlu.fit.utils.Util" %><%--
  Created by IntelliJ IDEA.
  User: Minh Hung Tran
  Date: 19/12/2019
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--[if !IE]> -->
<script src="<%=Util.fullPathAdmin("assets/js/jquery-2.1.4.min.js")%>"></script>

<!-- <![endif]-->

<!--[if IE]-->
<script src="<%=Util.fullPathAdmin("assets/js/jquery-1.11.3.min.js")%>"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='<%=Util.fullPathAdmin("assets/js/jquery.mobile.custom.min.js")%>'>" + "<" + "/script>");
</script>
<script src="<%=Util.fullPathAdmin("assets/js/bootstrap.min.js")%>"></script>

<!-- page specific plugin scripts -->
<script src="<%=Util.fullPathAdmin("assets/js/jquery.dataTables.min.js")%>"></script>
<script src="<%=Util.fullPathAdmin("assets/js/jquery.dataTables.bootstrap.min.js")%>"></script>
<script src="<%=Util.fullPathAdmin("assets/js/dataTables.buttons.min.js")%>"></script>
<script src="<%=Util.fullPathAdmin("assets/js/buttons.flash.min.js")%>"></script>
<script src="<%=Util.fullPathAdmin("assets/js/buttons.html5.min.js")%>"></script>
<script src="<%=Util.fullPathAdmin("assets/js/buttons.print.min.js")%>"></script>
<script src="<%=Util.fullPathAdmin("assets/js/buttons.colVis.min.js")%>"></script>
<script src="<%=Util.fullPathAdmin("assets/js/dataTables.select.min.js")%>"></script>

<!-- ace scripts -->
<script src="<%=Util.fullPathAdmin("assets/js/ace-elements.min.js")%>"></script>
<script src="<%=Util.fullPathAdmin("assets/js/ace.min.js")%>"></script>