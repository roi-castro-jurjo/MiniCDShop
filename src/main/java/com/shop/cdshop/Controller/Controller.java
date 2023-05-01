package com.shop.cdshop.Controller;

import com.shop.cdshop.DB.DatabaseFacade;
import com.shop.cdshop.JBeans.Cart;
import com.shop.cdshop.JBeans.Product;
import com.shop.cdshop.JBeans.User;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.StringTokenizer;

@WebServlet(name = "Controller", value = "/Controller")
public class Controller extends HttpServlet {
    static Cart cart = new Cart();
    HttpSession session;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        if(page == null || page.equals("index")) {

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

        if (session == null) {
            session = request.getSession(true);
            cart.setCart(new ArrayList<Product>());
            session.setAttribute("cart", cart);
        }
        if(page.equals("index")) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (page.equals("CD-selection")) {
            Product product = new Product();

            StringTokenizer t = new StringTokenizer(request.getParameter( "title" ),"|");
            product.setName(t.nextToken().trim());
            product.setAuthor(t.nextToken().trim());
            product.setCountry(t.nextToken().trim());
            product.setPrice(Float.parseFloat(t.nextToken().replace('$',' ').trim()));

            cart = (Cart) session.getAttribute("cart");
            ArrayList<Product> thisCart = cart.getCart();
            thisCart.add(product);
            cart.setCart(thisCart);
            session.setAttribute("cart", cart);

            System.out.println(cart.toString());

            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else if(page.equals("removeItem")) {
            cart = (Cart) session.getAttribute("cart");
            ArrayList<Product> thisCart = cart.getCart();
            for (Product product : thisCart) {
                if (product.getName().equals(request.getParameter("name"))){
                    thisCart.remove(product);
                    break;
                }
            }
            cart.setCart(thisCart);
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else if(page.equals("checkout")) {
            if (session.getAttribute("username") == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
        } else if (page.equals("login-credentials")) {
            User user = new User();
            user.setName(request.getParameter("username"));
            user.setPassword(request.getParameter("password"));

            // AQUI VALIDAR USUARIO CON EL DAO

            session.setAttribute("username", user.getName());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
