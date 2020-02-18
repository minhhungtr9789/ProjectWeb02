package vn.nlu.fit.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import vn.nlu.fit.models.Catalog;
import vn.nlu.fit.models.User;
import vn.nlu.fit.utils.DBUtils;
import vn.nlu.fit.utils.MD5;
import vn.nlu.fit.utils.User_DAO;
import vn.nlu.fit.utils.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;


@WebServlet("/Login")
public class Login extends HttpServlet {
    HashMap<String, String> hashMap;
    private static final long serialVersionUID = 1L;

    public Login() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Gson gson = new Gson();
        hashMap = new HashMap<>();
        response.setCharacterEncoding("UTF-8");
        String json;

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user;
        System.out.println("Enter Login Servlet");
        if (checkValidate(username, password)) {
            if (new User_DAO().checkUser(username, MD5.encryption(password))) {
                HttpSession session = request.getSession();
                user = new User_DAO().takeProfileUer(username);
                //  find Cart in database
                try {
                    DBUtils.findCart(user);
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
                session.setAttribute("user", user);
                hashMap.put("resultValid", "success");
                hashMap.put("resultSign", "success");
                // send using ajax
                json = gson.toJson(hashMap);
                response.getWriter().print(json);
            } else {
                // Sai tên đăng nhập, mật khẩu
                hashMap.put("resultValid", "success");
                hashMap.put("resultSign", "Tên đăng nhập hoặc mật khẩu không đúng, vui lòng thử lại");
                // send using ajax
                json = gson.toJson(hashMap);
                response.getWriter().print(json);
            }
        } else {
            // Sai valid
            hashMap.put("resultValid", "error");
            // send using ajax
            json = gson.toJson(hashMap);
            response.getWriter().print(json);
        }

    }

    private boolean checkValidate(String username, String password) {
        // check valid, invalid, required
        boolean result = true;
            hashMap.put("username", "");
            hashMap.put("password", "");
        // Check required Tài khoản
        if ("".equals(username) || username == null) {
            hashMap.put("username", "Vui lòng nhập \"Tên đăng nhập\"");
            result = false;
        }
        // Check required Mật khẩu
        if ("".equals(password) || password == null) {
            hashMap.put("password", "Vui lòng nhập \"Mật khẩu\"");
            result = false;
        }
        // Gửi lại nội dung
        return result;
    }
}
