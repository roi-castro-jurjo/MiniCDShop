package com.shop.cdshop.model.JBeans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

public class Cart implements Serializable {
    private Integer id;
    HashMap<Product,Integer> cart;

    //getters & setters
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public HashMap<Product,Integer> getCart() {
        return cart;
    }
    public void setCart(HashMap<Product,Integer> cart) {
        this.cart = cart;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", cart=" + cart +
                "}\n\n";
    }
}
