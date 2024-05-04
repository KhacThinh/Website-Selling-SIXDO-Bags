CREATE DATABASE DATN_CUAHANGTUIXACHSixDoo
GO
USE DATN_CUAHANGTUIXACHSixDoo
GO


CREATE TABLE thoi_gian_bao_hanh(
                                   id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                                   ma VARCHAR(100) UNIQUE,
                                   thoi_gian INT,
                                   trang_thai INT
);

CREATE TABLE danh_muc(
                         id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                         ma VARCHAR(100) UNIQUE,
                         ten NVARCHAR(300),
                         trang_thai INT
);

CREATE TABLE thuong_hieu(
                            id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                            ma VARCHAR(100) UNIQUE,
                            ten NVARCHAR(300),
                            trang_thai INT
);

CREATE TABLE doi_tuong_su_dung(
                                  id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                                  ma VARCHAR(100) UNIQUE,
                                  ten NVARCHAR(100),
                                  trang_thai INT
);

CREATE TABLE san_pham(
                         id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                         ma_san_pham VARCHAR(100),
                         id_thoi_gian_bao_hanh INT,
                         id_thuong_hieu INT,
                         id_danh_muc INT,
                         id_doi_tuong_su_dung INT,
                         ten NVARCHAR(300),
                         anh NVARCHAR(100),
                         product_url NVARCHAR(100),
                         kich_thuoc VARCHAR(200),
                         khoi_luong FLOAT,
                         chat_lieu NVARCHAR(200),
                         xuat_xu NVARCHAR(100),
                         mo_ta NVARCHAR(MAX),
                         trang_thai INT,
                         CONSTRAINT FK_ThoiGianBaoHang_SP FOREIGN KEY(id_thoi_gian_bao_hanh) REFERENCES thoi_gian_bao_hanh(id),
                         CONSTRAINT FK_ThuongHieu_SP FOREIGN KEY(id_thuong_hieu) REFERENCES thuong_hieu(id),
                         CONSTRAINT FK_DanhMuc_SP FOREIGN KEY(id_danh_muc) REFERENCES danh_muc(id),
                         CONSTRAINT FK_DoiTuongSuDung_SP FOREIGN KEY(id_doi_tuong_su_dung) REFERENCES doi_tuong_su_dung(id)
);

CREATE TABLE mau_sac(
                        id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                        ma NVARCHAR(100),
                        ten NVARCHAR(200)
);

CREATE TABLE khuyen_mai(
                           id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                           ma_khuyen_mai VARCHAR(100) UNIQUE,
                           ten NVARCHAR(200),
                           gia_tri_giam FLOAT,
                           ngay_bat_dau DATETIME,
                           ngay_ket_thuc DATETIME,
                           mo_ta NVARCHAR(MAX),
                           trang_thai INT
);

CREATE TABLE chi_tiet_san_pham(
                                  id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                                  ma_ctsp VARCHAR(100),
                                  id_san_pham INT,
                                  id_mau_sac INT,
                                  id_khuyen_mai INT,
                                  so_luong INT,
                                  gia_nhap FLOAT,
                                  gia_ban FLOAT,
                                  thoi_gian DATETIME,
                                  anh_ctsp NVARCHAR(max),
                                  trang_thai INT,
                                  CONSTRAINT FK_SanPham_CTSP FOREIGN KEY(id_san_pham) REFERENCES san_pham(id),
                                  CONSTRAINT FK_MauSac_CTSP FOREIGN KEY(id_mau_sac) REFERENCES mau_sac(id),
                                  CONSTRAINT FK_KhuyenMai_CTSP FOREIGN KEY(id_khuyen_mai) REFERENCES khuyen_mai(id)
);

CREATE TABLE anh_ctsp(
                         id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                         id_ctsp INT,
                         url VARCHAR(MAX),
    CONSTRAINT FK_CTSP_ACTSP FOREIGN KEY(id_ctsp) REFERENCES chi_tiet_san_pham(id)
);

