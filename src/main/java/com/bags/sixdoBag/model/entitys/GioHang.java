package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "gio_hang")
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class GioHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang")
    private KhachHang khachHang;

    @Column
    private LocalDateTime ngayTao;

    @Column
    private Double tongTien;

    @Column
    private Integer trangThai;
}