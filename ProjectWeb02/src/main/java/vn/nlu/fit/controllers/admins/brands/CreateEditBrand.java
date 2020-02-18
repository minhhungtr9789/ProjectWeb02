package vn.nlu.fit.controllers.admins.brands;

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
import java.util.HashMap;

@WebServlet("/admin/brand/create-edit")
public class CreateEditBrand extends HttpServlet {
    private String code, name, description, settingInfo, listImg;
    private int catalog, brand, warranty, quantity;
    private double price, promotionPrice;
    private HashMap<String, String> hashMap;
    private Product p, realP;
    String result;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        hashMap = new HashMap<>();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
//        System.out.println("action: " + action);
        String id = request.getParameter("id");
//        System.out.println("id: " + id);
        // Thêm mới sẩn phẩm
        // Check valid, check code
        if (action.equals("new")) {
            // Check valid/ check code
            // Check valid
            if (!checkValidate(request)) {
                // Báo lỗi
                // List thông báo
                request.setAttribute("errorList", hashMap);
                // Thông báo toast lỗi
                result = "errorNew";
                request.setAttribute("result", result);
                request.getRequestDispatcher("/admin/product/new").forward(request, response);
            } else {
                try {
                    if (!checkCode(action, "")) {
                        // Báo lỗi
                        hashMap.put("code", "Mã sản phẩm SKU đã tồn tại!");
                        // List thông báo
                        request.setAttribute("errorList", hashMap);
                        // Thông báo toast lỗi
                        result = "errorNew";
                        request.setAttribute("result", result);
                        request.getRequestDispatcher("/admin/product/new").forward(request, response);
                    } else {
                        // Ok
                        // Tạo mới sản phẩm
                        DBUtils.insertProduct(p);
                        // Thông báo toast success
                        result = "successNew";
                        request.setAttribute("result", result);
                        request.getRequestDispatcher("/admin/product/new").forward(request, response);
                    }
                } catch (SQLException e) {
                    // Báo lỗi
                    // List thông báo
                    request.setAttribute("errorList", hashMap);
                    // Thông báo toast lỗi
                    result = "errorNew";
                    request.setAttribute("result", result);
                    request.getRequestDispatcher("/admin/product/new").forward(request, response);
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
            // Check valid/ check code
            // Check valid
            if (!checkValidate(request)) {
                // Báo lỗi
                // List thông báo
                request.setAttribute("errorList", hashMap);
                // Thông báo toast lỗi
                result = "errorEdit";
                request.setAttribute("result", result);
                request.getRequestDispatcher("/admin/product/edit?id=" + id).forward(request, response);
            } else {
                try {
                    if (!checkCode(action, id)) {
                        // Báo lỗi
                        hashMap.put("code", "Mã sản phẩm SKU đã tồn tại!");
                        // List thông báo
                        request.setAttribute("errorList", hashMap);
                        // Thông báo toast lỗi
                        result = "errorEdit";
                        request.setAttribute("result", result);
                        request.getRequestDispatcher("/admin/product/edit?id=" + id).forward(request, response);
                    } else {
                        // Ok
                        // Update sản phẩm
                        DBUtils.updateProduct(p,realP.getId());
                        // Thông báo toast success
                        result = "successEdit";
                        request.setAttribute("result", result);
                        request.getRequestDispatcher("/admin/product/edit?id=" + code).forward(request, response);
                    }
                } catch (SQLException e) {
                    // Báo lỗi
                    // List thông báo
                    request.setAttribute("errorList", hashMap);
                    // Thông báo toast lỗi
                    result = "errorEdit";
                    request.setAttribute("result", result);
                    request.getRequestDispatcher("/admin/product/edit?id=" + id).forward(request, response);
                    e.printStackTrace();
                }
            }
        }
    }


    private boolean checkValidate(HttpServletRequest request) {
        // check valid, invalid, required
        boolean result = true;
        p = new Product();
        p.setCode("");
        p.setName("");
        p.setDescription("");
        p.setSettingInfo("");

        hashMap.put("code", "");
        hashMap.put("name", "");
        hashMap.put("quantity", "");
        hashMap.put("price", "");
        hashMap.put("promotionPrice", "");
        try {
            description = request.getParameter("description");
            settingInfo = request.getParameter("settingInfo");
            catalog = Integer.parseInt(request.getParameter("catalog"));
            brand = Integer.parseInt(request.getParameter("brand"));
            warranty = Integer.parseInt(request.getParameter("warranty"));
            listImg = request.getParameter("listImg");

            p.setDescription(description);
            p.setSettingInfo(settingInfo);
            p.setCatalog(catalog);
            p.setBrand(brand);
            p.setWarranty(warranty);
            p.setListImg(Product.convertToArray(listImg));

            // Check required Mã SKU
            if ("".equals(request.getParameter("code")) || request.getParameter("code") == null) {
                hashMap.put("code", "Vui lòng nhập \"Mã SKU\"");
                result = false;
            } else {
                code = request.getParameter("code");
                p.setCode(code);
            }
            // Check required name
            if ("".equals(request.getParameter("name")) || request.getParameter("name") == null) {
                hashMap.put("name", "Vui lòng nhập \"Tên sản phẩm\"");
                result = false;
            } else {
                name = request.getParameter("name");
                p.setName(name);
            }
            // Check required quantity
            if ("".equals(request.getParameter("quantity")) || request.getParameter("quantity") == null) {
                hashMap.put("quantity", "Vui lòng nhập \"Số lượng hàng\"");
                result = false;
            } else {
                quantity = Integer.parseInt(request.getParameter("quantity"));
                p.setQuantity(quantity);
            }
            // Check required price
            if ("".equals(request.getParameter("price")) || request.getParameter("price") == null) {
                hashMap.put("price", "Vui lòng nhập \"Giá sản phẩm\"");
                result = false;
            } else {
                price = Util.convertVndCurrencyToDoub(request.getParameter("price"));
                p.setPrice(price);
            }
            // Check required promotionPrice
            if ("".equals(request.getParameter("promotionPrice")) || request.getParameter("promotionPrice") == null) {
                hashMap.put("promotionPrice", "Vui lòng nhập \"Giá khuyến mãi\"");
                result = false;
            } else {
                promotionPrice = Util.convertVndCurrencyToDoub(request.getParameter("promotionPrice"));
                p.setPromotionPrice(promotionPrice);
            }
        } catch (NumberFormatException e) {
            e.getMessage();
            result = false;
        }
        // Gửi lại nội dung
        request.setAttribute("pEdit", p);
        return result;
    }

    private boolean checkCode(String action, String id) throws SQLException {
        if (action.equals("edit")) {
            // Giống code cũ thì update
            // Không giống thì kiểm tra xem code tồn tại?
            realP = DBUtils.findProduct(id);
            if (id.equals(code)) {
                // Giống code cũ
                // Thực hiện update
                return true;
            } else {
                // Kiểm tra code tồn tại?
                // Nếu chưa có
                // Thực hiện update
                // Nếu có
                // Báo lỗi
                return DBUtils.findProduct(code) == null;
            }
        }
        if (action.equals("new")) {
            // Check lỗi trùng mã sản phẩm khác
            // Nếu chưa có => thêm mới
            // Nếu đã có => báo lỗi
            return DBUtils.findProduct(code) == null;
        }
        return false;
    }
}

