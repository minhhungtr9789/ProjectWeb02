package vn.nlu.fit.controllers.admins.productCatalogs;

import com.google.gson.Gson;
import vn.nlu.fit.models.Catalog;
import vn.nlu.fit.utils.DBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

@WebServlet("/admin/productCatalogs/create-edit")
public class CreateEditProductCatalog extends HttpServlet {
    private String code, name, description, settingInfo, listImg;
    private int catalog, brand, warranty, quantity;
    private double price, promotionPrice;
    private HashMap<String, String> hashMap;
    private Catalog c, realP;
    String result;
    String catalogName;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        hashMap = new HashMap<>();
        Gson gson = new Gson();
        String json;
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        catalogName = request.getParameter("name");

        // Thêm mới loại sản phẩm
        // Check valid, check code
        if (action.equals("new")) {
            // Check valid/ check code
            // Check valid
            if (!checkValidate(request)) {
                // Báo lỗi
                json = gson.toJson(hashMap);
                response.getWriter().print(json);
            } else {
                hashMap.put("resultValid", "success");
                // Check code
                try {
                    // Nếu trùng không trùng code
                    if (!checkCode(action, 0)) {
                        // ghi lỗi vô map
                        hashMap.put("resultDuplicated", "Tên loại sản phẩm đã tồn tại");
                        json = gson.toJson(hashMap);
                        response.getWriter().print(json);
                    } else {
                        // success thêm mới
                        // insert to DB
                        DBUtils.insertCatalog(c);
                        // thông báo
                        hashMap.put("resultDuplicated", "success");
                        json = gson.toJson(hashMap);
                        response.getWriter().print(json);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        // Edit sản phẩm
        // Check valid,
        // Check code
        //  + Trùng code cũ
        //  + Trùng code sp trong data
        //  + Không trùng
        if (action.equals("edit")) {
            System.out.println("enter edit catalog servlet1");
            // Check valid/ check code
            // Check valid
            if (!checkValidate(request)) {
                // Báo lỗi
                json = gson.toJson(hashMap);
                response.getWriter().print(json);
            } else {
                hashMap.put("resultValid", "success");
                // Check code
                try {
                    // Nếu trùng code
                    int idCatalog = Integer.parseInt(request.getParameter("id"));
                    if (!checkCode(action, idCatalog)) {
                        System.out.println("Tên loại sản phẩm đã tồn tại");
                        // ghi lỗi vô map
                        hashMap.put("resultDuplicated", "Tên loại sản phẩm đã tồn tại");
                        json = gson.toJson(hashMap);
                        response.getWriter().print(json);
                    } else {
                        System.out.println("success");
                        // update to DB
                        DBUtils.updateCatalog(c, idCatalog);
                        // thông báo
                        hashMap.put("resultDuplicated", "success");
                        json = gson.toJson(hashMap);
                        response.getWriter().print(json);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }


    private boolean checkValidate(HttpServletRequest request) {
        // check valid, invalid, required
        boolean result = true;
        c = new Catalog();
        c.setName("");

        hashMap.put("resultValid", "");
        try {
            int parentId = Integer.parseInt(request.getParameter("select"));
            c.setParentId(parentId);
            // Check required Tên loại sản phẩm
            if ("".equals(request.getParameter("name")) || request.getParameter("name") == null) {
                hashMap.put("resultValid", "Vui lòng nhập \"Tên loại sản phẩm\"");
                result = false;
            } else {
                name = request.getParameter("name");
                c.setName(name);
            }
        } catch (NumberFormatException e) {
            e.getMessage();
            result = false;
        }
        // Gửi lại nội dung
        return result;
    }

    private boolean checkCode(String action, int idCatalog) throws SQLException {

        if (action.equals("new")) {
            // Check lỗi trùng mã sản phẩm khác
            // Nếu chưa có => thêm mới
            // Nếu đã có => báo lỗi
            return !DBUtils.findCatalog(c.getName());
        }
        if (action.equals("edit")) {
            // Giống code cũ thì update
            // Không giống thì kiểm tra xem code tồn tại?
            Catalog cata = DBUtils.findCatalog(idCatalog);
            if (cata != null) {
                if (cata.getName().equals(catalogName)) {
                    // Giống code cũ
                    // Thực hiện update
                    return true;
                } else {
                    // Kiểm tra code tồn tại?
                    // Nếu chưa có
                    // Thực hiện update
                    // Nếu có
                    // Báo lỗi
                    return !DBUtils.findCatalog(c.getName());
                }
            } else {
                return false;
            }
        }

        return false;
    }
}

