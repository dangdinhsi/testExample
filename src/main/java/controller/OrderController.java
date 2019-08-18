package controller;

import entity.Customer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class OrderController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        String customerName = req.getParameter("customerName");
        String address =req.getParameter("address");
        String phone = req.getParameter("phone");
        String total = req.getParameter("total");
        Customer customer = new Customer();
        customer.setName(customerName);
        customer.setAddress(address);
        customer.setPhone(phone);
        double _total= Double.parseDouble(total);
        customer.setTotal(_total);
        req.setAttribute("customer",customer);
        session.invalidate();
        req.getRequestDispatcher("/detail.jsp").forward(req,resp);
    }
}
