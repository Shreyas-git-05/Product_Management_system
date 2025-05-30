package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProductDAO;
import com.model.Product;

/**
 * UpdateProductServlet.java
 * Servlet implementation class UpdateProductServlet
 * Handles requests to update an existing product's details.
 * It retrieves product ID and new details from the form,
 * creates/updates a Product object, and uses ProductDAO to update it in the database.
 */
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product productToUpdate = new Product(productID, productName, category, price, quantity);

        boolean success = productDAO.updateProduct(productToUpdate);

        if (success) {
            request.setAttribute("message", "Product updated successfully!");
        } else {
            request.setAttribute("message", "Failed to update product. Product ID might not exist.");
        }
        // Forward to a confirmation page or back to the update product form with a message
        request.getRequestDispatcher("productupdate.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This doGet can be used to pre-fill the update form if a product ID is passed
        try {
            int productID = Integer.parseInt(request.getParameter("productID"));
            Product product = productDAO.getProductById(productID);
            if (product != null) {
                request.setAttribute("product", product);
            } else {
                request.setAttribute("message", "Product not found for ID: " + productID);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid Product ID format.");
        }
        request.getRequestDispatcher("productupdate.jsp").forward(request, response);
    }
}
