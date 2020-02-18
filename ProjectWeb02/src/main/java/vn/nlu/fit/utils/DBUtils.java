package vn.nlu.fit.utils;

import vn.nlu.fit.connections.MySQLConnUtils;
import vn.nlu.fit.models.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class DBUtils {
    private static int quantityPerPage = 20;

    public static void addUser(User userName) throws SQLException {

        Connection con = MySQLConnUtils.getMySQLConnection();
        String sql = "INSERT INTO `user` ( `user`.Username, `user`.Email, `user`.FullName, `user`.`Password` )\n" +
                "VALUES\n" +
                "\t(?,?,?,?)";
        PreparedStatement pr = con.prepareStatement(sql);
        pr.setString(1, userName.getUsername());
        pr.setString(2, userName.getEmail());
        pr.setString(3, userName.getFullname());
        pr.setString(4, userName.getPassword());
        pr.executeUpdate();
    }

    public static boolean checkUserName(String userName) throws SQLException {
        Connection con = MySQLConnUtils.getMySQLConnection();
        String sql = "SELECT * FROM `user` WHERE  `user`.Username=?";
        PreparedStatement pr = con.prepareStatement(sql);
        pr.setString(1, userName);
        ResultSet rs = pr.executeQuery();
        return rs.next();
    }

    public static User findUser(int id) {
        try {
            User u = new User();
            Connection con = MySQLConnUtils.getMySQLConnection();
            String sql = "SELECT id,Username,Email,FullName,PhoneNumber,level,Address FROM `user` WHERE id=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, id);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                u.setId(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setFullname(rs.getString(4));
                u.setPhone(rs.getString(5));
                u.setLevel(rs.getInt(6));
                u.setAddress(rs.getString(7));

            }
            return u;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static int getMountAcc() {
        int i = 0;
        try {
            Connection con = MySQLConnUtils.getMySQLConnection();
            String sql = "SELECT * FROM `user`";
            PreparedStatement pr = con.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            rs.last();
            i = rs.getRow() + 4;


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public static int getRowAcc() {
        int i = 0;
        try {
            Connection con = MySQLConnUtils.getMySQLConnection();
            String sql = "SELECT * FROM `user` WHERE level=1 OR level=2";
            PreparedStatement pr = con.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            rs.last();
            i = rs.getRow();


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }


    public static List<Product> queryProduct(String sql) throws SQLException, ClassNotFoundException {

        Connection conn = MySQLConnUtils.getMySQLConnection();

        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = setProductData(rs);
            list.add(product);
        }
        return list;
    }


    public static List<Product> queryMobileList(int page) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();
        String sql = "SELECT * FROM product WHERE (CatalogId=1 OR CatalogId=5) AND `Status` = 1\n" +
                "ORDER BY `Top` ASC LIMIT ?," + quantityPerPage;
        PreparedStatement pr = conn.prepareStatement(sql);

        pr.setInt(1, (page - 1) * 20);
        ResultSet rs = pr.executeQuery();
        List<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = setProductData(rs);
            list.add(product);
        }
        return list;
    }

    public static int numberOfMobilePage() throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();
        String sql = "SELECT COUNT(`Id`) FROM product WHERE (CatalogId=1 OR CatalogId=5) AND `Status` = 1\n";
        PreparedStatement pr = conn.prepareStatement(sql);

        ResultSet rs = pr.executeQuery();
        rs.next();
        int total = rs.getInt(1);
        int numberOfPages;
        if (total % quantityPerPage == 0)
            numberOfPages = total / quantityPerPage;
        else
            numberOfPages = total / quantityPerPage + 1;
        return numberOfPages;
    }

    public static List<Product> queryProduct() throws SQLException, ClassNotFoundException {
        String sql = "SELECT* FROM product";
        Connection conn = MySQLConnUtils.getMySQLConnection();

        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
            Product product = setProductData(rs);
            list.add(product);
        }
        return list;
    }

    public static ArrayList<Catalog> queryCatalog() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM catalog";
        Connection conn = MySQLConnUtils.getMySQLConnection();

        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Catalog> list = new ArrayList<>();
        Catalog catalog;
        while (rs.next()) {
            int catalogId = rs.getInt("CatalogId");
            String name = rs.getString("Name");
            int parentId = rs.getInt("ParentId");

            catalog = new Catalog();
            catalog.setId(catalogId);
            catalog.setName(name);
            catalog.setParentId(parentId);
            list.add(catalog);
        }
        return list;
    }

    public static ArrayList<Brand> queryBrand() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM brand";
        Connection conn = MySQLConnUtils.getMySQLConnection();

        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Brand> list = new ArrayList<>();
        Brand brand;
        while (rs.next()) {
            int id = rs.getInt("Id");
            String name = rs.getString("Name");
            String img = rs.getString("Img");

            brand = new Brand();
            brand.setBrandId(id);
            brand.setBrandName(name);
            brand.setBrandImg(img);
            list.add(brand);
        }
        return list;
    }

    public static Product findProduct(String code, int status) throws SQLException, ClassNotFoundException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "SELECT * FROM product WHERE ProductCode=? and status=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, code);
        pstm.setInt(2, status);

        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            return setProductData(rs);
        }
        return null;
    }

    public static Product findProduct(String code) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "SELECT * FROM product WHERE ProductCode=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, code);

        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            return setProductData(rs);
        }
        return null;
    }

    public static boolean findCatalog(String code) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "SELECT * FROM catalog WHERE catalog.`Name`= ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, code);

        ResultSet rs = pstm.executeQuery();
        return rs.next() ? true : false;
    }

    public static Catalog findCatalog(int code) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "SELECT * FROM catalog WHERE catalog.`CatalogId`= ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, code);

        ResultSet rs = pstm.executeQuery();
        Catalog catalog;
        while (rs.next()) {
            int catalogId = rs.getInt("CatalogId");
            String name = rs.getString("Name");
            int parentId = rs.getInt("ParentId");

            catalog = new Catalog();
            catalog.setId(catalogId);
            catalog.setName(name);
            catalog.setParentId(parentId);
            return catalog;
        }
        return null;
    }

    public static void updateProduct(Product product, int id) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();
        String sql = "UPDATE product\n" +
                "SET \n" +
                "CatalogId=?,\n" +
                "ProductCode=?,\n" +
                "Name=?,\n" +
                "SettingInfo=?,\n" +
                "Description=?,\n" +
                "PromotionText=?,\n" +
                "Brand=?,\n" +
                "Price=?,\n" +
                "PromotionPrice=?,\n" +
                "ImageList=?,\n" +
                "Quantity=?,\n" +
                "Waranty=?,\n" +
                "DateCreated=?,\n" +
                "Status=?\n" +
                "WHERE product.Id=?";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setInt(1, product.getCatalog());
        pstm.setString(2, product.getCode());
        pstm.setString(3, product.getName());
        pstm.setString(4, product.getSettingInfo());
        pstm.setString(5, product.getDescription());
        pstm.setString(6, product.getPromotionText());
        pstm.setInt(7, product.getBrand());
        pstm.setDouble(8, product.getPrice());
        pstm.setDouble(9, product.getPromotionPrice());
        pstm.setString(10, Product.converImgListToDB(product.getListImg()));
        pstm.setInt(11, product.getQuantity());
        pstm.setInt(12, product.getWarranty());
        pstm.setTimestamp(13, new Timestamp(new Date().getTime()));
        pstm.setInt(14, 1);

        pstm.setInt(15, id);
        int row = pstm.executeUpdate();
