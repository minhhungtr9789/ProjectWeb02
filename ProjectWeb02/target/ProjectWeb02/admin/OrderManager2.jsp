<%@ page import="vn.nlu.fit.utils.Util" %>
<%@ page import="vn.nlu.fit.models.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.nlu.fit.models.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.nlu.fit.models.OrderItem" %>
<%@ page import="vn.nlu.fit.utils.DBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="parts/header.jsp"></jsp:include>

<body class="no-skin">
<%
    List<Order> list = (List<Order>) request.getAttribute("list");
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
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Danh sách đơn hàng</li>
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
                                            <th>Mã đơn hàng</th>
                                            <th>Ngày đặt</th>
                                            <th>Người đặt</th>
                                            <th>Số lượng</th>
                                            <th>
                                                Tổng tiền
                                            </th>
                                            <th>Trạng thái đơn hàng</th>
                                            <th class="hidden-480">Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            for (int i=0;i<list.size();i++){

                                        %>
                                        <tr>
                                            <td class="product-name-col">
                                                <%=list.get(i).getId()%>
                                            </td>
                                            <td><%=list.get(i).getDatecreate()%>
                                            </td>
                                            <td><%=list.get(i).getUser()%>
                                            </td>
                                            <td><%=list.get(i).sumQuantity()%> Sản phẩm
                                            </td>
                                            <td class="color-blue"><%= Util.convertToVndCurrency(list.get(i).totalCost())%>
                                            </td>
                                            </td>
                                            <td><form action="<%=Util.fullPath("admin/order/updateDelivery")%>" method="post">
                                                <select name="status">
                                                    <option value="1" <%=list.get(i).getStatus()==1?"selected":""%>>Chờ xác nhận</option>
                                                    <option value="2" <%=list.get(i).getStatus()==2?"selected":""%>>Đang giao</option>
                                                    <option value="3"<%=list.get(i).getStatus()==3?"selected":""%>>Đã giao</option>
                                                    <option value="4" <%=list.get(i).getStatus()==4?"selected":""%>>Đã hủy</option>
                                                </select>
                                                <input type="hidden" name="id" value="<%=list.get(i).getId()%>">
                                                <input type="submit" class="btn-primary" value="Cập nhật">
                                            </form>
                                            </td>
                                            <td>
                                                <div class="hidden-sm hidden-xs action-buttons">


                                                    <a class="red" href="#editEmployeeModal<%=i%>" data-toggle="modal"
                                                       data-product-id>
                                                        <i class="ace-icon fas fa-eye">Xem chi tiết</i>
                                                    </a>
                                                </div>

                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
<%
    for (int i=0;i<list.size();i++){
%>
<div id="editEmployeeModal<%=i%>" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <table class="table table-striped table-hover">
                <thead>
                <tr>

                    <th>Ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Giá</th>


                </tr>
                </thead>
                <tbody>
                <%
                    for (int j=0;j<list.get(i).getListItem().size();j++){
                        OrderItem item = list.get(i).getListItem().get(j);
                        Product p = DBUtils.findIdProduct(item.getId());
                        String img = p.getListImg()[0];
                %>
                <tr>

                    <td><img src="<%=img%>" width="100" height="100"></td>
                    <td><%=p.getName()%></td>
                    <td><%=item.getQuantity()%></td>
                    <td><%=Util.convertToVndCurrency(item.getPrice())%></td>
                <%}%>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%}%>

<jsp:include page="parts/js-library.jsp"></jsp:include>
<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function ($) {
        //initiate dataTables plugin
        var myTable =
            $('#dynamic-table')
            //.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
                .DataTable({
                    bAutoWidth: false,
                    "aoColumns": [
                        null, null, null, null, null, null,
                        {"bSortable": false}
                    ],
                    "aaSorting": [],


                    select: {
                        style: 'multi'
                    }
                });


        $.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';

        new $.fn.dataTable.Buttons(myTable, {
            buttons: [
                {
                    "extend": "colvis",
                    "text": "<i class='fa fa-search bigger-110 blue'></i> <span class='hidden'>Show/hide columns</span>",
                    "className": "btn btn-white btn-primary btn-bold",
                    columns: ':not(:first):not(:last)'
                },
                {
                    "extend": "copy",
                    "text": "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>Copy to clipboard</span>",
                    "className": "btn btn-white btn-primary btn-bold"
                },
                {
                    "extend": "csv",
                    "text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>Export to CSV</span>",
                    "className": "btn btn-white btn-primary btn-bold"
                },
                {
                    "extend": "excel",
                    "text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>Export to Excel</span>",
                    "className": "btn btn-white btn-primary btn-bold"
                },
                {
                    "extend": "pdf",
                    "text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>Export to PDF</span>",
                    "className": "btn btn-white btn-primary btn-bold"
                },
                {
                    "extend": "print",
                    "text": "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'>Print</span>",
                    "className": "btn btn-white btn-primary btn-bold",
                    autoPrint: false,
                    message: 'This print was produced using the Print button for DataTables'
                }
            ]
        });
        myTable.buttons().container().appendTo($('.tableTools-container'));

        //style the message box
        var defaultCopyAction = myTable.button(1).action();
        myTable.button(1).action(function (e, dt, button, config) {
            defaultCopyAction(e, dt, button, config);
            $('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
        });


        var defaultColvisAction = myTable.button(0).action();
        myTable.button(0).action(function (e, dt, button, config) {

            defaultColvisAction(e, dt, button, config);


            if ($('.dt-button-collection > .dropdown-menu').length == 0) {
                $('.dt-button-collection')
                    .wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
                    .find('a').attr('href', '#').wrap("<li />")
            }
            $('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
        });

        ////

        setTimeout(function () {
            $($('.tableTools-container')).find('a.dt-button').each(function () {
                var div = $(this).find(' > div').first();
                if (div.length == 1) div.tooltip({container: 'body', title: div.parent().text()});
                else $(this).tooltip({container: 'body', title: $(this).text()});
            });
        }, 500);





    })
</script>

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
                $(this).load($(this).href);
            }
        };
        xhttp.open("GET", "changeStatusProduct?id=" + code, true);
        // console.log("vô rồi ");
        xhttp.send();
    }
</script>
</body>
</html>
