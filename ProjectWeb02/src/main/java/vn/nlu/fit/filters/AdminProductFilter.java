package vn.nlu.fit.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebFilter("/admin/producdt/*")
public class AdminProductFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        System.out.println("enter to product filter");
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String servletPath = httpRequest.getServletPath();

        if (!servletProducts(servletPath)) {
            System.out.println("do something...");
            request.getRequestDispatcher("/admin/product/list").forward(request, response);
        } else chain.doFilter(request, response);
    }
    private boolean servletProducts(String servletPath) {
        ArrayList<String> servlets = new ArrayList<>();
        servlets.add("product/list");
        servlets.add("product/new");
        servlets.add("product/edit");
        servlets.add("product/changeStatusProduct");
        servlets.add("product/create-edit");
        servlets.add("product/delete");
        for (String item : servlets) {
            if (servletPath.endsWith(item)) return true;
        }
        return false;
    }

    public void init(FilterConfig config) throws ServletException {
    }

}