CREATE TABLE chuc_vu(
                        id INT PRIMARY KEY NOT NULL,
                        ma_chuc_vu VARCHAR(100) UNIQUE,
                        ten_chuc_vu NVARCHAR(100),
                        trang_thai INT
);

CREATE TABLE tai_khoan(
                          id INT IDENTITY(1,1) PRIMARY KEY,
                          ten_dang_nhap VARCHAR(50),
                          mat_khau VARCHAR(50),
                          quyen INT
);


CREATE TABLE khach_hang(
                           id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                           id_tai_khoan INT,
                           ma_khach_hang VARCHAR(100) UNIQUE,
                           ten_khach_hang NVARCHAR(100),
                           gioi_tinh INT,
                           ngay_sinh VARCHAR(100),
                           sdt VARCHAR(100),
                           email VARCHAR(100),
                           trang_thai INT,
                           mat_khau VARCHAR(100),
                           dia_chi NVARCHAR(MAX),
                           hinh_anh NVARCHAR(MAX),
                           CONSTRAINT FK_TaiKhoan FOREIGN KEY(id_tai_khoan) REFERENCES tai_khoan(id)
);


CREATE TABLE nhan_vien(
                          id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                          id_chuc_vu INT,
                          id_tai_khoan INT,
                          ma_nhan_vien VARCHAR(100),
                          ho_ten NVARCHAR(100),
                          ngay_sinh DATETIME,
                          sdt VARCHAR(100),
                          email VARCHAR(100),
                          mat_khau VARCHAR(100),
                          que_quan NVARCHAR(300),
                          cccd VARCHAR(100),
                          thoi_gian_vao DATETIME,
                          thoi_gian_ra DATETIME,
                          trang_thai INT,
                          gioiTinh INT,
                          CONSTRAINT FK_ChucVu_NV FOREIGN KEY(id_chuc_vu) REFERENCES chuc_vu(id),
                          CONSTRAINT FK_TaiKhoan_NV FOREIGN KEY(id_tai_khoan) REFERENCES tai_khoan(id)
);

CREATE TABLE dia_chi_khach_hang(
                                   id INT IDENTITY(1, 1) PRIMARY KEY,
                                   id_khach_hang INT,
                                   ten_dia_chi NVARCHAR(MAX),
                                   trang_thai INT,
                                   mo_ta NVARCHAR(MAX),
                                   CONSTRAINT FK_KhachHang_DCKH FOREIGN KEY(id_khach_hang) REFERENCES khach_hang(id)
);


CREATE TABLE danh_sach_kh_mgg (
                                  id_khach_hang INT,
                                  id_ma_giam_gia INT,
                                  PRIMARY KEY (id_khach_hang, id_ma_giam_gia),
                                  FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id),
                                  FOREIGN KEY (id_ma_giam_gia) REFERENCES ma_giam_gia(id)
);


CREATE TABLE san_pham_yeu_thich(
                                   id_san_pham INT,
                                   id_khach_hang INT,
                                   trang_thai INT,
                                   PRIMARY KEY (id_san_pham, id_khach_hang),
                                   CONSTRAINT FK_SanPham_YT FOREIGN KEY(id_san_pham) REFERENCES san_pham(id),
                                   CONSTRAINT FK_KhachHang_YT FOREIGN KEY(id_khach_hang) REFERENCES khach_hang(id)
);


CREATE TABLE gio_hang(
                         id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                         id_khach_hang INT,
                         ngay_tao DATETIME,
                         tong_tien FLOAT,
                         trang_thai INT,
                         CONSTRAINT FK_KhachHang_GH FOREIGN KEY(id_khach_hang) REFERENCES khach_hang(id)
);


CREATE TABLE chi_tiet_gio_hang(
                                  id_ctsp INT,
                                  id_gio_hang INT,
                                  tong_tien FLOAT,
                                  so_luong INT,
                                  PRIMARY KEY (id_ctsp, id_gio_hang),
                                  CONSTRAINT FK_CTSP_CTGH FOREIGN KEY(id_ctsp) REFERENCES chi_tiet_san_pham(id),
                                  CONSTRAINT FK_GioHang_CTGH FOREIGN KEY(id_gio_hang) REFERENCES gio_hang(id)
);


