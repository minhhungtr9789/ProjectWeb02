package vn.nlu.fit.controllers.admins.users;

import vn.nlu.fit.connections.MySQLConnUtils;
import vn.nlu.fit.models.User;
import vn.nlu.fit.utils.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/admin/user/list")
public class ShowUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        User user = (User) request.getSession().getAttribute("user");
//        if (user!=null){
//            if (user.getLevel()>2){
                try {
                    Connection con = MySQLConnUtils.getMySQLConnection();
                    String sql="SELECT id,Username,Email,FullName,PhoneNumber,level,Address FROM `user` WHERE level=1 OR level=2";
                    PreparedStatement pr = con.prepareStatement(sql);
                    ResultSet rs = pr.executeQuery();
                    request.setAttribute("rs",rs);
//                    response.sendRedirect(Util.fullPathAdmin("UserManager22.jsp"));
                    request.getRequestDispatcher("../UserManager22.jsp").forward(request,response);

                } catch (SQLException e) {
                    e.printStackTrace();
                }
//            }
//        }

    }
}
