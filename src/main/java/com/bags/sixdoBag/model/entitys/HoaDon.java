package com.bags.sixdoBag.model.entitys;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "hoa_don")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "id_nhan_vien")
    private NhanVien nhanVien;

    @ManyToOne
    @JoinColumn(name = "id_ma_giam_gia")
    private MaGiamGia maGiamGia;

    @Column(name = "ma_hoa_don")
    private String maHoaDon;

    @Column(name = "tong_tien")
    private Double tongTien;

    @Column(name = "thoi_gian_tao")
    private LocalDateTime thoiGianTao;

    @Column(name = "thoi_gian_xac_nhan")
    private LocalDateTime thoiGianXacNhan;

    @Column(name = "thoi_gian_giao_hang")
    private LocalDateTime thoiGianGiaoHang;

    @Column(name = "thoi_gian_thanh_toan")
    private LocalDateTime thoiGianThanhToan;

    @Column(name = "trang_thai")
    private Integer trangThai;

    @Column(name = "ten_nguoi_nhan")
    private String tenNguoiNhan;

    @Column(name = "email_nguoi_nhan")
    private String emailNguoiNhan;

    @Column(name = "sdt_nguoi_nhan")
    private String sdtNguoiNhan;

    @Column(name = "dia_chi_nguoi_nhan")
    private String diaChiNguoiNhan;

    @Column(name = "khach_thanh_toan")
    private Double khachThanhToan;

    @Column(name = "giam_gia")
    private float giamGia;

    @Column(name = "phi_van_chuyen")
    private Double phiVanChuyen;

    @Column(name = "so_tien_no")
    private Double soTienNo;

    @Column(name = "ly_do_khach_huy")
    private String lyDoKhachHuy;

    @JsonIgnore
    @OneToMany(mappedBy = "hoaDon", fetch = FetchType.LAZY)
    private List<ChiTietHoaDon> chiTietHoaDons;


//        case 0:
//            trangThaiString = 'Đã Thanh Toán';
//        case 1:
//            trangThaiString = 'Hóa Đơn Tạm';
//        case 2:
//            trangThaiString = 'Chưa Xác Nhận';
//        case 3:
//            trangThaiString = 'Đã Xác Nhận';
//        case 4:
//            trangThaiString = 'Đã Hủy';
//        case 5:
//            trangThaiString = 'Đang Giao Hàng';
}
