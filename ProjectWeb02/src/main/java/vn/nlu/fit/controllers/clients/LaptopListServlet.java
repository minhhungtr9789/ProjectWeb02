package vn.nlu.fit.controllers.clients;


import vn.nlu.fit.models.Product;
import vn.nlu.fit.utils.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/laptopList")
public class LaptopListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        Connection conn = MyUtils.getStoredConnection(request);

        String errorString = null;
        List<Product> list = null;

        try {
            list = DBUtils.queryProduct("SELECT * FROM product WHERE CatalogId=2 AND `Status` = 1 AND Top = 1");
            request.setAttribute("firsList", list);
            list = DBUtils.queryProduct("SELECT * FROM product WHERE CatalogId=2 AND `Status` = 1 AND Top = 0");
            request.setAttribute("list", list);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        // Lưu thông tin vào request attribute trước khi forward sang views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("catalog", "2");
//        // Forward sang /productListView.jsp
        request.getRequestDispatcher("tablet-products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}