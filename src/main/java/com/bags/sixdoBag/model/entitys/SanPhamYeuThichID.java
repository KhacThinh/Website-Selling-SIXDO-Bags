package com.bags.sixdoBag.model.entitys;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Embeddable
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SanPhamYeuThichID implements Serializable {
    @Column(name = "id_san_pham", nullable = false)
    private Integer idSanPham;

    @Column(name = "id_khach_hang", nullable = false)
    private Integer idKhachHang;


}