//        System.out.println(row);
    }

    public static void updateCatalog(Catalog catalog, int catalogId) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "UPDATE catalog \n" +
                "SET \n" +
                "catalog.`Name`=?,\n" +
                "catalog.ParentId=?\n" +
                "WHERE catalog.CatalogId=?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        System.out.println(catalog.getParentId());
        if (catalog.getParentId() == 0) {
            pstm.setString(1, catalog.getName());
            pstm.setNull(2, Types.INTEGER);
            pstm.setInt(3, catalogId);
        } else {
            pstm.setString(1, catalog.getName());
            pstm.setInt(2, catalog.getParentId());
            pstm.setInt(3, catalogId);
        }


        int row = pstm.executeUpdate();
        System.out.println(row);
    }

    public static void insertProduct(Product product) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();
        String sql = "Insert into product(CatalogId,ProductCode,Name,\n" +
                "SettingInfo,Description,PromotionText,Brand,Price,\n" +
                "PromotionPrice,ImageList,Quantity,Waranty,DateCreated,Status) \n" +
                "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

//        values (1 ,'2,'3','4','5','6',1,200000,200000,'ab',9,-1,10/2/2017,1)
        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setInt(1, product.getCatalog());
        pstm.setString(2, product.getCode());
        pstm.setString(3, product.getName());
        pstm.setString(4, product.getSettingInfo());
        pstm.setString(5, product.getDescription());
        pstm.setString(6, product.getPromotionText());
        pstm.setInt(7, product.getBrand());
        pstm.setDouble(8, product.getPrice());
        pstm.setDouble(9, product.getPromotionPrice());
        pstm.setString(10, Product.converImgListToDB(product.getListImg()));
        pstm.setInt(11, product.getQuantity());
        pstm.setInt(12, product.getWarranty());
        pstm.setTimestamp(13, new Timestamp(new Date().getTime()));
        pstm.setInt(14, 1);

        int row = pstm.executeUpdate();
