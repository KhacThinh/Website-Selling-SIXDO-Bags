﻿CREATE DATABASE DATN_CUAHANGTUIXACHSixDoo
GO
USE DATN_CUAHANGTUIXACHSixDoo
GO

create table thoi_gian_bao_hanh(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
ma varchar(100) unique,
thoi_gian int,
trang_thai int
)


create table thuong_hieu(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
ma varchar(100) unique,
ten nvarchar(300),
trang_thai int
)

create table danh_muc(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
ma varchar(100) unique,
ten nvarchar(300),
trang_thai int
)

create table doi_tuong_su_dung(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
ma varchar(100) unique,
ten nvarchar(100),
trang_thai int
)

create table san_pham(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
ma_san_pham varchar(100) unique,
id_thoi_gian_bao_hanh int,
id_thuong_hieu int,
id_danh_muc int,
id_doi_tuong_su_dung int,
ten nvarchar(300),
anh varchar(100),
product_url varchar(100),
kich_thuoc varchar(200),
khoi_luong float,
chat_lieu varchar (200),
xuat_xu varchar(100),
mo_ta varchar(max),
trang_thai int

CONSTRAINT FK_ThoiGianBaoHang_SP FOREIGN KEY(id_thoi_gian_bao_hanh) REFERENCES thoi_gian_bao_hanh(id),
CONSTRAINT FK_ThuongHieu_SP FOREIGN KEY(id_thuong_hieu) REFERENCES thuong_hieu(id),
CONSTRAINT FK_DanhMuc_SP FOREIGN KEY(id_danh_muc) REFERENCES danh_muc(id),
CONSTRAINT FK_DoiTuongSuDung_SP FOREIGN KEY(id_doi_tuong_su_dung) REFERENCES doi_tuong_su_dung(id)
)
 
create table mau_sac(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
ma nvarchar(100),
ten nvarchar(200)
)


create table khuyen_mai(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
ma_khuyen_mai varchar(100) unique,
ten nvarchar(200),
gia_tri_giam float,
ngay_bat_dau datetime,
ngay_ket_thuc datetime,
mo_ta varchar(max),
trang_thai int
)

create table chi_tiet_san_pham(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
ma_ctsp varchar(100) ,
id_san_pham int,
id_mau_sac int,
id_khuyen_mai int,
so_luong int ,
gia_nhap float,
gia_ban float,
thoi_gian datetime,
anh_ctsp varchar(100),
CONSTRAINT FK_SanPham_CTSP FOREIGN KEY(id_san_pham) REFERENCES san_pham(id),
CONSTRAINT FK_MauSac_CTSP FOREIGN KEY(id_mau_sac) REFERENCES mau_sac(id),
CONSTRAINT FK_KhuyenMai_CTSP FOREIGN KEY(id_khuyen_mai) REFERENCES khuyen_mai(id)
)

create table anh_ctsp(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
id_ctsp  int ,
url varchar(max)
CONSTRAINT FK_CTSP_ACTSP FOREIGN KEY(id_ctsp) REFERENCES chi_tiet_san_pham(id),
)

create table tai_khoan(
id int IDENTITY(1,1) PRIMARY KEY,
ten_dang_nhap varchar(50),
mat_khau varchar(50),
quyen varchar(30)
)

create table khach_hang(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
id_tai_khoan int,
ma_khach_hang varchar(100) unique,
ten_khach_hang nvarchar(100),
gioi_tinh int,
ngay_sinh varchar(100),
sdt varchar(100),
email varchar(100),
trang_thai int,
mat_khau varchar(100),
CONSTRAINT FK_TaiKhoan FOREIGN KEY(id_tai_khoan) REFERENCES tai_khoan(id)
)

create table dia_chi_khach_hang(
id int IDENTITY(1, 1) PRIMARY KEY,
id_khach_hang  int,
ten_dia_chi nvarchar(max),
trang_thai int,
mo_ta nvarchar(max)
CONSTRAINT FK_KhachHang_DCKH FOREIGN KEY(id_khach_hang) REFERENCES khach_hang(id)
)