CREATE TABLE ma_giam_gia(
                            id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                            ma_giam_gia VARCHAR(100) UNIQUE,
                            ten_ma_giam_gia NVARCHAR(200),
                            gia_tri_giam FLOAT,
                            ngay_bat_dau DATETIME,
                            so_luong INT,
                            dieu_kien INT,
                            ngay_ket_thuc DATETIME,
                            mo_ta NVARCHAR(MAX),
                            trang_thai INT
);


CREATE TABLE hoa_don(
                        id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
                        id_khach_hang INT,
                        id_nhan_vien INT,
                        id_ma_giam_gia INT,
                        ma_hoa_don VARCHAR(30),
                        tong_tien FLOAT,
                        thoi_gian_tao DATETIME,
                        thoi_gian_xac_nhan DATETIME,
                        thoi_gian_giao_hang DATETIME,
                        thoi_gian_thanh_toan DATETIME,
                        trang_thai INT,
                        ten_nguoi_nhan NVARCHAR(100),
                        email_nguoi_nhan VARCHAR(100),
                        sdt_nguoi_nhan VARCHAR(100),
                        dia_chi_nguoi_nhan NVARCHAR(300),
                        ly_do_khach_huy NVARCHAR(MAX),
                        khach_thanh_toan FLOAT,
                        phi_van_chuyen FLOAT,
                        giam_gia FLOAT,
                        so_tien_no float, -- Nợ
                        CONSTRAINT FK_MAGIAMGIA_HD FOREIGN KEY(id_ma_giam_gia) REFERENCES ma_giam_gia(id),
                        CONSTRAINT FK_KhachHang_HD FOREIGN KEY(id_khach_hang) REFERENCES khach_hang(id),
                        CONSTRAINT FK_NhanVien_HD FOREIGN KEY(id_nhan_vien) REFERENCES nhan_vien(id)
);

CREATE TABLE chi_tiet_hoa_don(
                                 id_hoa_don INT,
                                 id_ctsp INT,
                                 so_luong INT,
                                 gia FLOAT,
                                 PRIMARY KEY (id_hoa_don, id_ctsp),
                                 CONSTRAINT FK_HoaDon_CTHD FOREIGN KEY(id_hoa_don) REFERENCES hoa_don(id),
                                 CONSTRAINT FK_CTSP_CTHD FOREIGN KEY(id_ctsp) REFERENCES chi_tiet_san_pham(id)
);


select * from mau_sac

select * from ma_giam_gia

select * from nhan_vien

select * from san_pham

select * from hoa_don


--DECLARE @start_date datetime = '2024-03-10';  -- Thay đổi giá trị theo ngày bạn muốn
--DECLARE @end_date datetime = '2030-01-01';    -- Thay đổi giá trị theo ngày bạn muốn

--SELECT * FROM khuyen_mai
--WHERE ngay_bat_dau BETWEEN @start_date AND @end_date
--   OR ngay_ket_thuc BETWEEN @start_date AND @end_date
--   OR (@start_date BETWEEN ngay_bat_dau AND ngay_ket_thuc AND @end_date BETWEEN ngay_bat_dau AND ngay_ket_thuc);

-- thương hiệu
    INSERT INTO thuong_hieu (ma, ten, trang_thai) VALUES ('TH001', N'Louis Vuitton', 1);
INSERT INTO thuong_hieu (ma, ten, trang_thai) VALUES ('TH002', N'Gucci', 1);
INSERT INTO thuong_hieu (ma, ten, trang_thai) VALUES ('TH003', N'Chanel', 1);
INSERT INTO thuong_hieu (ma, ten, trang_thai) VALUES ('TH004', N'Prada', 1);
INSERT INTO thuong_hieu (ma, ten, trang_thai) VALUES ('TH005', N'Coach', 1);
INSERT INTO thuong_hieu (ma, ten, trang_thai) VALUES ('TH006', N'Michael Kors', 1);
INSERT INTO thuong_hieu (ma, ten, trang_thai) VALUES ('TH007', N'Burberry', 1);
INSERT INTO thuong_hieu (ma, ten, trang_thai) VALUES ('TH008', N'Hermès', 1);
INSERT INTO thuong_hieu (ma, ten, trang_thai) VALUES ('TH009', N'Dior', 1);
INSERT INTO thuong_hieu (ma, ten, trang_thai) VALUES ('TH010', N'Fendi', 1);

