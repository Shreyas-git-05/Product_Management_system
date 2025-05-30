package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ReportCriteriaServlet.java
 * Servlet implementation class ReportCriteriaServlet
 * This servlet simply forwards the request to report_form.jsp,
 * which presents the user with options to select different report types
 * and their respective criteria.
 */
@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Just forward to the JSP that presents the report form
        request.getRequestDispatcher("report_form.jsp").forward(request, response);
    }
}
