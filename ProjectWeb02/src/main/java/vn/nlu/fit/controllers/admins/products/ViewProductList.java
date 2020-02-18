package vn.nlu.fit.controllers.admins.products;

import vn.nlu.fit.models.Product;
import vn.nlu.fit.utils.DBUtils;
import vn.nlu.fit.utils.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/admin/product/list")
public class ViewProductList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<Product> list = null;
        try {
            list = (ArrayList<Product>) DBUtils.queryProduct();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }


        request.setAttribute("list", list);
        request.getRequestDispatcher("../list-product.jsp").forward(request, response);
    }
}

