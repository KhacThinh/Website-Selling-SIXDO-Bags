package com.bags.sixdoBag.model.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DoiTuongSuDungRequest {
    private String maDoiTuongSuDung;

    private String tenDoiTuongSuDung;

    private Boolean trangThai;
}
