package vn.nlu.fit.controllers.clients;

import vn.nlu.fit.models.Cart;
import vn.nlu.fit.models.Product;
import vn.nlu.fit.models.User;
import vn.nlu.fit.utils.DBUtils;
import vn.nlu.fit.utils.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equalsIgnoreCase("view")) {
                try {
                    doGet_ViewCart(request, response);
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
            if (action.equalsIgnoreCase("proceed2Checkout")) {
                try {
                    doGet_Proceed2Checkout(request);
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
            if (action.equalsIgnoreCase("add")) {
                doGet_Add(request, response);
            }
            if (action.equalsIgnoreCase("remove")) {
                try {
                    doGet_Remove(request, response);
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
            if (action.equalsIgnoreCase("removeFormCheckOut")) {
                try {
                    doGet_RemoveFormCheckOut(request, response);
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
            if (action.equalsIgnoreCase("quantity_Up")) {
                try {
                    doGet_quantity_Up(request, response);
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
            if (action.equalsIgnoreCase("quantity_Down")) {
                try {
                    doGet_quantity_Down(request, response);
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
            if (action.equalsIgnoreCase("enter_Quantity")) {
                try {
                    doGet_enter_Quantity(request, response);
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
            if (action.equalsIgnoreCase("proceed_to_checkout")) {
//                try {
                    doGet_proceed_to_checkout(request, response);
//                } catch (SQLException | ClassNotFoundException e) {
//                    e.printStackTrace();
//                }
            }
        } else {
            response.sendRedirect((Util.fullPath("")));
        }
    }

    private void doGet_proceed_to_checkout(HttpServletRequest request, HttpServletResponse response) {

    }

    private void doGet_Proceed2Checkout(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        // Thay đổi status của product item, lưu xuống database
        // Cẩn user(session), item nào(chỉ lấy đc product id)

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int id = Integer.parseInt(request.getParameter("id"));
        user.getCart().changeStatusOCartItem(user, id);

    }

    private void doGet_ViewCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        /*
         *  User đăng nhập?
         *       Nếu chưa đăng nhập: kiểm tra lỗi, hiển thị trang đăng nhập trong cart
         *       Đã đăng nhập: next
         *              <Khi tạo tài khoản thì phải tạo 1 cart cho user đó trong database>
         *  Lấy Cart của user trong database lên
         *       Cart null: (k có th này vì đã tạo cart khi đk)
         *       Cart có dữ liệu: next(set lại cart mới cho user, làm trong phần serch cart)
         *  Cập nhật lại số lượng product/ trạng thái product(đang bán, ngừng bán) trong cart vs product trong kho
         *      Set Cart mới cho User
         *
         *
         *  Set lại User vào session (không cần bởi vì mình dùng user của session nên thao tác gì nó cũng tham chiếu đến
         *  user của session)
         *
         * */
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        // Kiểm tra trường hợp vượt biên trái phép
        if (user == null) {
            //Nếu chưa đăng nhập: kiểm tra lỗi, hiển thị trang đăng nhập trong cart
        }
        if (user != null) {
            // Cập nhật lại số lượng product/ trạng thái product(đang bán, ngừng bán) trong cart vs product trong kho
            user.updateCart();
//            session.setAttribute("user", user);
        }
        // Forward
        request.getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    private void doGet_Add(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            HttpSession session = request.getSession();
            String code = request.getParameter("id");
            Product p = DBUtils.findProduct(code,1);
            User user = (User) session.getAttribute("user");
            Cart c = user.getCart();

            if (user != null) {
                if (p != null) {
                    c.addCartItem(p);
                }
            }

            response.sendRedirect((Util.fullPath("DetailProduct?id=" + code)));
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void doGet_Remove(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart c = user.getCart();

        String code = request.getParameter("id");
        // Kiem tra id null
        if (!code.equals("")) {
            // Remove list
            if (code.substring(code.length() - 1, code.length()).equals(":")) {
                String[] listCode = code.split(":");
                code = code.substring(0, code.length() - 1);
                Product p;
                for (String codeItem : listCode) {
                    p = DBUtils.findProduct(codeItem,1);
                    if (user != null) {
                        if (p != null) {
                            c.removeCartItem(p);
                        }
                    }
                }
            }
            // Remove one item
            else {
                Product p = DBUtils.findProduct(code,1);
                if (user != null) {
                    if (p != null) {
                        c.removeCartItem(p);
                    }
                }
            }
        }

        response.sendRedirect(Util.fullPath("CartServlet?action=view"));
    }
    private void doGet_RemoveFormCheckOut(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart c = user.getCart();

        String code = request.getParameter("id");
        // Kiem tra id null
        if (!code.equals("")) {
            // Remove list
            if (code.substring(code.length() - 1, code.length()).equals(":")) {
                String[] listCode = code.split(":");
                code = code.substring(0, code.length() - 1);
                Product p;
                for (String codeItem : listCode) {
                    p = DBUtils.findProduct(codeItem,1);
                    if (user != null) {
                        if (p != null) {
                            c.removeCartItem(p);
                        }
                    }
                }
            }
            // Remove one item
            else {
                Product p = DBUtils.findProduct(code,1);
                if (user != null) {
                    if (p != null) {
                        c.removeCartItem(p);
                    }
                }
            }
        }

        response.sendRedirect(Util.fullPath("proceed-to-checkout.jsp"));
    }

    /*
        do get quantity_Up
        send data from jsp to serlet
            + id product => send by url: ok
            + action = quantity_Up send by url: ok
        servlet
            + check quantity of product >= quantity in cart

    */
    private void doGet_quantity_Up(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        HttpSession session = request.getSession();
        String code = request.getParameter("id");
        Product p = DBUtils.findProduct(code,1);
        User user = (User) session.getAttribute("user");
        Cart c = user.getCart();
        if (user != null) {
            if (p != null) {
                // process.......
                c.quantity_Up(code);
            }
        }
        response.sendRedirect(Util.fullPath("CartServlet?action=view"));
    }

    private void doGet_quantity_Down(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        HttpSession session = request.getSession();
        String code = request.getParameter("id");
        Product p = DBUtils.findProduct(code,1);
        User user = (User) session.getAttribute("user");
        Cart c = user.getCart();
        if (user != null) {
            if (p != null) {
                // process.......
                c.quantity_Down(code);
            }
        }
        response.sendRedirect(Util.fullPath("CartServlet?action=view"));
    }

    private void doGet_enter_Quantity(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        HttpSession session = request.getSession();
        String code = request.getParameter("id");
        int quantity = Integer.parseInt(request.getParameter("value"));
        Product p = DBUtils.findProduct(code,1);
        User user = (User) session.getAttribute("user");
        Cart c = user.getCart();
//        System.out.println("Vô đây chưa: " + code + "\t" + quantity);
        if (user != null) {
            if (p != null) {
                // process.......
                c.doGet_enter_Quantity(code, quantity);
            }
        }

//        response.setContentType("text/html;charset=UTF-8");
//        response.getWriter().println((Util.fullPath("index.jsp")));
    }
}

