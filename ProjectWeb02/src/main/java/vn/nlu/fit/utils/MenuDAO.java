package vn.nlu.fit.utils;

import vn.nlu.fit.connections.DBConnection;
import vn.nlu.fit.models.MenuItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class MenuDAO {

    public static List<MenuItem> listAllMenuItems() {
        String sql = "SELECT * FROM menuitems";
        List<MenuItem> menus = new LinkedList<>();
        Connection conn = DBConnection.getMySQLConnection();
        PreparedStatement pstm = null;
        try {
            pstm = conn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                MenuItem item = new MenuItem();
                item.setId(rs.getInt("id"));
                item.setMenuName(rs.getString("menu_name"));
                item.setIcon(rs.getString("icon"));
                item.setLink(rs.getString("link"));
                item.setParentId(rs.getInt("parent_menu"));
                item.setMenuBackground(rs.getString("menu_background"));
                menus.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menus;
    }

    public static List<MenuItem> listMenuItems(int parentId) {
        String sql = "SELECT * FROM menuitems WHERE parent_menu=?";
        List<MenuItem> menus = new ArrayList<>();
        Connection conn = DBConnection.getMySQLConnection();
        PreparedStatement pstm = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, parentId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                MenuItem item = new MenuItem();
                item.setId(rs.getInt("id"));
                item.setMenuName(rs.getNString("menu_name"));
                item.setIcon(rs.getNString("icon"));
                item.setLink(rs.getNString("link"));
                item.setParentId(rs.getInt("parent_menu"));
                item.setMenuBackground(rs.getString("menu_background"));
                menus.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menus;
    }

    public static List<MenuItem> listMenuItems(int parentId, String name) {
        String sql = "SELECT * FROM menuitems WHERE parent_menu=? and menu_name<>?";
        List<MenuItem> menus = new LinkedList<>();
        Connection conn = DBConnection.getMySQLConnection();
        PreparedStatement pstm = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, parentId);
            pstm.setString(2, name);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                MenuItem item = new MenuItem();
                item.setId(rs.getInt("id"));
                item.setMenuName(rs.getNString("menu_name"));
                item.setIcon(rs.getNString("icon"));
                item.setLink(rs.getNString("link"));
                item.setParentId(rs.getInt("parent_menu"));
                item.setMenuBackground(rs.getString("menu_background"));
                menus.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menus;
    }

    public static Map<MenuItem, List<MenuItem>> getDynamicMenu() {
        List<MenuItem> items = listMenuItems(0);

        Map<MenuItem, List<MenuItem>> menuItemListMap = new LinkedHashMap<>();
        for (MenuItem m : items) {
            menuItemListMap.put(m, listMenuItems(m.getId(), m.getMenuName()));

        }

        return menuItemListMap;
    }
}
