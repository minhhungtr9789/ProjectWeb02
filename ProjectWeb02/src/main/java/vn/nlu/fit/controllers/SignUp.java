package vn.nlu.fit.controllers;

import com.google.gson.Gson;
import vn.nlu.fit.models.User;
import vn.nlu.fit.utils.DBUtils;
import vn.nlu.fit.utils.MD5;
import vn.nlu.fit.utils.User_DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;


@WebServlet("/signUp")
public class SignUp extends HttpServlet {
    HashMap<String, String> hashMap;
    private static final long serialVersionUID = 1L;

    public SignUp() {
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

        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");

        User user;
        System.out.println("Enter Login Servlet");
        if (checkValidate(userName, email, fullName, password, rePassword)) {
            // check duplicate
            hashMap.put("resultValid", "success");
            try {
                if (checkDulicate(userName)) {
                    // Không trùng, tạo mới
                    System.out.println("Không trùng, tạo mới");
                    User u= new User();
                    u.setUsername(userName);
                    u.setEmail(email);
                    u.setFullname(fullName);
                    u.setPassword(MD5.encryption(password) );
                    // tạo trong DB
                    DBUtils.addUser(u);
                    hashMap.put("resultDulicate", "success");
                    // send using ajax
                    json = gson.toJson(hashMap);
                    response.getWriter().print(json);
                } else {
                    // Trùng, báo lỗi
                    System.out.println("Trùng, báo lỗi");
                    // Sai valid
                    hashMap.put("resultDulicate", "Tên đăng nhập đã tồn tại, xin chọn tên khác");
                    // send using ajax
                    json = gson.toJson(hashMap);
                    response.getWriter().print(json);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            // Sai valid
            hashMap.put("resultValid", "error");
            // send using ajax
            json = gson.toJson(hashMap);
            response.getWriter().print(json);
        }

    }

    private boolean checkDulicate(String userName) throws SQLException {
        return DBUtils.checkUserName(userName) ? false : true;
    }

    private boolean checkValidate(String userName, String email, String fullName, String password, String rePassword) {
        // check valid, invalid, required
        boolean result = true;

        String emailPattern = "^[\\w!#$%&’*+/=?`{|}~^-]+(?:\\.[\\w!#$%&’*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
        String passPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$";

        hashMap.put("userName", "");
        hashMap.put("email", "");
        hashMap.put("fullName", "");
        hashMap.put("password", "");
        hashMap.put("rePassword", "");
        // Check required Tài khoản
        if ("".equals(userName) || userName == null) {
            hashMap.put("userName", "Vui lòng nhập \"Tên đăng nhập\"");
            result = false;
        }
        // Check required email
        if ("".equals(email) || email == null) {
            hashMap.put("email", "Vui lòng nhập \"Email\"");
            result = false;
        } else {
            if (!email.matches(emailPattern)) {
                hashMap.put("email", "Email không hợp lệ");
                result = false;
            }
        }
        // Check required Tên
        if ("".equals(fullName) || fullName == null) {
            hashMap.put("fullName", "Vui lòng nhập \"Tên của bạn\"");
            result = false;
        }
        // Check required Mật khẩu
        if ("".equals(password) || password == null) {
            hashMap.put("password", "Vui lòng nhập \"Mật khẩu\"");
            result = false;
        } else {
            if (password.length() <= 8) {
                hashMap.put("password", "Mật khẩu phải lớn hơn 8 ký tự");
                result = false;
            } else {
                if (!password.matches(passPattern)) {
                    hashMap.put("password", "Mật khẩu phải chứa 1 ký tự hoa, 1 ký tự thường, và 1 chữ số");
                    result = false;
                }
            }
        }
        // Check required nhập lại Mật khẩu
        if ("".equals(rePassword) || rePassword == null) {
            hashMap.put("rePassword", "Vui lòng nhập \" Xác nhận mật khẩu\"");
            result = false;
        } else {
            // Check nhập lại mật khẩu giống
            if (!rePassword.equals(password)) {
                hashMap.put("rePassword", "Mật khẩu nhập lại không khớp");
                result = false;
            }
        }
        // Gửi lại nội dung
        return result;
    }
}
