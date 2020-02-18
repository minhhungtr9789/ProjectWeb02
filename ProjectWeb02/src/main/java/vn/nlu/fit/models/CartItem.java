package vn.nlu.fit.models;

public class CartItem {
    private Product product;
    private int quantity;
    private int status;

    public CartItem() {
    }

    public CartItem(Product product, int quantity, int status) {
        this.product = product;
        this.quantity = quantity;
        this.status = status;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Product getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getStatus() {
        return status;
    }

    public void qOCartItemUp() {
        if (quantity < product.getQuantity()) {
            this.quantity++;
        }
    }

    public void qOCartItemDown() {
        if (quantity > 1) {
            this.quantity--;
        }
    }

    public void changeStatusOCartItem() {
        if (status == 0) status = 1;
        else status = 0;
    }

    public void enter_Quantity(int quantity) {
        if (quantity < 1) {
            this.quantity = 1;
        }

        if (quantity > product.getQuantity()) {
            this.quantity = product.getQuantity();
        }
        this.quantity = quantity;
    }


//    public static void main(String[] args) {
//        String st = "SSTA2019-IPDW322018-";
//        st.substring(0,st.length()-2);
//        System.out.println(st.substring(0,st.length()-1));
//    }
}