-- thời gian bảo hành(tháng)
INSERT INTO thoi_gian_bao_hanh (ma, thoi_gian, trang_thai) VALUES ('TG001', 12, 1);
INSERT INTO thoi_gian_bao_hanh (ma, thoi_gian, trang_thai) VALUES ('TG002', 24, 1);
INSERT INTO thoi_gian_bao_hanh (ma, thoi_gian, trang_thai) VALUES ('TG003', 36, 1);
INSERT INTO thoi_gian_bao_hanh (ma, thoi_gian, trang_thai) VALUES ('TG004', 48, 1);
INSERT INTO thoi_gian_bao_hanh (ma, thoi_gian, trang_thai) VALUES ('TG005', 60, 1);

-- danh mục
INSERT INTO danh_muc (ma, ten, trang_thai) VALUES ('DM001', N'Túi xách tote', 1);
INSERT INTO danh_muc (ma, ten, trang_thai) VALUES ('DM002', N'Túi xách xách tay', 1);
INSERT INTO danh_muc (ma, ten, trang_thai) VALUES ('DM003', N'Balo nữ', 1);
INSERT INTO danh_muc (ma, ten, trang_thai) VALUES ('DM004', N'Balo nam', 1);
INSERT INTO danh_muc (ma, ten, trang_thai) VALUES ('DM005', N'Balo thể thao', 1);
INSERT INTO danh_muc (ma, ten, trang_thai) VALUES ('DM006', N'Ba lô du lịch', 1);
INSERT INTO danh_muc (ma, ten, trang_thai) VALUES ('DM007', N'Cặp xách nữ', 1);
INSERT INTO danh_muc (ma, ten, trang_thai) VALUES ('DM008', N'Cặp xách nam', 1);

-- đối tượng sử dụng
INSERT INTO doi_tuong_su_dung (ma, ten, trang_thai) VALUES ('DT001', N'Nam', 1);
INSERT INTO doi_tuong_su_dung (ma, ten, trang_thai) VALUES ('DT002', N'Nữ', 1);
INSERT INTO doi_tuong_su_dung (ma, ten, trang_thai) VALUES ('DT003', N'Unisex', 1);


-- màu sắc
INSERT INTO mau_sac (ma, ten) VALUES (N'#FF0000', N'Đỏ');
INSERT INTO mau_sac (ma, ten) VALUES (N'#00FF00', N'Xanh lá cây');
INSERT INTO mau_sac (ma, ten) VALUES (N'#0000FF', N'Xanh dương');
INSERT INTO mau_sac (ma, ten) VALUES (N'#FFFF00', N'Vàng');
INSERT INTO mau_sac (ma, ten) VALUES (N'#FF00FF', N'Hồng');
INSERT INTO mau_sac (ma, ten) VALUES (N'#00FFFF', N'Xanh lơ');
INSERT INTO mau_sac (ma, ten) VALUES (N'#800000', N'Màu đỏ rượu');
INSERT INTO mau_sac (ma, ten) VALUES (N'#008000', N'Màu ô liu');
INSERT INTO mau_sac (ma, ten) VALUES (N'#000080', N'Màu xanh lục');
INSERT INTO mau_sac (ma, ten) VALUES (N'#808080', N'Màu xám');
INSERT INTO mau_sac (ma, ten) VALUES (N'#FFFFFF', N'Trắng');
INSERT INTO mau_sac (ma, ten) VALUES (N'#000000', N'Đen');


-- chức vụ
INSERT INTO chuc_vu (id, ma_chuc_vu, ten_chuc_vu, trang_thai) VALUES (1, 'CV001', N'Quản lý', 1);
INSERT INTO chuc_vu (id, ma_chuc_vu, ten_chuc_vu, trang_thai) VALUES (2, 'CV002', N'Nhân viên', 1);


