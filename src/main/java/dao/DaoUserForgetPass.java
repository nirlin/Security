package dao;


import utils.Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author NieLin
 * @version 1.0
 * @date 2019/11/27 17:04
 */
public class DaoUserForgetPass {
    public static int daoAdminLogin(String name,String phone){
        int num=0;
        Connection connection= Utils.getConnection();
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        String sql="select * from users where user_name=? and user_phone=?";
        try {
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,phone);
            resultSet=preparedStatement.executeQuery();
            resultSet.last();
            num=resultSet.getRow();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (connection != null)
                    connection.close();
                if (resultSet != null)
                    resultSet.close();
                if (preparedStatement != null)
                    preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return num;
    }
}
