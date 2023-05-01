package com.shop.cdshop.JBeans;

import java.io.Serializable;

public class Product implements Serializable {
    private Integer id;
    private String name;
    private Float price;

    //getters & setters
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public Float getPrice() {
        return price;
    }
    public void setPrice(Float price) {
        this.price = price;
    }
}
