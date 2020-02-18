package vn.nlu.fit.controllers.clients;

import vn.nlu.fit.models.Order;
import vn.nlu.fit.models.User;
import vn.nlu.fit.utils.DBUtils;
import vn.nlu.fit.utils.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/order")
public class order extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User u = (User) request.getSession().getAttribute("user");
        try {

            List<Order> list = DBUtils.AllOrderUser(DBUtils.getIdUser(u.getUsername()));
            System.out.println(DBUtils.getIdUser(u.getUsername()));
            request.setAttribute("list",list);
            request.getRequestDispatcher("account-orderd-history.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
