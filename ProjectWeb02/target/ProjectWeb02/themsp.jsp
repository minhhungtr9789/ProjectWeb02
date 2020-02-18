<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>
</head>
<body>
<form action="ThemSanPham" class="form-horizontal" role="form" method="post">
								
								<div class="page-header">
									<h3>Thông tin bán hàng</h3>
								</div>
								<!-- /.page-header -->
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right"
										for="form-field-1-1"> *Tên sản phẩm </label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1-1" name="tensp"
											placeholder="Tên sản phẩm" class="col-xs-10 col-sm-11" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right"
										for="form-field-3-3"> *Danh mục </label>
									<div class="col-sm-9">
										<input type="text" id="form-field-3-3" name="danhmuc" placeholder="Danh mục"
											class="col-xs-10 col-sm-11" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right"
										for="content"> *Mô tả sản phẩm </label>
									<div class="col-sm-9">
										<textarea name="motasp" id="content" cols="30" rows="8"
											placeholder="Mô tả sản phẩm" class="col-xs-10 col-sm-11"></textarea>
									</div>
								</div>
								


								<div class="clearfix form-actions">
									<div class="col-md-offset-3 col-md-9">
										<button class="btn btn-info" type="submit">
											<i class="ace-icon fa fa-check bigger-110"></i> Submit
										</button>
										<!-- <button class="btn" type="button">
											<i class="ace-icon fa fa-undo bigger-110"></i> Reset
										</button> -->
									</div>
								</div>
							</form>
							
							<script type="text/javascript">
							var editor =CKEDITOR.replace('content');
							  CKFinder.setupCKEditor(editor,'ckfinder');
							
							</script>
</body>
</html>