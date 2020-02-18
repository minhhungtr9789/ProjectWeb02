package vn.nlu.fit.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import vn.nlu.fit.models.Product;
import vn.nlu.fit.models.User;
import vn.nlu.fit.utils.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keys = request.getParameter("keys");

        ArrayList<Product> list = new ArrayList<>();
        try {
            list = DBUtils.searchProduct(keys);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // send using ajax
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(list);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(json);

    }
}

