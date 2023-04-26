package com.example.product_discount_calculator;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("HEllo world");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String des = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        int discountPercent = Integer.parseInt(request.getParameter("discount"));
        double discountAmount = price*discountPercent*0.01;
        double discountPrice = price - discountAmount;

        request.setAttribute("des",des);
        request.setAttribute("price",price);
        request.setAttribute("discountPercent",discountPercent);
        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("discountPrice",discountPrice);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        requestDispatcher.forward(request,response);
    }
}
