package com.bags.sixdoBag.model.repository;

import com.bags.sixdoBag.model.dto.request.ProductHomeRequest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QueryJpa {
    static final String JDBC_URL = "jdbc:sqlserver://localhost:1433;databaseName=DATN_CUAHANGTUIXACHSixDoo;encrypt=true;trustServerCertificate=true";
    static final String USERNAME = "sa";
    static final String PASSWORD = "123456";
   public List<ProductHomeRequest> temp() {
        try {
            // Tạo kết nối tới cơ sở dữ liệu
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);

            // Tạo câu lệnh SQL
            String sql = "WITH MinPrices AS (" +
                    "    SELECT " +
                    "        san_pham.id, " +
                    "        san_pham.ten, " +
                    "        chi_tiet_san_pham.gia_ban, " +
                    "        chi_tiet_san_pham.anh_ctsp, " +
                    "        ROW_NUMBER() OVER (PARTITION BY san_pham.id ORDER BY chi_tiet_san_pham.gia_ban ASC) AS RowNumber " +
                    "    FROM " +
                    "        san_pham " +
                    "    JOIN " +
                    "        chi_tiet_san_pham ON san_pham.id = chi_tiet_san_pham.id_san_pham " +
                    ") " +
                    "SELECT " +
                    "    id, " +
                    "    ten, " +
                    "    gia_ban, " +
                    "    anh_ctsp " +
                    "FROM " +
                    "    MinPrices " +
                    "WHERE " +
                    "    RowNumber = 1";

            // Tạo đối tượng PreparedStatement
            PreparedStatement statement = connection.prepareStatement(sql);

            // Thực thi câu lệnh SQL và nhận kết quả
            ResultSet resultSet = statement.executeQuery();

            // Duyệt qua kết quả và tạo danh sách sản phẩm
            List<ProductHomeRequest> productList = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String ten = resultSet.getString("ten");
                float giaBan = resultSet.getFloat("gia_ban");
                String anhCtsp = resultSet.getString("anh_ctsp");
                ProductHomeRequest product = new ProductHomeRequest(id, ten, giaBan, anhCtsp);
                productList.add(product);
            }

            // In ra danh sách sản phẩm
            for (ProductHomeRequest product : productList) {
                System.out.println(product);
            }

            // Đóng kết nối, statement và resultSet
            resultSet.close();
            statement.close();
            connection.close();
            return productList;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

    }


}
