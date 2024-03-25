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

    public List<ProductHomeRequest> displayedByBrand(int idThuongHieu) {
        try {
            // Tạo kết nối tới cơ sở dữ liệu
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);

            // Tạo câu lệnh SQL
            String sql = "WITH MinPrices AS ( SELECT san_pham.id, san_pham.ten," +
                    " chi_tiet_san_pham.gia_ban, chi_tiet_san_pham.anh_ctsp," +
                    " ROW_NUMBER() OVER (PARTITION BY san_pham.id ORDER BY chi_tiet_san_pham.gia_ban ASC) " +
                    "AS RowNumber FROM san_pham JOIN chi_tiet_san_pham" +
                    " ON san_pham.id = chi_tiet_san_pham.id_san_pham WHERE " +
                    "san_pham.id_thuong_hieu = ? ) " +
                    "SELECT id, ten, gia_ban, anh_ctsp FROM MinPrices WHERE RowNumber = 1;";

            // Tạo đối tượng PreparedStatement
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, idThuongHieu);

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


    public List<ProductHomeRequest> searchProductByName(String name) {
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

            // Nếu tên được cung cấp, thêm điều kiện tìm kiếm vào câu lệnh SQL
            if (name != null && !name.isEmpty()) {
                sql += " AND ten LIKE ?";
            }

            // Tạo đối tượng PreparedStatement
            PreparedStatement statement = connection.prepareStatement(sql);

            // Nếu tên được cung cấp, đặt giá trị tham số cho câu lệnh SQL
            if (name != null && !name.isEmpty()) {
                statement.setString(1, "%" + name + "%");
            }

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


    public List<ProductHomeRequest> filterDoiTuongSuDungProductHome(String doiTuongSuDung) {
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
                    "    JOIN " +
                    "        doi_tuong_su_dung ON san_pham.id_doi_tuong_su_dung = doi_tuong_su_dung.id ";
            // Nếu tên được cung cấp, thêm điều kiện tìm kiếm vào câu lệnh SQL
            if (doiTuongSuDung != null && !doiTuongSuDung.isEmpty()) {
                sql += "WHERE doi_tuong_su_dung.ten LIKE ? )";
            }

            sql += "SELECT " +
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

            // Nếu tên được cung cấp, đặt giá trị tham số cho câu lệnh SQL
            if (doiTuongSuDung != null && !doiTuongSuDung.isEmpty()) {
                statement.setString(1, "%" + doiTuongSuDung + "%");
            }

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

    public List<ProductHomeRequest> filterDanhMucProductHome(String danhMuc) {
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
                    "    JOIN " +
                    "        danh_muc ON san_pham.id_danh_muc = danh_muc.id ";
            // Nếu tên được cung cấp, thêm điều kiện tìm kiếm vào câu lệnh SQL
            if (danhMuc != null && !danhMuc.isEmpty()) {
                sql += "WHERE danh_muc.ten LIKE ? )";
            }

            sql += "SELECT " +
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

            // Nếu tên được cung cấp, đặt giá trị tham số cho câu lệnh SQL
            if (danhMuc != null && !danhMuc.isEmpty()) {
                statement.setString(1, "%" + danhMuc + "%");
            }

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

    public List<ProductHomeRequest> filterMauSacThuongHieuProductHome(String maMau, String tenThuongHieu) {
        List<ProductHomeRequest> productHomeRequests = new ArrayList<>();

        // Kết nối tới cơ sở dữ liệu
        try (Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD)) {
            // Chuẩn bị câu truy vấn SQL với các tham số muaMua và tenThuongHieu
            String sqlQuery = "WITH MinPrices AS ( " +
                    "    SELECT " +
                    "        san_pham.id, " +
                    "        san_pham.ten, " +
                    "        chi_tiet_san_pham.gia_ban, " +
                    "        chi_tiet_san_pham.anh_ctsp, " +
                    "        ROW_NUMBER() OVER (PARTITION BY san_pham.id ORDER BY chi_tiet_san_pham.gia_ban ASC) AS RowNumber " +
                    "    FROM " +
                    "        san_pham " +
                    "    JOIN  chi_tiet_san_pham on " +
                    "        san_pham.id = chi_tiet_san_pham.id_san_pham " +
                    "    join thuong_hieu on thuong_hieu.id = san_pham.id_thuong_hieu " +
                    "    join mau_sac on mau_sac.id = chi_tiet_san_pham.id_mau_sac " +
                    "    where thuong_hieu.ten like ? and mau_sac.ma like ? " +
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

            // Thực thi câu truy vấn với các tham số tenThuongHieu và maMau
            try (PreparedStatement statement = connection.prepareStatement(sqlQuery)) {
                statement.setString(1, "%" + tenThuongHieu + "%");
                statement.setString(2, "%" + maMau + "%");
                ResultSet resultSet = statement.executeQuery();
                // Duyệt qua kết quả trả về
                while (resultSet.next()) {
                    // Tạo một đối tượng ProductHomeRequest và đặt các giá trị từ cơ sở dữ liệu
                    ProductHomeRequest productHomeRequest = new ProductHomeRequest();
                    productHomeRequest.setId(resultSet.getInt("id"));
                    productHomeRequest.setTenSanPham(resultSet.getString("ten"));
                    productHomeRequest.setGiaBan(resultSet.getFloat("gia_ban"));
                    productHomeRequest.setHinhAnh(resultSet.getString("anh_ctsp"));
                    // Thêm đối tượng vào danh sách
                    productHomeRequests.add(productHomeRequest);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ nếu có
        }
        // Trả về danh sách các ProductHomeRequest
        return productHomeRequests;
    }


    public List<ProductHomeRequest> getSanPhamYeuThich(Integer idKhachHang) {
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
                    "    JOIN chi_tiet_san_pham ON chi_tiet_san_pham.id_san_pham = san_pham.id "+
                    "    JOIN san_pham_yeu_thich as spyt ON san_pham.id = spyt.id_san_pham" +
                    "    JOIN khach_hang kh ON spyt.id_khach_hang = kh.id ";
            // Nếu tên được cung cấp, thêm điều kiện tìm kiếm vào câu lệnh SQL
            if (idKhachHang != null) {
                sql += "WHERE kh.id = ? )";
            }

            sql += "SELECT " +
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

            // Nếu tên được cung cấp, đặt giá trị tham số cho câu lệnh SQL
            if (idKhachHang != null) {
                statement.setInt(1, idKhachHang);
            }

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
