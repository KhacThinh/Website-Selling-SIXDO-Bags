package com.bags.sixdoBag.service.impl;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.model.entitys.DanhSachKhachHangApMgg;
import com.bags.sixdoBag.model.entitys.KhuyenMai;
import com.bags.sixdoBag.model.entitys.MaGiamGia;
import com.bags.sixdoBag.model.repository.MaGiamGiaRepository;
import com.bags.sixdoBag.service.MaGiamGiaService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MaGiamGiaServiceImpl implements MaGiamGiaService {
    public final MaGiamGiaRepository maGiamGiaRepository;

    @Override
    public MaGiamGia getMaGiamGia(Integer idMaGiamGia) {
        MaGiamGia maGiamGia = maGiamGiaRepository.findById(idMaGiamGia).orElse(null);

        return maGiamGia;
    }

    @Override
    public int apDungMaGiamGia(int idKhachHang, int maGiamGia) {
        return maGiamGiaRepository.apDungMaGiamGia(idKhachHang,maGiamGia);
    }

    @Override
    public List<MaGiamGia> getListMaGiamGia() {
        List<MaGiamGia> listMaGiamGia = maGiamGiaRepository.findMaGiamGiaByAll();
        return listMaGiamGia;
    }

    @Override
    public MaGiamGia addMaGiamGia(MaGiamGia maGiamGia) {
        System.out.println("ok roi ne");
        MaGiamGia ma = new MaGiamGia();
        ma.setMaGiamGia(maGiamGia.getMaGiamGia().trim());
        ma.setTenMaGiamGia(maGiamGia.getTenMaGiamGia().trim());
        ma.setGiaTriGiam(maGiamGia.getGiaTriGiam());
        ma.setNgayBatDau(maGiamGia.getNgayBatDau());
        ma.setNgayKetThuc(maGiamGia.getNgayKetThuc());
        ma.setMoTa(maGiamGia.getMoTa().trim());
        ma.setSoLuong(maGiamGia.getSoLuong());
        ma.setDieuKienGiam(maGiamGia.getDieuKienGiam());
        ma.setTrangThai(true);
        maGiamGiaRepository.save(ma);
        return ma;
    }

    @Override
    public MaGiamGia searchMaGiamGiaByMa(String maGiamGia) {
        return maGiamGiaRepository.searchMaGiamGiaByMa(maGiamGia);
    }

    @Override
    public MaGiamGia editMaGiamGia(Integer idMaGiamGia, MaGiamGia maGiamGia) {
        MaGiamGia ma = getMaGiamGia(idMaGiamGia);
        ma.setTenMaGiamGia(maGiamGia.getTenMaGiamGia().trim());
        ma.setGiaTriGiam(maGiamGia.getGiaTriGiam());
        ma.setNgayBatDau(maGiamGia.getNgayBatDau());
        ma.setNgayKetThuc(maGiamGia.getNgayKetThuc());
        ma.setMoTa(maGiamGia.getMoTa().trim());
        maGiamGiaRepository.save(ma);
        return ma;
    }

    @Override
    public MaGiamGia deleteMaGiamGia(Integer idMaGiamGia) {
        MaGiamGia maGiamGia = getMaGiamGia(idMaGiamGia);
        maGiamGia.setTrangThai(false);
        return maGiamGiaRepository.save(maGiamGia);
    }

    @Override
    public List<MaGiamGia> pageMaGiamGia(int limit, int size) {
        List<MaGiamGia> list = maGiamGiaRepository.findByPageing(limit, size);

        return list;
    }
    @Override
    public MaGiamGia getidMaGiamGia(Integer idMaGiamGia) {
        MaGiamGia maGiamGia = maGiamGiaRepository.findById(idMaGiamGia).orElse(null);
        return maGiamGia;
    }

    @Override
    public void insertKhachHangMgg(int idKhachHang, int idMaGiamGia) {
        maGiamGiaRepository.insertKhachHangApMgg(idKhachHang,idMaGiamGia);
    }

    @Override
    public int top1IdMaGiamGia() {
        return  maGiamGiaRepository.top1IdMaGiamGia();
    }

    ////////////////////////////////////////////////////////////////////////////
    @Override
    public Page<MaGiamGia> searchMGGTenOrMa(String tenMa, Pageable pageable) {
        return maGiamGiaRepository.searchMGGTenOrMa(tenMa, pageable);
    }
    @Override
    public Page<MaGiamGia> searchcbb(boolean name, Pageable pageable) {
        return maGiamGiaRepository.searchCbb(name,pageable);
    }
    //////////////////////////////////////////////////////////////////////////
}
