package uef.edu.vn.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Set;

public class AdminFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String role = String.valueOf(httpRequest.getSession().getAttribute("currentRole")).toUpperCase();
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

        if (!allowedRoles(path).contains(role)) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/error/403");
            return;
        }

        chain.doFilter(request, response);
    }

    private Set<String> allowedRoles(String path) {
        if (path.startsWith("/admin")) {
            return Set.of("ADMIN");
        }
        if (path.startsWith("/librarian")) {
            return Set.of("ADMIN", "LIBRARIAN");
        }
        if (path.startsWith("/reader")) {
            return Set.of("READER");
        }
        return Set.of("ADMIN", "LIBRARIAN", "READER");
    }
}
