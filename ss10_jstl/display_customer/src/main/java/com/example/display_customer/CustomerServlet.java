package com.example.display_customer;

import jdk.nashorn.internal.ir.RuntimeNode;
import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://lavenderstudio.com.vn/wp-content/uploads/2019/10/gia-chup-hinh-chan-dung-ca-nhan-tp-hcm-01.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://vnreview.vn/image/12/29/122965.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://camerabox.vn/uploads/news/2018_06/den-gan-chu-the.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-27", "Hà Tây", "https://bluemotionmedia.vn/wp-content/uploads/2020/11/mach-ban-dia-chi-chup-anh-chan-dung-ceo-chuyen-nghiep-o-hue_5fc4f6067839e.jpeg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://www.acfc.com.vn/acfc_wp/wp-content/uploads/2021/07/cach-chup-anh-chan-dung-nam-3.jpeg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("/customerList.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
