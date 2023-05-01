package com.shop.cdshop.Controller;

import com.shop.cdshop.DB.DatabaseFacade;
import com.shop.cdshop.JBeans.Cart;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Controller", value = "/Controller")
public class Controller extends HttpServlet {
    static Cart cart;
    HttpSession session;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        if(page == null || page.equals("index")) {

            try {
                DatabaseFacade databaseFacade = new DatabaseFacade();
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            session = request.getSession(true);
            session.setAttribute("cart", cart);

            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else {
            doPost(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        if (page.equals("CD-selection")) {

            System.out.println("funciona");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
    }
}
