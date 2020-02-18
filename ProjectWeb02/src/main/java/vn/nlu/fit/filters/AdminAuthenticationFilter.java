package vn.nlu.fit.filters;

import org.apache.catalina.Session;
import vn.nlu.fit.models.User;
import vn.nlu.fit.utils.Util;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/admfin/*")
public class AdminAuthenticationFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        System.out.println("enter to admin filter");
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpRequestResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession();
        User user = (User) session.getAttribute("user");

        // Nếu người dùng chưa đăng nhập,
        // Redirect (chuyển hướng) tới trang đăng nhập.
        if (user == null) {

//            String requestUri = request.getRequestURI();

            // Lưu trữ trang hiện tại để redirect đến sau khi đăng nhập thành công.
//            int redirectId = AppUtils.storeRedirectAfterLoginUrl(request.getSession(), requestUri);

//            response.sendRedirect(wrapRequest.getContextPath() + "/login?redirectId=" + redirectId);
            return;
        }
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
