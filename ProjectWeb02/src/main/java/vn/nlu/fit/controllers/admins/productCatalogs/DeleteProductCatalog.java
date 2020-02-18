package vn.nlu.fit.controllers.admins.productCatalogs;

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

@WebServlet("/admin/productCatalogs/delete")
public class DeleteProductCatalog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("id");

        try {
            DBUtils.deleteCatalog(code);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(Util.fullPath("admin/productCatalogs/list"));
    }
}

