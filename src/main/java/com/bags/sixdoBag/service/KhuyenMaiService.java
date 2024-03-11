package com.bags.sixdoBag.service;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface KhuyenMaiService {

    public KhuyenMai getKhuyenMai(Integer idKhuyenMai);

    public List<KhuyenMai> getKhuyenMais();

    public KhuyenMai addKhuyenMai(KhuyenMai khuyenMai);

    public KhuyenMai editKhuyenMai(Integer idKhuyenMai, KhuyenMai khuyenMai);

    public KhuyenMai deleteKhuyenMai(Integer idKhuyenMai);

    public List<KhuyenMai> searchKhuyenMaiTenOrMa(String tenMa);

    public List<KhuyenMai> pageKhuyenMai(int limit, int size);

    public List<KhuyenMai> searchKhuyenMaiNgay(String dateStart, String dateEnd);

    public KhuyenMai getidKhuyenMai(Integer idKhuyenMai);
}
