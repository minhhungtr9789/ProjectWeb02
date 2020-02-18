package vn.nlu.fit.utils;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.HashMap;
import java.util.Locale;

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
        String link="";
        for (String i : data.values()) {
//            if (i) return i;
        }
        return "";
    }

    public static void main(String[] args) {
//        System.out.println(Util.convertVndCurrencyToDoub("21.990.000 ₫"));
        System.out.println(Util.convertToVndCurrency(Util.convertVndCurrencyToDoub("21.990.000 ₫")));
    }
}
