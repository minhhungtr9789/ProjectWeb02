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
                        <!-- PAGE CONTENT BEGINS -->

                            <form class="form-horizontal"   method="post"
                                  action="<%=Util.fullPathAdmin("product/create-edit")%>"
                            >
                            <div class="page-header">
                                <h3> Thông tin cơ bản </h3>
                            </div><!-- /.page-header -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> *Mã
                                    SKU</label>
                                <div class="col-sm-9">
                                    <input name="code" required type="text" id="form-field-1" placeholder="Mã SKU" class="width-100"
                                           value=""
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-2"> *Tên sản
                                    phẩm </label>
                                <div class="col-sm-9">
                                    <input name="name" required type="text" id="form-field-2" placeholder="Tên sản phẩm" class="width-100"
                                           value=""
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right"> *Mô tả sản
                                    phẩm </label>
                                <div class="col-sm-9">
                                    <textarea name="editor1" id="editor1" cols="30" rows="8"
                                              placeholder="Mô tả sản phẩm" class="width-100">

                                    </textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right"> *Thông số kỹ thuật </label>
                                <div class="col-sm-9">
                                    <textarea name="editor2" id="editor2" cols="30" rows="8"
                                              placeholder="Mô tả sản phẩm" class="width-100">

                                    </textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-3"> *Loại sản
                                    phẩm </label>
                                <div class="col-sm-9">
                                    <select name="catalog" id="form-field-3" class="width-100">
                                        <%
                                            if (catalogList != null) {
                                                for (Catalog item : catalogList) {
                                        %>
                                        <option value="<%=item.getId()%>"
                                               >
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
                                    <select name="brand" id="form-field-4" class="width-100">
                                        <%
                                            if (brandList != null) {
                                                for (Brand item : brandList) {
                                        %>
                                        <option value="<%=item.getBrandId()%>"
                                               >
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
                                    <select name="warranty" id="form-field-5" class="width-100">
                                        <%
                                            if (warrantyList != null) {
                                                for (Warranty item : warrantyList) {
                                                    String month = item.getMonth() + " tháng";
                                                    if (item.getMonth() == -1) month = "Không Bảo Hành";
                                                    if (item.getMonth() == 1000) month = "Trên 36 tháng";
                                        %>
                                        <option value="<%=item.getMonth()%>"
                                           >
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
                                    <input name="price" required type="text" id="form-field-2-1" placeholder="Giá gốc"
                                           class="width-100" value=""/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-2-2"> *Giá
                                    bán</label>
                                <div class="col-sm-9 offset-sm-1">
                                    <input name="promotionPrice" required type="text" id="form-field-2-2"
                                           placeholder="Giá khuyến mãi" class="width-100"
                                           value=""/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-2-3"> *Kho
                                    hàng </label>
                                <div class="col-sm-9 offset-sm-1">
                                    <input name="quantity" required type="number" id="form-field-2-3"
                                           placeholder="Số lượng hàng còn trong kho"
                                           class="width-100"
                                           value=""/>
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

                            <div class="clearfix form-actions">
                                <div class="">
                                    <a class="btn "
                                       href="http://localhost:8080/ProjectWeb02/admin/product/list">
                                        <i class="ace-icon fa fa-undo bigger-110"></i>
                                        Hủy
                                    </a>
                                    <button class="btn btn-info" type="submit">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                       Thêm sản phẩm
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <jsp:include page="parts/footer.jsp"></jsp:include>

</div><!-- /.main-container -->
<jsp:include page="parts/js-library.jsp"></jsp:include>

<!--ckeditor-->
<script>
    // initSample();
</script><!--end ckeditor-->

<%--image Uploader --%>
<script type="text/javascript" src="<%=Util.fullPath("imageUploader/image-uploader.min.js")%>"></script>
<script>

    var listImg = [];
    <%if (p!=null){
        String[] listImg=p.getListImg();
        if (listImg.length>0){%>
    listImg = <%=Product.toJavascriptArray(listImg)%>
        <% }}%>
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
<script type="text/javascript">
    var editor1 = CKEDITOR.replace('editor1');
    CKFinder.setupCKEditor(editor1, 'ckfinder');
    var editor2 = CKEDITOR.replace('editor2');
    CKFinder.setupCKEditor(editor2, 'ckfinder');
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
