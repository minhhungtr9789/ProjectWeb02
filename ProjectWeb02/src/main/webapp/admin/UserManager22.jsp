<%@ page import="vn.nlu.fit.utils.Util" %>
<%@ page import="vn.nlu.fit.models.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="vn.nlu.fit.utils.DBUtils" %>
<%@ page import="vn.nlu.fit.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">
<title>User Manager</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/admin/assets/css/user.css">

<jsp:include page="parts/header.jsp"></jsp:include>

<body class="no-skin">
<%--<%--%>
<%--    ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");--%>
<%--%>--%>

<jsp:include page="parts/navbar.jsp"></jsp:include>

<div class="main-container ace-save-state" id="main-container">


    <jsp:include page="parts/left-menu.jsp"></jsp:include>

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Danh sách sản phẩm</li>
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
            <div class="table-wrapper">

                <%
                    ResultSet resultSet = (ResultSet) request.getAttribute("rs");
                %>
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Users</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>

                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>

                        <th>UserName</th>
                        <th>Email</th>
                        <th>FullName</th>
                        <th>Phone</th>
                        <th>Level</th>
                        <th>Address</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int j=0;
                        while (resultSet.next()){
                            j++;
                            int id = resultSet.getInt(1);
                    %>
                    <tr>

                        <td><%=resultSet.getString(2)%></td>
                        <td><%=resultSet.getString(3)%></td>
                        <td><%=resultSet.getString(4)%></td>
                        <td><%=resultSet.getString(5)%></td>
                        <td><%=resultSet.getInt(6)%></td>
                        <td><%=resultSet.getString(7)%></td>

                        <td>
                            <a href="#editEmployeeModal<%=j%>" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            <a href="#deleteEmployeeModal<%=j%>" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>

            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="<%=Util.fullPathAdmin("addEditRemoveUser")%>">
                        <div class="modal-header">
                            <h4 class="modal-title">Add User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>UserName</label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" name="pass" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" required>
                            </div>
                            <div class="form-group">
                                <label>FullName</label>
                                <input type="text" class="form-control" name="full" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                            <input type="hidden" name="a" value="add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <%
            resultSet.beforeFirst();
            int k=0;
            while (resultSet.next()){
                k++;
                int id=resultSet.getInt(1);
                User u = DBUtils.findUser(id);
        %>
        <div id="editEmployeeModal<%=k%>" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="<%=Util.fullPathAdmin("addEditRemoveUser")%>">

                        <div class="modal-header">
                            <h4 class="modal-title">Edit User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>UserName</label>
                                <input type="text" class="form-control" value="<%=((User) u).getUsername()%>" name="name" required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" required name="pass">
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" value="<%=u.getEmail()%>"required name="email">
                            </div>
                            <div class="form-group">
                                <label>FullName</label>
                                <input type="text" class="form-control" value="<%=u.getFullname()%>"required name="full">
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" value="<%=u.getPhone()%>"required name="phone">
                            </div>
                            <div class="form-group">
                                <label>Level</label>
                                <input type="text" class="form-control" value="<%=u.getLevel()%>"required name="level">
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" class="form-control" value="<%=u.getAddress()%>"required name="address">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                            <input type="hidden" name="a" value="edit">
                            <input type="hidden" name="id" value="<%=id%>">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%}%>
        <!-- Delete Modal HTML -->
        <%
            resultSet.beforeFirst();
            int i=0;
            while (resultSet.next()){
                i++;
                int id=resultSet.getInt(1);
        %>
        <div id="deleteEmployeeModal<%=i%>" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="<%=Util.fullPathAdmin("addEditRemoveUser")%>">

                        <div class="modal-header">
                            <h4 class="modal-title">Delete User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Bạn muốn xóa User này ?</p>
                            <p class="text-warning"><small>Dữ liệu không thể khôi phục khi đã xóa</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                            <input type="hidden" name="id" value="<%=id%>">
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div><!-- /.main-content -->
    <%}%>

    <jsp:include page="parts/footer.jsp"></jsp:include>

</div><!-- /.main-container -->
<!--Delete product-->


<jsp:include page="parts/js-library.jsp"></jsp:include>
<jsp:include page="parts/querytable.jsp"></jsp:include>

</body>
</html>
