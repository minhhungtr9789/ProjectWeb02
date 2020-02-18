package vn.nlu.fit.controllers.admins.order;

import vn.nlu.fit.utils.DBUtils;
import vn.nlu.fit.utils.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/order/updateDelivery")
public class updateDelivery extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int s = Integer.parseInt(request.getParameter("status"));
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            DBUtils.setDelivery(s,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(Util.fullPathAdmin("order/ShowOrder"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }
}
