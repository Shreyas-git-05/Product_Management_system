package com.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProductDAO;
import com.model.Product;

/**
 * DisplayProductsServlet.java
 * Servlet implementation class DisplayProductsServlet
 * Handles requests to display all products in the inventory.
 * It retrieves all products using ProductDAO and forwards them to productdisplay.jsp.
 */
@WebServlet("/DisplayProductsServlet")
public class DisplayProductsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = productDAO.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("productdisplay.jsp").forward(request, response);
    }
}
