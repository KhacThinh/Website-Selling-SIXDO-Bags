package com.bags.sixdoBag.model.repository;


import com.bags.sixdoBag.model.dto.response.ThongKeResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ThongKeRespository {

    static final String JDBC_URL = "jdbc:sqlserver://localhost:1433;databaseName=DATN_CUAHANGTUIXACHSixDoo;encrypt=true;trustServerCertificate=true";
    static final String USERNAME = "sa";
    static final String PASSWORD = "123456";

    public List<ThongKeResponse> getTop5SanPhamDaBanChay() {
        List<ThongKeResponse> productSalesList = new ArrayList<>();

        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            String query = "SELECT TOP 5 sp.ten AS TenSanPham, SUM(cthd.so_luong) AS SoLuongDaBan," +
                    "SUM(cthd.so_luong * cts.gia_ban) AS DoanhThuTrenTungSanPham," +
                    "SUM(cthd.so_luong * cts.gia_ban)-SUM(cthd.so_luong * cts.gia_nhap) AS SOTIENLAITRENTUNGSANPHAM " +
                    "FROM chi_tiet_hoa_don cthd " +
                    "JOIN chi_tiet_san_pham cts ON cthd.id_ctsp = cts.id " +
                    "JOIN san_pham sp ON cts.id_san_pham = sp.id " +
                    "JOIN hoa_don hd ON hd.id = cthd.id_hoa_don " +
                    "WHERE hd.trang_thai = 0 " +
                    "GROUP BY sp.ten " +
                    "ORDER BY SUM(cthd.so_luong) DESC;";

            try (PreparedStatement statement = connection.prepareStatement(query)) {
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    ThongKeResponse productSales = new ThongKeResponse();
                    productSales.setTenSanPham(resultSet.getString("TenSanPham"));
                    productSales.setSoLuongDaBanTrenTungSanPham(resultSet.getInt("SoLuongDaBan"));
                    productSales.setDoanhThuTrenTungSanPham(resultSet.getInt("DoanhThuTrenTungSanPham"));
                    productSales.setSoTienLaiTrenTungSanPham(resultSet.getInt("SOTIENLAITRENTUNGSANPHAM"));
                    productSalesList.add(productSales);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productSalesList;
    }


    public List<ThongKeResponse> getTongDoanhThu() {
        List<ThongKeResponse> productSalesList = new ArrayList<>();

        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            String query = "SELECT sp.ten AS TenSanPham, SUM(cthd.so_luong) AS SoLuongDaBan," +
                    "SUM(cthd.so_luong * cts.gia_ban) AS DoanhThuTrenTungSanPham," +
                    "SUM(cthd.so_luong * cts.gia_ban)-SUM(cthd.so_luong * cts.gia_nhap) AS SOTIENLAITRENTUNGSANPHAM " +
                    "FROM chi_tiet_hoa_don cthd " +
                    "JOIN chi_tiet_san_pham cts ON cthd.id_ctsp = cts.id " +
                    "JOIN san_pham sp ON cts.id_san_pham = sp.id " +
                    "JOIN hoa_don hd ON hd.id = cthd.id_hoa_don " +
                    "WHERE hd.trang_thai = 0 " +
                    "GROUP BY sp.ten " +
                    "ORDER BY SUM(cthd.so_luong) DESC;";

            try (PreparedStatement statement = connection.prepareStatement(query)) {
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    ThongKeResponse productSales = new ThongKeResponse();
                    productSales.setTenSanPham(resultSet.getString("TenSanPham"));
                    productSales.setSoLuongDaBanTrenTungSanPham(resultSet.getInt("SoLuongDaBan"));
                    productSales.setDoanhThuTrenTungSanPham(resultSet.getInt("DoanhThuTrenTungSanPham"));
                    productSales.setSoTienLaiTrenTungSanPham(resultSet.getInt("SOTIENLAITRENTUNGSANPHAM"));
                    productSalesList.add(productSales);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productSalesList;
    }

    public Map<Integer, ThongKeResponse> getThongKeSanPhamTheoNam(int year) {
        Map<Integer, ThongKeResponse> thongKeResponses = new LinkedHashMap<>();
        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            String query = "DECLARE @Year INT =?;" +
                    "SELECT" +
                    "    MONTH(hd.thoi_gian_tao) AS DOANHTHUTHEOTHANG," +
                    "SUM(cthd.so_luong * ctsp.gia_ban) AS SOTIENBANSANPHAM," +
                    "SUM(cthd.so_luong) AS SOLUONGBANTHEOTUNGSANPHAM," +
                    "SUM(cthd.so_luong * ctsp.gia_ban)-SUM(cthd.so_luong * ctsp.gia_nhap) AS SOTIENLAITRENTUNGSANPHAM " +
                    " FROM " +
                    "hoa_don hd " +
                    "JOIN " +
                    "chi_tiet_hoa_don cthd ON hd.id = cthd.id_hoa_don " +
                    "JOIN " +
                    "    chi_tiet_san_pham ctsp ON cthd.id_ctsp = ctsp.id " +
                    "WHERE " +
                    "    YEAR(hd.thoi_gian_tao) = @Year and hd.trang_thai = 0 " +
                    "GROUP BY " +
                    "    MONTH (hd.thoi_gian_tao)";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, year);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ThongKeResponse thongKeResponse = new ThongKeResponse();
                thongKeResponse.setDoanhThuTrenTungSanPham(resultSet.getInt("SOTIENBANSANPHAM"));
                thongKeResponse.setSoLuongDaBanTrenTungSanPham(resultSet.getInt("SOLUONGBANTHEOTUNGSANPHAM"));
                thongKeResponse.setSoTienLaiTrenTungSanPham(resultSet.getInt("SOTIENLAITRENTUNGSANPHAM"));
                int thang = resultSet.getInt("DOANHTHUTHEOTHANG");
                thongKeResponses.put(thang, thongKeResponse);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return thongKeResponses;
    }
}