//        System.out.println(row);
    }

    public static void insertCatalog(Catalog c) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();
        String sql;
        PreparedStatement pstm;
        if (c.getParentId() == 0) {
            sql = "INSERT INTO catalog ( catalog.`Name`)\n" +
                    "VALUES (?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, c.getName());
        } else {
            sql = "INSERT INTO catalog ( catalog.`Name`, catalog.ParentId )\n" +
                    "VALUES (?,?)";

            pstm = conn.prepareStatement(sql);
            pstm.setString(1, c.getName());
            pstm.setInt(2, c.getParentId());
        }

        int row = pstm.executeUpdate();
        System.out.println("số row: " + row);
    }

    public static void deleteProduct(String code) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "Delete From product where product.ProductCode= ?";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1, code);

        int row = pstm.executeUpdate();

        // rows affected
//        System.out.println(row);
    }

    public static void deleteCatalog(String code) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "Delete From catalog where catalog.CatalogId= ?";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1, code);

        int row = pstm.executeUpdate();

        // rows affected
//        System.out.println(row);
    }

    public static void deleteBrand(String code) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "Delete From brand where brand.Id= ?";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1, code);

        int row = pstm.executeUpdate();

        // rows affected
//        System.out.println(row);
    }

    public static void findCart(User user) throws SQLException, ClassNotFoundException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "SELECT o.UserId, o.OrderId, p.*, i.ItemQuantity, i.`ItemStatus` \n" +
                "FROM order_item i\n" +
                "INNER JOIN `order` o ON i.OrderId = o.OrderId\n" +
                "INNER JOIN product p ON p.Id = i.ProductId \n" +
                "WHERE\n" +
                "o.UserId = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, user.getId());

        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            Product p = setProductData(rs);
            CartItem cartItem = new CartItem();
            cartItem.setProduct(p);
            int itemQuantity = rs.getInt("ItemQuantity");
            int itemStatus = rs.getInt("ItemStatus");
            cartItem.setQuantity(itemQuantity);
            cartItem.setStatus(itemStatus);

            // set cart kiếm được trong database cho user
            user.getCart().getData().put(p.getCode(), cartItem);
        }
//            user.getCart().setCartId(rs.getInt("OrderId"));
        user.getCart().setCartId(user.getId());
    }

    private static Product setProductData(ResultSet rs) throws SQLException {
        int productId = rs.getInt("Id");
        String productCode = rs.getString("ProductCode");
        String productName = rs.getString("Name");
        double productPrice = rs.getDouble("Price");
        double productPromotionPrice = rs.getDouble("PromotionPrice");
        String productListImg = rs.getString("ImageList");
        String productDescription = rs.getString("Description");
        String productSettingInfo = rs.getString("SettingInfo");
        int productQuantity = rs.getInt("Quantity");
        int warranty = rs.getInt("Waranty");
        int brand = rs.getInt("Brand");
        int catalog = rs.getInt("CatalogId");
        String productPromotionText = rs.getString("PromotionText");
        int productStatus = rs.getInt("Status");

        Product product = new Product();
        product.setId(productId);
        product.setCode(productCode);
        product.setName(productName);
        product.setPrice(productPrice);
        product.setPromotionPrice(productPromotionPrice);
        product.setListImg(Product.convertToArray(productListImg));
        product.setDescription(productDescription);
        product.setSettingInfo(productSettingInfo);
        product.setQuantity(productQuantity);
        product.setBrand(brand);
        product.setCatalog(catalog);
        product.setWarranty(warranty);
        product.setPromotionText(productPromotionText);
        product.setStatus(productStatus);
        return product;
    }

    public static void updateCart(int cartId, int productId, int quantity) throws SQLException, ClassNotFoundException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "UPDATE order_item SET ItemQuantity = ? WHERE OrderId=? AND ProductId = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, quantity);
        pstm.setInt(2, cartId);
        pstm.setInt(3, productId);

        int row = pstm.executeUpdate();

        // rows affected
