package vn.nlu.fit.models;

import vn.nlu.fit.utils.DBUtils;

import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;

public class Cart {
    private int cartId;
    private HashMap<String, CartItem> data;
    private int statusAll;

    public int getStatusAll() {
        return statusAll;
    }

    public void setStatusAll(int statusAll) {
        this.statusAll = statusAll;
    }

    public Cart() {
        data = new HashMap<>();
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    //    add CartItem
    public void addCartItem(Product p) throws SQLException, ClassNotFoundException {
//        System.out.println("id sp mun' them: " + p.getId());
        CartItem cartItem = this.findProductOItem(p);

        // check CartItem exist?
        // check quantity of project?
        if (data.containsKey(cartItem.getProduct().getCode())) {
            cartItem.qOCartItemUp();
            // update số lượng trong database
            DBUtils.updateCart(this.getCartId(), p.getId(), cartItem.getQuantity());
        } else {
            data.put(cartItem.getProduct().getCode(), cartItem);
            // thêm item mới vô database
//            System.out.println("this.getCartId(): " + this.getCartId() + ", p.getId() :" + p.getId());
            DBUtils.insertCartItem(this.getCartId(), p.getId(), cartItem.getQuantity(), 0);
        }
    }

    private CartItem findProductOItem(Product p) {
        for (CartItem i : data.values()) {
//            System.out.println(i.getProduct().getId());
            if (i.getProduct().getId() == p.getId()) return i;
        }
        return new CartItem(p, 1, 0);
    }


    //    remove CartItem
    public boolean removeCartItem(Product p) throws SQLException, ClassNotFoundException {
        CartItem cartItem = this.findProductOItem(p);
        if (data.containsKey(cartItem.getProduct().getCode())) {
            data.remove(cartItem.getProduct().getCode());
            // remove item trong database
            DBUtils.deleteItemOCart(this.getCartId(), p.getId());
            return true;
        } else return false;
    }

    //    //  total of price
//    public double totalPrice() {
//        double sum = 0;
//        for (CartItem p : data.values()) {
//            sum += (p.getQuantityOCart() * p.getPromotionPrice());
//        }
//        return sum;
//    }
//
    //  total of items
    public int totalItems() {
        int sum = 0;
        for (CartItem i : data.values()) {
            sum += i.getQuantity();
        }
        return sum;
    }

    //  total of items checkout
    public int totalItemsCheckout() {
        int sum = 0;
        for (CartItem i : data.values()) {
            if (i.getStatus() == 1) sum += i.getQuantity();
        }
        return sum;
    }

    //  total of price of items checkout
    public int totalPriceItemsCheckout() {
        int sum = 0;
        for (CartItem i : data.values()) {
            if (i.getStatus() == 1) sum += (i.getProduct().getPromotionPrice() * i.getQuantity());
        }
        return sum;
    }

    public HashMap<String, CartItem> getData() {
        return data;
    }

    public Collection<CartItem> list() {
        return data.values();
    }

    public void quantity_Up(String code) throws SQLException, ClassNotFoundException {
        CartItem cartItem = data.get(code);
        cartItem.qOCartItemUp();
        Product p = cartItem.getProduct();
        // update quantity to database
        DBUtils.updateQuantityItem(this.getCartId(), p.getId(), cartItem.getQuantity());
    }

    public void quantity_Down(String code) throws SQLException, ClassNotFoundException {
        CartItem cartItem = data.get(code);
        cartItem.qOCartItemDown();
        Product p = cartItem.getProduct();
        // update quantity to database
        DBUtils.updateQuantityItem(this.getCartId(), p.getId(), cartItem.getQuantity());
    }

    public void doGet_enter_Quantity(String code, int quantity) throws SQLException, ClassNotFoundException {
        data.get(code).enter_Quantity(quantity);

        CartItem cartItem = data.get(code);
        Product p = cartItem.getProduct();
        // update quantity to database
        DBUtils.updateQuantityItem(this.getCartId(), p.getId(), cartItem.getQuantity());
    }

    public void updateCart(User user) throws SQLException, ClassNotFoundException {
        for (CartItem i : data.values()) {
            //Nếu số lượng của cart < 1
            if (i.getQuantity() < 1) {
                // set lại quantity
                i.setQuantity(1);
                DBUtils.updateCart(user.getCart().getCartId(), i.getProduct().getId(), i.getQuantity());
            }
            // Nếu số lượng trong giỏ lớn hơn số lượng trong kho
            if (i.getQuantity() > i.getProduct().getQuantity()) {
                // set lại quantity
                i.setQuantity(i.getProduct().getQuantity());
                // update xuống databse
                DBUtils.updateCart(user.getCart().getCartId(), i.getProduct().getId(), i.getProduct().getQuantity());
            }
            // Nếu số lượng trong kho = 0
            if (i.getProduct().getQuantity() == 0) {
                // xóa item ra khỏi cart
                data.remove(i.getProduct().getCode());
                // xóa dưới databse
                DBUtils.deleteItemOCart(user.getCart().getCartId(), i.getProduct().getId());
            }
            // Nếu product tạm ngưng bán
            if (i.getProduct().getStatus() == 0) {
                // xóa item ra khỏi cart
                data.remove(i.getProduct().getCode());
                // xóa dưới databse
                DBUtils.deleteItemOCart(user.getCart().getCartId(), i.getProduct().getId());
            }
        }
    }

    public CartItem findCartItem(int id) {
        for (CartItem i : data.values()) {
            if (i.getProduct().getId() == id)
                return i;
        }
        return null;
    }

    public void changeStatusOCartItem(User user, int id) throws SQLException, ClassNotFoundException {
        if (id == -1) {
            boolean temp = true;
            for (CartItem i : data.values()) {
                if (i.getStatus() == 0) temp = false;
            }
//            System.out.println(temp);
            if (temp == true) user.getCart().setStatusAll(0);
            else user.getCart().setStatusAll(1);
            for (CartItem i : data.values()) {
                i.setStatus(getStatusAll());
//                System.out.println(i.getStatus());
            }
            // ghi xuống database
            DBUtils.updateCartItemStatus(user.getCart().getCartId(), -1, getStatusAll());
        } else {
            CartItem cartItem = findCartItem(id);
            if (cartItem != null) {
                cartItem.changeStatusOCartItem();
                // ghi xuống database
                DBUtils.updateCartItemStatus(user.getCart().getCartId(), cartItem.getProduct().getId(), cartItem.getStatus());
            }
        }
    }
}
