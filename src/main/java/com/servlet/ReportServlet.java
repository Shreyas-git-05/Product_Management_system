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
 * ReportServlet.java
 * Servlet implementation class ReportServlet
 * Handles requests for generating various product reports based on user-selected criteria.
 * It retrieves the report type and parameters, uses ProductDAO to fetch data,
 * and forwards the results to report_result.jsp.
 */
@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        List<Product> reportProducts = null;
        String reportTitle = "";

        if ("priceGreaterThan".equals(reportType)) {
            try {
                double priceThreshold = Double.parseDouble(request.getParameter("priceThreshold"));
                reportProducts = productDAO.getProductsByPriceGreaterThan(priceThreshold);
                reportTitle = "Products with Price Greater Than $" + String.format("%.2f", priceThreshold);
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid price threshold format.");
            }
        } else if ("byCategory".equals(reportType)) {
            String category = request.getParameter("category");
            reportProducts = productDAO.getProductsByCategory(category);
            reportTitle = "Products in Category: " + category;
        } else if ("topNByQuantity".equals(reportType)) {
            try {
                int limit = Integer.parseInt(request.getParameter("limit"));
                reportProducts = productDAO.getTopNProductsByQuantity(limit);
                reportTitle = "Top " + limit + " Products by Quantity";
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid limit format for Top N products.");
            }
        } else {
            request.setAttribute("message", "Invalid report type selected.");
        }

        request.setAttribute("reportProducts", reportProducts);
        request.setAttribute("reportTitle", reportTitle);
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}
