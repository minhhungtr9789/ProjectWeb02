<%@ page import="vn.nlu.fit.utils.Util" %>
<%@ page import="vn.nlu.fit.models.Product" %>
<%@ page import="vn.nlu.fit.models.Brand" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.nlu.fit.models.Catalog" %>
<%@ page import="vn.nlu.fit.models.Warranty" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<!-- page specific plugin styles -->
<%--    <link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css"/>--%>
<%--    <link rel="stylesheet" href="assets/css/chosen.min.css"/>--%>
<%--    <link rel="stylesheet" href="assets/css/bootstrap-datepicker3.min.css"/>--%>
<%--    <link rel="stylesheet" href="assets/css/bootstrap-timepicker.min.css"/>--%>
<%--    <link rel="stylesheet" href="assets/css/daterangepicker.min.css"/>--%>
<%--    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css"/>--%>
<%--    <link rel="stylesheet" href="assets/css/bootstrap-colorpicker.min.css"/>--%>
<jsp:include page="parts/header.jsp"></jsp:include>

<%--<!--[if lte IE 8]>--%>
<%--&lt;%&ndash;<!--<script src="assets/js/html5shiv.min.js"></script>-->&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="assets/js/respond.min.js"></script>&ndash;%&gt;--%>
<%--<![endif]-->--%>

<!--ckeditor-->
<%--    <script src="../ckeditor/ckeditor.js"></script>--%>
<%--    <script src="../ckeditor/samples/js/sample.js"></script>--%>
<%--    <link rel="stylesheet" href="../ckeditor/samples/css/samples.css">--%>
<%--    <link rel="stylesheet" href="../ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">--%>
<%--    <meta name="viewport" content="width=device-width,initial-scale=1">--%>
<!--end ckeditor-->

<%--imageUploader--%>
<link rel="stylesheet" href="<%=Util.fullPath("imageUploader/image-uploader.min.css")%>">
<%--    imageUploader--%>

<%--ckfinder--%>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>

<body class="no-skin">

<%
    Product p = (Product) request.getAttribute("p");
    ArrayList<Brand> brandList = (ArrayList<Brand>) request.getAttribute("brandList");
    ArrayList<Catalog> catalogList = (ArrayList<Catalog>) request.getAttribute("catalogList");
    ArrayList<Warranty> warrantyList = (ArrayList<Warranty>) request.getAttribute("warrantyList");
%>

<%
    String result = (String) request.getAttribute("result");
%>


<jsp:include page="parts/navbar.jsp"></jsp:include>

