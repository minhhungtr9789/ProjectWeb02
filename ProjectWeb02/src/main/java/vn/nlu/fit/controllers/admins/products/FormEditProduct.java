package vn.nlu.fit.controllers.admins.products;

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

@WebServlet("/admin/product/edit")
public class FormEditProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("id");
        Product p = null;
        ArrayList<Brand> brandList = null;
        ArrayList<Catalog> catalogList = null;
        ArrayList<Warranty> warrantyList = null;

        try {
            p = DBUtils.findProduct(code);
            brandList = DBUtils.loadBrand();
            catalogList = DBUtils.loadCataLog();
            warrantyList = DBUtils.loadWarranty();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("id", code);
        if (p != null) {
            request.setAttribute("p", p);
            System.out.println("Mầy vô đầy làm gì");
        }
        request.setAttribute("brandList", brandList);
        request.setAttribute("catalogList", catalogList);
        request.setAttribute("warrantyList", warrantyList);
        request.getRequestDispatcher("../new-edit-product.jsp").forward(request, response);
    }
}

