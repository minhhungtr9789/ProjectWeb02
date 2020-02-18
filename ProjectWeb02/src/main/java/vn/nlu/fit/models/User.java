package vn.nlu.fit.models;

import java.sql.SQLException;


    public class User {
        private int id;
        private String username;
        private String password;
        private String gender;
        private String email;
        private String fullname;
        private String address;
        private int level;
        private String phone;
        private Cart cart;

        public User() {
            cart = new Cart();
        }

        public User(int id, String username, String password, String email, String fullname) {
            super();
            this.id = id;
            this.username = username;
            this.password = password;
            this.email = email;
            this.fullname = fullname;

            cart = new Cart();
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public Cart getCart() {
            return cart;
        }

        public void setCart(Cart cart) {
            this.cart = cart;
        }

        public int getId() {
            return id;
        }

        public String getUsername() {
            return username;
        }

        public String getPassword() {
            return password;
        }

        public String getGender() {
            return gender;
        }

        public String getEmail() {
            return email;
        }

        public String getFullname() {
            return fullname;
        }

        public void setId(int id) {
            this.id = id;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public void setGender(String gender) {
            this.gender = gender;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public void setFullname(String fullname) {
            this.fullname = fullname;
        }

        public void updateCart() throws SQLException, ClassNotFoundException {
            cart.updateCart(this);
        }


        public int getLevel() {
            return level;
        }

        public void setLevel(int level) {
            this.level = level;
        }

        public User(int id, String username, String password, String email, String fullname, String address, int level, String phone) {
            this.id = id;
            this.username = username;
            this.password = password;
            this.email = email;
            this.fullname = fullname;
            this.address = address;
            this.level = level;
            this.phone = phone;
//        this.cart = cart;
        }

        public User(String username, String password, String email, String fullname, String address, int level, String phone) {
            this.username = username;
            this.password = password;
            this.email = email;
            this.fullname = fullname;
            this.address = address;
            this.level = level;
            this.phone = phone;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }
    }