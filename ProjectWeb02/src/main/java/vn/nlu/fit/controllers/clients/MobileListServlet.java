package vn.nlu.fit.controllers.clients;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import vn.nlu.fit.models.Brand;
import vn.nlu.fit.models.Product;
import vn.nlu.fit.utils.DBUtils;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
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
        List<Product> list = null;

        int page = 0;
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException ignored) {
            }
        }
        page = page <= 0 ? 1 : page;

        //request.getParameter("brand");
        ArrayList<Brand> brandList = null;
        try {
            brandList = DBUtils.loadBrand();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // request.getParameter("price");

        try {
            list = DBUtils.queryMobileList(page);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        int numberOfPages = 1;
        try {
            numberOfPages = DBUtils.numberOfMobilePage();
        } catch (SQLException e) {
            e.printStackTrace();
        }


        request.setAttribute("catalog", "1");
        request.setAttribute("brandList", brandList); //brand list

        request.setAttribute("list", list); //product list
        request.setAttribute("numberOfPages", numberOfPages); //số lượng phân trang
        request.setAttribute("page", page); //số trang

        request.setAttribute("servletPath", request.getServletPath());

        request.getRequestDispatcher("tablet-products.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> list = new ArrayList<>();


        Gson gson = new Gson();
        String json = null;
        String[] brand = null;
        String[] price = null;
        String brandJson = request.getParameter("brand");
//        if (request.getParameter("brand") != null) {
//            brand = gson.fromJson(brandJson, String[].class);
//        }
        String priceJson = request.getParameter("price");
//        if (request.getParameter("price") != null) {
//            price = gson.fromJson(priceJson, String[].class);
//        }
        String sort = request.getParameter("sort");
        //  System.out.println(sort);

        int page = 0;
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page").trim());
                System.out.println("page: " + page);
            } catch (NumberFormatException ignored) {
            }
        }
        page = page <= 0 ? 1 : page;


        ArrayList<Brand> brandList = null;
        try {
            brandList = DBUtils.loadBrand();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getParameter("price");

        try {
            list = DBUtils.queryMobileList(brandJson, priceJson, sort, page);
            System.out.println("size " + list.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        int numberOfPages = 1;
        try {
            numberOfPages = DBUtils.numberOfMobilePage(brandJson, priceJson, sort);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        // send using ajax
        HashMap<String, Object> map = new HashMap<>();
        map.put("list", list); // result of filter
        map.put("page", page); // at page x
        map.put("numberOfPages", numberOfPages); // number of pages

        System.out.println("numberOfPages: " + numberOfPages);
        json = gson.toJson(map);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(json);
    }
}