package controller;

import model.Product;
import repository.IProductRepository;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/Product")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IProductService iProductService = new ProductService();
        List<Product> productList = iProductService.getAll();
        int id;
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("/create.jsp").forward(request, response);
                break;
            case "edit":

                id = Integer.parseInt(request.getParameter("id"));
                for (int i = 0; i < productList.size(); i++) {
                    if (id == productList.get(i).getId()) {
                        request.setAttribute("id", productList.get(i).getId());
                        request.setAttribute("name", productList.get(i).getName());
                        request.setAttribute("price", productList.get(i).getPrice());
                        request.setAttribute("description", productList.get(i).getDescription());
                        request.setAttribute("brand", productList.get(i).getBrand());
                        request.getRequestDispatcher("/edit.jsp").forward(request, response);
                        break;
                    }
                }
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                iProductService.deleteProduct(id);
                response.sendRedirect("/Product");
                break;
            default: {

                request.setAttribute("productList", productList);
                request.getRequestDispatcher("/product.jsp").forward(request, response);
            }

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IProductService iProductService = new ProductService();
        List<Product> productList = iProductService.getAll();

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response, iProductService);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                float price = Float.parseFloat(request.getParameter("price"));
                String description = request.getParameter("description");
                String brand = request.getParameter("brand");
                Product product = new Product(id, name, price, description, brand);
                iProductService.editProduct(product);
                response.sendRedirect("/Product");

                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                iProductService.deleteProduct(id);
                response.sendRedirect("/Product");
                break;
            default: {

                request.setAttribute("productList", productList);
                request.getRequestDispatcher("/product.jsp").forward(request, response);
            }

        }


    }

    private static void createProduct(HttpServletRequest request, HttpServletResponse response, IProductService iProductService) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        String description = request.getParameter("description");
        String brand = request.getParameter("brand");
        Product product = new Product(id, name, price, description, brand);
        iProductService.saveProduct(product);
        response.sendRedirect("/Product");
    }
}
