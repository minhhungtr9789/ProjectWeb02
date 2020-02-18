package vn.nlu.fit.controllers.admins.productCatalogs;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import vn.nlu.fit.models.Brand;
import vn.nlu.fit.models.Catalog;
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

@WebServlet("/admin/productCatalogs/new")
public class FormNewProductCatalog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Catalog> catalogs = null;
        try {
            catalogs = DBUtils.queryCatalog();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        // send using ajax
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(catalogs);
        response.setCharacterEncoding("UTF-8");
//        System.out.println(json);
        response.getWriter().print(json);
    }
}

