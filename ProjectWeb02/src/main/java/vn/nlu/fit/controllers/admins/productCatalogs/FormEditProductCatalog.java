package vn.nlu.fit.controllers.admins.productCatalogs;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import vn.nlu.fit.models.Brand;
import vn.nlu.fit.models.Catalog;
import vn.nlu.fit.models.Product;
import vn.nlu.fit.models.Warranty;
import vn.nlu.fit.utils.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/admin/productCatalogs/edit")
public class FormEditProductCatalog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Enter new catalog form servlet");
        int code = Integer.parseInt(request.getParameter("id"));
        Catalog catalog = null;
        ArrayList<Brand> brandList = null;
        ArrayList<Catalog> catalogList = null;
        ArrayList<Warranty> warrantyList = null;

        try {
            catalog = DBUtils.findCatalog(code);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (catalog != null) {
            // send using ajax
            Gson gson = new Gson();
            String json = gson.toJson(catalog);
            response.setCharacterEncoding("UTF-8");
//            System.out.println(json);
            response.getWriter().print(json);
        }
    }
}

