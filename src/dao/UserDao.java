package dao;

import entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private static Connection connection = null;
    private static Statement stat = null;
    private static ResultSet resultSet = null;

    private static boolean connect(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/design_pattern" +
                    "?useUnicode=true&characterEncoding=gbk&useJDBCCompliantTimezoneShift=true&serverTimezone=UTC";
            connection = DriverManager.getConnection(url,"root", "root");
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (ClassNotFoundException e) {
            System.out.println("加载驱动失败！");
            e.printStackTrace();return false;

        }
        return true;
    }

    private static void close() throws SQLException {
        if (connection != null)
            connection.close();
        if (stat != null)
            stat.close();
        if (resultSet !=null)
            resultSet.close();
    }

    public static List<User> selectAll() throws SQLException {
        if (!connect()){
            System.out.println("连接失败");
            close();
            return null;
        }
        stat = connection.createStatement();
        resultSet = stat.executeQuery("select * from user");
        List<User> users = new ArrayList<>();
        System.out.println("aaa");
        while (resultSet.next()){
            User user = new User();
            user.setUserName(resultSet.getString("name"));
            user.setPassword(resultSet.getString("password"));
            System.out.println("!!!" + resultSet.getString("name"));
            users.add(user);
        }
        close();
        return users;
    }

    public static void main(String []args) throws SQLException {
        selectAll();
    }
}
