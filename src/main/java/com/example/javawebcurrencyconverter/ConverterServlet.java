package com.example.javawebcurrencyconverter;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@WebServlet(name = "ConverterServlet", urlPatterns = "/convert")
public class ConverterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float rate = Float.parseFloat(req.getParameter("rate"));
        float usd = Float.parseFloat(req.getParameter("usd"));
        float vnđ = rate * usd;
        PrintWriter w= resp.getWriter();
        w.println("<html>");
        w.println("<h1>Rate: " + rate + "</h1>");
        w.println("<h1>USD: " + usd + "</h1>");
        w.println("<h1>VND: "+ vnđ + "</h1>");
        w.println("</html>");

    }
}