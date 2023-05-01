package com.shop.cdshop.JBeans;

import java.io.Serializable;
import java.util.ArrayList;

public class Cart implements Serializable {
    private Integer id;
    private ArrayList<Product> cart;

    //getters & setters
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public ArrayList<Product> getCart() {
        return cart;
    }
    public void setCart(ArrayList<Product> cart) {
        this.cart = cart;
    }
}