create table san_pham_yeu_thich(
id_san_pham  int,
id_khach_hang  int ,
trang_thai int,
PRIMARY KEY (id_san_pham, id_khach_hang),
CONSTRAINT FK_SanPham_YT FOREIGN KEY(id_san_pham) REFERENCES san_pham(id),
CONSTRAINT FK_KhachHang_YT FOREIGN KEY(id_khach_hang) REFERENCES khach_hang(id),
)

create table gio_hang(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
id_khach_hang  int,
ngay_tao datetime,
tong_tien float,
trang_thai int,
CONSTRAINT FK_KhachHang_GH FOREIGN KEY(id_khach_hang) REFERENCES khach_hang(id)
)


create table chi_tiet_gio_hang(
id_ctsp  int ,
id_gio_hang  int,
tong_tien float,
so_luong int,
PRIMARY KEY (id_ctsp, id_gio_hang),
CONSTRAINT FK_CTSP_CTGH FOREIGN KEY(id_ctsp) REFERENCES chi_tiet_san_pham(id),
CONSTRAINT FK_GioHang_CTGH FOREIGN KEY(id_gio_hang) REFERENCES gio_hang(id)
)

create table chuc_vu(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
ma_chuc_vu varchar(100) unique,
ten_chuc_vu nvarchar(100),
trang_thai int
)


create table ma_giam_gia(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
ma_giam_gia varchar(100) unique,
ten_ma_giam_gia nvarchar(200),
gia_tri_giam float,
ngay_bat_dau datetime,
so_luong int,
dieu_kien int,
ngay_ket_thuc datetime,
mo_ta nvarchar(max),
trang_thai int
)

create table nhan_vien(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
id_chuc_vu int,
id_tai_khoan int,
ma_nhan_vien varchar(100),
ho_ten nvarchar(100),
ngay_sinh datetime, 
sdt varchar(100),
email varchar(100),
mat_khau varchar(100),
que_quan nvarchar(300),
cccd varchar(100),
thoi_gian_vao datetime,
thoi_gian_ra datetime,
trang_thai int,
FOREIGN KEY(id_chuc_vu) REFERENCES chuc_vu(id),
FOREIGN KEY(id_tai_khoan) REFERENCES tai_khoan(id)
)


create table hoa_don(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
id_khach_hang int,
id_nhan_vien int,
id_ma_giam_gia int,
tong_tien float,
thoi_gian_tao datetime,
thoi_gian_xac_nhan datetime,
thoi_gian_giao_hang datetime,
thoi_gian_thanh_toan datetime,
trang_thai int,
ten_nguoi_nhan nvarchar(100),
email_nguoi_nhan varchar(100),
sdt_nguoi_nhan varchar(100),
dia_chi_nguoi_nhan nvarchar(300),
CONSTRAINT FK_MAGIAMGIA_HD FOREIGN KEY(id_ma_giam_gia) REFERENCES ma_giam_gia(id),
CONSTRAINT FK_KhachHang_HD FOREIGN KEY(id_khach_hang) REFERENCES khach_hang(id),
CONSTRAINT FK_NhanVien_HD FOREIGN KEY(id_nhan_vien) REFERENCES nhan_vien(id)
)

create table chi_tiet_hoa_don(
id_hoa_don  int,
id_ctsp  int ,
so_luong int,
gia float,
PRIMARY KEY (id_hoa_don,id_ctsp),
CONSTRAINT FK_HoaDon_CTHD FOREIGN KEY(id_hoa_don) REFERENCES hoa_don(id),
CONSTRAINT FK_CTSP_CTHD FOREIGN KEY(id_ctsp) REFERENCES chi_tiet_san_pham(id),
)

