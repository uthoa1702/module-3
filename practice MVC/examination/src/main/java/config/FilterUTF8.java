package config;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "FilterUTF8", value = "/*")
public class FilterUTF8 implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        HttpServletRequest req = (HttpServletRequest) request;
////        Lấy đường dẫn truy cập để phân quyền truy ccaapj
//        String uri = ((HttpServletRequest) request).getRequestURI();
//        HttpServletResponse resp = (HttpServletResponse) response;
//        HttpSession session = req.getSession();
//        if (uri.equals("/")
//                //        nếu chưa đăng nhập thì về trang index.jsp(trang chủ)
//                ||uri.equals("/login.jsp")
//                ||uri.equals("/sign.jsp")
////            ||uri.equals("/customer")
//            ||uri.equals("/index.jsp")
//
//             |session.getAttribute("user")!=null){
//            chain.doFilter(request, response);
//        }else {
//            req.getRequestDispatcher("/login").forward(req,resp);
//        }
        request.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }
}
