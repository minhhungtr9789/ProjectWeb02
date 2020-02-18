package vn.nlu.fit.controllers.clients;


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
import java.util.List;

public class IndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public IndexServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String errorString = null;
        List<Product> list = null;

        try {
            list = DBUtils.queryProduct("SELECT * FROM product WHERE CatalogId IN(1,5) AND `Status` = 1\n" +
                    "ORDER BY `Top` ASC LIMIT 0,8");
            request.setAttribute("mobileList", list);

            list = DBUtils.queryProduct("SELECT * FROM product WHERE CatalogId=3 AND `Status` = 1\n" +
                    "ORDER BY `Top` ASC LIMIT 0,8");
            request.setAttribute("tabletList", list);

            list = DBUtils.queryProduct("SELECT * FROM product WHERE CatalogId=2 AND `Status` = 1\n" +
                    "ORDER BY `Top` ASC LIMIT 0,8");
            request.setAttribute("laptopList", list);

            list = DBUtils.queryProduct("SELECT * FROM product WHERE CatalogId IN(4,9,10) AND `Status` = 1\n" +
                    "ORDER BY `Top` ASC LIMIT 0,8");
            request.setAttribute("phukienList", list);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}