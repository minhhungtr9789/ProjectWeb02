package vn.nlu.fit.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vn.nlu.fit.connections.MyConnection_DB;
import vn.nlu.fit.connections.MySQLConnUtils;
import vn.nlu.fit.models.User;
import vn.nlu.fit.models.User;

public class User_DAO implements Object_DAO {

    @Override
    public boolean addUser(Object obj) {
        User user = (User) obj;
        try {
            Connection con = MySQLConnUtils.getMySQLConnection();
            String sql = "INSERT INTO `user`( `Username`, `Password`, `Email`, `FullName`, `PhoneNumber`, `level`, `Address`) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement pr = con.prepareStatement(sql);

            pr.setString(1, user.getUsername());
            pr.setString(2, MD5.encryption(user.getPassword()));
            pr.setString(3, user.getEmail());
            pr.setString(4, user.getFullname());
            pr.setString(5, user.getPhone());
            pr.setInt(6, user.getLevel());
            pr.setString(7, user.getAddress());
            pr.executeUpdate();
            return true;
        } catch (Exception e) {

            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editUser(Object obj) {
        User user = (User) obj;
        try {
            Connection con = MySQLConnUtils.getMySQLConnection();
            String sql = "UPDATE `user` SET `Username`=?, `Password`=?, `Email`=?, `FullName`=?, `PhoneNumber`=?, `level`=?, `Address`=? WHERE id=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, user.getUsername());
            pr.setString(2, MD5.encryption(user.getPassword()));
            pr.setString(3, user.getEmail());
            pr.setString(4, user.getFullname());
            pr.setString(5, user.getPhone());
            pr.setInt(6, user.getLevel());
            pr.setString(7, user.getAddress());
            pr.setInt(8, user.getId());
            pr.executeUpdate();
            return true;
        } catch (Exception e) {

            e.printStackTrace();
        }
        return false;
    }


    @Override
    public boolean removeUser(int id) {
        try {
            Connection con = MySQLConnUtils.getMySQLConnection();
            String sql = "DELETE FROM `user` WHERE id=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, id);
            pr.executeUpdate();
            return true;
        } catch (Exception e) {

            e.printStackTrace();
        }
        return false;
    }

    public User takeProfileUer(String username) {
        User user;
        try {
            Connection con = MyConnection_DB.getConnection();

            String sql = "SELECT * FROM user where username=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String userName = rs.getString(2);
                String password = rs.getString(3);
                String email = rs.getString(4);
                String fullName = rs.getString(5);
                String address = rs.getString("Address");
                user = new User();

                user.setId(id);
                user.setUsername(userName);
                user.setPassword(password);
                user.setEmail(email);
                user.setFullname(fullName);
                user.setAddress(address);
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return null;
    }

    @Override
    public boolean checkUser(String username, String password) {

        try {
            Connection con = MyConnection_DB.getConnection();
            String sql = "SELECT * FROM user where username= ? and password= ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return false;
    }
}
