package vn.nlu.fit.models;

import java.util.ArrayList;
import java.util.List;

public class Order {
    private int id;
    private String datecreate;
    private String user;
    private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    private List<OrderItem> listItem = new ArrayList<>();


    public Order(int id, String datecreate) {
        this.id = id;
        this.datecreate = datecreate;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDatecreate() {
        return datecreate;
    }

    public void setDatecreate(String datecreate) {
        this.datecreate = datecreate;
    }

    public List<OrderItem> getListItem() {
        return listItem;
    }

    public void setListItem(ArrayList<OrderItem> listItem) {
        this.listItem = listItem;
    }
    public void addOrderItem(OrderItem i){
        getListItem().add(i);
    }
    public double totalCost(){
        double d=0.0;
        for(OrderItem o:listItem){
            d+=o.cost();
        }
        return d;
    }
    public int sumQuantity(){
        int s=0;
        for(OrderItem o:listItem){
            s+=o.getQuantity();
        }
        return s;
    }
}
