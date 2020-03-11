package vn.nlu.fit.utils;

import vn.nlu.fit.connections.DBConnection;

import java.sql.Array;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.Normalizer;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;
import java.util.regex.Pattern;

public class Util {
    private static Locale localeVN = new Locale("vi", "VN");
    private static DecimalFormatSymbols symbols = new DecimalFormatSymbols();

    public static String fullPath(String path) {
        return "http://localhost:8080/ProjectWeb02/" + path;
    }

    public static String fullPathAdmin(String path) {
        return "http://localhost:8080/ProjectWeb02/admin/" + path;
    }

    public static String convertToVndCurrency(double vnd) {

        DecimalFormat currencyVN = (DecimalFormat) DecimalFormat.getCurrencyInstance(localeVN);
        symbols.setCurrencySymbol("₫");
        symbols.setGroupingSeparator('.');

        currencyVN.setDecimalFormatSymbols(symbols);
        return currencyVN.format(vnd);
    }

    public static double convertVndCurrencyToDoub(String vnd) {
        String data = vnd.substring(0, vnd.length() - 2);

        String[] list = data.split("\\.");

        String newdata = "";
        for (int i = 0; i < list.length; i++) {
            newdata += list[i];
        }
//        System.out.println(newdata);
        return Double.parseDouble(newdata);
    }

    public static String concatString(HashMap<String, String> data) {
        String link = "";
        for (String i : data.values()) {
//            if (i) return i;
        }
        return "";
    }

    public static String covertStringToURL(String str) {
        try {
            String temp = Normalizer.normalize(str, Normalizer.Form.NFD);
            Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
            return pattern.matcher(temp).replaceAll("").toLowerCase().replaceAll(" ", "-").replaceAll("đ", "d");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public static String convertArrayToString(String[] ar) {
        StringBuilder x = new StringBuilder();
        if (ar != null) {
            if (ar.length != 0) {
                for (String st : ar) {
                    x.append(st).append(",");
                }
                x.deleteCharAt(x.lastIndexOf(","));
            } else {
                x.append("[]");
            }
        }
        return x.toString();
    }

    public static void main(String[] args) throws SQLException {
//        System.out.println(Util.convertVndCurrencyToDoub("21.990.000 ₫"));
//        System.out.println(Util.convertToVndCurrency(Util.convertVndCurrencyToDoub("21.990.000 ₫")));
        String[] x = new String[0];

        System.out.println("â" + convertArrayToString(x));
//        String[] brand = new String[0];
//        System.out.println(brand.length);

        Connection conn = DBConnection.getMySQLConnection();
        Array array = conn.createArrayOf("INTEGER", new Integer[]{1,2,3});
    }
}
