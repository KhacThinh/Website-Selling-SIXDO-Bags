package com.bags.sixdoBag.model.dto.request;

import com.bags.sixdoBag.model.entitys.ThuongHieu;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ThuongHieuRequest {
    private String maThuongHieu;

    private String tenThuongHieu;

    private Boolean trangThaiTT;


}
