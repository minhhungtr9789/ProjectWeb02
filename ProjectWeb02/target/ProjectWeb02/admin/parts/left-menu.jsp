<%@ page import="vn.nlu.fit.utils.Util" %><%--
  Created by IntelliJ IDEA.
  User: Minh Hung Tran
  Date: 19/12/2019
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="sidebar" class="sidebar responsive ace-save-state">
    <script type="text/javascript">
        try {
            ace.settings.loadState('sidebar')
        } catch (e) {
        }
    </script>

    <ul class="nav nav-list">
        <!--Quản lý đơn hàng-->
        <li class="open">
            <a href="#" class="dropdown-toggle ">
                <i class="menu-icon ">
                    <i class="fas fa-file-invoice-dollar"></i>
                </i>
                <span class="menu-text "> Đơn hàng </span>
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li class="">
                    <a href="<%=Util.fullPathAdmin("order/ShowOrder")%>">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Quản lý đơn hàng
                    </a>

                    <b class="arrow"></b>
                </li>


            </ul>
        </li><!--End quản lý đơn hàng-->

        <!--Quản lý sản phẩm-->
        <li class="open">
            <a href="#" class="dropdown-toggle ">
                <i class="menu-icon ">
                    <i class="fas fa-shopping-bag"></i>
                </i>
                <span class="menu-text"> Sản phẩm </span>

                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li class="">
                    <a href="<%=Util.fullPathAdmin("product/list")%>">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Quản lý sản phẩm
                    </a>

                    <b class="arrow"></b>
                </li>
                <li class="">
                    <a href="<%=Util.fullPathAdmin("product/new")%>">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Thêm sản phẩm
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li><!--End quản lý sản phẩm-->

        <!--Quản lý loại sản phẩm-->
        <li class="open">
            <a href="#" class="dropdown-toggle ">
                <i class="menu-icon ">
                    <i class="fas fa-clipboard-list"></i>
                </i>
                <span class="menu-text"> Loại sản phẩm </span>

                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li class="">
                    <a href="<%=Util.fullPathAdmin("productCatalogs/list")%>">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Quản lý loại sản phẩm
                    </a>
                    <b class="arrow"></b>
                </li>
                <li class="">
                    <a href="#newCataLogModal" data-toggle="modal">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Thêm loại sản phẩm
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li><!--End quản lý loại sản phẩm-->

        <!--Quản lý nhà sản xuất-->
        <li class="open">
            <a href="#" class="dropdown-toggle ">
                <i class="menu-icon ">
                    <i class="fas fa-industry"></i>
                </i>
                <span class="menu-text"> Nhà sản xuất </span>

                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li class="">
                    <a href="<%=Util.fullPathAdmin("brand/list")%>">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Quản lý nhà sản xuất
                    </a>
                    <b class="arrow"></b>
                </li>
                <li class="">
                    <a href="<%=Util.fullPathAdmin("product/new")%>">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Thêm nhà sản xuất
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li><!--End quản nhà sản xuất-->

        <!--Quản lý khách hàng-->
        <li class="open">
            <a href="#" class="dropdown-toggle ">
                <i class="menu-icon ">
                    <i class="fas fa-users"></i>
                </i>
                <span class="menu-text"> User </span>

            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li class="">
                    <a href="<%=Util.fullPathAdmin("user/list")%>">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Quản lý user
                    </a>

                    <b class="arrow"></b>
                </li>

            </ul>
        </li><!--End quản khách hàng-->

    </ul><!-- /.nav-list -->

    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state"
           data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

    <div class="modal fade" id="newCataLogModal" tabindex="-1" role="dialog" aria-labelledby="newCataLogModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="newCataLogModalLabel">Thêm loại sản phẩm</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="newCataLogForm" action="<%=Util.fullPath("admin/productCatalogs/create-edit?action=")%>"
                      method="post">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="catalog-name" class="col-form-label">Tên loại sản phẩm:</label>
                            <input name='name' type="text" class="form-control" id="catalog-name">
                        </div>
                        <div class="form-group">
                            <label for="catalog-select" class="col-form-label">Mã Parent ID:</label>
                            <select name='select' id='catalog-select' class='form-control'></select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">HỦY</button>
                        <input type="submit" onclick="submitNewCataLog(event)" class="btn btn-primary" value="ĐỒNG Ý">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="<%=Util.fullPathAdmin("assets/js/jquery-2.1.4.min.js")%>"></script>
    <script src="<%=Util.fullPathAdmin("assets/js/bootstrap.min.js")%>"></script>

    <%-- New catalog--%>
    <script>
        var id;

        function submitNewCataLog(event) {
            if (id == undefined) {
                var formSe = $('form[id="newCataLogForm"]');


                event.preventDefault(); //prevent default action
                var post_url = formSe.attr("action") + "new"; //get form action url
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
                            console.log('valid success');
                            if (myObj.resultDuplicated == 'success') {
                                $('#newModal').modal('hide');
                                $("[data-dismiss=modal]").trigger({type: "click"});


                                // Thông báo success
                                $('#toast2').find('div').remove();
                                $('#toast2').append('<div class><i class="fas fa-check"> Thêm loại sản phẩm thành công</i></div>');
                                $('#toast2').addClass('success');

                                var x = $('#toastParent2');
                                setTimeout(function () {
                                    x.addClass("show");
                                }, 1000);
                                setTimeout(function () {
                                    x.removeClass('show');
                                    // refesh fage
                                    location.reload();
                                }, 4000);
                            } else {
                                console.log('resultDuplicated error');
                                $('#catalog-name').parent().find('.error').remove();
                                $('#catalog-name').parent().append('<div class="error" style="color:red">' + myObj.resultDuplicated + '</div>');
                            }
                        } else {
                            console.log('valid error');
                            $('#catalog-name').parent().find('.error').remove();
                            $('#catalog-name').parent().append('<div class="error" style="color:red">' + resultValid + '</div>');
                        }
                    }
                });
            } else {
                var formSe = $('form[id="newCataLogForm"]');
                // Reset input

                event.preventDefault(); //prevent default action
                var post_url = formSe.attr("action") + "edit&id=" + id; //get form action url
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
                            console.log('valid success');
                            if (myObj.resultDuplicated == 'success') {
                                $('#newModal').modal('hide');
                                $("[data-dismiss=modal]").trigger({type: "click"});

                                // Thông báo success
                                $('#toast2').find('div').remove();
                                $('#toast2').append('<div class><i class="fas fa-check"> Cập nhật loại sản phẩm thành công</i></div>');
                                $('#toast2').addClass('success');

                                var x = $('#toastParent2');
                                setTimeout(function () {
                                    x.addClass("show");
                                }, 1000);
                                setTimeout(function () {
                                    x.removeClass('show');
                                    // refesh fage
                                    location.reload();
                                }, 4000);
                            } else {
                                console.log('resultDuplicated error');
                                $('#catalog-name').parent().find('.error').remove();
                                $('#catalog-name').parent().append('<div class="error" style="color:red">' + myObj.resultDuplicated + '</div>');
                            }
                        } else {
                            console.log('valid error');
                            $('#catalog-name').parent().find('.error').remove();
                            $('#catalog-name').parent().append('<div class="error" style="color:red">' + resultValid + '</div>');
                        }
                    }
                });
            }
            // remove div error on click input
            $('#catalog-name').keyup(function () {
                $(this).parent().find('.error').remove();
            })
        }
    </script>

    <%-- Load data form new catalog --%>
    <script>
        var modal = $('#newCataLogModal');
        //get list parernt ID
        <%String data=Util.fullPath("admin/productCatalogs/new");%>
        var post_url = "<%=data%>"; //get form action url
        var request_method = $('form[id="newCataLogForm"]').attr("method"); //get form GET/POST method
        $.ajax({
            url: post_url,
            type: request_method,
            headers: {
                Accept: "application/json; charset=utf-8",
                "Content-Type": "application/json; charset=utf-8"
            },
            error: function () {
                console.log("error")
            },
            success: function (data) {
                var x = $.parseJSON(data);
                // console.log("success")
                modal.find('.modal-body').find('#catalog-select').children().remove();
                modal.find('.modal-body').find('#catalog-select').append('<option value="0">0 - Không có</option>'
                );
                for (let i = 0; i < x.length; i++) {
                    modal.find('.modal-body').find('#catalog-select').append('<option value=\"' + x[i].id + '\">' + x[i].id + " - " +
                        x[i].name + '</option>'
                    )
                }
            }
        });
    </script>

    <%--    Load data form edit catalof--%>
    <script>
        $('#newCataLogModal').on('show.bs.modal', function (e) {
            $(this).parent().find('.error').remove();
            var dataCatalogId = $(e.relatedTarget).data('catalog-id');
            // Get catalog from admin
            if (dataCatalogId != undefined) {
                // console.log(dataCatalogId);
                var formSe = $('form[id="newCataLogForm"]');

                <%String data2=Util.fullPath("admin/productCatalogs/edit?id=");%>
                var post_url = "<%=data2%>" + dataCatalogId; //get form action url
                // console.log(post_url);
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
                        id = myObj.id;
                        var catalogName = myObj.name;
                        var catalogParentId = myObj.parentId;
                        $('#catalog-name').val(catalogName);
                        $('#catalog-select').find('option').each(function () {
                            var selected = $(this);

                            if (selected.val() == catalogParentId) {
                                console.log(selected);
                                console.log(selected.val());
                                selected.attr('selected', true);
                            } else {
                                selected.attr("selected", false);
                            }
                        })
                        // if (catalogParentId)
                    }
                });
                $('#newCataLogModal').find('.modal-title').text('Sửa loại sản phẩm');
                console.log($('#newCataLogModal').find('.modal-title').text());
            } else {
                $('#newCataLogModal').find('.modal-title').text('Thêm loại sản phẩm');
                console.log($('#newCataLogModal').find('.modal-title').text());
                // Reset input
                $('#catalog-name').val('');
                // $('#catalog-select').find('option').attr("selected", false);
                // $('#catalog-select').find('option').first().attr("selected", true);
            }
        });
    </script>
</div>