-- tài khoản
INSERT INTO tai_khoan (ten_dang_nhap, mat_khau, quyen) VALUES
('nhanvien1@example.com', '123456', 2),
('nhanvien2@example.com', '123456', 2),
('khachhang1@example.com', '123456', 1);


-- khách hàng
INSERT INTO khach_hang (id_tai_khoan, ma_khach_hang, ten_khach_hang, gioi_tinh, ngay_sinh, sdt, email, trang_thai, mat_khau, dia_chi, hinh_anh) VALUES
(3, 'KH001', N'Nguyễn Thị A', 0, '1990-01-01', '0123456789', 'khachhang1@example.com', 1, '123456', N'Hà Nội', NULL),
(3, 'KH002', N'Trần Văn B', 1, '1995-05-15', '0987654321', 'khachhang2@example.com', 1, '123456', N'Hồ Chí Minh', NULL),
(3, 'KH003', N'Phạm Thị C', 0, '1988-11-30', '0369852147', 'khachhang3@example.com', 1, '123456', N'Đà Nẵng', NULL);


-- nhân viên
INSERT INTO nhan_vien (id_chuc_vu, id_tai_khoan, ma_nhan_vien, ho_ten, ngay_sinh, sdt, email, mat_khau, que_quan, cccd, thoi_gian_vao, thoi_gian_ra, trang_thai, gioiTinh) VALUES
(1, 1, 'NV001', N'Nguyễn Văn A', '1990-01-01', '0123456789', 'nhanvien1@example.com', '123456', N'Hà Nội', '0123456789123', '2023-01-01', NULL, 1, 1),
(2, 2, 'NV002', N'Trần Thị B', '1995-05-15', '0987654321', 'nhanvien2@example.com', '123456', N'Hồ Chí Minh', '1234567890123', '2023-01-01', NULL, 1, 0),
(2, 3, 'NV003', N'Phạm Văn C', '1988-11-30', '0369852147', 'nhanvien3@example.com', '123456', N'Đà Nẵng', '1234567890123', '2023-01-01', NULL, 1, 1);




-- sản phẩm
INSERT INTO san_pham (ma_san_pham, ten, anh, kich_thuoc, khoi_luong, chat_lieu, xuat_xu, mo_ta, trang_thai) VALUES
('SP001', N'Túi tote đeo vai nắp gập quai đôi', '', '20x30x40', 300, N'Nhựa', N'Việt Nam', N'Hàng việt nam chất lương cao', 1),
('SP002', N'Túi hobo khóa gập kèm túi mini', '', '20x30x40', 500, N'Da', N'Trung Quốc', N'Hàng trung quốc chất lương cao', 1),
('SP003', N'Túi xách tay bowler style tối giản', '', '20x30x40', 300, N'Vải', N'Việt Nam', N'Hàng việt nam chất lương cao', 1),
('SP004', N'Saddle bag nắp gập vân saffiano', '', '20x30x40', 300, N'Nhựa', N'Việt Nam', N'Hàng việt nam chất lương cao', 1),
('SP005', N'Túi tote xách tay quai thắt trang trí', '', '20x30x40', 300, N'Nhựa', N'Việt Nam', N'Hàng việt nam chất lương cao', 1),
('SP006', N'Túi xách tay bowler style tối giản', '', '20x30x40', 300, N'Giấy', N'Việt Nam', N'Hàng việt nam chất lương cao', 1),
('SP007', N'Túi đeo vai nhấn quai ống', '', '20x30x40', 300, N'Giấy', N'Nhật Bản', N'Hàng nhật bản chất lương cao', 1),
('SP008', N'Túi đeo vai nắp gập nhấn khóa gài', '', '20x30x40', 300, N'Nhựa', N'Pháp', N'Hàng pháp chất lương cao', 1),
('SP009', N'Túi đeo vai nắp gập monotone', '', '20x30x40', 300, N'Nhựa', N'Việt Nam', N'Hàng việt nam chất lương cao', 1),
('SP0010', N'Balo vải dù phối da', '', '20x30x40', 300, N'Giấy', N'Việt Nam', N'Hàng việt nam chất lương cao', 1),
('SP0011', N'Túi tote cổ điển nhấn chân quai ', '', '20x30x40', 300, N'Giấy', N'Nhật Bản', N'Hàng nhật bản chất lương cao', 1),
('SP0012', N'Soft baguette bag', '', '20x30x40', 300, N'Nhựa', N'Pháp', N'Hàng pháp chất lương cao', 1),
('SP0013', N'Túi đeo chéo nhấn khóa bán nguyệt', '', '20x30x40', 300, N'Nhựa', N'Việt Nam', N'Hàng việt nam chất lương cao', 1),
('SP0014', N'Túi đeo chéo may chần phối xích', '', '20x30x40', 300, N'Giấy', N'Việt Nam', N'Hàng việt nam chất lương cao', 1),
('SP0015', N'Túi xách tay hình thang nhấn khóa gập', '', '20x30x40', 300, N'Giấy', N'Nhật Bản', N'Hàng nhật bản chất lương cao', 1),
('SP0016', N'Túi tote nhấn viền layer', '', '40x30x40', 300, N'Thuỷ tinh', N'Pháp', N'Hàng pháp chất lương cao', 1);


