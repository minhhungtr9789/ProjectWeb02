package vn.nlu.fit.controllers.clients;


import vn.nlu.fit.models.Brand;
import vn.nlu.fit.models.Product;
import vn.nlu.fit.utils.DBUtils;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mobileList")
public class MobileListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String errorString = null;
        List<Product> list = null;

        request.getParameter("sort");

        int page = 0;
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException ignored) {
            }
        }
        page = page <= 0 ? 1 : page;

        System.out.println(request.getParameter("brand"));
        System.out.println(request.getParameter("price"));

        request.getParameter("brand");
        ArrayList<Brand> brandList = null;
        try {
            brandList = DBUtils.loadBrand();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getParameter("price");

        try {
            list = DBUtils.queryMobileList(page);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }

        int numberOfPages = 1;
        try {
            numberOfPages = DBUtils.numberOfMobilePage();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("errorString", errorString);

        request.setAttribute("catalog", "1");
        request.setAttribute("list", list); //product list
        request.setAttribute("brandList", brandList); //brand list
        request.setAttribute("numberOfPages", numberOfPages); //số lượng phân trang
        request.setAttribute("page", page); //số trang
        request.setAttribute("servletPath", request.getServletPath());

        request.getRequestDispatcher("tablet-products.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}