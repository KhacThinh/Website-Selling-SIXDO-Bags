package com.bags.sixdoBag.model.repository;


import com.bags.sixdoBag.model.dto.response.ThongKeResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
                    "WHERE hd.trang_thai IN (0, 6) " +
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





    public ThongKeResponse getTongDoanhThuTaiQuayAndOnline() {
        ThongKeResponse thongKeResponse = new ThongKeResponse();

        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            String query = "SELECT \n" +
                    "    \n" +
                    "    SUM(hd.tong_tien) AS TongDoanhThu\n" +
                    "FROM \n" +
                    "    hoa_don hd \n" +
                    "WHERE \n" +
                    "    hd.trang_thai IN (0, 6)\n" +
                    " \n" +
                    "ORDER BY \n" +
                    "    SUM(hd.tong_tien) DESC;";

            try (PreparedStatement statement = connection.prepareStatement(query)) {
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {

                    thongKeResponse.setTongDoanhThu(resultSet.getLong("TongDoanhThu"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return thongKeResponse;
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
                    "WHERE hd.trang_thai IN (0, 6) " +
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
            String query = "SELECT\n" +
                    "    MONTH(hd.thoi_gian_tao) AS DOANHTHUTHEOTHANG,\n" +
                    "    SUM(hd.tong_tien) AS TongDoanhThu\n" +
                    "FROM\n" +
                    "    hoa_don hd\n" +
                    "WHERE\n" +
                    "    YEAR(hd.thoi_gian_tao) = ? AND hd.trang_thai IN (0, 6)\n" +
                    "GROUP BY\n" +
                    "    MONTH(hd.thoi_gian_tao);";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, year);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ThongKeResponse thongKeResponse = new ThongKeResponse();
                int thang = resultSet.getInt("DOANHTHUTHEOTHANG");
                long tongDoanhThu = resultSet.getInt("TongDoanhThu");
                thongKeResponse.setThang(thang);
                thongKeResponse.setTongDoanhThu(tongDoanhThu);
                thongKeResponses.put(thang, thongKeResponse);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return thongKeResponses;
    }


    public List<ThongKeResponse> getAllCTSPOrderByDESCSoLuong() {
        List<ThongKeResponse> productList = new ArrayList<>();

        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            String query = "SELECT " +
                    "    sp.ten AS 'Tên Sản Phẩm', " +
                    "    ms.ten AS 'Màu Sắc', " +
                    "    cts.gia_ban AS 'Giá Bán', " +
                    "    SUM(cthd.so_luong) AS 'Số lượng đã bán', " +
                    "    SUM(cthd.so_luong * cts.gia_ban) AS 'DoanhThuTrenTungSanPham' " +
                    "FROM " +
                    "    chi_tiet_hoa_don cthd " +
                    "JOIN " +
                    "    chi_tiet_san_pham cts ON cthd.id_ctsp = cts.id " +
                    "JOIN " +
                    "    san_pham sp ON cts.id_san_pham = sp.id " +
                    "JOIN hoa_don hd ON hd.id = cthd.id_hoa_don " +
                    "JOIN mau_sac ms ON ms.id = cts.id_mau_sac " +
                    "WHERE hd.trang_thai IN (0, 6) " +
                    "GROUP BY " +
                    "    sp.ten, " +
                    "    ms.ten, " +
                    "    cts.gia_ban " +
                    "ORDER BY " +
                    "    SUM(cthd.so_luong) DESC;";


            try (PreparedStatement statement = connection.prepareStatement(query)) {
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    ThongKeResponse productSales = new ThongKeResponse();
                    productSales.setTenSanPham(resultSet.getString("Tên Sản Phẩm"));
                    productSales.setMauSac(resultSet.getString("Màu Sắc"));
                    productSales.setGiaBan(resultSet.getInt("Giá Bán"));
                    productSales.setSoLuongDaBanTrenTungSanPham(resultSet.getInt("Số lượng đã bán"));
                    productSales.setDoanhThuTrenTungSanPham(resultSet.getInt("DoanhThuTrenTungSanPham"));

                    productList.add(productSales);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }


    public List<ThongKeResponse> getAllCTSPOrderByDESCDoanhThu() {
        List<ThongKeResponse> productList = new ArrayList<>();

        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            String query = "SELECT " +
                    "    sp.ten AS 'Tên Sản Phẩm', " +
                    "    ms.ten AS 'Màu Sắc', " +
                    "    cts.gia_ban AS 'Giá Bán', " +
                    "    SUM(cthd.so_luong) AS 'Số lượng đã bán', " +
                    "    SUM(cthd.so_luong * cts.gia_ban) AS 'DoanhThuTrenTungSanPham' " +
                    "FROM " +
                    "    chi_tiet_hoa_don cthd " +
                    "JOIN " +
                    "    chi_tiet_san_pham cts ON cthd.id_ctsp = cts.id " +
                    "JOIN " +
                    "    san_pham sp ON cts.id_san_pham = sp.id " +
                    "JOIN hoa_don hd ON hd.id = cthd.id_hoa_don " +
                    "JOIN mau_sac ms ON ms.id = cts.id_mau_sac " +
                    "WHERE hd.trang_thai IN (0, 6) " +
                    "GROUP BY " +
                    "    sp.ten, " +
                    "    ms.ten, " +
                    "    cts.gia_ban " +
                    "ORDER BY " +
                    "    SUM(cthd.so_luong * cts.gia_ban) DESC;";


            try (PreparedStatement statement = connection.prepareStatement(query)) {
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    ThongKeResponse productSales = new ThongKeResponse();
                    productSales.setTenSanPham(resultSet.getString("Tên Sản Phẩm"));
                    productSales.setMauSac(resultSet.getString("Màu Sắc"));
                    productSales.setGiaBan(resultSet.getInt("Giá Bán"));
                    productSales.setSoLuongDaBanTrenTungSanPham(resultSet.getInt("Số lượng đã bán"));
                    productSales.setDoanhThuTrenTungSanPham(resultSet.getInt("DoanhThuTrenTungSanPham"));

                    productList.add(productSales);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }


    public List<ThongKeResponse> getKhachHangMuaSamDESC() {
        List<ThongKeResponse> productList = new ArrayList<>();

        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            String query = "SELECT \n" +
                    "    kh.ten_khach_hang AS [Tên Khách Hàng], \n" +
                    "    kh.sdt AS [Số Điện Thoại], \n" +
                    "    SUM(hd.tong_tien) AS [Tiền Mua Sắm] \n" +
                    "FROM \n" +
                    "    hoa_don hd \n" +
                    "JOIN \n" +
                    "    khach_hang kh ON kh.id = hd.id_khach_hang \n" +
                    "WHERE \n" +
                    "    hd.trang_thai=6 \n" +
                    "GROUP BY \n" +
                    "    kh.ten_khach_hang, \n" +
                    "    kh.sdt\n" +
                    "ORDER BY \n" +
                    "    [Tiền Mua Sắm] DESC;";


            try (PreparedStatement statement = connection.prepareStatement(query)) {
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    ThongKeResponse productSales = new ThongKeResponse();
                    productSales.setTenKh(resultSet.getString("Tên Khách Hàng"));
                    productSales.setSdtKh(resultSet.getString("Số Điện Thoại"));
                    productSales.setTienMuaSam(resultSet.getInt("Tiền Mua Sắm"));


                    productList.add(productSales);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }


    public List<ThongKeResponse> thongKeDoanhThuTheoNgay(String ngayTruyVan) {
        List<ThongKeResponse> productList = new ArrayList<>();

        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            String query = "SELECT\n" +
                    "    CAST(hd.thoi_gian_tao AS DATE) AS NGAY,\n" +
                    "    sp.ten AS 'Tên Sản Phẩm',\n" +
                    "    ms.ten AS 'Màu Sắc',\n" +
                    "    SUM(cthd.so_luong) AS 'Số Lượng Bán',\n" +
                    "    SUM(cthd.so_luong * ctsp.gia_ban) AS 'Số Tiền Bán',\n" +
                    "    CASE\n" +
                    "        WHEN hd.trang_thai = 0 THEN 'Ban Tai Quay'\n" +
                    "        WHEN hd.trang_thai = 6 THEN 'Ban online'\n" +
                    "        ELSE 'Không xác định'\n" +
                    "    END AS 'Loại Bán Hàng'\n" +
                    "FROM\n" +
                    "    hoa_don hd\n" +
                    "JOIN\n" +
                    "    chi_tiet_hoa_don cthd ON hd.id = cthd.id_hoa_don\n" +
                    "JOIN\n" +
                    "    chi_tiet_san_pham ctsp ON cthd.id_ctsp = ctsp.id\n" +
                    "JOIN\n" +
                    "    san_pham sp ON sp.id = ctsp.id_san_pham\n" +
                    "JOIN \n" +
                    "    mau_sac ms ON ms.id= ctsp.id_mau_sac\n" +
                    "WHERE\n" +
                    "    CAST(hd.thoi_gian_tao AS DATE) = ? \n" +
                    "    AND (hd.trang_thai = 0 OR hd.trang_thai = 6)\n" +
                    "GROUP BY\n" +
                    "    CAST(hd.thoi_gian_tao AS DATE),\n" +
                    "    sp.ten,\n" +
                    "    ms.ten,\n" +
                    "    CASE\n" +
                    "        WHEN hd.trang_thai = 0 THEN 'Ban Tai Quay'\n" +
                    "        WHEN hd.trang_thai = 6 THEN 'Ban online'\n" +
                    "        ELSE 'Không xác định'\n" +
                    "    END;";

            try (PreparedStatement statement = connection.prepareStatement(query)) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date parsedDate = dateFormat.parse(ngayTruyVan);
                java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
                statement.setDate(1, sqlDate);

                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    ThongKeResponse productSales = new ThongKeResponse();
                    productSales.setNgay(resultSet.getDate("NGAY"));
                    productSales.setTenSanPham(resultSet.getString("Tên Sản Phẩm"));
                    productSales.setMauSac(resultSet.getString("Màu Sắc"));
                    productSales.setSoLuongDaBanTrenTungSanPham(resultSet.getInt("Số Lượng Bán"));
                    productSales.setDoanhThuTrenTungSanPham(resultSet.getInt("Số Tiền Bán"));
                    productSales.setLoaiBanHang(resultSet.getString("Loại Bán Hàng"));

                    productList.add(productSales);
                }
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }

        return productList;
    }



    public ThongKeResponse tongDoanhThuTheoNgay(String ngayTruyVan) {
        ThongKeResponse thongKeDoanhThu = new ThongKeResponse();

        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            String query = "SELECT \n" +
                    "    CAST(hd.thoi_gian_tao AS DATE) AS [Ngày], \n" +
                    "    SUM(hd.tong_tien) AS [Tiền Mua Sắm] \n" +
                    "FROM \n" +
                    "    hoa_don hd \n" +
                    "WHERE \n" +
                    "    CAST(hd.thoi_gian_tao AS DATE) = ? \n" +
                    "    AND hd.trang_thai IN (0, 6) \n" +
                    "GROUP BY \n" +
                    "    CAST(hd.thoi_gian_tao AS DATE);";

            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, ngayTruyVan);

                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    thongKeDoanhThu.setNgay(resultSet.getDate("Ngày"));
                    thongKeDoanhThu.setTongDoanhThu(resultSet.getLong("Tiền Mua Sắm"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return thongKeDoanhThu;
    }



    public ThongKeResponse tongDoanhThuTheoTuan(int tuan, int nam) {
        ThongKeResponse thongKeDoanhThu = new ThongKeResponse();

        try {
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            String query = "DECLARE @Year INT = ?;\n" +
                    "DECLARE @Week INT = ?;\n" +
                    "\n" +
                    "DECLARE @StartDate DATE = DATEADD(WEEK, @Week - 1, DATEADD(YEAR, @Year - 1900, 0));\n" +
                    "DECLARE @EndDate DATE = DATEADD(DAY, 6, @StartDate);\n" +
                    "\n" +
                    "SELECT\n" +
                    "    YEAR(hd.thoi_gian_tao) AS Nam,\n" +
                    "    DATEPART(WEEK, hd.thoi_gian_tao) AS Tuan,\n" +
                    "    SUM(cthd.so_luong * ctsp.gia_ban) AS SOTIENBANSANPHAM\n" +
                    "FROM\n" +
                    "    hoa_don hd\n" +
                    "JOIN\n" +
                    "    chi_tiet_hoa_don cthd ON hd.id = cthd.id_hoa_don\n" +
                    "JOIN\n" +
                    "    chi_tiet_san_pham ctsp ON cthd.id_ctsp = ctsp.id\n" +
                    "WHERE\n" +
                    "    hd.thoi_gian_tao BETWEEN @StartDate AND @EndDate\n" +
                    "    AND hd.trang_thai IN (0, 6)\n" +
                    "GROUP BY\n" +
                    "    YEAR(hd.thoi_gian_tao),\n" +
                    "    DATEPART(WEEK, hd.thoi_gian_tao);";

            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, nam);
                statement.setInt(2, tuan);

                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    thongKeDoanhThu.setTongDoanhThu(resultSet.getLong("SOTIENBANSANPHAM"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return thongKeDoanhThu;
    }



}