//        System.out.println(row);
    }

    public static void insertCartItem(int cartId, int productId, int quantity, int status) throws SQLException, ClassNotFoundException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "INSERT INTO order_item (OrderId, ProductId, ItemQuantity, ItemStatus) VALUES (?, ?, ?, ? );";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, cartId);
        pstm.setInt(2, productId);
        pstm.setInt(3, quantity);
        pstm.setInt(4, status);

        int row = pstm.executeUpdate();

        // rows affected
//        System.out.println("Số sản phẩm được thêm vô: " + row);
    }

    public static void deleteItemOCart(int cartId, int productId) throws SQLException, ClassNotFoundException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "DELETE FROM order_item WHERE OrderId= ? AND ProductId = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, cartId);
        pstm.setInt(2, productId);

        int row = pstm.executeUpdate();

        // rows affected
//        System.out.println(row);

    }

    public static void updateCartItemStatus(int cartId, int productId, int statusCartItem) throws SQLException, ClassNotFoundException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        if (productId == -1) {
            String sql = "UPDATE order_item SET ItemStatus = ? WHERE OrderId=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, statusCartItem);
            pstm.setInt(2, cartId);

            int row = pstm.executeUpdate();

            // rows affected
//            System.out.println(row);
        }
        String sql = "UPDATE order_item SET ItemStatus = ? WHERE OrderId=? AND ProductId = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, statusCartItem);
        pstm.setInt(2, cartId);
        pstm.setInt(3, productId);

        int row = pstm.executeUpdate();

        // rows affected
//        System.out.println(row);
    }

    public static void updateQuantityItem(int cartId, int productId, int quantity) throws SQLException, ClassNotFoundException {
        Connection conn = MySQLConnUtils.getMySQLConnection();
        String sql = "UPDATE order_item SET ItemQuantity = ? WHERE OrderId=? AND ProductId = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, quantity);
        pstm.setInt(2, cartId);
        pstm.setInt(3, productId);

        int row = pstm.executeUpdate();

        // rows affected
//        System.out.println(row);
    }

    public static ArrayList<Product> searchProduct(String keys) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        StringBuilder sql = new StringBuilder("SELECT * FROM product WHERE product.`Name` LIKE ?");
        String[] listkeys = keys.trim().split(" ");
        PreparedStatement pstm;
        if (listkeys.length > 1) {
            for (int i = 1; i < listkeys.length; i++) {
                sql.append(" AND product.`Name` LIKE ?");
            }

            pstm = conn.prepareStatement(sql.toString());
            pstm.setString(1, "%" + listkeys[0] + "%");
            for (int i = 1; i < listkeys.length; i++) {
                pstm.setString(i + 1, "%" + listkeys[i] + "%");
            }
        } else {
            pstm = conn.prepareStatement(sql.toString());
            pstm.setString(1, "%" + keys + "%");
        }
        ResultSet rs = pstm.executeQuery();

        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product p = setProductData(rs);
            list.add(p);
        }
        return list;
    }

    public static void changeStatusProduct(String code, int status) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();
        String sql = "UPDATE product SET product.`Status` =? WHERE product.ProductCode=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, status);
        pstm.setString(2, code);

        int row = pstm.executeUpdate();

        // rows affected
