package vn.nlu.fit.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import vn.nlu.fit.models.Product;
import vn.nlu.fit.utils.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/SearchPageServlet")
public class SearchPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keys = request.getParameter("keys");
        ArrayList<Product> list = new ArrayList<>();
        if (keys != null && !keys.equals("")) {
            try {
                list = DBUtils.searchProduct(keys);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        request.setAttribute("list", list);
        request.getRequestDispatcher("/find-products.jsp").forward(request, response);
    }
}

