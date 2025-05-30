package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProductDAO;

/**
 * DeleteProductServlet.java
 * Servlet implementation class DeleteProductServlet
 * Handles requests to delete a product from the inventory.
 * It retrieves the product ID from the form and uses ProductDAO to remove it from the database.
 */
@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));

        boolean success = productDAO.deleteProduct(productID);

        if (success) {
            request.setAttribute("message", "Product deleted successfully!");
        } else {
            request.setAttribute("message", "Failed to delete product. Product ID might not exist.");
        }
        // Forward to a confirmation page or back to the delete product form with a message
        request.getRequestDispatcher("productdelete.jsp").forward(request, response);
    }
}