//        System.out.println("Số hàng:" + row);
    }

    public static ArrayList<Brand> loadBrand() throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "SELECT * FROM brand";
        PreparedStatement pstm = conn.prepareStatement(sql);

        ResultSet rs = pstm.executeQuery();
        ArrayList<Brand> list = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt("Id");
            String name = rs.getString("Name");
            String img = rs.getString("Img");

            Brand brand = new Brand();
            brand.setBrandId(id);
            brand.setBrandName(name);
            brand.setBrandImg(img);
            list.add(brand);
        }
        return list;
    }

    public static ArrayList<Catalog> loadCataLog() throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "SELECT * FROM catalog";
        PreparedStatement pstm = conn.prepareStatement(sql);

        ResultSet rs = pstm.executeQuery();
        ArrayList<Catalog> list = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt("CatalogId");
            String name = rs.getString("Name");
            int parentId = rs.getInt("ParentId");

            Catalog catalog = new Catalog();
            catalog.setId(id);
            catalog.setName(name);
            catalog.setParentId(parentId);
            list.add(catalog);
        }
        return list;
    }

    public static ArrayList<Warranty> loadWarranty() throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "SELECT * FROM warranty";
        PreparedStatement pstm = conn.prepareStatement(sql);

        ResultSet rs = pstm.executeQuery();
        ArrayList<Warranty> list = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt("WarrantyId");
            int month = rs.getInt("WarrantyMonth");

            Warranty warranty = new Warranty();
            warranty.setId(id);
            warranty.setMonth(month);
            list.add(warranty);
        }
        return list;
    }

    public static List<Order> AllOrder() throws SQLException {
        List<Order> list = new ArrayList<>();


        String sql = "SELECT `order`.OrderId ,`user`.FullName,`order`.OrderDate,`order`.`Status` FROM `order` INNER JOIN `user` ON `order`.UserId=`user`.Id";
        Connection conn = MySQLConnUtils.getMySQLConnection();

        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Order order = new Order();
            order.setId(rs.getInt(1));
            order.setDatecreate(rs.getString(3));
            order.setUser(rs.getString(2));
            order.setStatus(rs.getInt(4));
            String orderitem = "SELECT * FROM order_item WHERE OrderId=?";
            Connection conn1 = MySQLConnUtils.getMySQLConnection();

            PreparedStatement pstm1 = conn1.prepareStatement(orderitem);
            pstm1.setInt(1, rs.getInt(1));
            ResultSet rs1 = pstm1.executeQuery();

            while (rs1.next()) {
                OrderItem item = new OrderItem();
                item.setId(rs1.getInt(2));
                item.setQuantity(rs1.getInt(3));
                item.setPrice(rs1.getDouble(5));
                item.setStatusdelivery(rs1.getInt(4));
                order.addOrderItem(item);
            }
            list.add(order);

        }
        return list;
    }

    public static List<Order> AllOrderUser(int id) throws SQLException {
        List<Order> list = new ArrayList<>();


        String sql = "SELECT `order`.OrderId ,`user`.FullName,`order`.OrderDate,`order`.`Status` FROM `order` INNER JOIN `user` ON `order`.UserId=`user`.Id\n" +
                "WHERE `user`.Id=?";
        Connection conn = MySQLConnUtils.getMySQLConnection();

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Order order = new Order();
            order.setId(rs.getInt(1));
            order.setDatecreate(rs.getString(3));
            order.setUser(rs.getString(2));
            order.setStatus(rs.getInt(4));
            String orderitem = "SELECT * FROM order_item WHERE OrderId=?";
            Connection conn1 = MySQLConnUtils.getMySQLConnection();

            PreparedStatement pstm1 = conn1.prepareStatement(orderitem);
            pstm1.setInt(1, rs.getInt(1));
            ResultSet rs1 = pstm1.executeQuery();

            while (rs1.next()) {
                OrderItem item = new OrderItem();
                item.setId(rs1.getInt(2));
                item.setQuantity(rs1.getInt(3));
                item.setPrice(rs1.getDouble(5));
                item.setStatusdelivery(rs1.getInt(4));
                order.addOrderItem(item);
            }
            list.add(order);

        }
        return list;
    }

    public static Product findIdProduct(int id) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "SELECT * FROM product WHERE Id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);

        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            return setProductData(rs);
        }
        return null;
    }

    public static void setDelivery(int i, int id) throws SQLException {
        Connection conn = MySQLConnUtils.getMySQLConnection();

        String sql = "UPDATE `order` SET `order`.`Status`=? WHERE OrderId=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, i);
        pstm.setInt(2, id);
        pstm.executeUpdate();
    }

    public static int getIdUser(String s) {
        int i = 0;
        try {
            Connection con = MySQLConnUtils.getMySQLConnection();
            String sql = "SELECT `user`.Id FROM `user` WHERE Username=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, s);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                i = rs.getInt(1);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }
}