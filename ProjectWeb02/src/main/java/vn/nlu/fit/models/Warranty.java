package vn.nlu.fit.models;

public class Warranty {
    private int id;
    private int month;

    public Warranty(int id, int month) {
        this.id = id;
        this.month = month;
    }

    public Warranty() {
    }

    public int getId() {
        return id;
    }

    public int getMonth() {
        return month;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setMonth(int month) {
        this.month = month;
    }
}
