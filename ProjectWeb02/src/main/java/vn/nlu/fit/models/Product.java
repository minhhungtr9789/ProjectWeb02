package vn.nlu.fit.models;

import vn.nlu.fit.utils.DBUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

public class Product {
    private int id;
    private String code;
    private String name;
    private double price;
    private double promotionPrice;
    private String[] listImg = {};
    private int quantity;
    private int warranty;
    private String description;
    private String settingInfo;
    private int brand;
    private int catalog;
    private String promotionText;
    private int status;
    private Date dateCreate;

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public Product(String code) {
        this.code = code;
    }

    public int getCatalog() {
        return catalog;
    }

    public String getSettingInfo() {
        return settingInfo;
    }

    public void setSettingInfo(String settingInfo) {
        this.settingInfo = settingInfo;
    }

    public void setCatalog(int catalog) {
        this.catalog = catalog;
    }

    public void setWarranty(int waranty) {
        this.warranty = waranty;
    }

    public int getWarranty() {
        return warranty;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setBrand(int brand) {
        this.brand = brand;
    }

    public int getBrand() {
        return brand;
    }

    public void changeStatus() throws SQLException {
        if (status == 1) {
            status = 0;
        } else status = 1;
//        System.out.println(code + ":" + status);
        DBUtils.changeStatusProduct(code, status);
    }

    public String getPromotionText() {
        return promotionText;
    }

    public void setPromotionText(String promotionText) {
        this.promotionText = promotionText;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public static String toJavascriptArray(String[] arr) {
        StringBuffer sb = new StringBuffer();
        sb.append("[");
        for (int i = 0; i < arr.length; i++) {
            sb.append("\"").append(arr[i]).append("\"");
            if (i + 1 < arr.length) {
                sb.append(",");
            }
        }
        sb.append("]");
        return sb.toString();
    }


    public static String[] convertToArray(String stringImg) {
        String[] arr = {};
        if (stringImg != null) {
            arr = Pattern.compile("\\|").split(stringImg);
//            for (String data : listImg) {
//                System.out.println(data);
//            }
        }
        return arr;
    }

    public static String arrConvertToString(String[] arrImg) {
        StringBuilder stringImg = new StringBuilder();
        for (String s : arrImg) {
            stringImg.append(s);
        }
        return stringImg.toString();
    }

    public static String converImgListToDB(String[] arrImg) {
        StringBuilder stringImg = new StringBuilder();
        for (String s : arrImg) {
            stringImg.append(s).append("|");
        }
        return stringImg.toString().substring(0, stringImg.toString().length() - 1);
    }

    public void setListImg(String[] listImg) {
        this.listImg = listImg;
    }

    public String[] getListImg() {
        return listImg;
    }

    public static void main(String[] args) {
        String testString = "http://localhost:8080/ProjectWeb02/img/products/mobile/iphone/iphoneX/iphone-11-pro-max-256gb-black-600x600.jpg\ta";
        String[] a = (testString.split("\\t"));
        System.out.println(a.length);
        for (int i = 0; i < a.length; i++) {
            System.out.println(a[i]);
        }
        // output : [Real, How, To]
    }


    public Product(String code, String name, double price) {
        this.code = code;
        this.name = name;
        this.price = price;
    }

    public Product() {
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPromotionPrice(double promotionPrice) {
        this.promotionPrice = promotionPrice;
    }

    public double getPromotionPrice() {
        return promotionPrice;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }


}
