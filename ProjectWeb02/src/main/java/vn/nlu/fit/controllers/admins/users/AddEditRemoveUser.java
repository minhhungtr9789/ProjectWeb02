package vn.nlu.fit.controllers.admins.users;

import vn.nlu.fit.models.User;
import vn.nlu.fit.utils.DBUtils;
import vn.nlu.fit.utils.User_DAO;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/addEditRemoveUser")
public class AddEditRemoveUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String funtion = request.getParameter("a");
        User_DAO ud = new User_DAO();
        if (funtion == null) {
            int id = Integer.parseInt(request.getParameter("id"));
            ud.removeUser(id);
        } else {
            if (funtion.equalsIgnoreCase("add")) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                String full = request.getParameter("full");
                User u = new User(name, pass, email, full, "", 1, "");
                ud.addUser(u);
            }
            if (funtion.equalsIgnoreCase("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                String phone = request.getParameter("phone");
                String full = request.getParameter("full");
                int level = Integer.parseInt(request.getParameter("level"));
                String address = request.getParameter("address");
                User u = new User(id, name, pass, email, full, address, level, phone);
                ud.editUser(u);
            }
        }
        response.sendRedirect("user/list");
    }
}
