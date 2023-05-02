package com.shop.cdshop.Controller;

import com.shop.cdshop.model.DB.Database;
import com.shop.cdshop.model.DB.UserDAO;
import com.shop.cdshop.model.JBeans.Cart;
import com.shop.cdshop.model.JBeans.Product;
import com.shop.cdshop.model.JBeans.User;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
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
            cart.setCart(new HashMap<>());
            session.setAttribute("cart", cart);
        }
        if(page.equals("index")) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (page.equals("CD-selection")) {
            int isProductInHashMap = 0;
            Product product = new Product();

            StringTokenizer t = new StringTokenizer(request.getParameter( "title" ),"|");
            product.setName(t.nextToken().trim());
            product.setAuthor(t.nextToken().trim());
            product.setCountry(t.nextToken().trim());
            product.setPrice(Float.parseFloat(t.nextToken().replace('$',' ').trim()));

            cart = (Cart) session.getAttribute("cart");
            HashMap<Product,Integer> thisCart = cart.getCart();

            int quantity = Integer.parseInt(request.getParameter("cantidad"));

            for (Product productAux : thisCart.keySet()) {
                if (productAux.getName().equals(product.getName())){
                    isProductInHashMap = 1;
                    thisCart.put(productAux, thisCart.get(productAux) + quantity);
                    break;
                }
            }

            if (isProductInHashMap == 0){
                thisCart.put(product, quantity);
            }

            cart.setCart(thisCart);
            session.setAttribute("cart", cart);

            System.out.println(cart.toString());

            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else if(page.equals("removeItem")) {
            cart = (Cart) session.getAttribute("cart");
            HashMap<Product, Integer> thisCart = cart.getCart();

            for (Product product : thisCart.keySet()) {
                if (product.getName().equals(request.getParameter("name"))) {
                    thisCart.remove(product);
                    break;
                }
            }
            cart.setCart(thisCart);
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else if (page.equals("decreaseQuantity")) {
            cart = (Cart) session.getAttribute("cart");
            HashMap<Product, Integer> thisCart = cart.getCart();

            for (Product product : thisCart.keySet()) {
                if (product.getName().equals(request.getParameter("name"))){
                    if (thisCart.get(product) > 1) {
                        thisCart.put(product, thisCart.get(product) - 1);
                    }
                    break;
                }
            }

            cart.setCart(thisCart);
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else if (page.equals("increaseQuantity")) {
            cart = (Cart) session.getAttribute("cart");
            HashMap<Product, Integer> thisCart = cart.getCart();

            for (Product product : thisCart.keySet()) {
                if (product.getName().equals(request.getParameter("name"))){
                    thisCart.put(product, thisCart.get(product) + 1);
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
        } else if (page.equals("login")) {
            if (session.getAttribute("username") == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else if (page.equals("login-credentials")) {
            User user = new User();
            user.setEmail(request.getParameter("email"));
            user.setPassword(request.getParameter("password"));

            try {
                Database database = new Database();
                UserDAO userDAO = new UserDAO(database.getConnection());
                if (userDAO.login(user)) {
                    session.setAttribute("username", userDAO.fetchUser(user.getEmail()));
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.setAttribute("msg", "Invalid Crediantials");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }
                database.closeConnection();
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        } else if (page.equals("signup")) {
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if (page.equals("signup-credentials")) {
            User user = new User();
            user.setName(request.getParameter("username"));
            user.setPassword(request.getParameter("password"));
            user.setEmail(request.getParameter("email"));
            user.setCardType(request.getParameter("cardType"));
            user.setCardNumber(Long.parseLong(request.getParameter("cardNumber")));

            try {
                Database database = new Database();
                UserDAO userDAO = new UserDAO(database.getConnection());
                userDAO.signup(user);
                database.closeConnection();
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            session.setAttribute("username", user.getName());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
