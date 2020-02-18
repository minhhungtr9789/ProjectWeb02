<%@ page import="vn.nlu.fit.utils.Util" %>
<%@ page import="vn.nlu.fit.models.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="parts/header.jsp"></jsp:include>

<body class="no-skin">
<%
    ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");
%>

<jsp:include page="parts/navbar.jsp"></jsp:include>

<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.loadState('main-container')
        } catch (e) {
        }
    </script>

    <jsp:include page="parts/left-menu.jsp"></jsp:include>

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="<%=Util.fullPathAdmin("product/list")%>">Trang chủ</a>
                    </li>
                    <li class="active">Quản lý sản phẩm</li>
                </ul><!-- /.breadcrumb -->

                <div class="nav-search" id="nav-search">
                    <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input"
                                           id="nav-search-input" autocomplete="off"/>
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
                    </form>
                </div><!-- /.nav-search -->
            </div>

            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-xs-12">
                                <!-- div.table-responsive -->

                                <!-- div.dataTables_borderWrap -->
                                <div>
                                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>Tên sản phẩm
                                            </th>
                                            <th>Mã sản phẩm</th>
                                            <th>Giá gốc</th>
                                            <th class="hidden-480">Giá bán</th>
                                            <th>Sẵn có</th>
                                            <th>
                                                Đang chạy
                                            </th>
                                            <th class="hidden-480">Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            if (list != null) {
                                                for (Product p : list) {
                                        %>
                                        <tr>
                                            <td class="product-name-col">
                                                <a class="product-name"
                                                   href="<%= Util.fullPath("DetailProduct?id="+p.getCode())%>"
                                                   target="_blank"><%=p.getName()%>
                                                </a>
                                                <%
                                                    if (!"".equals(p.getListImg()[0])) {%>
                                                <div>
                                                    <img src="<%= p.getListImg()[0]%>" alt="">
                                                    <span></span>
                                                </div>
                                                <%}%>

                                            </td>
                                            <td><%=p.getCode()%>
                                            </td>
                                            <td class="hidden-480 color-blue"><%= Util.convertToVndCurrency(p.getPrice())%>
                                            </td>
                                            <td class="color-blue"><%= Util.convertToVndCurrency(p.getPromotionPrice())%>
                                            </td>
                                            <td class="color-blue"><%=p.getQuantity()%>
                                            </td>
                                            <td class="hidden-480">
                                                <div class="sortt"><%=p.getStatus() == 1 ? 1 : 2 %>
                                                </div>
                                                <label>
                                                    <input name="switch-field-1" class="ace ace-switch ace-switch-7"
                                                           type="checkbox"  <%=p.getStatus()==1 ? "checked value=\"1\"":"value=\"0\"" %>
                                                           onclick="callChangeStatusServlet('<%=p.getCode()%>')">
                                                    <span class="lbl"></span>
                                                </label>
                                            </td>

                                            <td>
                                                <div class="hidden-sm hidden-xs action-buttons">
                                                    <a class="green"
                                                       href="<%= Util.fullPathAdmin("product/edit?id="+p.getCode())%>">
                                                        <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                    </a>

                                                    <a class="red" href="#exampleModal" data-toggle="modal"
                                                       data-product-id="<%=p.getCode()%>">
                                                        <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                    </a>
                                                </div>

                                                <div class="hidden-md hidden-lg">
                                                    <div class="inline pos-rel">
                                                        <button class="btn btn-minier btn-yellow dropdown-toggle"
                                                                data-toggle="dropdown" data-position="auto">
                                                            <i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
                                                        </button>

                                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                            <li>
                                                                <a class="green"
                                                                   href="<%= Util.fullPathAdmin("product/edit?id="+p.getCode())%>">
                                                                    <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="red" href="#exampleModal" data-toggle="modal"
                                                                   data-product-id="<%=p.getCode()%>">
                                                                    <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div id="modal-table" class="modal fade" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header no-padding">
                                        <div class="table-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                <span class="white">&times;</span>
                                            </button>
                                            Results for "Latest Registered Domains
                                        </div>
                                    </div>

                                    <div class="modal-body no-padding">
                                        <table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
                                            <thead>
                                            <tr>
                                                <th>Domain</th>
                                                <th>Price</th>
                                                <th>Clicks</th>

                                                <th>
                                                    <i class="ace-icon fa fa-clock-o bigger-110"></i>
                                                    Update
                                                </th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <tr>
                                                <td>
                                                    <a href="#">ace.com</a>
                                                </td>
                                                <td>$45</td>
                                                <td>3,330</td>
                                                <td>Feb 12</td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <a href="#">base.com</a>
                                                </td>
                                                <td>$35</td>
                                                <td>2,595</td>
                                                <td>Feb 18</td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <a href="#">max.com</a>
                                                </td>
                                                <td>$60</td>
                                                <td>4,400</td>
                                                <td>Mar 11</td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <a href="#">best.com</a>
                                                </td>
                                                <td>$75</td>
                                                <td>6,500</td>
                                                <td>Apr 03</td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <a href="#">pro.com</a>
                                                </td>
                                                <td>$55</td>
                                                <td>4,250</td>
                                                <td>Jan 21</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="modal-footer no-margin-top">
                                        <button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
                                            <i class="ace-icon fa fa-times"></i>
                                            Close
                                        </button>

                                        <ul class="pagination pull-right no-margin">
                                            <li class="prev disabled">
                                                <a href="#">
                                                    <i class="ace-icon fa fa-angle-double-left"></i>
                                                </a>
                                            </li>

                                            <li class="active">
                                                <a href="#">1</a>
                                            </li>

                                            <li>
                                                <a href="#">2</a>
                                            </li>

                                            <li>
                                                <a href="#">3</a>
                                            </li>

                                            <li class="next">
                                                <a href="#">
                                                    <i class="ace-icon fa fa-angle-double-right"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div>

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <jsp:include page="parts/footer.jsp"></jsp:include>

</div><!-- /.main-container -->
<!--Delete product-->
<div class="delete-product">
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa sản phẩm</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">HỦY</button>
                    <a class="btn btn-primary"
                       href="<%= Util.fullPathAdmin("product/delete?&id=")%>">ĐỒNG Ý</a>
                </div>
            </div>
        </div>
    </div>
</div><!--End Delete product-->

<jsp:include page="parts/js-library.jsp"></jsp:include>
<jsp:include page="parts/querytable.jsp"></jsp:include>

<%--DeleteProduct/ call server event--%>
<script>
    // get id from modal, send request delete to server
    //triggered when modal is about to be shown
    var href = $('#exampleModal').find('.modal-footer').find('a').attr("href");
    $('#exampleModal').on('show.bs.modal', function (e) {
        $('#exampleModal').find('.modal-body').html("Bạn có đồng ý xóa bỏ sản phẩm này không?");
        var hrefFix = href;
        var productId = $(e.relatedTarget).data('product-id');
        if (productId != undefined) {
            // console.log(href);
            $('#exampleModal').find('.modal-footer').find('a').attr("href", hrefFix + productId);
        }
    });

    // call proceed2CheckoutServlet
    function callChangeStatusServlet(code) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                // location.reload();
                var parent = $(this).parent().parent();
                parent.load(parent.href);
            }
        };
        xhttp.open("GET", "changeStatusProduct?id=" + code, true);
        // console.log("vô rồi ");
        xhttp.send();
    }
</script>
</body>
</html>