<%--Toast--%>
<style>
    .toastParent {
        display: flex;
        align-items: center;
        justify-content: center;
        position: fixed;
        left: 0;
        top: 0;
        width: 100vw;
        height: 100vh;
        padding-right: 17px;
        overflow-x: hidden;
        overflow-y: auto;
        z-index: 1050;
        outline: 0;
    }

    #toast {
        display: flex !important;
        align-items: center;
        justify-content: center;
        visibility: hidden;
        min-width: 250px;
        min-height: 100px;
        background-color: #000000b3;
        color: #fff;
        border-radius: 2px;
        padding: 16px;
        font-size: 20px;
    }

    #toast.show {
        visibility: visible;
        -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
        animation: fadein 0.5s, fadeout 0.5s 2.5s;
    }

    @-webkit-keyframes fadein {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    @keyframes fadein {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    @-webkit-keyframes fadeout {
        from {
            opacity: 1;
        }
        to {
            opacity: 0;
        }
    }

    @keyframes fadeout {
        from {
            opacity: 1;
        }
        to {
            opacity: 0;
        }
    }
</style>
<% if (result != null) {%>
<div class="toastParent">
    <div id="toast">
        <%
            if (result.equals("success")) {
        %>
        Thêm sản phẩm thành công
        <% } else {%>
        Thêm sản phẩm thất bại
        <% }%>
    </div>
</div>
<% }%>

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

                    <li>
                        <a href="#">Forms</a>
                    </li>
                    <li class="active">Form Elements</li>
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
                <div class="ace-settings-container" id="ace-settings-container">
                    <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                        <i class="ace-icon fa fa-cog bigger-130"></i>
                    </div>

                    <div class="ace-settings-box clearfix" id="ace-settings-box">
                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <div class="pull-left">
                                    <select id="skin-colorpicker" class="hide">
                                        <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                        <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                        <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                        <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                    </select>
                                </div>
                                <span>&nbsp; Choose Skin</span>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                       id="ace-settings-navbar" autocomplete="off"/>
                                <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                       id="ace-settings-sidebar" autocomplete="off"/>
                                <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                       id="ace-settings-breadcrumbs" autocomplete="off"/>
                                <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"
                                       autocomplete="off"/>
                                <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                       id="ace-settings-add-container" autocomplete="off"/>
                                <label class="lbl" for="ace-settings-add-container">
                                    Inside
                                    <b>.container</b>
                                </label>
                            </div>
                        </div><!-- /.pull-left -->

                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover"
                                       autocomplete="off"/>
                                <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact"
                                       autocomplete="off"/>
                                <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight"
                                       autocomplete="off"/>
                                <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                            </div>
                        </div><!-- /.pull-left -->
                    </div><!-- /.ace-settings-box -->
                </div><!-- /.ace-settings-container -->
                <div class="row">
                    <div class="col-xs-12">
                        <%
                            if (p != null) {

                        %>

                        <!-- PAGE CONTENT BEGINS -->
                        <form class="form-horizontal" method="post"
                              action="<%=Util.fullPathAdmin("product/create-edit")%>"
                        >
                            <div class="page-header">
                                <h3> Thông tin cơ bản </h3>
                            </div><!-- /.page-header -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> *Mã
                                    SKU</label>
                                <div class="col-sm-9">
                                    <input type="text" id="form-field-1" placeholder="Mã SKU" class="width-100"
                                           value="<%=p.getCode()%>" name="code"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-2"> *Tên sản
                                    phẩm </label>
                                <div class="col-sm-9">
                                    <input type="text" id="form-field-2" placeholder="Tên sản phẩm" class="width-100"
                                           value="<%=p.getName()%>" name="name"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right"> *Mô tả sản
                                    phẩm </label>
                                <div class="col-sm-9">
                                    <textarea name="description" id="editor1" cols="30" rows="8"
                                              placeholder="Mô tả sản phẩm" class="width-100">
                                        <%=p.getDescription()%>
                                    </textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right"> *Thông số kỹ thuật </label>
                                <div class="col-sm-9">
                                    <textarea name="settingInfo" id="editor2" cols="30" rows="8"
                                              placeholder="Mô tả sản phẩm" class="width-100">
                                        <%=p.getSettingInfo()%>
                                    </textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-3"> *Loại sản
                                    phẩm </label>
                                <div class="col-sm-9">
                                    <select id="form-field-3" class="width-100" name="catalog">
                                        <%
                                            if (catalogList != null) {
                                                for (Catalog item : catalogList) {
                                        %>
                                        <option value="<%=item.getName()%>"
                                                <%=p.getCatalog() == item.getId() ? "selected" : ""%>>
                                            <%=item.getName()%>
                                        </option>
                                        <% }
                                        } %>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-4">*Thương
                                    hiệu </label>
                                <div class="col-sm-9">
                                    <select id="form-field-4" class="width-100" name="brand">
                                        <%
                                            if (brandList != null) {
                                                for (Brand item : brandList) {
                                        %>
                                        <option value="<%=item.getBrandName()%>"
                                                <%=p.getBrand() == item.getBrandId() ? "selected" : ""%>>
                                            <%=item.getBrandName()%>
                                        </option>
                                        <% }
                                        } %>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-5"> Bảo
                                    hành</label>
                                <div class="col-sm-9">
                                    <select id="form-field-5" class="width-100" name="warranty">
                                        <%
                                            if (warrantyList != null) {
                                                for (Warranty item : warrantyList) {
                                                    String month = item.getMonth() + " tháng";
                                                    if (item.getMonth() == -1) month = "Không Bảo Hành";
                                                    if (item.getMonth() == 1000) month = "Trên 36 tháng";
                                        %>
                                        <option value="<%=month%>"
                                                <%=p.getWarranty() == item.getMonth() ? "selected" : ""%>>
                                            <%=month%>
                                        </option>
                                        <% }
                                        } %>
                                    </select>
                                </div>
                            </div>

                            <div class=" page-header
                                        ">
                                <h3> Thông tin bán hàng </h3>
                            </div><!-- /.page-header -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-2-1">*Giá
                                    gốc</label>
                                <div class="col-sm-9">
                                    <input type="text" id="form-field-2-1" placeholder="Giá gốc"
                                           class="width-100" value="<%=Util.vndCurrency(p.getPrice())%>"
                                           pattern="^\d{1,3}(.\d{3})*(\₫)?$" data-type="currency"
                                           name="price"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-2-2"> *Giá
                                    bán</label>
                                <div class="col-sm-9 offset-sm-1">
                                    <input type="text" id="form-field-2-2"
                                           placeholder="Giá khuyến mãi" class="width-100"
                                           value="<%=Util.vndCurrency(p.getPromotionPrice())%>"
                                           pattern="^\d{1,3}(.\d{3})*(\₫)?$" data-type="currency"
                                           name="promotionPrice"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-2-3"> *Kho
                                    hàng </label>
                                <div class="col-sm-9 offset-sm-1">
                                    <input type="number" id="form-field-2-3"
                                           placeholder="Số lượng hàng còn trong kho"
                                           class="width-100"
                                           value="<%=p.getQuantity()%>"
                                           min="0"
                                           name="quantity"
                                    />
                                </div>
                            </div>

                            <div class="page-header">
                                <h3> Quản lý hình ảnh </h3>
                            </div><!-- /.page-header -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-3-1"> Hình
                                    ảnh
                                    sản phẩm </label>
                                <%--                                <input type="file" name="photos"/>--%>
                                <div class="input-field col-sm-9">
                                    <div class="input-images-2" id="form-field-3-1"
                                         style="padding-top: .5rem;"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input id="xFilePath" name="FilePath" type="text" size="60"/>
                                <input type="button" value="Browse Server" onclick="BrowseServer();"/>
                            </div>
                            <div class="clearfix form-actions">
                                <div class="">
                                    <a class="btn "
                                       href="http://localhost:8080/ProjectWeb02/admin/product/list">
                                        <i class="ace-icon fa fa-undo bigger-110"></i>
                                        Hủy
                                    </a>
                                    <button class="btn btn-info" type="submit">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Cập nhật
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div><!-- /.col -->
                    <%}%>
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <jsp:include page="parts/footer.jsp"></jsp:include>

</div><!-- /.main-container -->
<jsp:include page="parts/js-library.jsp"></jsp:include>


<%--image Uploader --%>
<script type="text/javascript" src="<%=Util.fullPath("imageUploader/image-uploader.min.js")%>"></script>
<script>

    var listImg = [];
    <%if (p!=null){
        String[] listImg=p.getListImg();
        if (listImg.length>0){%>
    listImg = <%=Product.toJavascriptArray(listImg)%>
        <% }
    }%>
        $(function () {
            // let preloaded = [
            //     {id: 1, src: 'https://picsum.photos/500/500?random=1'},
            //     {id: 2, src: 'https://picsum.photos/500/500?random=2'},
            //     {id: 3, src: 'https://picsum.photos/500/500?random=3'},
            //     {id: 4, src: 'https://picsum.photos/500/500?random=4'},
            //     {id: 5, src: 'https://picsum.photos/500/500?random=5'},
            //     {id: 6, src: 'https://picsum.photos/500/500?random=6'},
            // ];
            let preloaded = [];
            for (let i = 0; i < listImg.length; i++) {
                preloaded[i] = {id: (i + 1), src: '' + listImg[i] + ''};
            }

            $('.input-images-2').imageUploader({
                preloaded: preloaded,
                imagesInputName: 'photos',
                preloadedInputName: 'old',
                maxSize: 2 * 1024 * 1024,
                maxFiles: 10
            });

            // $('form').on('submit', function (event) {
            //
            //     // Stop propagation
            //     event.preventDefault();
            //     event.stopPropagation();
            //
            //     // Get some vars
            //     let $form = $(this),
            //         $modal = $('.modal');
            //
            //     // Set name and description
            //     $modal.find('#display-name span').text($form.find('input[id^="name"]').val());
            //     $modal.find('#display-description span').text($form.find('input[id^="description"]').val());
            //
            //     // Get the input file
            //     let $inputImages = $form.find('input[name^="images"]');
            //     if (!$inputImages.length) {
            //         $inputImages = $form.find('input[name^="photos"]')
            //     }
            //
            //     // Get the new files names
            //     let $fileNames = $('<ul>');
            //     for (let file of $inputImages.prop('files')) {
            //         $('<li>', {text: file.name}).appendTo($fileNames);
            //     }
            //
            //     // Set the new files names
            //     $modal.find('#display-new-images').html($fileNames.html());
            //
            //     // Get the preloaded inputs
            //     let $inputPreloaded = $form.find('input[name^="old"]');
            //     if ($inputPreloaded.length) {
            //
            //         // Get the ids
            //         let $preloadedIds = $('<ul>');
            //         for (let iP of $inputPreloaded) {
            //             $('<li>', {text: '#' + iP.value}).appendTo($preloadedIds);
            //         }
            //
            //         // Show the preloadede info and set the brandList of ids
            //         $modal.find('#display-preloaded-images').show().html($preloadedIds.html());
            //
            //     } else {
            //
            //         // Hide the preloaded info
            //         $modal.find('#display-preloaded-images').hide();
            //
            //     }
            //
            //     // Show the modal
            //     $modal.css('visibility', 'visible');
            // });
        });
</script>

<%--Ckeditor/ CKfinder--%>
<script type="text/javascript">
    var editor = CKEDITOR.replace('editor1');
    <%--var url = '<%=request.getContextPath()+"/ckfinder/"%>';--%>
    CKFinder.setupCKEditor(editor, "../../ckfinder");

    var editor2 = CKEDITOR.replace('editor2');
    CKFinder.setupCKEditor(editor2, "../../ckfinder");


    function BrowseServer() {
        // You can use the "CKFinder" class to render CKFinder in a page:
        var finder = new CKFinder();
        finder.basePath = '../';	// The path for the installation of CKFinder (default = "/ckfinder/").
        finder.selectActionFunction = SetFileField;
        finder.popup();

        // It can also be done in a single line, calling the "static"
        // popup( basePath, width, height, selectFunction ) function:
        // CKFinder.popup( '../', null, null, SetFileField ) ;
        //
        // The "popup" function can also accept an object as the only argument.
        // CKFinder.popup( { basePath : '../', selectActionFunction : SetFileField } ) ;
    }

    // This is a sample function which is called when a file is selected in CKFinder.
    function SetFileField(fileUrl) {
        document.getElementById('xFilePath').value = fileUrl;
    }
</script>

<%--Format currentcy--%>
<script>
    // Jquery Dependency
    $("input[data-type='currency']").on({
        keyup: function () {
            formatCurrency($(this));
        },
        blur: function () {
            formatCurrency($(this), "blur");
        }
    });

    function formatNumber(n) {
        // format number 1000000 to 1,234,567
        return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ".")
    }

    function formatCurrency(input, blur) {
        // appends $ to value, validates decimal side
        // and puts cursor back in right position.

        // get input value
        var input_val = input.val();

        // don't validate empty input
        if (input_val === "") {
            return;
        }

        // original length
        var original_len = input_val.length;

        // initial caret position
        var caret_pos = input.prop("selectionStart");

        // no decimal entered
        // add commas to number
        // remove all non-digits
        input_val = formatNumber(input_val);
        input_val = input_val;

        // final formatting
        if (blur === "blur") {
            input_val += " ₫";
        }

        // send updated string to input
        input.val(input_val);

        // put caret back in the right position
        var updated_len = input_val.length;
        caret_pos = updated_len - original_len + caret_pos;
        input[0].setSelectionRange(caret_pos, caret_pos);
    }
</script>
<%--Toast--%>
<script>
    <% if (result != null) {%>

    var x = document.getElementById("toast");
    x.className = "show";
    setTimeout(function () {
        x.className = x.className.replace("show", "");
    }, 3000);

    <%}%>
</script>

<%--Stick menu--%>
<%--<script>--%>
<%--    window.onscroll = function() {myFunction()};--%>

<%--    var navbar = document.getElementById("breadcrumbs");--%>
<%--    var sticky = navbar.offsetTop;--%>

<%--    function myFunction() {--%>
<%--        if (window.pageYOffset >= sticky) {--%>
<%--            navbar.classList.add("sticky")--%>
<%--        } else {--%>
<%--            navbar.classList.remove("sticky");--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
