package vn.nlu.fit.models;

public class OrderItem {
    private int  id;
    private int quantity;
    private double price;
    private int statusdelivery;



    public OrderItem() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStatusdelivery() {
        return statusdelivery;
    }

    public void setStatusdelivery(int statusdelivery) {
        this.statusdelivery = statusdelivery;
    }

    @Override
    public String toString() {
        return id+" "+ quantity+" "+price+" "+statusdelivery;
    }
    public double cost(){
        return quantity*price;
    }
}