-- chi tiết sản phẩm
--INSERT INTO chi_tiet_san_pham(ma_ctsp, so_luong, gia_nhap, gia_ban, thoi_gian, anh_ctsp, trang_thai, id_san_pham) VALUES
--('CTSP001', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP002', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP003', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP004', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP005', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP006', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP007', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP008', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP009', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP010', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP011', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP012', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP013', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP014', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP015', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP016', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP017', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP018', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP019', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP020', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP021', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP022', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP023', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP024', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP025', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP026', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP027', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP028', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP029', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10),
--('CTSP030', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 10);


INSERT INTO chi_tiet_san_pham(ma_ctsp, so_luong, gia_nhap, gia_ban, thoi_gian, anh_ctsp, trang_thai, id_san_pham) VALUES
('CTSP001', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 71),
('CTSP002', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 71),
('CTSP003', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 72),
('CTSP004', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 72),
('CTSP005', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 73),
('CTSP006', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 73),
('CTSP007', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 74),
('CTSP008', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 74),
('CTSP009', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 75),
('CTSP010', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 75),
('CTSP011', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 76),
('CTSP012', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 76),
('CTSP013', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 77),
('CTSP014', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 77),
('CTSP015', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 78),
('CTSP016', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 78),
('CTSP017', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 79),
('CTSP018', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 79),
('CTSP019', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 80),
('CTSP020', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 80),
('CTSP021', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 81),
('CTSP022', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 81),
('CTSP023', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 82),
('CTSP024', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 82),
('CTSP025', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 83),
('CTSP026', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 83),
('CTSP027', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 84),
('CTSP028', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 84),
('CTSP029', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 85),
('CTSP030', ROUND(RAND(CHECKSUM(NEWID())) * (150 - 10) + 10, 0), ROUND(RAND(CHECKSUM(NEWID())) * (100000 - 10000) + 10000, 0), ROUND(RAND(CHECKSUM(NEWID())) * (200000 - 100000) + 100000, 0), '2024-05-02 10:00:00', N'../static/images/chi-tiet-san-pham/357006782_570496615251199_9069581305631454264_n_d3f1f2b63a2846a689a833a70d4d5a66_grande.jpg', 1, 85);

update chi_tiet_san_pham set id_mau_sac = 2
--delete from ma_giam_gia
delete from gio_hang
delete from chi_tiet_gio_hang
delete from chi_tiet_hoa_don
delete from hoa_don
delete from khach_hang
delete from san_pham_yeu_thich
delete from chi_tiet_san_pham
delete from san_pham
delete from anh_ctsp


select * from khach_hang
select * from chuc_vu
select * from san_pham
select * from mau_sac
update mau_sac set ten = N'Nâu' where ma = '#663300'
select * from chi_tiet_san_pham

















































