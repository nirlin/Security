package dao;


import utils.Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoAdminUseNameFindId {
    public static String useNameFindId(String admin_name){
        Connection connection= Utils.getConnection();
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        String sql="select * from admins where admin_name=?";
        String admin_id="";
        try {
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,admin_name);
            resultSet=preparedStatement.executeQuery();
            resultSet.next();
            admin_id=String.valueOf(resultSet.getInt("admin_id"));
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (connection!=null)
                    connection.close();
                if (preparedStatement!=null)
                    preparedStatement.close();
                if (resultSet!=null)
                    resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return admin_id;

    }
}
