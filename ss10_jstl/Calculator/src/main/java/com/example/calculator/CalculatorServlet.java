package com.example.calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float a = Float.parseFloat(request.getParameter("first"));
        float b = Float.parseFloat(request.getParameter("second"));
        String c = request.getParameter("operator");
        float result = 0;
        Calculate calculate = new Calculate();
        switch (c.charAt(0)) {
            case '+':
                result = calculate.addition(a,b);
                break;
            case '-':
                result = calculate.subtraction(a,b);
                break;
            case 'x':
                result =  calculate.times(a,b);
                break;
            case '/':
                result =  calculate.division(a,b);
                break;
        }
        request.setAttribute("result",result);
        request.setAttribute("a",a);
        request.setAttribute("b",b);
        request.setAttribute("c",c);
        request.getRequestDispatcher("/index.jsp").forward(request,response);


    }
}
