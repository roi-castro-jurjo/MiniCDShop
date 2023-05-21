package com.shop.cdshop.Controller;

import com.shop.cdshop.model.DB.Database;
import com.shop.cdshop.model.DB.OrderDAO;
import com.shop.cdshop.model.DB.ProductDAO;
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

@WebServlet(name = "Controller", value = "/Controller")
public class Controller extends HttpServlet {
    static Cart cart = new Cart();
    static HashMap<Product, Integer> products;
    HttpSession session;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (session == null) {
            session = request.getSession(true);
            cart.setCart(new HashMap<>());
            session.setAttribute("cart", cart);
            products = new HashMap<>();
        }

        if(request.getParameter("showProducts") != null && request.getParameter("showProducts").equals("true")){
            try {
                Database database = new Database();
                ProductDAO productDAO = new ProductDAO(database.getConnection());
                HashMap<Product, Integer> allProducts = productDAO.getAllProducts();
                session = request.getSession(true);
                session.setAttribute("products", allProducts);
                products = allProducts;
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }

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
            products = new HashMap<>();
        }
        if(page.equals("index")) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (page.equals("CD-selection")) {
            int isProductInHashMap = 0;
            Product product = new Product();

            try {
                Database database = new Database();
                ProductDAO productDAO = new ProductDAO(database.getConnection());
                product = productDAO.fetchProduct(request.getParameter("name"));
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }


            cart = (Cart) session.getAttribute("cart");
            HashMap<Product,Integer> thisCart = cart.getCart();

            int quantity = Integer.parseInt(request.getParameter("quantity"));

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
                    request.setAttribute("badLogin", "Invalid Crediantials.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
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
                userDAO.signUp(user);
                database.closeConnection();
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            session.setAttribute("username", user.getName());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (page.equals("cart")){
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else if (page.equals("decreaseQuantityIndex")){
           products = (HashMap<Product, Integer>) session.getAttribute("products");
            for (Product product : products.keySet()) {
                if (product.getName().equals(request.getParameter("name"))){
                    if (products.get(product) > 1) {
                        products.put(product, products.get(product) - 1);
                    }
                    break;
                }
            }
            session.setAttribute("products", products);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (page.equals("increaseQuantityIndex")){
            products = (HashMap<Product, Integer>) session.getAttribute("products");

            for (Product product : products.keySet()) {
                if (product.getName().equals(request.getParameter("name"))){
                    products.put(product, products.get(product) + 1);
                    break;
                }
            }
            session.setAttribute("products", products);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (page.equals("proccess-order")) {
            cart = (Cart) session.getAttribute("cart");
            try {
                Database database = new Database();
                OrderDAO orderDAO = new OrderDAO(database.getConnection());
                orderDAO.saveOrder(cart, (String) session.getAttribute("username"));
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            request.getRequestDispatcher("resume.jsp").forward(request, response);
        } else if (page.equals("resume")) {
            cart = new Cart();
            cart.setCart(new HashMap<>());
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (page.equals("cart-resume")){
            cart = new Cart();
            cart.setCart(new HashMap<>());
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
    }
}