create table slide_show(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
ten nvarchar(200),
trang_thai int
)

create table anh_slide_show(
id int IDENTITY(1, 1)  PRIMARY KEY not null,
id_slide_show int,
url_anh varchar(200),
link varchar(300),
CONSTRAINT FK_Anh_Slide_Show FOREIGN KEY(id_slide_show) REFERENCES slide_show(id),
)


---- Câu 1
INSERT INTO khuyen_mai (ma_khuyen_mai, ten, gia_tri_giam, ngay_bat_dau, ngay_ket_thuc, mo_ta, trang_thai)
VALUES	('KM001', N'Khuyến mãi 1', 10.5, '2024-01-01 08:30:00', '2024-01-10 18:45:00', N'Giảm 10%', 1),
		('KM002', N'Khuyến mãi 2', 15.75, '2024-02-05 12:00:00', '2024-02-15 23:59:59', N'Giảm 15%', 1),
		('KM003', N'Khuyến mãi 3', 20, '2024-03-10 09:15:30', '2024-03-20 15:30:00', N'Giảm 20%', 1),
		('KM004', N'Khuyến mãi 4', 25.3, '2024-04-15 14:00:00', '2024-04-25 23:59:59', N'Giảm 25%', 1),
		('KM005', N'Khuyến mãi 5', 30.2, '2024-05-20 10:45:00', '2024-05-30 20:30:45', N'Giảm 30%', 1);

DECLARE @start_date datetime = '2024-03-10';  -- Thay đổi giá trị theo ngày bạn muốn
DECLARE @end_date datetime = '2030-01-01';    -- Thay đổi giá trị theo ngày bạn muốn

SELECT * FROM khuyen_mai
WHERE ngay_bat_dau BETWEEN @start_date AND @end_date
   OR ngay_ket_thuc BETWEEN @start_date AND @end_date
   OR (@start_date BETWEEN ngay_bat_dau AND ngay_ket_thuc AND @end_date BETWEEN ngay_bat_dau AND ngay_ket_thuc);

select * from khuyen_mai

INSERT INTO san_pham (ma_san_pham, id_thoi_gian_bao_hanh, id_thuong_hieu, id_danh_muc, id_doi_tuong_su_dung, ten, anh, product_url, kich_thuoc, khoi_luong, chat_lieu, xuat_xu, mo_ta, trang_thai)
VALUES	('SP001', null, null, null, null, N'Sản phẩm 1', 'image1.jpg', 'product1_url', '10x15x5 cm', 0.5, N'Vật liệu 1', 'Việt Nam', N'Mô tả sản phẩm 1', 1),
		('SP002', null, null, null, null, N'Sản phẩm 2', 'image2.jpg', 'product2_url', '20x25x10 cm', 1.2, N'Vật liệu 2', 'Trung Quốc', N'Mô tả sản phẩm 2', 1),
		('SP003', null, null, null, null, N'Sản phẩm 3', 'image3.jpg', 'product3_url', '15x20x8 cm', 0.8, N'Vật liệu 3', 'Hàn Quốc', N'Mô tả sản phẩm 3', 1),
		('SP004', null, null, null, null, N'Sản phẩm 4', 'image4.jpg', 'product4_url', '18x22x7 cm', 1.0, N'Vật liệu 4', 'Mỹ', N'Mô tả sản phẩm 4', 1),
		('SP005', null, null, null, null, N'Sản phẩm 5', 'image5.jpg', 'product5_url', '25x30x12 cm', 1.5, N'Vật liệu 5', 'Nhật Bản', N'Mô tả sản phẩm 5', 1);

select * from san_pham where khoi_luong between 0.4 and 1
select * from san_pham where trang_thai = 1 and ten like N'%phẩm 2%'

--select * from san_pham where khoi_luong = or ten like N'%Phẩm 4%'

select * from mau_sac

select * from khuyen_mai

select * from san_pham

select * from hoa_don

























