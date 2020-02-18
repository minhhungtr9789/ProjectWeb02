package vn.nlu.fit.controllers.admins.brands;

import vn.nlu.fit.models.Brand;
import vn.nlu.fit.models.Catalog;
import vn.nlu.fit.utils.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/admin/brand/list")
public class ViewBrandList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<Brand> list = null;
        try {
            list = DBUtils.queryBrand();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        request.setAttribute("list", list);
        request.getRequestDispatcher("../list-brand.jsp").forward(request, response);
    }
}

